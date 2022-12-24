import 'package:sqflite/sqflite.dart' as sql;
import 'package:path/path.dart' as path;
import 'package:sqflite/sqflite.dart';

class Password_DbHelper {
  static Future<Database> passDataBase() async {
    final dbPath = await sql.getDatabasesPath();
    return await sql.openDatabase(path.join(dbPath, 'passwords.db'),
        onCreate: ((db, version) {
      return db.execute(
          'CREATE TABLE PASSWORD(id TEXT PRIMARY KEY ,webSite TEXT,uName Text,password TEXT, addDate TEXT)');
    }), version: 1);
  }

  Future<void> insert(String table, Map<String, Object> data) async {
    final db = await Password_DbHelper.passDataBase();
    db.insert(
      table,
      data,
      conflictAlgorithm: ConflictAlgorithm.replace,
    );
  }

  Future<List<Map<String, dynamic>>> getData(String table) async {
    final db = await Password_DbHelper.passDataBase();
    return db.query(table);
  }

  Future<Database> AddressDataBase() async {
    final dbPath = await sql.getDatabasesPath();
    return sql.openDatabase(path.join(dbPath, "Address.db"),
        onCreate: (db, version) {
      db.execute("CREATE TABLE ADDRESS()");
    }, version: 1);
  }
}
