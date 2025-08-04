
import 'package:eky_pos/data/datasources/db_local_datasource.dart';
import 'package:eky_pos/data/models/responses/transaction_response_model.dart';
import 'package:sqflite/sqflite.dart';

class TransactionDataSource {
  
  final DBLocalDatasource dbLocal;

  static final String tableTransactions = 'transactions';
  static final String tableTransactionItems = 'transaction_items';

  TransactionDataSource({required this.dbLocal});

  static Future<void> createTransactionTable(Database db) async {
    await db.execute('''
      CREATE TABLE $tableTransactions (
        id INTEGER PRIMARY KEY AUTOINCREMENT,
        transaction_id TEXT,
        total_price TEXT,
        total_items INTEGER,
        payment_method TEXT,
        status TEXT,
        created_at TEXT
      )
    ''');
  }

  static Future<void> createTransactionItemTable(Database db) async {
    await db.execute('''
      CREATE TABLE $tableTransactionItems (
        id INTEGER PRIMARY KEY AUTOINCREMENT,
        transaction_item_id TEXT,
        order_id TEXT,
        product_id INTEGER,
        quantity INTEGER,
        price TEXT,
        total TEXT,
        created_at TEXT
      )
    ''');
  }

  Future<int> saveTransaction(TransactionModel transactions) async {
    final db = await dbLocal.database;
    int id = await db.insert(tableTransactions, transactions.toMap());
    if (transactions.items != null) {
      for (var orderItem in transactions.items!) {
        await db.insert(tableTransactionItems, orderItem.toMap());
      }
    }
    return id;
  }

  Future<List<TransactionModel>> getAllTransaction() async {
    final db = await dbLocal.database;
    final result = await db.query(
      tableTransactions,
      orderBy: 'created_at DESC',
    );
    final transactions = result.map((e) => TransactionModel.fromMap(e)).toList();
    for (final transaction in transactions) {
      final items = await _getAllTransactionItem();
      transaction.items = items.where((item) => item.transactionId == transaction.transactionId).toList();
    }
    return transactions;
  }

  Future<List<TransactionItemModel>> _getAllTransactionItem() async {
    final db = await dbLocal.database;
    final result = await db.query(
      tableTransactionItems,
      orderBy: 'created_at DESC',
    );
    return result.map((e) => TransactionItemModel.fromMap(e)).toList();
  }

  Future<TransactionModel?> getTransactionById(int id) async {
    final db = await dbLocal.database;
    final result = await db.query(
      tableTransactions,
      where: 'id = ?',
      whereArgs: [id],
    );
    if (result.isEmpty) return null;
    final transaction = TransactionModel.fromMap(result[0]);
    final items = await _getAllTransactionItem();
    transaction.items = items.where((item) => item.transactionId == transaction.transactionId).toList();
    return transaction;
  }
}