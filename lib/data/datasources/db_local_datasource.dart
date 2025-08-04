import 'dart:developer';

import 'package:eky_pos/core/utils/talker.dart';
import 'package:eky_pos/data/datasources/category_datasource.dart';
import 'package:eky_pos/data/datasources/product_datasource.dart' show ProductDataSource;
import 'package:eky_pos/data/datasources/transaction_datasource.dart';
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
  static Database? _database;

  Future<Database> _initDB(String filePath) async {
    final dbPath = await getDatabasesPath();
    final path = dbPath + filePath;
    return await openDatabase(
      path,
      version: 1,
      onCreate: _createDB,
    );
  }

  Future<void> _createDB(Database db, int version) async {
    await CategoryDataSource.createTableCategory(db);
    await ProductDataSource.createTableProduct(db);
    await TransactionDataSource.createTransactionTable(db);
    await TransactionDataSource.createTransactionItemTable(db);
  }

  Future<Database> get database async {
    if (_database != null) return _database!;

    _database = await _initDB('ekypos.db');
    return _database!;
  }

  Future<void> clearAllData() async {
    final db = await instance.database;
    await db.delete(tableCategories);
    await db.delete(tableProducts);
    await db.delete(tableTransactions);
    await db.delete(tableTransactionItems);
  }
}
