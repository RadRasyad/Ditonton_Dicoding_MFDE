// Mocks generated by Mockito 5.3.2 from annotations
// in tvseries/test/helpers/tvseries_test_helper.dart.
// Do not manually edit this file.

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'dart:async' as _i6;
import 'dart:convert' as _i18;
import 'dart:typed_data' as _i19;

import 'package:core/core.dart' as _i7;
import 'package:core/data/datasources/db/database_helper.dart' as _i14;
import 'package:core/utils/network_info.dart' as _i17;
import 'package:dartz/dartz.dart' as _i2;
import 'package:http/http.dart' as _i4;
import 'package:mockito/mockito.dart' as _i1;
import 'package:movies/data/model/movie_table.dart' as _i16;
import 'package:sqflite/sqflite.dart' as _i15;
import 'package:tvseries/data/datasources/tvseries_local_data_source.dart'
    as _i12;
import 'package:tvseries/data/datasources/tvseries_remote_data_source.dart'
    as _i10;
import 'package:tvseries/data/model/tvseries_detail_model.dart' as _i3;
import 'package:tvseries/data/model/tvseries_model.dart' as _i11;
import 'package:tvseries/data/model/tvseries_table.dart' as _i13;
import 'package:tvseries/domain/entities/tvseries.dart' as _i8;
import 'package:tvseries/domain/entities/tvseries_detail.dart' as _i9;
import 'package:tvseries/domain/repisitories/tvseries_repository.dart' as _i5;

// ignore_for_file: type=lint
// ignore_for_file: avoid_redundant_argument_values
// ignore_for_file: avoid_setters_without_getters
// ignore_for_file: comment_references
// ignore_for_file: implementation_imports
// ignore_for_file: invalid_use_of_visible_for_testing_member
// ignore_for_file: prefer_const_constructors
// ignore_for_file: unnecessary_parenthesis
// ignore_for_file: camel_case_types
// ignore_for_file: subtype_of_sealed_class

class _FakeEither_0<L, R> extends _i1.SmartFake implements _i2.Either<L, R> {
  _FakeEither_0(
    Object parent,
    Invocation parentInvocation,
  ) : super(
          parent,
          parentInvocation,
        );
}

class _FakeTvSeriesDetailResponse_1 extends _i1.SmartFake
    implements _i3.TvSeriesDetailResponse {
  _FakeTvSeriesDetailResponse_1(
    Object parent,
    Invocation parentInvocation,
  ) : super(
          parent,
          parentInvocation,
        );
}

class _FakeResponse_2 extends _i1.SmartFake implements _i4.Response {
  _FakeResponse_2(
    Object parent,
    Invocation parentInvocation,
  ) : super(
          parent,
          parentInvocation,
        );
}

class _FakeStreamedResponse_3 extends _i1.SmartFake
    implements _i4.StreamedResponse {
  _FakeStreamedResponse_3(
    Object parent,
    Invocation parentInvocation,
  ) : super(
          parent,
          parentInvocation,
        );
}

