
import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:core/utils/state_enum.dart';
import 'package:tvseries/domain/entities/tvseries_detail.dart';
import 'package:tvseries/domain/usecases/get_tvseries_detail.dart';
import 'package:tvseries/domain/usecases/get_tvseries_recommendations.dart';
import 'package:tvseries/domain/usecases/get_tvseries_watchlist_status.dart';
import 'package:tvseries/domain/usecases/remove_tvseries_watchlist.dart';
import 'package:tvseries/domain/usecases/save_tvseries_watchlist.dart';

part 'detail_tvseries_state.dart';
part 'detail_tvseries_event.dart';

class TvSeriesDetailBloc extends Bloc<DetailTvSeriesEvent, DetailTvSeriesState> {
  final GetTvSeriesDetail getTvSeriesDetail;
  final GetTvSeriesWatchListStatus getTvSeriesWatchListStatus;
  final SaveTvSeriesWatchlist saveTWatchlist;
  final RemoveTvSeriesWatchlist removeTWatchlist;

  static const watchlistAddSuccessMessage = 'Added to Watchlist';
  static const watchlistRemoveSuccessMessage = 'Removed from Watchlist';

  TvSeriesDetailBloc({
    required this.getTvSeriesDetail,
    required this.getTvSeriesWatchListStatus,
    required this.saveTWatchlist,
    required this.removeTWatchlist,
  }) : super(DetailTvSeriesState.initial()) {
    on<FetchTvSeriesDetailDataWithId>((event, emit) async {
      emit(state.copyWith(state: RequestState.Loading));
      final detailResult = await getTvSeriesDetail.execute(event.id);

      detailResult.fold(
            (failure) async {
          emit(state.copyWith(state: RequestState.Error));
        },
            (tvSeries) async {
          emit(state.copyWith(
            state: RequestState.Loaded,
            tvSeriesDetail: tvSeries,
          ));
        },
      );
    });

    on<TAddWatchlist>((event, emit) async {
      final result = await saveTWatchlist.execute(event.detailTvSeries);

      result.fold((failure) {
        emit(state.copyWith(watchlistMessage: failure.message));
      }, (successMessage) {
        emit(state.copyWith(watchlistMessage: successMessage));
      });

      add(TLoadWatchlistStatus(event.detailTvSeries.id));
    });
    on<TRemoveWatchlist>((event, emit) async {
      final result = await removeTWatchlist.execute(event.tvSeriesDetail);

      result.fold((failure) {
        emit(state.copyWith(watchlistMessage: failure.message));
      }, (successMessage) {
        emit(state.copyWith(watchlistMessage: successMessage));
      });

      add(TLoadWatchlistStatus(event.tvSeriesDetail.id));
    });
    on<TLoadWatchlistStatus>((event, emit) async {
      final result = await getTvSeriesWatchListStatus.execute(event.id);
      emit(state.copyWith(isAddedToWatchlist: result));
    });
  }
}