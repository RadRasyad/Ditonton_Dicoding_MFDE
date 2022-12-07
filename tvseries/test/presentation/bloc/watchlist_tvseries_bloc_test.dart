import 'package:bloc_test/bloc_test.dart';
import 'package:core/utils/failure.dart';
import 'package:dartz/dartz.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';
import 'package:tvseries/domain/usecases/get_watchlist_tvseries.dart';
import 'package:tvseries/presentation/bloc/tvseries/tvseries_bloc.dart';
import '../../dummy_data/dummy_objects.dart';
import 'watchlist_tvseries_bloc_test.mocks.dart';

@GenerateMocks([GetWatchListTvSeries])
void main() {
  late MockGetWatchListTvSeries mockGetWatchlistTvSeries;
  late WatchlistTvSeriesBloc watchlistBloc;

  setUp(() {
    mockGetWatchlistTvSeries = MockGetWatchListTvSeries();
    watchlistBloc = WatchlistTvSeriesBloc(mockGetWatchlistTvSeries);
  });

  test('initial state should be empty', () {
    expect(watchlistBloc.state, EmptyData());
  });

  blocTest<WatchlistTvSeriesBloc, TvSeriesState>(
    'Should emit [Loading, HasData] when data is gotten successfully',
    build: () {
      when(mockGetWatchlistTvSeries.execute())
          .thenAnswer((_) async => Right([testWatchlistTvSeries]));
      return watchlistBloc;
    },
    act: (bloc) => bloc.add(const FetchTvSeriesData()),
    expect: () => [
      LoadingData(),
      LoadedData([testWatchlistTvSeries]),
    ],
    verify: (bloc) {
      verify(mockGetWatchlistTvSeries.execute());
    },
  );

  blocTest<WatchlistTvSeriesBloc, TvSeriesState>(
    'Should emit [Loading, Error] when get top rated is unsuccessful',
    build: () {
      when(mockGetWatchlistTvSeries.execute())
          .thenAnswer((_) async => Left(ServerFailure('Server Failure')));
      return watchlistBloc;
    },
    act: (bloc) => bloc.add(const FetchTvSeriesData()),
    expect: () => [
      LoadingData(),
      const ErrorData('Server Failure'),
    ],
    verify: (bloc) {
      verify(mockGetWatchlistTvSeries.execute());
    },
  );

  blocTest<WatchlistTvSeriesBloc, TvSeriesState>(
    'Should emit [Loading, Error] when get top rated is unsuccessful',
    build: () {
      when(mockGetWatchlistTvSeries.execute()).thenAnswer(
          (_) async => Left(ConnectionFailure('Connection Failure')));
      return watchlistBloc;
    },
    act: (bloc) => bloc.add(const FetchTvSeriesData()),
    expect: () => [
      LoadingData(),
      const ErrorData('Connection Failure'),
    ],
    verify: (bloc) {
      verify(mockGetWatchlistTvSeries.execute());
    },
  );

  blocTest<WatchlistTvSeriesBloc, TvSeriesState>(
    'Should emit [Loading, Error] when get top rated is unsuccessful',
    build: () {
      when(mockGetWatchlistTvSeries.execute())
          .thenAnswer((_) async => Left(DatabaseFailure('Database Failure')));
      return watchlistBloc;
    },
    act: (bloc) => bloc.add(const FetchTvSeriesData()),
    expect: () => [
      LoadingData(),
      const ErrorData('Database Failure'),
    ],
    verify: (bloc) {
      verify(mockGetWatchlistTvSeries.execute());
    },
  );
}