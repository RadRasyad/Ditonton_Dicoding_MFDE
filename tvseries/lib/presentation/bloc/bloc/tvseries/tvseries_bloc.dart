
import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:tvseries/domain/entities/tvseries.dart';
import 'package:tvseries/domain/usecases/get_now_playing_tvseries.dart';
import 'package:tvseries/domain/usecases/get_popular_tvseries.dart';
import 'package:tvseries/domain/usecases/get_top_rated_tvseries.dart';
import 'package:tvseries/domain/usecases/get_tvseries_recommendations.dart';
import 'package:tvseries/domain/usecases/get_watchlist_tvseries.dart';

part 'tvseries_event.dart';
part 'tvseries_state.dart';

class TvSeriesBloc extends Bloc<TvSeriesEvent, TvSeriesState> {
  final GetNowPlayingTvSeries _getNowPlayingTvSeries;

  TvSeriesBloc(this._getNowPlayingTvSeries) : super(EmptyData()) {
    on<FetchTvSeriesData>((event, emit) async {
      emit(LoadingData());
      final result = await _getNowPlayingTvSeries.execute();

      result.fold(
        (failure) {
          emit(ErrorData(failure.message));
        },
        (data) {
          emit(LoadedData(data));
        },
      );
    });
  }
}

class PopularTvSeriesBloc extends Bloc<TvSeriesEvent, TvSeriesState> {
  final GetPopularTvSeries _getPopularTvSeries;

  PopularTvSeriesBloc(this._getPopularTvSeries) : super(EmptyData()) {
    on<FetchTvSeriesData>((event, emit) async {
      emit(LoadingData());
      final result = await _getPopularTvSeries.execute();

      result.fold(
        (failure) {
          emit(ErrorData(failure.message));
        },
        (data) {
          emit(LoadedData(data));
        },
      );
    });
  }
}

class TopRatedTvSeriesBloc extends Bloc<TvSeriesEvent, TvSeriesState> {
  final GetTopRatedTvSeries _getTopRatedTvSeries;

  TopRatedTvSeriesBloc(this._getTopRatedTvSeries) : super(EmptyData()) {
    on<FetchTvSeriesData>((event, emit) async {
      emit(LoadingData());
      final result = await _getTopRatedTvSeries.execute();

      result.fold(
        (failure) {
          emit(ErrorData(failure.message));
        },
        (data) {
          emit(LoadedData(data));
        },
      );
    });
  }
}

class WatchlistTvSeriesBloc extends Bloc<TvSeriesEvent, TvSeriesState> {
  final GetWatchListTvSeries _getWatchlistTvSeries;

  WatchlistTvSeriesBloc(this._getWatchlistTvSeries) : super(EmptyData()) {
    on<FetchTvSeriesData>((event, emit) async {
      emit(LoadingData());
      final result = await _getWatchlistTvSeries.execute();

      result.fold(
        (failure) {
          emit(ErrorData(failure.message));
        },
        (data) {
          emit(LoadedData(data));
        },
      );
    });
  }
}

class RecommendationTvSeriesBloc extends Bloc<TvSeriesEvent, TvSeriesState> {
  final GetTvSeriesRecommendations _getTvSeriesRecommendations;

  RecommendationTvSeriesBloc(
    this._getTvSeriesRecommendations,
  ) : super(EmptyData()) {
    on<FetchTvSeriesDataWithId>((event, emit) async {
      final id = event.id;
      emit(LoadingData());
      final result = await _getTvSeriesRecommendations.execute(id);

      result.fold(
        (failure) {
          emit(ErrorData(failure.message));
        },
        (data) {
          emit(LoadedData(data));
        },
      );
    });
  }
}