
import 'package:bloc_test/bloc_test.dart';
import 'package:core/utils/failure.dart';
import 'package:dartz/dartz.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';
import 'package:movies/domain/usecases/get_top_rated_movies.dart';
import 'package:movies/presentation/bloc/movies/movies_bloc.dart';
import '../../dummy_data/dummy_objects.dart';
import 'top_rated_movies_bloc_test.mocks.dart';

@GenerateMocks([GetTopRatedMovies])
void main() {
  late MockGetTopRatedMovies mockGetTopRatedMovie;
  late TopRatedMoviesBloc topRatedBloc;

  setUp(() {
    mockGetTopRatedMovie = MockGetTopRatedMovies();
    topRatedBloc = TopRatedMoviesBloc(mockGetTopRatedMovie);
  });

  test('initial state should be empty', () {
    expect(topRatedBloc.state, MEmptyData());
  });

  blocTest<TopRatedMoviesBloc, MoviesState>(
    'Should emit [Loading, HasData] when data is gotten successfully',
    build: () {
      when(mockGetTopRatedMovie.execute())
          .thenAnswer((_) async => Right(testMovieList));
      return topRatedBloc;
    },
    act: (bloc) => bloc.add(const FetchMoviesData()),
    expect: () => [
      MLoadingData(),
      MLoadedData(testMovieList),
    ],
    verify: (bloc) {
      verify(mockGetTopRatedMovie.execute());
    },
  );

  blocTest<TopRatedMoviesBloc, MoviesState>(
    'Should emit [Loading, Error] when get top rated is unsuccessful',
    build: () {
      when(mockGetTopRatedMovie.execute())
          .thenAnswer((_) async => Left(ServerFailure('Server Failure')));
      return topRatedBloc;
    },
    act: (bloc) => bloc.add(const FetchMoviesData()),
    expect: () => [
      MLoadingData(),
      const MErrorData('Server Failure'),
    ],
    verify: (bloc) {
      verify(mockGetTopRatedMovie.execute());
    },
  );

  blocTest<TopRatedMoviesBloc, MoviesState>(
    'Should emit [Loading, Error] when get top rated is unsuccessful',
    build: () {
      when(mockGetTopRatedMovie.execute()).thenAnswer(
          (_) async => Left(ConnectionFailure('Connection Failure')));
      return topRatedBloc;
    },
    act: (bloc) => bloc.add(const FetchMoviesData()),
    expect: () => [
      MLoadingData(),
      const MErrorData('Connection Failure'),
    ],
    verify: (bloc) {
      verify(mockGetTopRatedMovie.execute());
    },
  );

  blocTest<TopRatedMoviesBloc, MoviesState>(
    'Should emit [Loading, Error] when get top rated is unsuccessful',
    build: () {
      when(mockGetTopRatedMovie.execute())
          .thenAnswer((_) async => Left(DatabaseFailure('Database Failure')));
      return topRatedBloc;
    },
    act: (bloc) => bloc.add(const FetchMoviesData()),
    expect: () => [
      MLoadingData(),
      const MErrorData('Database Failure'),
    ],
    verify: (bloc) {
      verify(mockGetTopRatedMovie.execute());
    },
  );
}