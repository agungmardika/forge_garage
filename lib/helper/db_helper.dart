// ignore_for_file: depend_on_referenced_packages

import 'package:sqflite/sqflite.dart';
import 'package:path/path.dart';

class DBHelper {
  static final DBHelper _instance = DBHelper._internal();
  factory DBHelper() => _instance;
  DBHelper._internal();

  static Database? _database;

  Future<Database> get database async {
    if (_database != null) return _database!;
    _database = await _initDatabase();
    return _database!;
  }

  Future<Database> _initDatabase() async {
    String path = join(await getDatabasesPath(), 'reservasi.db');
    return await openDatabase(
      path,
      version: 1,
      onCreate: _onCreate,
    );
  }

  Future<void> _onCreate(Database db, int version) async {
    await db.execute('''
      CREATE TABLE reservasi (
        id INTEGER PRIMARY KEY AUTOINCREMENT,
        produk_servis TEXT,
        tanggal_servis TEXT,
        jam_servis TEXT,
        tipe_mobil TEXT
      )
    ''');
  }

  Future<int> insertReservasi(Map<String, dynamic> row) async {
    Database db = await database;
    return await db.insert('reservasi', row);
  }

  Future<int> updateReservasi(Map<String, dynamic> row) async {
    Database db = await database;
    int id = row['id'];
    return await db.update('reservasi', row, where: 'id = ?', whereArgs: [id]);
  }

  Future<void> deleteReservasi(int id) async {
    Database db = await database;
    await db.delete('reservasi', where: 'id = ?', whereArgs: [id]);
  }

  Future<List<Map<String, dynamic>>> queryAllReservasi() async {
    Database db = await database;
    return await db.query('reservasi');
  }
}
