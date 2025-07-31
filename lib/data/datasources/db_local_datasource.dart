import 'dart:developer';

import 'package:eky_pos/core/utils/talker.dart';
import 'package:eky_pos/data/models/responses/category_response_model.dart';
import 'package:eky_pos/data/models/responses/product_response_model.dart';
import 'package:eky_pos/data/models/responses/user_model.dart';
import 'package:eky_pos/presentation/auth/models/user_model.dart';
import 'package:eky_pos/presentation/items/models/product_model.dart';
import 'package:sqflite/sqflite.dart';

import '../models/responses/tax_discount_model.dart';
import '../models/responses/transaction_response_model.dart';

class DBLocalDatasource {
  DBLocalDatasource._init();

  static final DBLocalDatasource instance = DBLocalDatasource._init();

  final String tableProducts = 'products';
  final String tableCategories = 'categories';
  final String tableTransactions = 'transactions';
  final String tableTransactionItems = 'transaction_items';
  final String tableTaxDiscount = 'tax_discounts';
  final String tableUsers = 'users';
  final String tableStocks = 'stocks';
  static Database? _database;

  Future<Database> _initDB(String filePath) async {
    final dbPath = await getDatabasesPath();
    final path = dbPath + filePath;
    talkerInfoDB("Init DB");
    return await openDatabase(
      path,
      version: 1,
      onCreate: _createDB,
    );
  }

  Future<void> deleteDB(String name) async {
    final dbPath = await getDatabasesPath();
    talkerInfoDB("Delete DB $name");
    final path = '$dbPath$name';
    await deleteDatabase(path);
  }

  Future<void> _createDB(Database db, int version) async {
    talkerInfoDB("Create DB");
    await db.execute('''
      CREATE TABLE $tableCategories (
        id INTEGER PRIMARY KEY AUTOINCREMENT,
        name TEXT,
        business_id INTEGER,
        created_at TEXT,
        updated_at TEXT
      )
    ''');
    await db.execute('''
      CREATE TABLE $tableProducts (
        id INTEGER PRIMARY KEY AUTOINCREMENT,
        name TEXT,
        category_id INTEGER,
        business_id INTEGER,
        description TEXT,
        image TEXT,
        color TEXT,
        price TEXT,
        cost TEXT,
        stock INTEGER,
        barcode TEXT,
        sku TEXT,
        created_at TEXT,
        updated_at TEXT
      )
    ''');

    await db.execute('''
      CREATE TABLE $tableStocks (
        id INTEGER PRIMARY KEY,
        stock_id INTEGER,
        product_id INTEGER,
        outlet_id INTEGER,
        quantity INTEGER,
        created_at TEXT,
        updated_at TEXT
      )
    ''');

    await db.execute('''
      CREATE TABLE $tableTransactions (
        id INTEGER PRIMARY KEY AUTOINCREMENT,
        transactionId TEXT,
        orderNumber TEXT,
        outlet_id INTEGER,
        subTotal TEXT,
        totalPrice TEXT,
        totalItems INTEGER,
        tax TEXT,
        discount TEXT,
        paymentMethod TEXT,
        status TEXT,
        cashierId INTEGER,
        createdAt TEXT,
        is_sync INTEGER DEFAULT 0
      )
    ''');

    await db.execute('''
      CREATE TABLE $tableTransactionItems (
        id INTEGER PRIMARY KEY AUTOINCREMENT,
        transactionItemId TEXT,
        order_id TEXT,
        product_id INTEGER,
        quantity INTEGER,
        price TEXT,
        total TEXT,
        createdAt TEXT
      )
    ''');

    await db.execute('''
    CREATE TABLE $tableTaxDiscount (
        id INTEGER PRIMARY KEY AUTOINCREMENT,
        name TEXT,
        type TEXT,
        status TEXT,
        value INTEGER,
        chargeType TEXT
      )
    ''');

    await db.execute('''
    CREATE TABLE $tableUsers (
      id INTEGER PRIMARY KEY AUTOINCREMENT,
      userId TEXT,
      name TEXT,
      phone TEXT,
      email TEXT,
      password TEXT,
      role TEXT
    )
    ''');
  }

  Future<Database> get database async {
    if (_database != null) return _database!;

    _database = await _initDB('ekypos.db');
    return _database!;
  }

