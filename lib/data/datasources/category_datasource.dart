
import 'package:eky_pos/data/datasources/db_local_datasource.dart';
import 'package:eky_pos/data/models/responses/category_response_model.dart';
import 'package:sqflite/sqflite.dart';

class CategoryDataSource {
  final DBLocalDatasource dbLocal;

  CategoryDataSource({required this.dbLocal});

  static final String tableCategories = 'categories';

  static Future<void> createTableCategory(Database db) async {
    await db.execute('''
      CREATE TABLE $tableCategories (
        id INTEGER PRIMARY KEY AUTOINCREMENT,
        name TEXT,
        category_id INTEGER,
        created_at TEXT,
        updated_at TEXT
      )
    '''); 
  }

  Future<int> saveCategory(CategoryModel category) async {
    final db = await dbLocal.database;
    return await db.insert(tableCategories, category.toMap());
  }

  Future<List<CategoryModel>> getAllCategory() async {
    final db = await dbLocal.database;
    final result = await db.query(tableCategories);
    return result.map((e) => CategoryModel.fromMap(e)).toList();
  }

  Future<void> insertAllCategory(List<CategoryModel> categories) async {
    final db = await dbLocal.database;
    for (var category in categories) {
      await db.insert(tableCategories, category.toMap());
    }
  }

  Future<void> removeAllCategory() async {
    final db = await dbLocal.database;
    await db.delete(tableCategories);
  }

  Future<CategoryModel?> getCategoryById(String categoryId) async {
    final db = await dbLocal.database;
    final result = await db.query(
      tableCategories,
      where: 'id = ?',
      whereArgs: [categoryId],
    );
    if (result.isEmpty) return null;
    return CategoryModel.fromMap(result[0]);
  }

  Future<int> updateCategory(int id, String name) async {
    final db = await dbLocal.database;
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

  Future<int> deleteCategory(int id) async {
    final db = await dbLocal.database;
    return await db.delete(
      tableCategories,
      where: 'id = ?',
      whereArgs: [id],
    );
  }
}