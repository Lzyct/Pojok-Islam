import 'dart:io' as io;

import 'package:path/path.dart';
import 'package:path_provider/path_provider.dart';
import 'package:sqflite/sqflite.dart';

///*********************************************
/// Created by ukietux on 2019-12-30 with ♥
/// (>’’)> email : ukie.tux@gmail.com
/// github : https://www.github.com/ukieTux <(’’<)
///*********************************************
/// © 2019 | All Right Reserved
class DbHelper {
  Database db;

  Future<Database> get dataBase async {
    if (db != null) return db;
    db = await initDb();
    return db;
  }

  initDb() async {
    io.Directory documentsDirectory = await getApplicationDocumentsDirectory();
    String path = join(documentsDirectory.path, "pojokislam.db");
    var theDb = await openDatabase(path, version: 1, onCreate: onCreate);
    return theDb;
  }

  // Creating a table name Employee with fields
  void onCreate(Database db, int version) async {
    // When creating the db, create the table
    await db.execute(
        "CREATE TABLE PrayerTime(timestamp INTEGER PRIMARY KEY, waktuShalat TEXT, hijriah TEXT, masehi TEXT,detailHijriah TEXT,detailMasehi TEXT,holidays TEXT,kota TEXT,negara TEXT,method TEXT)");
    print("Created tables");
  }
}
