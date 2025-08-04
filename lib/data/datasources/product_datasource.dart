import 'package:eky_pos/data/datasources/db_local_datasource.dart';
import 'package:eky_pos/data/models/responses/product_response_model.dart';
import 'package:sqflite/sqflite.dart';

class ProductDataSource {
  final DBLocalDatasource dbLocal;

  ProductDataSource({required this.dbLocal});

  static final String tableProducts = 'products';

  static Future<void> createTableProduct(Database db) async {
    await db.execute('''
      CREATE TABLE $tableProducts (
        id INTEGER PRIMARY KEY AUTOINCREMENT,
        name TEXT,
        product_id INTEGER,
        category_id INTEGER,
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
  }

  Future<int> saveProduct(ProductModel product) async {
    final db = await dbLocal.database;
    return await db.insert(tableProducts, product.toMap());
  }

  Future<List<ProductModel>> getAllProduct() async {
    final db = await dbLocal.database;
    final result = await db.query(tableProducts);
    return result.map((e) => ProductModel.fromMap(e)).toList();
  }

  Future<ProductModel?> getProductById(int id) async {
    final db = await dbLocal.database;
    final rows = await db.query(tableProducts,
      where: 'id = ?',
      whereArgs: [id],
      limit: 1
    );
    if (rows.isEmpty) return null;
    return ProductModel.fromMap(rows.first);
  }

  Future<void> removeAllProduct() async {
    final db = await dbLocal.database;
    await db.delete(tableProducts);
  }

  Future<int> updateProduct(ProductModel product) async {
    final db = await dbLocal.database;
    return await db.update(
      tableProducts,
      product.toMap(),
      where: 'id = ?',
      whereArgs: [product.id!],
    );
  }

  Future<int> deleteProduct(int id) async {
    final db = await dbLocal.database;
    return await db.delete(
      tableProducts,
      where: 'id = ?',
      whereArgs: [id],
    );
  }
}