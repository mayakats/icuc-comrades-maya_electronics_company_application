import 'package:sqflite/sqflite.dart';
import 'package:path/path.dart';

class DatabaseHelper {
  static Database? _database;

  Future<Database> get database async {
    if (_database != null) return _database!;

    // If _database is null, instantiate it
    _database = await initDatabase();
    return _database!;
  }

  Future<Database> initDatabase() async {
    final databasesPath = await getDatabasesPath();
    final path = join(databasesPath, 'mayaelectronicscompany.db');

    return await openDatabase(path, version: 1, onCreate: (db, version) async {
      // Create tables and perform initial setup if needed
      await db.execute('''
        CREATE TABLE userdata (
          Id INTEGER PRIMARY KEY AUTOINCREMENT,
          Fullname TEXT,
          Username TEXT,
          Password TEXT,
          Age INTEGER,
          Department TEXT,
          Address TEXT
        )
      ''');
    });
  }

  Future<int> insertUser(Map<String, dynamic> user) async {
    final db = await database;
    return await db.insert('userdata', user);
  }

  Future<List<Map<String, dynamic>>> getUsers() async {
    final db = await database;
    return await db.query('userdata');
  }

  Future<Map<String, dynamic>> getSingleUser(int userId) async {
    final db = await database;
    List<Map<String, dynamic>> result = await db.query('userdata',
        where: 'Id = ?', whereArgs: [userId]);

    if (result.isNotEmpty) {
      return result.first;
    } else {
      // Return an empty map if the user is not found
      return {};
    }
  }

  Future<int> updateUser(Map<String, dynamic> user) async {
    final db = await database;
    return await db.update('userdata', user,
        where: 'Id = ?', whereArgs: [user['Id']]);
  }

  Future<int> deleteUser(int userId) async {
    final db = await database;
    return await db.delete('userdata', where: 'Id = ?', whereArgs: [userId]);
  }
}
