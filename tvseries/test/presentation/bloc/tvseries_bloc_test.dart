
import 'package:bloc_test/bloc_test.dart';
import 'package:core/utils/failure.dart';
import 'package:dartz/dartz.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';
import 'package:tvseries/domain/usecases/get_now_playing_tvseries.dart';
import 'package:tvseries/presentation/bloc/tvseries/tvseries_bloc.dart';
import '../../dummy_data/dummy_objects.dart';
import 'tvseries_bloc_test.mocks.dart';

@GenerateMocks([GetNowPlayingTvSeries])
void main() {
  late MockGetNowPlayingTvSeries mockGetNowPlayingTvSeries;
  late TvSeriesBloc tvSeriesBloc;

  setUp(
        () {
      mockGetNowPlayingTvSeries = MockGetNowPlayingTvSeries();
      tvSeriesBloc = TvSeriesBloc(mockGetNowPlayingTvSeries);
    },
  );

  test('initial state should be empty', () {
    expect(tvSeriesBloc.state, EmptyData());
  });

  blocTest<TvSeriesBloc, TvSeriesState>(
    'Should emit [Loading, HasData] when data is gotten successfully',
    build: () {
      when(mockGetNowPlayingTvSeries.execute())
          .thenAnswer((_) async => Right(testTvSeriesList));
      return tvSeriesBloc;
    },
    act: (bloc) => bloc.add(const FetchTvSeriesData()),
    expect: () => [
      LoadingData(),
      LoadedData(testTvSeriesList),
    ],
    verify: (bloc) {
      verify(mockGetNowPlayingTvSeries.execute());
    },
  );

  blocTest<TvSeriesBloc, TvSeriesState>(
    'Should emit [Loading, Error] when get top rated is unsuccessful',
    build: () {
      when(mockGetNowPlayingTvSeries.execute())
          .thenAnswer((_) async => Left(ServerFailure('Server Failure')));
      return tvSeriesBloc;
    },
    act: (bloc) => bloc.add(const FetchTvSeriesData()),
    expect: () => [
      LoadingData(),
      const ErrorData('Server Failure'),
    ],
    verify: (bloc) {
      verify(mockGetNowPlayingTvSeries.execute());
    },
  );

  blocTest<TvSeriesBloc, TvSeriesState>(
    'Should emit [Loading, Error] when get top rated is unsuccessful',
    build: () {
      when(mockGetNowPlayingTvSeries.execute()).thenAnswer(
              (_) async => Left(ConnectionFailure('Connection Failure')));
      return tvSeriesBloc;
    },
    act: (bloc) => bloc.add(const FetchTvSeriesData()),
    expect: () => [
      LoadingData(),
      const ErrorData('Connection Failure'),
    ],
    verify: (bloc) {
      verify(mockGetNowPlayingTvSeries.execute());
    },
  );

  blocTest<TvSeriesBloc, TvSeriesState>(
    'Should emit [Loading, Error] when get top rated is unsuccessful',
    build: () {
      when(mockGetNowPlayingTvSeries.execute()).thenAnswer(
              (_) async => Left(DatabaseFailure('Database Failure')));
      return tvSeriesBloc;
    },
    act: (bloc) => bloc.add(const FetchTvSeriesData()),
    expect: () => [
      LoadingData(),
      const ErrorData('Database Failure'),
    ],
    verify: (bloc) {
      verify(mockGetNowPlayingTvSeries.execute());
    },
  );
}