/// A class which mocks [TvSeriesRepository].
///
/// See the documentation for Mockito's code generation for more information.
class MockTvSeriesRepository extends _i1.Mock
    implements _i5.TvSeriesRepository {
  MockTvSeriesRepository() {
    _i1.throwOnMissingStub(this);
  }

  @override
  _i6.Future<_i2.Either<_i7.Failure, List<_i8.TvSeries>>>
      getNowPlayingTvSeries() => (super.noSuchMethod(
            Invocation.method(
              #getNowPlayingTvSeries,
              [],
            ),
            returnValue:
                _i6.Future<_i2.Either<_i7.Failure, List<_i8.TvSeries>>>.value(
                    _FakeEither_0<_i7.Failure, List<_i8.TvSeries>>(
              this,
              Invocation.method(
                #getNowPlayingTvSeries,
                [],
              ),
            )),
          ) as _i6.Future<_i2.Either<_i7.Failure, List<_i8.TvSeries>>>);
  @override
  _i6.Future<_i2.Either<_i7.Failure, List<_i8.TvSeries>>>
      getPopularTvSeries() => (super.noSuchMethod(
            Invocation.method(
              #getPopularTvSeries,
              [],
            ),
            returnValue:
                _i6.Future<_i2.Either<_i7.Failure, List<_i8.TvSeries>>>.value(
                    _FakeEither_0<_i7.Failure, List<_i8.TvSeries>>(
              this,
              Invocation.method(
                #getPopularTvSeries,
                [],
              ),
            )),
          ) as _i6.Future<_i2.Either<_i7.Failure, List<_i8.TvSeries>>>);
  @override
  _i6.Future<_i2.Either<_i7.Failure, List<_i8.TvSeries>>>
      getTopRatedTvSeries() => (super.noSuchMethod(
            Invocation.method(
              #getTopRatedTvSeries,
              [],
            ),
            returnValue:
                _i6.Future<_i2.Either<_i7.Failure, List<_i8.TvSeries>>>.value(
                    _FakeEither_0<_i7.Failure, List<_i8.TvSeries>>(
              this,
              Invocation.method(
                #getTopRatedTvSeries,
                [],
              ),
            )),
          ) as _i6.Future<_i2.Either<_i7.Failure, List<_i8.TvSeries>>>);
  @override
  _i6.Future<_i2.Either<_i7.Failure, _i9.TvSeriesDetail>> getTvSeriesDetail(
          int? id) =>
      (super.noSuchMethod(
        Invocation.method(
          #getTvSeriesDetail,
          [id],
        ),
        returnValue:
            _i6.Future<_i2.Either<_i7.Failure, _i9.TvSeriesDetail>>.value(
                _FakeEither_0<_i7.Failure, _i9.TvSeriesDetail>(
          this,
          Invocation.method(
            #getTvSeriesDetail,
            [id],
          ),
        )),
      ) as _i6.Future<_i2.Either<_i7.Failure, _i9.TvSeriesDetail>>);
  @override
  _i6.Future<_i2.Either<_i7.Failure, List<_i8.TvSeries>>>
      getTvSeriesRecommendations(int? id) => (super.noSuchMethod(
            Invocation.method(
              #getTvSeriesRecommendations,
              [id],
            ),
            returnValue:
                _i6.Future<_i2.Either<_i7.Failure, List<_i8.TvSeries>>>.value(
                    _FakeEither_0<_i7.Failure, List<_i8.TvSeries>>(
              this,
              Invocation.method(
                #getTvSeriesRecommendations,
                [id],
              ),
            )),
          ) as _i6.Future<_i2.Either<_i7.Failure, List<_i8.TvSeries>>>);
  @override
  _i6.Future<_i2.Either<_i7.Failure, List<_i8.TvSeries>>> searchTvSeries(
          String? query) =>
      (super.noSuchMethod(
        Invocation.method(
          #searchTvSeries,
          [query],
        ),
        returnValue:
            _i6.Future<_i2.Either<_i7.Failure, List<_i8.TvSeries>>>.value(
                _FakeEither_0<_i7.Failure, List<_i8.TvSeries>>(
          this,
          Invocation.method(
            #searchTvSeries,
            [query],
          ),
        )),
      ) as _i6.Future<_i2.Either<_i7.Failure, List<_i8.TvSeries>>>);
  @override
  _i6.Future<_i2.Either<_i7.Failure, String>> saveTvSeriesWatchlist(
          _i9.TvSeriesDetail? tvSeries) =>
      (super.noSuchMethod(
        Invocation.method(
          #saveTvSeriesWatchlist,
          [tvSeries],
        ),
        returnValue: _i6.Future<_i2.Either<_i7.Failure, String>>.value(
            _FakeEither_0<_i7.Failure, String>(
          this,
          Invocation.method(
            #saveTvSeriesWatchlist,
            [tvSeries],
          ),
        )),
      ) as _i6.Future<_i2.Either<_i7.Failure, String>>);
  @override
  _i6.Future<_i2.Either<_i7.Failure, String>> removeTvSeriesWatchlist(
          _i9.TvSeriesDetail? tvSeries) =>
      (super.noSuchMethod(
        Invocation.method(
          #removeTvSeriesWatchlist,
          [tvSeries],
        ),
        returnValue: _i6.Future<_i2.Either<_i7.Failure, String>>.value(
            _FakeEither_0<_i7.Failure, String>(
          this,
          Invocation.method(
            #removeTvSeriesWatchlist,
            [tvSeries],
          ),
        )),
      ) as _i6.Future<_i2.Either<_i7.Failure, String>>);
  @override
  _i6.Future<bool> isAddedToWatchlist(int? id) => (super.noSuchMethod(
        Invocation.method(
          #isAddedToWatchlist,
          [id],
        ),
        returnValue: _i6.Future<bool>.value(false),
      ) as _i6.Future<bool>);
  @override
  _i6.Future<_i2.Either<_i7.Failure, List<_i8.TvSeries>>>
      getWatchlistTvSeries() => (super.noSuchMethod(
            Invocation.method(
              #getWatchlistTvSeries,
              [],
            ),
            returnValue:
                _i6.Future<_i2.Either<_i7.Failure, List<_i8.TvSeries>>>.value(
                    _FakeEither_0<_i7.Failure, List<_i8.TvSeries>>(
              this,
              Invocation.method(
                #getWatchlistTvSeries,
                [],
              ),
            )),
          ) as _i6.Future<_i2.Either<_i7.Failure, List<_i8.TvSeries>>>);
}

