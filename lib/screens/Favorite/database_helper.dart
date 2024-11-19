import 'package:sqflite/sqflite.dart';
import 'package:path/path.dart';
import 'favorite_model.dart';

class DatabaseHelper {
  static final DatabaseHelper instance = DatabaseHelper._init();
  static Database? _database;

  DatabaseHelper._init();

  Future<Database> get database async {
    if (_database != null) return _database!;
    _database = await _initDB('bola.db');
    return _database!;
  }

  Future<Database> _initDB(String filePath) async {
    final dbPath = await getDatabasesPath();
    final path = join(dbPath, filePath);

    return await openDatabase(
      path,
      version: 1,
      onCreate: _createDB,
    );
  }

  Future _createDB(Database db, int version) async {
    await db.execute('''
      CREATE TABLE favorites(
        malId INTEGER PRIMARY KEY,
        title TEXT,
        type TEXT,
        aired TEXT,
        genres TEXT,
        popularity INTEGER,
        imageUrl TEXT
      )
    ''');
  }

  Future<bool> isFavorite(int malId) async {
    final db = await instance.database;
    final result = await db.query(
      'favorites',
      where: 'malId = ?',
      whereArgs: [malId],
    );
    return result.isNotEmpty;
  }

  Future<int> addFavorite(FavoriteBola bola) async {
    final db = await instance.database;
    return await db.insert('favorites', bola.toMap());
  }

  Future<int> removeFavorite(int malId) async {
    final db = await instance.database;
    return await db.delete(
      'favorites',
      where: 'malId = ?',
      whereArgs: [malId],
    );
  }

  Future<List<FavoriteBola>> getAllFavorites() async {
    final db = await instance.database;
    final result = await db.query('favorites');
    return result.map((json) => FavoriteBola.fromMap(json)).toList();
  }
} 