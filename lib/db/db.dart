// ignore_for_file: avoid_print

import 'dart:async';

import 'package:sqflite/sqflite.dart';
import 'package:path/path.dart' as p;
import 'package:flutter_application_1/model/entry.dart';

abstract class DB {
  static late Database _db;
  static int get _version => 1;

  static Future<void> init() async {
    try {
      String path = await getDatabasesPath();
      String dbpath = p.join(path, 'database.db');
      _db = await openDatabase(dbpath, version: _version, onCreate: onCreate);
    } catch (ex) {
      print(ex);
    }
  }

  static FutureOr<void> onCreate(Database db, int version) async {
    await db.execute('''
      CREATE TABLE entries (
        id INTEGER PRIMARY KEY NOT NULL, 
        duration STRING,
        distance REAL,
        avepace REAL,
        avespeed REAL, 
        topspeed REAL,
      )
    ''');
  }

  static Future<List<Map<String, dynamic>>> query(String table) async =>
      await _db.query(table);
  static Future<int> insert(String table, Entry item) async =>
      await _db.insert(table, item.toMap());
}