/// A class which mocks [TvSeriesRemoteDataSource].
///
/// See the documentation for Mockito's code generation for more information.
class MockTvSeriesRemoteDataSource extends _i1.Mock
    implements _i10.TvSeriesRemoteDataSource {
  MockTvSeriesRemoteDataSource() {
    _i1.throwOnMissingStub(this);
  }

  @override
  _i6.Future<List<_i11.TvSeriesModel>> getNowPlayingTvSeries() =>
      (super.noSuchMethod(
        Invocation.method(
          #getNowPlayingTvSeries,
          [],
        ),
        returnValue:
            _i6.Future<List<_i11.TvSeriesModel>>.value(<_i11.TvSeriesModel>[]),
      ) as _i6.Future<List<_i11.TvSeriesModel>>);
  @override
  _i6.Future<List<_i11.TvSeriesModel>> getPopularTvSeries() =>
      (super.noSuchMethod(
        Invocation.method(
          #getPopularTvSeries,
          [],
        ),
        returnValue:
            _i6.Future<List<_i11.TvSeriesModel>>.value(<_i11.TvSeriesModel>[]),
      ) as _i6.Future<List<_i11.TvSeriesModel>>);
  @override
  _i6.Future<List<_i11.TvSeriesModel>> getTopRatedTvSeries() =>
      (super.noSuchMethod(
        Invocation.method(
          #getTopRatedTvSeries,
          [],
        ),
        returnValue:
            _i6.Future<List<_i11.TvSeriesModel>>.value(<_i11.TvSeriesModel>[]),
      ) as _i6.Future<List<_i11.TvSeriesModel>>);
  @override
  _i6.Future<_i3.TvSeriesDetailResponse> getTvSeriesDetail(int? id) =>
      (super.noSuchMethod(
        Invocation.method(
          #getTvSeriesDetail,
          [id],
        ),
        returnValue: _i6.Future<_i3.TvSeriesDetailResponse>.value(
            _FakeTvSeriesDetailResponse_1(
          this,
          Invocation.method(
            #getTvSeriesDetail,
            [id],
          ),
        )),
      ) as _i6.Future<_i3.TvSeriesDetailResponse>);
  @override
  _i6.Future<List<_i11.TvSeriesModel>> getTvSeriesRecommendations(int? id) =>
      (super.noSuchMethod(
        Invocation.method(
          #getTvSeriesRecommendations,
          [id],
        ),
        returnValue:
            _i6.Future<List<_i11.TvSeriesModel>>.value(<_i11.TvSeriesModel>[]),
      ) as _i6.Future<List<_i11.TvSeriesModel>>);
  @override
  _i6.Future<List<_i11.TvSeriesModel>> searchTvSeries(String? query) =>
      (super.noSuchMethod(
        Invocation.method(
          #searchTvSeries,
          [query],
        ),
        returnValue:
            _i6.Future<List<_i11.TvSeriesModel>>.value(<_i11.TvSeriesModel>[]),
      ) as _i6.Future<List<_i11.TvSeriesModel>>);
}