  /// ambil semua transaksi yang belum tersinkron (is_sync = 0)
  Future<List<TransactionModel>> getUnsyncedOrders() async {
    final db = await instance.database;
    final trxRows = await db.query(
      tableTransactions,
      where: 'is_sync = 0',
      orderBy: 'createdAt ASC',
    );

    final List<TransactionModel> result = [];
    for (final row in trxRows) {
      final trx = TransactionModel.fromMap(row);

      final itemRows = await db.query(
        tableTransactionItems,
        where: 'order_id = ?',
        whereArgs: [trx.transactionId],
      );

      final items = itemRows.map((e) => Item.fromMap(e)).toList();
      result.add(trx.copyWith(items: items));
    }
    return result;
  }

  /// update status & tandai sudah tersinkron
  Future<void> markOrderSynced({
    required int id, // primary‑key lokal
    required String status, // mis. 'success'
  }) async {
    final db = await instance.database;
    await db.update(
      tableTransactions,
      {
        'status': status,
        'is_sync': 1,
      },
      where: 'id = ?',
      whereArgs: [id],
    );
  }

  Future<int> saveOrder(TransactionModel transactions) async {
    final db = await instance.database;
    int id = await db.insert(tableTransactions, transactions.toMap());
    log("Save order: ${transactions.toMap()}");
    for (var orderItem in transactions.items!) {
      await db.insert(tableTransactionItems, orderItem.toMap3(transactions.transactionId!));
    }
    return id;
  }

  Future<int> saveOrderOnly(TransactionModel transactions) async {
    final db = await instance.database;
    int id = await db.insert(tableTransactions, transactions.toMap());
    log("Save order Only: ${transactions.toMap()}");

    return id;
  }

  Future<List<TransactionModel>> getAllOrder() async {
    final db = await instance.database;
    final result = await db.query(
      tableTransactions,
      orderBy: 'createdAt DESC',
    );
    return result.map((e) => TransactionModel.fromMap(e)).toList();
  }

  // save order item
  Future<int> saveOrderItem(Item item) async {
    final db = await instance.database;
    log("Save order item: ${item.toMap2()}");
    return await db.insert(tableTransactionItems, item.toMap2());
  }

  /// get all order Item
  Future<List<Item>> getAllOrderItem() async {
    final db = await instance.database;
    final result = await db.query(
      tableTransactionItems,
      orderBy: 'createdAt DESC',
    );
    log("Get all order item: ${result.toString()}");
    return result.map((e) => Item.fromMap(e)).toList();
  }

  // get order by date
  Future<List<TransactionModel>> getOrderByDate(String dateOnly) async {
    final db = await instance.database;
    final result = await db.query(
      tableTransactions,
      where: 'createdAt LIKE ?',
      whereArgs: ['${dateOnly}T%'],
    );
    // log("Date: $dateOnly, result: ${result.length}");
    return result.map((e) => TransactionModel.fromMap(e)).toList();
  }

  // get order by transaction id
  Future<TransactionModel> getOrderByTransactionId(String transactionId) async {
    final db = await instance.database;
    final result = await db.query(
      tableTransactions,
      where: 'transactionId = ?',
      whereArgs: [transactionId],
    );
    return TransactionModel.fromMap(result[0]);
  }

  // get items by transaction id
  Future<List<Item>> getItemsByTransactionId(String transactionId) async {
    final db = await instance.database;
    final result = await db.query(
      tableTransactionItems,
      where: 'order_id = ?',
      whereArgs: [transactionId],
    );
    return result.map((e) => Item.fromMap(e)).toList();
  }

  // save category
  Future<int> saveCategory(Category category) async {
    final db = await instance.database;
    talkerInfoDB("Save category: ${category.name}");
    return await db.insert(tableCategories, category.toMap());
  }

  // get all category
  Future<List<Category>> getAllCategory() async {
    final db = await instance.database;
    final result = await db.query(tableCategories);
    talkerInfoDB("Get all category: ${result.length} total");
    return result.map((e) => Category.fromMap(e)).toList();
  }

  Future<void> insertAllCategory(List<Category> categories) async {
    final db = await instance.database;
    for (var category in categories) {
      await db.insert(tableCategories, category.toBackUpMap());
    }
  }

  Future<void> removeAllCategory() async {
    final db = await instance.database;
    await db.delete(tableCategories);
  }

  // get category by id
  Future<Category> getCategoryById(String categoryId) async {
    final db = await instance.database;
    talkerInfoDB("Get category by id: $categoryId");
    final result = await db.query(tableCategories,
        where: 'category_id = ?', whereArgs: [categoryId]);
    return Category.fromMap(result[0]);
  }

