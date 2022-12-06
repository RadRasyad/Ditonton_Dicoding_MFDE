
import 'package:bloc_test/bloc_test.dart';
import 'package:core/utils/failure.dart';
import 'package:dartz/dartz.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';
import 'package:movies/domain/usecases/get_movie_recommendations.dart';
import 'package:movies/presentation/bloc/movies/movies_bloc.dart';
import '../../dummy_data/dummy_objects.dart';
import 'recommendation_movies_bloc_test.mocks.dart';

@GenerateMocks([GetMovieRecommendations])
void main() {
  late MockGetMovieRecommendations mockGetRecommendationMovie;
  late RecommendationMoviesBloc recomBloc;

  setUp(() {
    mockGetRecommendationMovie = MockGetMovieRecommendations();
    recomBloc = RecommendationMoviesBloc(mockGetRecommendationMovie);
  });

  const tId = 1;

  test('initial state should be empty', () {
    expect(recomBloc.state, MEmptyData());
  });

  blocTest<RecommendationMoviesBloc, MoviesState>(
    'Should emit [Loading, HasData] when data is gotten successfully',
    build: () {
      when(mockGetRecommendationMovie.execute(tId))
          .thenAnswer((_) async => Right(testMovieList));
      return recomBloc;
    },
    act: (bloc) => bloc.add(const FetchMovieDataWithId(tId)),
    expect: () => [
      MLoadingData(),
      MLoadedData(testMovieList),
    ],
    verify: (bloc) {
      verify(mockGetRecommendationMovie.execute(tId));
    },
  );

  blocTest<RecommendationMoviesBloc, MoviesState>(
    'Should emit [Loading, Error] when get top rated is unsuccessful',
    build: () {
      when(mockGetRecommendationMovie.execute(tId))
          .thenAnswer((_) async => Left(ServerFailure('Server Failure')));
      return recomBloc;
    },
    act: (bloc) => bloc.add(const FetchMovieDataWithId(tId)),
    expect: () => [
      MLoadingData(),
      const MErrorData('Server Failure'),
    ],
    verify: (bloc) {
      verify(mockGetRecommendationMovie.execute(tId));
    },
  );

  blocTest<RecommendationMoviesBloc, MoviesState>(
    'Should emit [Loading, Error] when get top rated is unsuccessful',
    build: () {
      when(mockGetRecommendationMovie.execute(tId)).thenAnswer(
              (_) async => Left(ConnectionFailure('Connection Failure')));
      return recomBloc;
    },
    act: (bloc) => bloc.add(const FetchMovieDataWithId(tId)),
    expect: () => [
      MLoadingData(),
      const MErrorData('Connection Failure'),
    ],
    verify: (bloc) {
      verify(mockGetRecommendationMovie.execute(tId));
    },
  );

  blocTest<RecommendationMoviesBloc, MoviesState>(
    'Should emit [Loading, Error] when get top rated is unsuccessful',
    build: () {
      when(mockGetRecommendationMovie.execute(tId)).thenAnswer(
              (_) async => Left(DatabaseFailure('Database Failure')));
      return recomBloc;
    },
    act: (bloc) => bloc.add(const FetchMovieDataWithId(tId)),
    expect: () => [
      MLoadingData(),
      const MErrorData('Database Failure'),
    ],
    verify: (bloc) {
      verify(mockGetRecommendationMovie.execute(tId));
    },
  );
}