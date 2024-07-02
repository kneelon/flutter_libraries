import 'package:libraries/library/sqflite/database/todo_db.dart';
import 'package:libraries/library/sqflite/model/todo_model.dart';
import 'package:sqflite/sqflite.dart';
import 'package:path/path.dart';

class DatabaseService {
  Database? _database;

  Future<Database> get database async {
    if (_database != null) {
      return _database!;
    }
    _database = await _initialize();
    return _database!;
  }

  Future<String> get fullPath async {
    const name = 'todo.db';
    final path = await getDatabasesPath();
    return join(path, name);
  }

  Future<Database> _initialize() async {
    // final path = await fullPath;
    // var database = await openDatabase(
    //   path,
    //   version: 1,
    //   onCreate: create,
    //   singleInstance: true,
    // );
    // return database;
    return await openDatabase(
      join(await getDatabasesPath(), 'todo_database.db'),
      onCreate: (db, version) {
        return db.execute(
          'CREATE TABLE todos(id INTEGER PRIMARY KEY, title TEXT, created_at INTEGER, updated_at INTEGER)',
        );
      },
      version: 1,
    );

  }

  Future<void> create(Database database, int version) async {
    return await TodoDB().createTable(database);
  }
}