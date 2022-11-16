
import 'package:ditonton/common/exception.dart';
import 'package:ditonton/data/datasources/tvseries_local_data_source.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/mockito.dart';
import '../../dummy_data/dummy_objects.dart';
import '../../helpers/test_helper.mocks.dart';

void main() {
  late TvSeriesLocalDataSourceImpl dataSource;
  late MockDatabaseHelper mockDatabaseHelper;

  setUp(() {
    mockDatabaseHelper = MockDatabaseHelper();
    dataSource = TvSeriesLocalDataSourceImpl(databaseHelper: mockDatabaseHelper);
  });

  group('save watchlist', () {
    test('should return success message when insert to database is success',
            () async {
          // arrange
          when(mockDatabaseHelper.insertTvSeriesWatchlist(testTvSeriesTable))
              .thenAnswer((_) async => 1);
          // act
          final result = await dataSource.insertWatchlist(testTvSeriesTable);
          // assert
          expect(result, 'Added to Watchlist');
        });

    test('should throw DatabaseException when insert to database is failed',
            () async {
          // arrange
          when(mockDatabaseHelper.insertTvSeriesWatchlist(testTvSeriesTable))
              .thenThrow(Exception());
          // act
          final call = dataSource.insertWatchlist(testTvSeriesTable);
          // assert
          expect(() => call, throwsA(isA<DatabaseException>()));
        });
  });

  group('remove watchlist', () {
    test('should return success message when remove from database is success',
            () async {
          // arrange
          when(mockDatabaseHelper.removeTvSeriesWatchlist(testTvSeriesTable))
              .thenAnswer((_) async => 1);
          // act
          final result = await dataSource.removeWatchlist(testTvSeriesTable);
          // assert
          expect(result, 'Removed from Watchlist');
        });

    test('should throw DatabaseException when remove from database is failed',
            () async {
          // arrange
          when(mockDatabaseHelper.removeTvSeriesWatchlist(testTvSeriesTable))
              .thenThrow(Exception());
          // act
          final call = dataSource.removeWatchlist(testTvSeriesTable);
          // assert
          expect(() => call, throwsA(isA<DatabaseException>()));
        });
  });

  group('Get Tv Series Detail By Id', () {
    final tId = 94605;

    test('should return Tv Series Detail Table when data is found', () async {
      // arrange
      when(mockDatabaseHelper.getTvseriesById(tId))
          .thenAnswer((_) async => testTvSeriesMap);
      // act
      final result = await dataSource.getTvSeriesById(tId);
      // assert
      expect(result, testTvSeriesTable);
    });

    test('should return null when data is not found', () async {
      // arrange
      when(mockDatabaseHelper.getTvseriesById(tId)).thenAnswer((_) async => null);
      // act
      final result = await dataSource.getTvSeriesById(tId);
      // assert
      expect(result, null);
    });
  });

  group('get watchlist tv series', () {
    test('should return list of TvSeriesTable from database', () async {
      // arrange
      when(mockDatabaseHelper.getWatchlistTvSeries())
          .thenAnswer((_) async => [testTvSeriesMap]);
      // act
      final result = await dataSource.getWatchlistTvSeries();
      // assert
      expect(result, [testTvSeriesTable]);
    });
  });

  group('cache now playing tv series', () {
    test('should call database helper to save data', () async {
      // arrange
      when(mockDatabaseHelper.clearCache('now playing'))
          .thenAnswer((_) async => 1);
      // act
      await dataSource.cacheNowPlayingTvSeries([testTvSeriesCache]);
      // assert
      verify(mockDatabaseHelper.clearCache('now playing'));
      verify(mockDatabaseHelper
          .insertTvSeriesCacheTransaction([testTvSeriesCache], 'now playing'));
    });

    test('should return list of tv series from db when data exist', () async {
      // arrange
      when(mockDatabaseHelper.getCache('now playing'))
          .thenAnswer((_) async => [testTvSeriesCacheMap]);
      // act
      final result = await dataSource.getCachedNowPlayingTvSeries();
      // assert
      expect(result, [testTvSeriesCache]);
    });

    test('should throw CacheException when cache data is not exist', () async {
      // arrange
      when(mockDatabaseHelper.getCache('now playing'))
          .thenAnswer((_) async => []);
      // act
      final call = dataSource.getCachedNowPlayingTvSeries();
      // assert
      expect(() => call, throwsA(isA<CacheException>()));
    });
  });
}