/// A class which mocks [TvSeriesLocalDataSource].
///
/// See the documentation for Mockito's code generation for more information.
class MockTvSeriesLocalDataSource extends _i1.Mock
    implements _i12.TvSeriesLocalDataSource {
  MockTvSeriesLocalDataSource() {
    _i1.throwOnMissingStub(this);
  }

  @override
  _i6.Future<String> insertTvSeriesWatchlist(_i13.TvSeriesTable? tvSeries) =>
      (super.noSuchMethod(
        Invocation.method(
          #insertTvSeriesWatchlist,
          [tvSeries],
        ),
        returnValue: _i6.Future<String>.value(''),
      ) as _i6.Future<String>);
  @override
  _i6.Future<String> removeTvSeriesWatchlist(_i13.TvSeriesTable? tvSeries) =>
      (super.noSuchMethod(
        Invocation.method(
          #removeTvSeriesWatchlist,
          [tvSeries],
        ),
        returnValue: _i6.Future<String>.value(''),
      ) as _i6.Future<String>);
  @override
  _i6.Future<_i13.TvSeriesTable?> getTvSeriesById(int? id) =>
      (super.noSuchMethod(
        Invocation.method(
          #getTvSeriesById,
          [id],
        ),
        returnValue: _i6.Future<_i13.TvSeriesTable?>.value(),
      ) as _i6.Future<_i13.TvSeriesTable?>);
  @override
  _i6.Future<List<_i13.TvSeriesTable>> getWatchlistTvSeries() =>
      (super.noSuchMethod(
        Invocation.method(
          #getWatchlistTvSeries,
          [],
        ),
        returnValue:
            _i6.Future<List<_i13.TvSeriesTable>>.value(<_i13.TvSeriesTable>[]),
      ) as _i6.Future<List<_i13.TvSeriesTable>>);
  @override
  _i6.Future<void> cacheNowPlayingTvSeries(
          List<_i13.TvSeriesTable>? tvSeries) =>
      (super.noSuchMethod(
        Invocation.method(
          #cacheNowPlayingTvSeries,
          [tvSeries],
        ),
        returnValue: _i6.Future<void>.value(),
        returnValueForMissingStub: _i6.Future<void>.value(),
      ) as _i6.Future<void>);
  @override
  _i6.Future<List<_i13.TvSeriesTable>> getCachedNowPlayingTvSeries() =>
      (super.noSuchMethod(
        Invocation.method(
          #getCachedNowPlayingTvSeries,
          [],
        ),
        returnValue:
            _i6.Future<List<_i13.TvSeriesTable>>.value(<_i13.TvSeriesTable>[]),
      ) as _i6.Future<List<_i13.TvSeriesTable>>);
}

/// A class which mocks [DatabaseHelper].
///
/// See the documentation for Mockito's code generation for more information.
class MockDatabaseHelper extends _i1.Mock implements _i14.DatabaseHelper {
  MockDatabaseHelper() {
    _i1.throwOnMissingStub(this);
  }

