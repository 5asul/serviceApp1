import 'package:sqflite/sqflite.dart';
import 'package:path/path.dart';

class SqlDb {
  static Database? _db;

  Future<Database?> get db async {
    if (_db == null) {
      _db = await _initialDb();
      return _db;
    } else {
      return _db;
    }
  }

  Future<Database> _initialDb() async {
    String databasePath = await getDatabasesPath();
    String path = join(databasePath, 'ahmed.db');
    Database mydb = await openDatabase(path,
      version: 2,
      onCreate: _onCreate,
      onUpgrade: _onUpgrade,
    );
    return mydb;
  }

  Future<void> _onUpgrade(Database db, int oldversion, int newversion) async {
    try {
      await db.execute('''
      CREATE TABLE "services" (
        "id" INTEGER PRIMARY KEY AUTOINCREMENT,
        "service_name" TEXT NOT NULL,
        "time" time NOT NULL,
        "user_id" INTEGER,
        FOREIGN KEY (user_id) REFERENCES users(id)
      )
    ''');
      print('_onCreate DATABASE AND TABLE CREATED SUCCESSFULLY');
    } catch (e) {
      print('ERROR ON CREATING TABLE: $e');
    }
    print('_onUpgrade DATABASE AND TABLE================');
  }

  Future<void> _onCreate(Database db, int version) async {
    try {
      await db.execute('''
      CREATE TABLE "users" (
        "id" INTEGER PRIMARY KEY AUTOINCREMENT,
        "username" TEXT NOT NULL,
        "email" TEXT NOT NULL,
        "password" TEXT NOT NULL
      )
    ''');
      print('_onCreate DATABASE AND TABLE CREATED SUCCESSFULLY');
    } catch (e) {
      print('ERROR ON CREATING TABLE: $e');
    }
  }


  readData(String sql)async {
    Database? mydb = await db;
    List<Map> response = await mydb!.rawQuery(sql);
    return response;
  }
  insertData(String sql)async {
    Database? mydb = await db;
    int response = await mydb!.rawInsert(sql);
    return response;
  }
  updateData(String sql)async {
    Database? mydb = await db;
    int response = await mydb!.rawUpdate(sql);
    return response;
  }
  deleteData(String sql)async {
    Database? mydb = await db;
    int response = await mydb!.rawDelete(sql);
    return response;
  }



  Future<void> close() async {
    final dbClient = await db;
    dbClient?.close();
  }
}
