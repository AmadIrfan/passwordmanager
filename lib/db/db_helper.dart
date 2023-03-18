import 'package:firebase_auth/firebase_auth.dart';
import 'package:sqflite/sqflite.dart' as sql;
import 'package:path/path.dart' as path;
import 'package:sqflite/sqflite.dart';

class Password_DbHelper {
  static Future<Database> dataBase() async {
    final dbPath = await sql.getDatabasesPath();
    return await sql.openDatabase(
        path.join(
          dbPath,
          "password.db",
        ), onCreate: (db, version) {
      return db.execute(
          "CREATE TABLE password(id TEXT PRIMARY KEY,uid TEXT,name TEXT,web TEXT,password TEXT,date TEXT)");
    }, version: 1);
  }

  static Future<void> insertData(String table, Map<String, Object> data) async {
    final db = await Password_DbHelper.dataBase();
    db.insert(
      table,
      data,
      conflictAlgorithm: ConflictAlgorithm.replace,
    );
  }

  static Future<List<Map<String, dynamic>>> getData(String table) async {
    FirebaseAuth _auth = FirebaseAuth.instance;
    final db = await Password_DbHelper.dataBase();
    return await db.query(
      table,
      where: "uid=?",
      whereArgs: [_auth.currentUser!.uid],
    );
  }
}

class Address_Db_Helper {
  static Future<Database> database() async {
    FirebaseAuth _auth = FirebaseAuth.instance;
    final dbPath = await sql.getDatabasesPath();
    print(_auth.currentUser!.uid);
    return await sql.openDatabase(
      path.join(dbPath, "Address.db"),
      onCreate: (db, version) {
        return db.execute(
            "CREATE TABLE Address(id TEXT PRIMARY KEY,uid TEXT,name TEXT,orgnization TEXT, phone TEXT, email TEXT, country TEXT, street_Address TEXT, city TEXT, postalCode TEXT)");
      },
      version: 1,
    );
  }

  static Future<void> insert(String table, Map<String, Object> data) async {
    final db = await Address_Db_Helper.database();
    await db.insert(
      table,
      data,
      conflictAlgorithm: ConflictAlgorithm.replace,
    );
  }

  static Future<List<Map<String, dynamic>>> data(String table) async {
    FirebaseAuth _auth = FirebaseAuth.instance;
    final db = await Address_Db_Helper.database();
    return db.query(
      table,
      where: "uid=?",
      whereArgs: [_auth.currentUser!.uid],
    );
  }
}
