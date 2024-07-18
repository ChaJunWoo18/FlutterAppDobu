import 'package:prob/db/category_model.dart';
import 'package:sqflite/sqflite.dart';
import 'package:path/path.dart';
import 'consum_hist_model.dart';

class SqfliteControl {
  static late Database database;
  static late String _path;

  static Future<String> createDB() async {
    var databasesPath = await getDatabasesPath();
    _path = join(databasesPath, 'history.db');
    return _path;
  }

  static Future<void> createTable() async {
    database = await openDatabase(
      _path,
      version: 1,
      onCreate: (db, version) async {
        await db.execute(
          '''CREATE TABLE consum_his (id INTEGER PRIMARY KEY AUTOINCREMENT, 
                                      date TEXT NOT NULL, 
                                      receiver TEXT NOT NULL, 
                                      amount INTEGER NOT NULL,
                                      categoryId INTEGER,
                                      FOREIGN KEY (categoryId) REFERENCES category(id)
                                      )
          ''',
        );
        await db.execute('''
            CREATE TABLE category (
              id INTEGER PRIMARY KEY AUTOINCREMENT,
              name TEXT)
          ''');
      },
    );
  }

  static Future<void> initializeDatabase() async {
    await createDB();
    await createTable();
  }

  static Future insertQuery(ConsumHistModel sqfliteModel) async {
    await database.insert(
      'consum_his',
      sqfliteModel.toMap(),
      conflictAlgorithm: ConflictAlgorithm.replace,
    );
  }

  // 데이터 수정
  static Future<void> updateConsumHis(ConsumHistModel sqfliteModel) async {
    await database.update(
      'consum_his',
      sqfliteModel.toMap(),
      where: 'id = ?',
      whereArgs: [sqfliteModel.id],
    );
  }

  // 데이터 삭제
  static Future<void> deleteTestData() async {
    await database.rawDelete("delete from consum_his");
    await database.rawDelete("delete from category");
  }

  // 데이터 전부 삭제
  static Future<void> deleteAllConsumHis() async {
    await database.delete('consum_his');
  }

  static Future<List<ConsumHistModel>> getAllConsumHis() async {
    final List<Map<String, dynamic>> maps = await database.query('consum_his');

    return List.generate(maps.length, (i) {
      return ConsumHistModel(
        id: maps[i]['id'],
        date: maps[i]['date'],
        receiver: maps[i]['receiver'],
        amount: maps[i]['amount'],
        categoryId: maps[i]['categoryId'],
      );
    });
  }

  static Future<List<CategoryModel>> getAllCategory() async {
    final List<Map<String, dynamic>> maps = await database.query('category');

    return List.generate(maps.length, (i) {
      return CategoryModel(
        id: maps[i]['id'],
        name: maps[i]['name'],
      );
    });
  }

  static Future insertCategory(CategoryModel categoryModel) async {
    await database.insert(
      'category',
      categoryModel.toMap(),
      conflictAlgorithm: ConflictAlgorithm.replace,
    );
  }

  static Future addCategory(String categoryName) async {
    await database.insert('category', {'name': categoryName},
        conflictAlgorithm: ConflictAlgorithm.replace);
  }
}
