
import 'package:bloc_test/bloc_test.dart';
import 'package:core/utils/failure.dart';
import 'package:core/utils/state_enum.dart';
import 'package:dartz/dartz.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';
import 'package:movies/domain/usecases/get_movie_detail.dart';
import 'package:movies/domain/usecases/get_movie_watchlist_status.dart';
import 'package:movies/domain/usecases/remove_movies_watchlist.dart';
import 'package:movies/domain/usecases/save_movies_watchlist.dart';
import 'package:movies/presentation/bloc/detailmovies/detail_movies_bloc.dart';
import '../../dummy_data/dummy_objects.dart';
import 'detail_movies_bloc_test.mocks.dart';

@GenerateMocks([
  GetMovieDetail,
  GetWatchListStatus,
  SaveMoviesWatchlist,
  RemoveMoviesWatchlist,
])
void main() {
  late MoviesDetailBloc detailBloc;
  late MockGetMovieDetail mockGetMoviesDetail;
  late MockGetWatchListStatus mockGetWatchlistStatus;
  late MockSaveMoviesWatchlist mockSaveWatchlist;
  late MockRemoveMoviesWatchlist mockRemoveWatchlist;

  setUp(() {
    mockGetMoviesDetail = MockGetMovieDetail();
    mockGetWatchlistStatus = MockGetWatchListStatus();
    mockSaveWatchlist = MockSaveMoviesWatchlist();
    mockRemoveWatchlist = MockRemoveMoviesWatchlist();
    detailBloc = MoviesDetailBloc(
      getMovieDetail: mockGetMoviesDetail,
      getWatchListStatus: mockGetWatchlistStatus,
      saveWatchlist: mockSaveWatchlist,
      removeWatchlist: mockRemoveWatchlist,
    );
  });

  const tId = 1;

  group('Get Movie Detail', () {
    test('initial state should be empty', () {
      expect(detailBloc.state.state, RequestState.Empty);
    });

    blocTest<MoviesDetailBloc, DetailMoviesState>(
      'Should emit [Loading, Loaded] when data is gotten successfully',
      build: () {
        when(mockGetMoviesDetail.execute(tId))
            .thenAnswer((_) async => Right(testMovieDetail));
        return detailBloc;
      },
      act: (bloc) => bloc.add(const FetchMovieDetailDataWithId(tId)),
      expect: () => [
       DetailMoviesState.initial().copyWith(state: RequestState.Loading),
       DetailMoviesState.initial().copyWith(
          state: RequestState.Loaded,
          movieDetail: testMovieDetail,
        ),
      ],
      verify: (_) {
        verify(mockGetMoviesDetail.execute(tId));
      },
    );

    blocTest<MoviesDetailBloc, DetailMoviesState>(
      'Should emit [Loading, Error] when get top rated is unsuccessful',
      build: () {
        when(mockGetMoviesDetail.execute(tId)).thenAnswer(
                (_) async => Left(ServerFailure('Server Failure')));
        return detailBloc;
      },
      act: (bloc) => bloc.add(const FetchMovieDetailDataWithId(tId)),
      expect: () => [
       DetailMoviesState.initial().copyWith(state: RequestState.Loading),
       DetailMoviesState.initial().copyWith(
          state: RequestState.Error,
        ),
      ],
      verify: (_) {
        verify(mockGetMoviesDetail.execute(tId));
      },
    );
  });

  group('Watchlist Status', () {
    blocTest<MoviesDetailBloc, DetailMoviesState>(
      'Get Watchlist Status',
      build: () {
        when(mockGetWatchlistStatus.execute(tId)).thenAnswer((_) async => true);
        return detailBloc;
      },
      act: (bloc) => bloc.add(const LoadWatchlistStatus(tId)),
      expect: () => [
       DetailMoviesState.initial().copyWith(
          movieDetail: testMovieDetail,
          isAddedToWatchlist: true,
        ),
      ],
      verify: (_) {
        verify(mockGetWatchlistStatus.execute(tId));
      },
    );

    blocTest<MoviesDetailBloc, DetailMoviesState>(
      'Should execute save watchlist when function called',
      build: () {
        when(mockSaveWatchlist.execute(testMovieDetail))
            .thenAnswer((_) async => const Right('Success'));
        when(mockGetWatchlistStatus.execute(testMovieDetail.id))
            .thenAnswer((_) async => true);
        return detailBloc;
      },
      act: (bloc) => bloc.add(AddWatchlist(testMovieDetail)),
      expect: () => [
       DetailMoviesState.initial().copyWith(
            movieDetail: testMovieDetail,
            isAddedToWatchlist: false,
            watchlistMessage: 'Success'),
       DetailMoviesState.initial().copyWith(
            movieDetail: testMovieDetail,
            isAddedToWatchlist: true,
            watchlistMessage: 'Success'),
      ],
      verify: (_) {
        verify(mockSaveWatchlist.execute(testMovieDetail));
      },
    );

    blocTest<MoviesDetailBloc, DetailMoviesState>(
      'should execute remove watchlist when function called',
      build: () {
        when(mockRemoveWatchlist.execute(testMovieDetail))
            .thenAnswer((_) async => const Right('Removed'));
        when(mockGetWatchlistStatus.execute(testMovieDetail.id))
            .thenAnswer((_) async => false);
        return detailBloc;
      },
      act: (bloc) => bloc.add(RemoveWatchlist(testMovieDetail)),
      expect: () => [
       DetailMoviesState.initial().copyWith(
            movieDetail: testMovieDetail,
            isAddedToWatchlist: false,
            watchlistMessage: 'Removed'),
      ],
      verify: (_) {
        verify(mockRemoveWatchlist.execute(testMovieDetail));
      },
    );

    blocTest<MoviesDetailBloc,DetailMoviesState>(
      'should update watchlist message when add watchlist failed',
      build: () {
        when(mockSaveWatchlist.execute(testMovieDetail)).thenAnswer(
                (_) async => Left(ServerFailure('Server Failure')));
        when(mockGetWatchlistStatus.execute(testMovieDetail.id))
            .thenAnswer((_) async => false);
        return detailBloc;
      },
      act: (bloc) => bloc.add(AddWatchlist(testMovieDetail)),
      expect: () => [
       DetailMoviesState.initial().copyWith(
            movieDetail: testMovieDetail,
            isAddedToWatchlist: false,
            watchlistMessage: 'Server Failure'),
      ],
      verify: (_) {
        verify(mockSaveWatchlist.execute(testMovieDetail));
      },
    );

    blocTest<MoviesDetailBloc,DetailMoviesState>(
      'should update watchlist message when remove watchlist failed',
      build: () {
        when(mockRemoveWatchlist.execute(testMovieDetail)).thenAnswer(
                (_) async => Left(ServerFailure('Server Failure')));
        when(mockGetWatchlistStatus.execute(testMovieDetail.id))
            .thenAnswer((_) async => false);
        return detailBloc;
      },
      act: (bloc) => bloc.add(RemoveWatchlist(testMovieDetail)),
      expect: () => [
       DetailMoviesState.initial().copyWith(
            movieDetail: testMovieDetail,
            isAddedToWatchlist: false,
            watchlistMessage: 'Server Failure'),
      ],
      verify: (_) {
        verify(mockRemoveWatchlist.execute(testMovieDetail));
      },
    );
  });
}