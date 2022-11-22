
import 'dart:async';
import 'package:sqflite/sqflite.dart';

import '../../models/movies/movie_table.dart';
import '../../models/tvseries/tvseries_table.dart';

class DatabaseHelper {
  static DatabaseHelper? _databaseHelper;
  DatabaseHelper._instance() {
    _databaseHelper = this;
  }

  factory DatabaseHelper() => _databaseHelper ?? DatabaseHelper._instance();

  static Database? _database;

  Future<Database?> get database async {
    if (_database == null) {
      _database = await _initDb();
    }
    return _database;
  }

  static const String _tblWatchlist = 'watchlist';
  static const String _tblCache = 'cache';

  Future<Database> _initDb() async {
    final path = await getDatabasesPath();
    final databasePath = '$path/ditonton.db';

    var db = await openDatabase(databasePath, version: 1, onCreate: _onCreate);
    return db;
  }

  void _onCreate(Database db, int version) async {
    await db.execute('''
      CREATE TABLE  $_tblWatchlist (
        id INTEGER PRIMARY KEY,
        title TEXT,
        overview TEXT,
        posterPath TEXT,
        type TEXT
      );
    ''');
    await db.execute('''
      CREATE TABLE  $_tblCache (
        id INTEGER PRIMARY KEY,
        title TEXT,
        overview TEXT,
        posterPath TEXT,
        category TEXT,
        type TEXT
      );
    ''');
  }

  Future<void> insertMovieCacheTransaction(
      List<MovieTable> movies, String category) async {
    final db = await database;

    db!.transaction((txn) async {
      for (final movie in movies) {
        final movieJson = movie.toJson();
        movieJson['category'] = category;
        movieJson['type'] = "movies";
        txn.insert(_tblCache, movieJson);
      }
    });
  }

  Future<void> insertTvSeriesCacheTransaction(
      List<TvSeriesTable> tvSeries, String category) async {
    final db = await database;

    db!.transaction((txn) async {
      for (final tvSeries in tvSeries) {
        final tvseriesJson = tvSeries.toJson();
        tvseriesJson['category'] = category;
        tvseriesJson['type'] = "tvseries";
        txn.insert(_tblCache, tvseriesJson);
      }
    });
  }

  Future<List<Map<String, dynamic>>> getCache(String category) async {
    final db = await database;

    final List<Map<String, dynamic>> results = await db!.query(
      _tblCache,
      where: 'category = ?',
      whereArgs: [category],
    );

    return results;
  }

  Future<int> clearCache(String category) async {
    final db = await database;

    return await db!.delete(
      _tblCache,
      where: 'category = ?',
      whereArgs: [category],
    );
  }

  Future<int> insertMoviesWatchlist(MovieTable movie) async {
    final db = await database;
    final movieJson = movie.toJson();

    movieJson['type'] = 'movie';

    return await db!.insert(_tblWatchlist, movieJson);
  }

  Future<int> removeMoviesWatchlist(MovieTable movie) async {
    final db = await database;

    return await db!.delete(
      _tblWatchlist,
      where: 'id = ? and type = "movie" ',
      whereArgs: [movie.id],
    );
  }

  Future<int> insertTvSeriesWatchlist(TvSeriesTable tvSeries) async {
    final db = await database;
    final tvSeriesJson = tvSeries.toJson();

    tvSeriesJson['type'] = 'tvseries';

    return await db!.insert(_tblWatchlist, tvSeriesJson);
  }

  Future<int> removeTvSeriesWatchlist(TvSeriesTable tvSeries) async {
    final db = await database;

    return await db!.delete(
      _tblWatchlist,
      where: 'id = ? and type = "tvseries" ',
      whereArgs: [tvSeries.id],
    );
  }

  Future<Map<String, dynamic>?> getMovieById(int id) async {
    final db = await database;

    final results = await db!.query(
      _tblWatchlist,
      where: 'id = ? and type = "movie"',
      whereArgs: [id],
    );

    if (results.isNotEmpty) {
      return results.first;
    } else {
      return null;
    }
  }

  Future<List<Map<String, dynamic>>> getWatchlistMovies() async {
    final db = await database;

    final List<Map<String, dynamic>> results = await db!.query(
      _tblWatchlist,
      where: 'type = "movie"',
    );

    return results;
  }

  Future<Map<String, dynamic>?> getTvseriesById(int id) async {
    final db = await database;

    final results = await db!.query(
      _tblWatchlist,
      where: 'id = ? and type = "tvseries"',
      whereArgs: [id],
    );

    if (results.isNotEmpty) {
      return results.first;
    } else {
      return null;
    }
  }

  Future<List<Map<String, dynamic>>> getWatchlistTvSeries() async {
    final db = await database;

    final List<Map<String, dynamic>> results = await db!.query(
      _tblWatchlist,
      where: 'type = "tvseries"',
    );

    return results;
  }

}
