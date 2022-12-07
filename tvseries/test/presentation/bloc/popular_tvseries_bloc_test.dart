
import 'package:bloc_test/bloc_test.dart';
import 'package:core/utils/failure.dart';
import 'package:dartz/dartz.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';
import 'package:tvseries/domain/usecases/get_popular_tvseries.dart';
import 'package:tvseries/presentation/bloc/tvseries/tvseries_bloc.dart';
import '../../dummy_data/dummy_objects.dart';
import 'popular_tvseries_bloc_test.mocks.dart';

@GenerateMocks([GetPopularTvSeries])
void main() {
  late MockGetPopularTvSeries mockGetPopularTvSeries;
  late PopularTvSeriesBloc popularBloc;

  setUp(() {
    mockGetPopularTvSeries = MockGetPopularTvSeries();
    popularBloc = PopularTvSeriesBloc(mockGetPopularTvSeries);
  });

  test('initial state should be empty', () {
    expect(popularBloc.state, EmptyData());
  });

  blocTest<PopularTvSeriesBloc, TvSeriesState>(
    'Should emit [Loading, HasData] when data is gotten successfully',
    build: () {
      when(mockGetPopularTvSeries.execute())
          .thenAnswer((_) async => Right(testTvSeriesList));
      return popularBloc;
    },
    act: (bloc) => bloc.add(const FetchTvSeriesData()),
    expect: () => [
      LoadingData(),
      LoadedData(testTvSeriesList),
    ],
    verify: (bloc) {
      verify(mockGetPopularTvSeries.execute());
    },
  );

  blocTest<PopularTvSeriesBloc, TvSeriesState>(
    'Should emit [Loading, Error] when get popular is unsuccessful',
    build: () {
      when(mockGetPopularTvSeries.execute())
          .thenAnswer((_) async => Left(ServerFailure('Server Failure')));
      return popularBloc;
    },
    act: (bloc) => bloc.add(const FetchTvSeriesData()),
    expect: () => [
      LoadingData(),
      const ErrorData('Server Failure'),
    ],
    verify: (bloc) {
      verify(mockGetPopularTvSeries.execute());
    },
  );

  blocTest<PopularTvSeriesBloc, TvSeriesState>(
    'Should emit [Loading, Error] when get popular is unsuccessful',
    build: () {
      when(mockGetPopularTvSeries.execute()).thenAnswer(
          (_) async => Left(ConnectionFailure('Connection Failure')));
      return popularBloc;
    },
    act: (bloc) => bloc.add(const FetchTvSeriesData()),
    expect: () => [
      LoadingData(),
      const ErrorData('Connection Failure'),
    ],
    verify: (bloc) {
      verify(mockGetPopularTvSeries.execute());
    },
  );

  blocTest<PopularTvSeriesBloc, TvSeriesState>(
    'Should emit [Loading, Error] when get popular is unsuccessful',
    build: () {
      when(mockGetPopularTvSeries.execute())
          .thenAnswer((_) async => Left(DatabaseFailure('Database Failure')));
      return popularBloc;
    },
    act: (bloc) => bloc.add(const FetchTvSeriesData()),
    expect: () => [
      LoadingData(),
      const ErrorData('Database Failure'),
    ],
    verify: (bloc) {
      verify(mockGetPopularTvSeries.execute());
    },
  );
}