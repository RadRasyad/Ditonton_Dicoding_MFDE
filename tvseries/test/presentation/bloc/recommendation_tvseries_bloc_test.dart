
import 'package:bloc_test/bloc_test.dart';
import 'package:core/utils/failure.dart';
import 'package:dartz/dartz.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';
import 'package:tvseries/domain/usecases/get_tvseries_recommendations.dart';
import 'package:tvseries/presentation/bloc/tvseries/tvseries_bloc.dart';
import '../../../../movies/test/dummy_data/dummy_objects.dart';
import 'recommendation_tvseries_bloc_test.mocks.dart';

@GenerateMocks([GetTvSeriesRecommendations])
void main() {
  late MockGetTvSeriesRecommendations mockGetTvSeriesRecommendations;
  late RecommendationTvSeriesBloc tvSeriesBloc;

  setUp(() {
    mockGetTvSeriesRecommendations = MockGetTvSeriesRecommendations();
    tvSeriesBloc = RecommendationTvSeriesBloc(mockGetTvSeriesRecommendations);
  });

  const tId = 1;

  test('initial state should be empty', () {
    expect(tvSeriesBloc.state, EmptyData());
  });

  blocTest<RecommendationTvSeriesBloc, TvSeriesState>(
    'Should emit [Loading, HasData] when data is gotten successfully',
    build: () {
      when(mockGetTvSeriesRecommendations.execute(tId))
          .thenAnswer((_) async => Right(testTvSeriesList));
      return tvSeriesBloc;
    },
    act: (bloc) => bloc.add(const FetchTvSeriesDataWithId(tId)),
    expect: () => [
      LoadingData(),
      LoadedData(testTvSeriesList),
    ],
    verify: (bloc) {
      verify(mockGetTvSeriesRecommendations.execute(tId));
    },
  );

  blocTest<RecommendationTvSeriesBloc, TvSeriesState>(
    'Should emit [Loading, Error] when get top rated is unsuccessful',
    build: () {
      when(mockGetTvSeriesRecommendations.execute(tId))
          .thenAnswer((_) async => Left(ServerFailure('Server Failure')));
      return tvSeriesBloc;
    },
    act: (bloc) => bloc.add(const FetchTvSeriesDataWithId(tId)),
    expect: () => [
      LoadingData(),
      const ErrorData('Server Failure'),
    ],
    verify: (bloc) {
      verify(mockGetTvSeriesRecommendations.execute(tId));
    },
  );

  blocTest<RecommendationTvSeriesBloc, TvSeriesState>(
    'Should emit [Loading, Error] when get top rated is unsuccessful',
    build: () {
      when(mockGetTvSeriesRecommendations.execute(tId)).thenAnswer(
              (_) async => Left(ConnectionFailure('Connection Failure')));
      return tvSeriesBloc;
    },
    act: (bloc) => bloc.add(const FetchTvSeriesDataWithId(tId)),
    expect: () => [
      LoadingData(),
      const ErrorData('Connection Failure'),
    ],
    verify: (bloc) {
      verify(mockGetTvSeriesRecommendations.execute(tId));
    },
  );

  blocTest<RecommendationTvSeriesBloc, TvSeriesState>(
    'Should emit [Loading, Error] when get top rated is unsuccessful',
    build: () {
      when(mockGetTvSeriesRecommendations.execute(tId)).thenAnswer(
              (_) async => Left(DatabaseFailure('Database Failure')));
      return tvSeriesBloc;
    },
    act: (bloc) => bloc.add(const FetchTvSeriesDataWithId(tId)),
    expect: () => [
      LoadingData(),
      const ErrorData('Database Failure'),
    ],
    verify: (bloc) {
      verify(mockGetTvSeriesRecommendations.execute(tId));
    },
  );
}