  // update category
  Future<int> updateCategory(int id, String name) async {
    final db = await instance.database;
    talkerInfoDB("Update category: $name");
    return await db.update(
      tableCategories,
      {
        'name': name,
        'updated_at': DateTime.now(),
      },
      where: 'id = ?',
      whereArgs: [id],
    );
  }

  // delete category
  Future<int> deleteCategory(int id) async {
    final db = await instance.database;
    talkerInfoDB("Delete category: $id");
    return await db.delete(
      tableCategories,
      where: 'id = ?',
      whereArgs: [id],
    );
  }

  //save data product
  Future<int> saveProduct(Product product) async {
    final db = await instance.database;
    talkerInfoDB("Save product: ${product.name}");
    return await db.insert(tableProducts, product.toLocalMap());
  }

  //get all data product
  Future<List<Product>> getAllProduct() async {
    final db = await instance.database;
    final result = await db.query(tableProducts);
    talkerInfoDB("Get all product: ${result.length} total");
    return result.map((e) => Product.fromMap(e)).toList();
  }

  // Future<Product> getProductById(String id) async {
  //   final db = await instance.database;
  //   final result =
  //       await db.query(tableProducts, where: 'product_id = ?', whereArgs: [id]);
  //   log("result: $result");
  //   return Product.fromMap(result[0]);
  // }

  Future<Product?> getProductById(int id) async {
    final db = await instance.database;
    final rows = await db.query(tableProducts,
        where: 'product_id = ?', whereArgs: [id], limit: 1);
    if (rows.isEmpty) return null;
    return Product.fromMap(rows.first);
  }

  Future<void> insertAllProduct(List<Product> products) async {
    final db = await instance.database;
    for (var product in products) {
      await db.insert(tableProducts, product.toLocalMap());
    }
  }

  // Future<void> insertAllProduct(List<Product> products) async {
  //   final db = await instance.database;
  //   for (var product in products) {
  //     await db.insert(tableProducts, product.toLocalMap());

  //     // save stock
  //     if (product.stocks != null && product.stocks!.isNotEmpty) {
  //       for (var stock in product.stocks!) {
  //         await db.insert(tableStocks, {
  //           'id': stock.id,
  //           'product_id': stock.productId,
  //           'outlet_id': stock.outletId,
  //           'quantity': stock.quantity,
  //           'created_at': stock.createdAt?.toIso8601String(),
  //           'updated_at': stock.updatedAt?.toIso8601String(),
  //         });
  //       }
  //     }
  //   }
  // }

  Future<void> removeAllProduct() async {
    final db = await instance.database;
    talkerInfoDB("Remove all product");
    await db.delete(tableProducts);
  }

// update data product
  Future<int> updateProduct(Product product) async {
    final db = await instance.database;
    talkerInfoDB("Update product: ${product.id} ${product.name}");
    return await db.update(
      tableProducts,
      product.toLocalMap(),
      where: 'id = ?',
      whereArgs: [product.id!],
    );
  }

  // delete data product
  Future<int> deleteProduct(int id) async {
    final db = await instance.database;
    talkerInfoDB("Delete product: $id");
    return await db.delete(
      tableProducts,
      where: 'id = ?',
      whereArgs: [id],
    );
  }

  /// Hapus semua tax‑discount lama (biasanya dipanggil setiap sync online)
  Future<void> removeAllTaxDiscount() async {
    final db = await instance.database;
    await db.delete(tableTaxDiscount);
  }

  /// Simpan sekumpulan tax‑discount sekaligus (pakai Batch biar cepat)
  Future<void> insertAllTaxDiscount(List<TaxDiscountModel> list) async {
    final db = await instance.database;
    final batch = db.batch();

    for (final td in list) {
      batch.insert(
        tableTaxDiscount,
        td.toBackupMap(),
        conflictAlgorithm: ConflictAlgorithm.replace, // overwrite bila sama
      );
    }

    await batch.commit(noResult: true);
  }

  Future<List<TaxDiscountModel>> getAllTaxDiscount() async {
    final db = await instance.database;
    final List<Map<String, dynamic>> maps = await db.query(tableTaxDiscount);
    return List.generate(maps.length, (i) {
      return TaxDiscountModel.fromLocalMap(maps[i]);
    });
  }

