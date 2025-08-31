import 'package:sqflite/sqflite.dart';
import 'package:path/path.dart';
import 'modele/redacteur.dart';

class DatabaseManager {
  static final DatabaseManager instance = DatabaseManager._init();
  static Database? _database;

  DatabaseManager._init();

  Future<Database> get database async {
    if (_database != null) return _database!;
    _database = await _initDB('redacteurs.db');
    return _database!;
  }

  Future<Database> _initDB(String filePath) async {
    final dbPath = await getDatabasesPath();
    final path = join(dbPath, filePath);
    return await openDatabase(path, version: 1, onCreate: _createDB);
  }

  Future _createDB(Database db, int version) async {
    await db.execute('''
      CREATE TABLE redacteurs(
        id INTEGER PRIMARY KEY AUTOINCREMENT,
        nom TEXT NOT NULL,
        prenom TEXT NOT NULL,
        email TEXT NOT NULL
      )
    ''');
  }

  Future<List<Redacteur>> getAllRedacteurs() async {
    final db = await instance.database;
    final result = await db.query('redacteurs');
    return result.map((map) => Redacteur.fromMap(map)).toList();
  }

  Future<int> insertRedacteur(Redacteur r) async {
    final db = await instance.database;
    return await db.insert('redacteurs', r.toMap());
  }

  Future<int> updateRedacteur(Redacteur r) async {
    final db = await instance.database;
    return await db.update('redacteurs', r.toMap(),
        where: 'id = ?', whereArgs: [r.id]);
  }

  Future<int> deleteRedacteur(int id) async {
    final db = await instance.database;
    return await db.delete('redacteurs', where: 'id = ?', whereArgs: [id]);
  }
}
