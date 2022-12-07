
import 'package:bloc_test/bloc_test.dart';
import 'package:core/utils/failure.dart';
import 'package:dartz/dartz.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';
import 'package:tvseries/domain/usecases/get_top_rated_tvseries.dart';
import 'package:tvseries/presentation/bloc/tvseries/tvseries_bloc.dart';
import '../../../../movies/test/dummy_data/dummy_objects.dart';
import 'top_rated_tvseries_bloc_test.mocks.dart';

@GenerateMocks([GetTopRatedTvSeries])
void main() {
  late MockGetTopRatedTvSeries mockGetTopRatedTvSeries;
  late TopRatedTvSeriesBloc topRatedBloc;

  setUp(() {
    mockGetTopRatedTvSeries = MockGetTopRatedTvSeries();
    topRatedBloc = TopRatedTvSeriesBloc(mockGetTopRatedTvSeries);
  });

  test('initial state should be empty', () {
    expect(topRatedBloc.state, EmptyData());
  });

  blocTest<TopRatedTvSeriesBloc, TvSeriesState>(
    'Should emit [Loading, HasData] when data is gotten successfully',
    build: () {
      when(mockGetTopRatedTvSeries.execute())
          .thenAnswer((_) async => Right(testTvSeriesList));
      return topRatedBloc;
    },
    act: (bloc) => bloc.add(const FetchTvSeriesData()),
    expect: () => [
      LoadingData(),
      LoadedData(testTvSeriesList),
    ],
    verify: (bloc) {
      verify(mockGetTopRatedTvSeries.execute());
    },
  );

  blocTest<TopRatedTvSeriesBloc, TvSeriesState>(
    'Should emit [Loading, Error] when get top rated is unsuccessful',
    build: () {
      when(mockGetTopRatedTvSeries.execute())
          .thenAnswer((_) async => Left(ServerFailure('Server Failure')));
      return topRatedBloc;
    },
    act: (bloc) => bloc.add(const FetchTvSeriesData()),
    expect: () => [
      LoadingData(),
      const ErrorData('Server Failure'),
    ],
    verify: (bloc) {
      verify(mockGetTopRatedTvSeries.execute());
    },
  );

  blocTest<TopRatedTvSeriesBloc, TvSeriesState>(
    'Should emit [Loading, Error] when get top rated is unsuccessful',
    build: () {
      when(mockGetTopRatedTvSeries.execute()).thenAnswer(
          (_) async => Left(ConnectionFailure('Connection Failure')));
      return topRatedBloc;
    },
    act: (bloc) => bloc.add(const FetchTvSeriesData()),
    expect: () => [
      LoadingData(),
      const ErrorData('Connection Failure'),
    ],
    verify: (bloc) {
      verify(mockGetTopRatedTvSeries.execute());
    },
  );

  blocTest<TopRatedTvSeriesBloc, TvSeriesState>(
    'Should emit [Loading, Error] when get top rated is unsuccessful',
    build: () {
      when(mockGetTopRatedTvSeries.execute())
          .thenAnswer((_) async => Left(DatabaseFailure('Database Failure')));
      return topRatedBloc;
    },
    act: (bloc) => bloc.add(const FetchTvSeriesData()),
    expect: () => [
      LoadingData(),
      const ErrorData('Database Failure'),
    ],
    verify: (bloc) {
      verify(mockGetTopRatedTvSeries.execute());
    },
  );
}