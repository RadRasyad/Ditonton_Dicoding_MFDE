import 'package:bloc_test/bloc_test.dart';
import 'package:core/utils/failure.dart';
import 'package:dartz/dartz.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';
import 'package:movies/domain/usecases/get_now_playing_movies.dart';
import 'package:movies/presentation/bloc/movies/movies_bloc.dart';
import '../../dummy_data/dummy_objects.dart';
import 'movies_bloc_test.mocks.dart';

@GenerateMocks([GetNowPlayingMovies])
void main() {
  late MockGetNowPlayingMovies mockGetNowPlayingMovies;
  late MoviesBloc moviesBloc;

  setUp(
        () {
      mockGetNowPlayingMovies = MockGetNowPlayingMovies();
      moviesBloc = MoviesBloc(mockGetNowPlayingMovies);
    },
  );

  test('initial state should be empty', () {
    expect(moviesBloc.state, MEmptyData());
  });

  blocTest<MoviesBloc, MoviesState>(
    'Should emit [Loading, HasData] when data is gotten successfully',
    build: () {
      when(mockGetNowPlayingMovies.execute())
          .thenAnswer((_) async => Right(testMovieList));
      return moviesBloc;
    },
    act: (bloc) => bloc.add(const FetchMoviesData()),
    expect: () => [
      MLoadingData(),
      MLoadedData(testMovieList),
    ],
    verify: (bloc) {
      verify(mockGetNowPlayingMovies.execute());
    },
  );

  blocTest<MoviesBloc, MoviesState>(
    'Should emit [Loading, Error] when get top rated is unsuccessful',
    build: () {
      when(mockGetNowPlayingMovies.execute())
          .thenAnswer((_) async => Left(ServerFailure('Server Failure')));
      return moviesBloc;
    },
    act: (bloc) => bloc.add(const FetchMoviesData()),
    expect: () => [
      MLoadingData(),
      const MErrorData('Server Failure'),
    ],
    verify: (bloc) {
      verify(mockGetNowPlayingMovies.execute());
    },
  );

  blocTest<MoviesBloc, MoviesState>(
    'Should emit [Loading, Error] when get top rated is unsuccessful',
    build: () {
      when(mockGetNowPlayingMovies.execute()).thenAnswer(
              (_) async => Left(ConnectionFailure('Connection Failure')));
      return moviesBloc;
    },
    act: (bloc) => bloc.add(const FetchMoviesData()),
    expect: () => [
      MLoadingData(),
      const MErrorData('Connection Failure'),
    ],
    verify: (bloc) {
      verify(mockGetNowPlayingMovies.execute());
    },
  );

  blocTest<MoviesBloc, MoviesState>(
    'Should emit [Loading, Error] when get top rated is unsuccessful',
    build: () {
      when(mockGetNowPlayingMovies.execute()).thenAnswer(
              (_) async => Left(DatabaseFailure('Database Failure')));
      return moviesBloc;
    },
    act: (bloc) => bloc.add(const FetchMoviesData()),
    expect: () => [
      MLoadingData(),
      const MErrorData('Database Failure'),
    ],
    verify: (bloc) {
      verify(mockGetNowPlayingMovies.execute());
    },
  );
}