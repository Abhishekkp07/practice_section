import 'package:sqflite/sqflite.dart' as sql;
class SQ_Functions {

   /// create database
  static Future<sql.Database> openOrCreateDb()async{
    return sql.openDatabase("users",version: 1,
    onCreate: (sql.Database db,int version) async{
      await createTable(db);
    });
  }

  ///creating table to store user data
  static Future<void> createTable(sql.Database db) async{
    await db.execute(
          'CREATE TABLE Test (id INTEGER PRIMARY KEY, name TEXT, value INTEGER, num REAL)');
  }


  static addUser(String name, String email, String pass) {

  }


  
}