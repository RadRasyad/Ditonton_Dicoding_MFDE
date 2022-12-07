
import 'package:bloc_test/bloc_test.dart';
import 'package:core/utils/failure.dart';
import 'package:core/utils/state_enum.dart';
import 'package:dartz/dartz.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';
import 'package:tvseries/domain/usecases/get_tvseries_detail.dart';
import 'package:tvseries/domain/usecases/get_tvseries_watchlist_status.dart';
import 'package:tvseries/domain/usecases/remove_tvseries_watchlist.dart';
import 'package:tvseries/domain/usecases/save_tvseries_watchlist.dart';
import 'package:tvseries/presentation/bloc/detailtvseries/detail_tvseries_bloc.dart';
import '../../../../movies/test/dummy_data/dummy_objects.dart';
import 'detail_tvseries_bloc_test.mocks.dart';

@GenerateMocks([
  GetTvSeriesDetail,
  GetTvSeriesWatchListStatus,
  SaveTvSeriesWatchlist,
  RemoveTvSeriesWatchlist,
])
void main() {
  late TvSeriesDetailBloc detailBloc;
  late MockGetTvSeriesDetail mockGetMoviesDetail;
  late MockGetTvSeriesWatchListStatus mockGetWatchlistStatus;
  late MockSaveTvSeriesWatchlist mockSaveWatchlist;
  late MockRemoveTvSeriesWatchlist mockRemoveWatchlist;

  setUp(() {
    mockGetMoviesDetail = MockGetTvSeriesDetail();
    mockGetWatchlistStatus = MockGetTvSeriesWatchListStatus();
    mockSaveWatchlist = MockSaveTvSeriesWatchlist();
    mockRemoveWatchlist = MockRemoveTvSeriesWatchlist();
    detailBloc = TvSeriesDetailBloc(
      getTvSeriesDetail: mockGetMoviesDetail,
      getTvSeriesWatchListStatus: mockGetWatchlistStatus,
      saveTWatchlist: mockSaveWatchlist,
      removeTWatchlist: mockRemoveWatchlist,
    );
  });

  const tId = 1;

  group('Get TvSeries Detail', () {
    test('initial state should be empty', () {
      expect(detailBloc.state.tstate, RequestState.Empty);
    });

    blocTest<TvSeriesDetailBloc,  DetailTvSeriesState>(
      'Should emit [Loading, Loaded] when data is gotten successfully',
      build: () {
        when(mockGetMoviesDetail.execute(tId))
            .thenAnswer((_) async => Right(testTvSeriesDetail));
        return detailBloc;
      },
      act: (bloc) => bloc.add( FetchTvSeriesDetailDataWithId(tId)),
      expect: () => [
        DetailTvSeriesState.initial().copyWith(state: RequestState.Loading),
        DetailTvSeriesState.initial().copyWith(
          state: RequestState.Loaded,
          tvSeriesDetail: testTvSeriesDetail,
        ),
      ],
      verify: (_) {
        verify(mockGetMoviesDetail.execute(tId));
      },
    );

    blocTest<TvSeriesDetailBloc,  DetailTvSeriesState>(
      'Should emit [Loading, Error] when get top rated is unsuccessful',
      build: () {
        when(mockGetMoviesDetail.execute(tId)).thenAnswer(
                (_) async => Left(ServerFailure('Server Failure')));
        return detailBloc;
      },
      act: (bloc) => bloc.add( FetchTvSeriesDetailDataWithId(tId)),
      expect: () => [
        DetailTvSeriesState.initial().copyWith(state: RequestState.Loading),
        DetailTvSeriesState.initial().copyWith(
          state: RequestState.Error,
        ),
      ],
      verify: (_) {
        verify(mockGetMoviesDetail.execute(tId));
      },
    );
  });

  group('Watchlist Status', () {
    blocTest<TvSeriesDetailBloc,  DetailTvSeriesState>(
      'Get Watchlist Status',
      build: () {
        when(mockGetWatchlistStatus.execute(tId)).thenAnswer((_) async => true);
        return detailBloc;
      },
      act: (bloc) => bloc.add( TLoadWatchlistStatus(tId)),
      expect: () => [
        DetailTvSeriesState.initial().copyWith(
          tvSeriesDetail: testTvSeriesDetail,
          isAddedToWatchlist: true,
        ),
      ],
      verify: (_) {
        verify(mockGetWatchlistStatus.execute(tId));
      },
    );

    blocTest<TvSeriesDetailBloc,  DetailTvSeriesState>(
      'Should execute save watchlist when function called',
      build: () {
        when(mockSaveWatchlist.execute(testTvSeriesDetail))
            .thenAnswer((_) async => const Right('Success'));
        when(mockGetWatchlistStatus.execute(testTvSeriesDetail.id))
            .thenAnswer((_) async => true);
        return detailBloc;
      },
      act: (bloc) => bloc.add(TAddWatchlist(testTvSeriesDetail)),
      expect: () => [
        DetailTvSeriesState.initial().copyWith(
            tvSeriesDetail: testTvSeriesDetail,
            isAddedToWatchlist: false,
            watchlistMessage: 'Success'),
        DetailTvSeriesState.initial().copyWith(
            tvSeriesDetail: testTvSeriesDetail,
            isAddedToWatchlist: true,
            watchlistMessage: 'Success'),
      ],
      verify: (_) {
        verify(mockSaveWatchlist.execute(testTvSeriesDetail));
      },
    );

    blocTest<TvSeriesDetailBloc,  DetailTvSeriesState>(
      'should execute remove watchlist when function called',
      build: () {
        when(mockRemoveWatchlist.execute(testTvSeriesDetail))
            .thenAnswer((_) async => const Right('Removed'));
        when(mockGetWatchlistStatus.execute(testTvSeriesDetail.id))
            .thenAnswer((_) async => false);
        return detailBloc;
      },
      act: (bloc) => bloc.add(TRemoveWatchlist(testTvSeriesDetail)),
      expect: () => [
        DetailTvSeriesState.initial().copyWith(
            tvSeriesDetail: testTvSeriesDetail,
            isAddedToWatchlist: false,
            watchlistMessage: 'Removed'),
      ],
      verify: (_) {
        verify(mockRemoveWatchlist.execute(testTvSeriesDetail));
      },
    );

    blocTest<TvSeriesDetailBloc, DetailTvSeriesState>(
      'should update watchlist message when add watchlist failed',
      build: () {
        when(mockSaveWatchlist.execute(testTvSeriesDetail)).thenAnswer(
                (_) async => Left(ServerFailure('Server Failure')));
        when(mockGetWatchlistStatus.execute(testTvSeriesDetail.id))
            .thenAnswer((_) async => false);
        return detailBloc;
      },
      act: (bloc) => bloc.add(TAddWatchlist(testTvSeriesDetail)),
      expect: () => [
        DetailTvSeriesState.initial().copyWith(
            tvSeriesDetail: testTvSeriesDetail,
            isAddedToWatchlist: false,
            watchlistMessage: 'Server Failure'),
      ],
      verify: (_) {
        verify(mockSaveWatchlist.execute(testTvSeriesDetail));
      },
    );

    blocTest<TvSeriesDetailBloc, DetailTvSeriesState>(
      'should update watchlist message when remove watchlist failed',
      build: () {
        when(mockRemoveWatchlist.execute(testTvSeriesDetail)).thenAnswer(
                (_) async => Left(ServerFailure('Server Failure')));
        when(mockGetWatchlistStatus.execute(testTvSeriesDetail.id))
            .thenAnswer((_) async => false);
        return detailBloc;
      },
      act: (bloc) => bloc.add(TRemoveWatchlist(testTvSeriesDetail)),
      expect: () => [
        DetailTvSeriesState.initial().copyWith(
            tvSeriesDetail: testTvSeriesDetail,
            isAddedToWatchlist: false,
            watchlistMessage: 'Server Failure'),
      ],
      verify: (_) {
        verify(mockRemoveWatchlist.execute(testTvSeriesDetail));
      },
    );
  });
}