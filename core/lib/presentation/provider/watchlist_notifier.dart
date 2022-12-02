
import 'package:core/utils/state_enum.dart';
import 'package:flutter/material.dart';
import 'package:movies/domain/entities/movie.dart';
import 'package:tvseries/domain/entities/tvseries.dart';

// class WatchlistNotifier extends ChangeNotifier {
//   var _listMovies = <Movie>[];
//   List<Movie> get listMovies => _listMovies;
//
//   RequestState _listMoviesState = RequestState.Empty;
//   RequestState get listMoviesState => _listMoviesState;
//
//   var _listTvSeries = <TvSeries>[];
//   List<TvSeries> get listTvSeries => _listTvSeries;
//
//   RequestState _listTvSeriesState = RequestState.Empty;
//   RequestState get listTvSeriesState => _listTvSeriesState;
//
//   String _message = '';
//   String get message => _message;
//
//   WatchlistNotifier({
//     required this.getWatchlistMovies,
//     required this.getWatchlistTvSeries,
//   });
//
//   final GetWatchlistMovies getWatchlistMovies;
//   final GetWatchListTvSeries getWatchlistTvSeries;
//
//   Future<void> getWatchlistMovie() async {
//     _listMoviesState = RequestState.Loading;
//     notifyListeners();
//
//     final result = await getWatchlistMovies.execute();
//     result.fold(
//       (failure) {
//         _listMoviesState = RequestState.Error;
//         _message = failure.message;
//         notifyListeners();
//       },
//       (movieData) {
//         _listMoviesState = RequestState.Loaded;
//         _listMovies = movieData;
//         notifyListeners();
//       },
//     );
//   }
//
//   Future<void> getWatchlistTvSeriess() async {
//     _listTvSeriesState = RequestState.Loading;
//     notifyListeners();
//
//     final result = await getWatchlistTvSeries.execute();
//     result.fold(
//       (failure) {
//         _listTvSeriesState = RequestState.Error;
//         _message = failure.message;
//         notifyListeners();
//       },
//       (tvSeriesData) {
//         _listTvSeriesState = RequestState.Loaded;
//         _listTvSeries = tvSeriesData;
//         notifyListeners();
//       },
//     );
//   }
//
//
// }