  @override
  _i6.Future<_i15.Database?> get database => (super.noSuchMethod(
        Invocation.getter(#database),
        returnValue: _i6.Future<_i15.Database?>.value(),
      ) as _i6.Future<_i15.Database?>);
  @override
  _i6.Future<void> insertMovieCacheTransaction(
    List<_i16.MovieTable>? movies,
    String? category,
  ) =>
      (super.noSuchMethod(
        Invocation.method(
          #insertMovieCacheTransaction,
          [
            movies,
            category,
          ],
        ),
        returnValue: _i6.Future<void>.value(),
        returnValueForMissingStub: _i6.Future<void>.value(),
      ) as _i6.Future<void>);
  @override
  _i6.Future<void> insertTvSeriesCacheTransaction(
    List<_i13.TvSeriesTable>? tvSeries,
    String? category,
  ) =>
      (super.noSuchMethod(
        Invocation.method(
          #insertTvSeriesCacheTransaction,
          [
            tvSeries,
            category,
          ],
        ),
        returnValue: _i6.Future<void>.value(),
        returnValueForMissingStub: _i6.Future<void>.value(),
      ) as _i6.Future<void>);
  @override
  _i6.Future<List<Map<String, dynamic>>> getCache(String? category) =>
      (super.noSuchMethod(
        Invocation.method(
          #getCache,
          [category],
        ),
        returnValue: _i6.Future<List<Map<String, dynamic>>>.value(
            <Map<String, dynamic>>[]),
      ) as _i6.Future<List<Map<String, dynamic>>>);
  @override
  _i6.Future<int> clearCache(String? category) => (super.noSuchMethod(
        Invocation.method(
          #clearCache,
          [category],
        ),
        returnValue: _i6.Future<int>.value(0),
      ) as _i6.Future<int>);
  @override
  _i6.Future<int> insertMoviesWatchlist(_i16.MovieTable? movie) =>
      (super.noSuchMethod(
        Invocation.method(
          #insertMoviesWatchlist,
          [movie],
        ),
        returnValue: _i6.Future<int>.value(0),
      ) as _i6.Future<int>);
  @override
  _i6.Future<int> removeMoviesWatchlist(_i16.MovieTable? movie) =>
      (super.noSuchMethod(
        Invocation.method(
          #removeMoviesWatchlist,
          [movie],
        ),
        returnValue: _i6.Future<int>.value(0),
      ) as _i6.Future<int>);
  @override
  _i6.Future<int> insertTvSeriesWatchlist(_i13.TvSeriesTable? tvSeries) =>
      (super.noSuchMethod(
        Invocation.method(
          #insertTvSeriesWatchlist,
          [tvSeries],
        ),
        returnValue: _i6.Future<int>.value(0),
      ) as _i6.Future<int>);
  @override
  _i6.Future<int> removeTvSeriesWatchlist(_i13.TvSeriesTable? tvSeries) =>
      (super.noSuchMethod(
        Invocation.method(
          #removeTvSeriesWatchlist,
          [tvSeries],
        ),
        returnValue: _i6.Future<int>.value(0),
      ) as _i6.Future<int>);
  @override
  _i6.Future<Map<String, dynamic>?> getMovieById(int? id) =>
      (super.noSuchMethod(
        Invocation.method(
          #getMovieById,
          [id],
        ),
        returnValue: _i6.Future<Map<String, dynamic>?>.value(),
      ) as _i6.Future<Map<String, dynamic>?>);
  @override
  _i6.Future<List<Map<String, dynamic>>> getWatchlistMovies() =>
      (super.noSuchMethod(
        Invocation.method(
          #getWatchlistMovies,
          [],
        ),
        returnValue: _i6.Future<List<Map<String, dynamic>>>.value(
            <Map<String, dynamic>>[]),
      ) as _i6.Future<List<Map<String, dynamic>>>);
  @override
  _i6.Future<Map<String, dynamic>?> getTvseriesById(int? id) =>
      (super.noSuchMethod(
        Invocation.method(
          #getTvseriesById,
          [id],
        ),
        returnValue: _i6.Future<Map<String, dynamic>?>.value(),
      ) as _i6.Future<Map<String, dynamic>?>);
  @override
  _i6.Future<List<Map<String, dynamic>>> getWatchlistTvSeries() =>
      (super.noSuchMethod(
        Invocation.method(
          #getWatchlistTvSeries,
          [],
        ),
        returnValue: _i6.Future<List<Map<String, dynamic>>>.value(
            <Map<String, dynamic>>[]),
      ) as _i6.Future<List<Map<String, dynamic>>>);
}

/// A class which mocks [NetworkInfo].
///
/// See the documentation for Mockito's code generation for more information.
class MockNetworkInfo extends _i1.Mock implements _i17.NetworkInfo {
  MockNetworkInfo() {
    _i1.throwOnMissingStub(this);
  }

  @override
  _i6.Future<bool> get isConnected => (super.noSuchMethod(
        Invocation.getter(#isConnected),
        returnValue: _i6.Future<bool>.value(false),
      ) as _i6.Future<bool>);
}

/// A class which mocks [Client].
///
/// See the documentation for Mockito's code generation for more information.
class MockHttpClient extends _i1.Mock implements _i4.Client {
  MockHttpClient() {
    _i1.throwOnMissingStub(this);
  }

