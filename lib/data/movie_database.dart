import 'dart:async';
import 'dart:io';

import 'package:path/path.dart';
import 'package:path_provider/path_provider.dart';
import 'package:popular_movies/model/movie.dart';
import 'package:sqflite/sqflite.dart';

class MovieDatabase {
  static final MovieDatabase _instance = MovieDatabase._internal();

  factory MovieDatabase() => _instance;

  MovieDatabase._internal();

  final String tableName = 'favorite_movies';
  final String columnId = 'id';
  final String columnPosterPath = 'poster_path';
  final String columnAdult = 'adult';
  final String columnOverview = 'overview';
  final String columnReleaseDate = 'release_date';
  final String columnOriginalTitle = 'original_title';
  final String columnOriginalLanguage = 'original_language';
  final String columnTitle = 'title';
  final String columnBackdropPath = 'backdrop_path';
  final String columnPopularity = 'popularity';
  final String columnVoteCount = 'vote_count';
  final String columnVideo = 'video';
  final String columnVoteAverage = 'vote_average';

  static Database _db;

  Future<Database> get db async {
    if (_db != null) {
      return _db;
    }
    _db = await _initDb();
    return _db;
  }

  Future<Database> _initDb() async {
    Directory documentsDirectory = await getApplicationDocumentsDirectory();
    var path = join(documentsDirectory.path, 'movies.db');
    var db = await openDatabase(path, version: 1, onCreate: _onCreate);
    return db;
  }

  _onCreate(Database db, int version) {
    db.execute('CREATE TABLE $tableName ($columnId INTEGER PRIMARY KEY,'
        '$columnPosterPath TEXT,'
        '$columnAdult INTEGER,'
        '$columnOverview TEXT,'
        '$columnReleaseDate TEXT,'
        '$columnOriginalTitle TEXT,'
        '$columnOriginalLanguage TEXT,'
        '$columnTitle TEXT,'
        '$columnBackdropPath TEXT,'
        '$columnPopularity INTEGER,'
        '$columnVoteCount INTEGER,'
        '$columnVideo INTEGER,'
        '$columnVoteAverage REAL'
        ')');
    print('Table is created!');
  }

  //Insertion
  Future<int> saveFavorite(Movie item) async {
    var dbClient = await db;
    int id = await dbClient.insert(tableName, item.toDbValues());
    return id;
  }

  //Get Items
  Future<List<Movie>> getFavorites() async {
    var dbClient = await db;
    var list = dbClient.rawQuery("SELECT * FROM $tableName").then(
        (items) => items.map((item) => Movie.fromDbValues(item)).toList());
    return list;
  }

  //Get Item
  Future<Movie> getFavoriteById(int id) async {
    var dbClient = await db;
    var list = await dbClient
        .query(tableName, where: '$columnId = ?', whereArgs: [id]);
    if (list.length == 0) return null;
    return Movie.fromDbValues(list[0]);
  }

  //Get count
  Future<int> getFavoriteCount() async {
    var dbClient = await db;
    return Sqflite.firstIntValue(await dbClient.query(tableName));
  }

  //Delete Item
  Future<int> deleteFavorite(int id) async {
    var dbClient = await db;
    int row =
        await dbClient.delete(tableName, where: '$columnId=?', whereArgs: [id]);
    return row;
  }

  //Update Item
  Future<int> updateFavorite(Movie item) async {
    var dbClient = await db;
    var row = await dbClient.update(tableName, item.toDbValues(),
        where: '$columnId=?', whereArgs: [item.id]);
    return row;
  }

  //Close db
  Future close() async {
    var dbClient = await db;
    return dbClient.close();
  }
}