  // get discount by id
  // Future<TaxDiscountModel> getTaxDiscountById(int id) async {
  //   final db = await instance.database;
  //   final List<Map<String, dynamic>> maps =
  //       await db.query(tableTaxDiscount, where: 'id = ?', whereArgs: [id]);
  //   return TaxDiscountModel.fromLocalMap(maps[0]);
  // }

  // get tax discount by charge type
  Future<TaxDiscountModel?> getTaxDiscountByChargeType(
      String chargeType) async {
    final db = await instance.database;
    final List<Map<String, dynamic>> maps = await db.query(tableTaxDiscount,
        where: 'chargeType = ?', whereArgs: [chargeType]);

    if (maps.isEmpty) {
      return null;
    } else {
      return TaxDiscountModel.fromLocalMap(maps[0]);
    }
  }

  Future<void> saveTaxDiscount(TaxDiscountModel discount) async {
    final db = await instance.database;
    log("Save tax discount: ${discount.toMap()}");
    await db.insert(tableTaxDiscount, discount.toMap());
  }

  Future<void> updateTaxDiscount(TaxDiscountModel discount) async {
    final db = await instance.database;
    await db.update(tableTaxDiscount, discount.toMap(),
        where: 'id = ?', whereArgs: [discount.id]);
  }

  Future<void> deleteTaxDiscount(int id) async {
    final db = await instance.database;
    await db.delete(tableTaxDiscount, where: 'id = ?', whereArgs: [id]);
  }

  // get all user
  Future<List<UserModel>> getAllUser() async {
    final db = await instance.database;
    final List<Map<String, dynamic>> maps = await db.query(tableUsers);

    return List.generate(maps.length, (i) {
      return UserModel.fromMap(maps[i]);
    });
  }

  // get cashier by id
  Future<UserModel> getUserById(String id) async {
    final db = await instance.database;
    final result =
        await db.query(tableUsers, where: 'userId = ?', whereArgs: [id]);
    return UserModel.fromMap(result[0]);
  }

  // get user by email
  Future<UserModel?> getUserByEmail(String email) async {
    final db = await instance.database;
    final result =
        await db.query(tableUsers, where: 'email = ?', whereArgs: [email]);
    if (result.isEmpty) {
      return null;
    } else {
      return UserModel.fromMap(result[0]);
    }
  }

  Future<void> saveUser(UserModel user) async {
    final db = await instance.database;
    log("Save user: ${user.toMap()}");
    await db.insert(tableUsers, user.toMap());
  }

  Future<void> updateUser(UserModel user) async {
    final db = await instance.database;
    await db.update(tableUsers, user.toMap(),
        where: 'id = ?', whereArgs: [user.id]);
  }

  Future<void> deleteUser(int id) async {
    final db = await instance.database;
    await db.delete(tableUsers, where: 'id = ?', whereArgs: [id]);
  }

  //Stock
  Future<void> saveStock(Stock stock) async {
    final db = await instance.database;
    await db.insert(tableStocks, {
      'id': stock.id,
      'product_id': stock.productId,
      'outlet_id': stock.outletId,
      'quantity': stock.quantity,
      'created_at': stock.createdAt?.toIso8601String(),
      'updated_at': stock.updatedAt?.toIso8601String(),
    });
  }

  // Future<void> insertAllStock(List<Stock> stocks) async {
  //   final db = await instance.database;
  //   for (var stock in stocks) {
  //     await saveStock(stock);
  //   }
  // }

  Future<void> insertAllStock(List<Stock> stocks) async {
    final db = await instance.database;
    for (var stock in stocks) {
      await db.insert(tableStocks, stock.toBackUpMap());
    }
  }

  Future<void> removeAllStock() async {
    final db = await instance.database;
    await db.delete(tableStocks);
  }

  Future<Stock?> getStockByProductAndOutlet(int productId, int outletId) async {
    final db = await instance.database;
    final result = await db.query(
      tableStocks,
      where: 'product_id = ? AND outlet_id = ?',
      whereArgs: [productId, outletId],
    );
    if (result.isEmpty) return null;
    return Stock.fromMap(result.first);
  }

  // clear all data
  Future<void> clearAllData() async {
    final db = await instance.database;
    await db.delete(tableUsers);
    await db.delete(tableCategories);
    await db.delete(tableProducts);
    await db.delete(tableTransactions);
    await db.delete(tableTransactionItems);
    await db.delete(tableTaxDiscount);
  }
}
