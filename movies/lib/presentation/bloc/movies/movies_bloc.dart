
import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:movies/domain/entities/movie.dart';
import 'package:movies/domain/usecases/get_movie_recommendations.dart';
import 'package:movies/domain/usecases/get_now_playing_movies.dart';
import 'package:movies/domain/usecases/get_popular_movies.dart';
import 'package:movies/domain/usecases/get_top_rated_movies.dart';
import 'package:movies/domain/usecases/get_watchlist_movies.dart';

part 'movies_event.dart';
part 'movies_state.dart';

class MoviesBloc extends Bloc<MoviesEvent, MoviesState> {
  final GetNowPlayingMovies _getNowPlayingMovies;

  MoviesBloc(this._getNowPlayingMovies) : super(MEmptyData()) {
    on<FetchMoviesData>((event, emit) async {
      emit(MLoadingData());
      final result = await _getNowPlayingMovies.execute();

      result.fold(
            (failure) {
          emit(MErrorData(failure.message));
        },
            (data) {
          emit(MLoadedData(data));
        },
      );
    });
  }
}

class PopularMoviesBloc extends Bloc<MoviesEvent, MoviesState> {
  final GetPopularMovies _getPopularMovies;
  PopularMoviesBloc(this._getPopularMovies) : super(MEmptyData()) {
    on<FetchMoviesData>((event, emit) async {
      emit(MLoadingData());
      final result = await _getPopularMovies.execute();

      result.fold(
            (failure) {
          emit(MErrorData(failure.message));
        },
            (data) {
          emit(MLoadedData(data));
        },
      );
    });
  }
}

class TopRatedMoviesBloc extends Bloc<MoviesEvent, MoviesState> {
  final GetTopRatedMovies _getTopRatedMovies;
  TopRatedMoviesBloc(this._getTopRatedMovies) : super(MEmptyData()) {
    on<FetchMoviesData>((event, emit) async {
      emit(MLoadingData());
      final result = await _getTopRatedMovies.execute();

      result.fold(
            (failure) {
          emit(MErrorData(failure.message));
        },
            (data) {
          emit(MLoadedData(data));
        },
      );
    });
  }
}

class WatchlistMoviesBloc extends Bloc<MoviesEvent, MoviesState> {
  final GetWatchlistMovies _getWatchlistMovies;
  WatchlistMoviesBloc(this._getWatchlistMovies) : super(MEmptyData()) {
    on<FetchMoviesData>((event, emit) async {
      emit(MLoadingData());
      final result = await _getWatchlistMovies.execute();

      result.fold(
            (failure) {
          emit(MErrorData(failure.message));
        },
            (data) {
          emit(MLoadedData(data));
        },
      );
    });
  }
}

class RecommendationMoviesBloc extends Bloc<MoviesEvent, MoviesState> {
  final GetMovieRecommendations _getMovieRecommendations;

  RecommendationMoviesBloc(
      this._getMovieRecommendations,
      ) : super(MEmptyData()) {
    on<FetchMovieDataWithId>((event, emit) async {
      final id = event.id;
      emit(MLoadingData());
      final result = await _getMovieRecommendations.execute(id);

      result.fold(
            (failure) {
          emit(MErrorData(failure.message));
        },
            (data) {
          emit(MLoadedData(data));
        },
      );
    });
  }
}