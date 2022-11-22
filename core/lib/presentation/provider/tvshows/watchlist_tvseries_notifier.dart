
import 'package:core/domain/entities/tvseries/tvseries.dart';
import 'package:core/domain/usecases/tvshows/get_watchlist_tvseries.dart';
import 'package:core/utils/state_enum.dart';
import 'package:flutter/foundation.dart';

class WatchlistTvSeriesNotifier extends ChangeNotifier {
  var _watchlistTvSeries = <TvSeries>[];
  List<TvSeries> get watchlistTvSeries => _watchlistTvSeries;

  var _watchlistState = RequestState.Empty;
  RequestState get watchlistState => _watchlistState;

  String _message = '';
  String get message => _message;

  WatchlistTvSeriesNotifier({required this.getWatchlistTvSeriess});

  final GetWatchListTvSeries getWatchlistTvSeriess;

  Future<void> fetchWatchlistTvSeriess() async {
    _watchlistState = RequestState.Loading;
    notifyListeners();

    final result = await getWatchlistTvSeriess.execute();
    result.fold(
      (failure) {
        _watchlistState = RequestState.Error;
        _message = failure.message;
        notifyListeners();
      },
      (tvSeriessData) {
        _watchlistState = RequestState.Loaded;
        _watchlistTvSeries = tvSeriessData;
        notifyListeners();
      },
    );
  }
}
