import 'package:bloc_test/bloc_test.dart';
import 'package:core/utils/failure.dart';
import 'package:dartz/dartz.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';
import 'package:movies/domain/usecases/get_watchlist_movies.dart';
import 'package:movies/presentation/bloc/movies/movies_bloc.dart';
import '../../dummy_data/dummy_objects.dart';
import 'watchlist_movies_bloc_test.mocks.dart';

@GenerateMocks([GetWatchlistMovies])
void main() {
  late MockGetWatchlistMovies mockGetWatchlistMovie;
  late WatchlistMoviesBloc watchlistBloc;

  setUp(() {
    mockGetWatchlistMovie = MockGetWatchlistMovies();
    watchlistBloc = WatchlistMoviesBloc(mockGetWatchlistMovie);
  });

  test('initial state should be empty', () {
    expect(watchlistBloc.state, MEmptyData());
  });

  blocTest<WatchlistMoviesBloc, MoviesState>(
    'Should emit [Loading, HasData] when data is gotten successfully',
    build: () {
      when(mockGetWatchlistMovie.execute())
          .thenAnswer((_) async => Right([testWatchlistMovie]));
      return watchlistBloc;
    },
    act: (bloc) => bloc.add(const FetchMoviesData()),
    expect: () => [
      MLoadingData(),
      MLoadedData([testWatchlistMovie]),
    ],
    verify: (bloc) {
      verify(mockGetWatchlistMovie.execute());
    },
  );

  blocTest<WatchlistMoviesBloc, MoviesState>(
    'Should emit [Loading, Error] when get top rated is unsuccessful',
    build: () {
      when(mockGetWatchlistMovie.execute())
          .thenAnswer((_) async => Left(ServerFailure('Server Failure')));
      return watchlistBloc;
    },
    act: (bloc) => bloc.add(const FetchMoviesData()),
    expect: () => [
      MLoadingData(),
      const MErrorData('Server Failure'),
    ],
    verify: (bloc) {
      verify(mockGetWatchlistMovie.execute());
    },
  );

  blocTest<WatchlistMoviesBloc, MoviesState>(
    'Should emit [Loading, Error] when get top rated is unsuccessful',
    build: () {
      when(mockGetWatchlistMovie.execute()).thenAnswer(
          (_) async => Left(ConnectionFailure('Connection Failure')));
      return watchlistBloc;
    },
    act: (bloc) => bloc.add(const FetchMoviesData()),
    expect: () => [
      MLoadingData(),
      const MErrorData('Connection Failure'),
    ],
    verify: (bloc) {
      verify(mockGetWatchlistMovie.execute());
    },
  );

  blocTest<WatchlistMoviesBloc, MoviesState>(
    'Should emit [Loading, Error] when get top rated is unsuccessful',
    build: () {
      when(mockGetWatchlistMovie.execute())
          .thenAnswer((_) async => Left(DatabaseFailure('Database Failure')));
      return watchlistBloc;
    },
    act: (bloc) => bloc.add(const FetchMoviesData()),
    expect: () => [
      MLoadingData(),
      const MErrorData('Database Failure'),
    ],
    verify: (bloc) {
      verify(mockGetWatchlistMovie.execute());
    },
  );
}