  @override
  _i6.Future<_i4.Response> head(
    Uri? url, {
    Map<String, String>? headers,
  }) =>
      (super.noSuchMethod(
        Invocation.method(
          #head,
          [url],
          {#headers: headers},
        ),
        returnValue: _i6.Future<_i4.Response>.value(_FakeResponse_2(
          this,
          Invocation.method(
            #head,
            [url],
            {#headers: headers},
          ),
        )),
      ) as _i6.Future<_i4.Response>);
  @override
  _i6.Future<_i4.Response> get(
    Uri? url, {
    Map<String, String>? headers,
  }) =>
      (super.noSuchMethod(
        Invocation.method(
          #get,
          [url],
          {#headers: headers},
        ),
        returnValue: _i6.Future<_i4.Response>.value(_FakeResponse_2(
          this,
          Invocation.method(
            #get,
            [url],
            {#headers: headers},
          ),
        )),
      ) as _i6.Future<_i4.Response>);
  @override
  _i6.Future<_i4.Response> post(
    Uri? url, {
    Map<String, String>? headers,
    Object? body,
    _i18.Encoding? encoding,
  }) =>
      (super.noSuchMethod(
        Invocation.method(
          #post,
          [url],
          {
            #headers: headers,
            #body: body,
            #encoding: encoding,
          },
        ),
        returnValue: _i6.Future<_i4.Response>.value(_FakeResponse_2(
          this,
          Invocation.method(
            #post,
            [url],
            {
              #headers: headers,
              #body: body,
              #encoding: encoding,
            },
          ),
        )),
      ) as _i6.Future<_i4.Response>);
  @override
  _i6.Future<_i4.Response> put(
    Uri? url, {
    Map<String, String>? headers,
    Object? body,
    _i18.Encoding? encoding,
  }) =>
      (super.noSuchMethod(
        Invocation.method(
          #put,
          [url],
          {
            #headers: headers,
            #body: body,
            #encoding: encoding,
          },
        ),
        returnValue: _i6.Future<_i4.Response>.value(_FakeResponse_2(
          this,
          Invocation.method(
            #put,
            [url],
            {
              #headers: headers,
              #body: body,
              #encoding: encoding,
            },
          ),
        )),
      ) as _i6.Future<_i4.Response>);
  @override
  _i6.Future<_i4.Response> patch(
    Uri? url, {
    Map<String, String>? headers,
    Object? body,
    _i18.Encoding? encoding,
  }) =>
      (super.noSuchMethod(
        Invocation.method(
          #patch,
          [url],
          {
            #headers: headers,
            #body: body,
            #encoding: encoding,
          },
        ),
        returnValue: _i6.Future<_i4.Response>.value(_FakeResponse_2(
          this,
          Invocation.method(
            #patch,
            [url],
            {
              #headers: headers,
              #body: body,
              #encoding: encoding,
            },
          ),
        )),
      ) as _i6.Future<_i4.Response>);
  @override
  _i6.Future<_i4.Response> delete(
    Uri? url, {
    Map<String, String>? headers,
    Object? body,
    _i18.Encoding? encoding,
  }) =>
      (super.noSuchMethod(
        Invocation.method(
          #delete,
          [url],
          {
            #headers: headers,
            #body: body,
            #encoding: encoding,
          },
        ),
        returnValue: _i6.Future<_i4.Response>.value(_FakeResponse_2(
          this,
          Invocation.method(
            #delete,
            [url],
            {
              #headers: headers,
              #body: body,
              #encoding: encoding,
            },
          ),
        )),
      ) as _i6.Future<_i4.Response>);
  @override
  _i6.Future<String> read(
    Uri? url, {
    Map<String, String>? headers,
  }) =>
      (super.noSuchMethod(
        Invocation.method(
          #read,
          [url],
          {#headers: headers},
        ),
        returnValue: _i6.Future<String>.value(''),
      ) as _i6.Future<String>);
  @override
  _i6.Future<_i19.Uint8List> readBytes(
    Uri? url, {
    Map<String, String>? headers,
  }) =>
      (super.noSuchMethod(
        Invocation.method(
          #readBytes,
          [url],
          {#headers: headers},
        ),
        returnValue: _i6.Future<_i19.Uint8List>.value(_i19.Uint8List(0)),
      ) as _i6.Future<_i19.Uint8List>);
  @override
  _i6.Future<_i4.StreamedResponse> send(_i4.BaseRequest? request) =>
      (super.noSuchMethod(
        Invocation.method(
          #send,
          [request],
        ),
        returnValue:
            _i6.Future<_i4.StreamedResponse>.value(_FakeStreamedResponse_3(
          this,
          Invocation.method(
            #send,
            [request],
          ),
        )),
      ) as _i6.Future<_i4.StreamedResponse>);
  @override
  void close() => super.noSuchMethod(
        Invocation.method(
          #close,
          [],
        ),
        returnValueForMissingStub: null,
      );
}