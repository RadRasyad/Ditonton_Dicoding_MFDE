
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
  final GetTvSeriesRecommendations getTvSeriesRecommendations;
  final GetTvSeriesWatchListStatus getTvSeriesWatchListStatus;
  final SaveTvSeriesWatchlist saveWatchlist;
  final RemoveTvSeriesWatchlist removeWatchlist;

  static const watchlistAddSuccessMessage = 'Added to Watchlist';
  static const watchlistRemoveSuccessMessage = 'Removed from Watchlist';

  TvSeriesDetailBloc({
    required this.getTvSeriesDetail,
    required this.getTvSeriesRecommendations,
    required this.getTvSeriesWatchListStatus,
    required this.saveWatchlist,
    required this.removeWatchlist,
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

    on<AddWatchlist>((event, emit) async {
      final result = await saveWatchlist.execute(event.detailTvSeries);

      result.fold((failure) {
        emit(state.copyWith(watchlistMessage: failure.message));
      }, (successMessage) {
        emit(state.copyWith(watchlistMessage: successMessage));
      });

      add(LoadWatchlistStatus(event.detailTvSeries.id));
    });
    on<RemoveWatchlist>((event, emit) async {
      final result = await removeWatchlist.execute(event.tvSeriesDetail);

      result.fold((failure) {
        emit(state.copyWith(watchlistMessage: failure.message));
      }, (successMessage) {
        emit(state.copyWith(watchlistMessage: successMessage));
      });

      add(LoadWatchlistStatus(event.tvSeriesDetail.id));
    });
    on<LoadWatchlistStatus>((event, emit) async {
      final result = await getTvSeriesWatchListStatus.execute(event.id);
      emit(state.copyWith(isAddedToWatchlist: result));
    });
  }
}