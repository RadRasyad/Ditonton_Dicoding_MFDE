import 'package:data_connection_checker/data_connection_checker.dart';
import 'package:ditonton/data/datasources/db/database_helper.dart';
import 'package:ditonton/data/datasources/movie_local_data_source.dart';
import 'package:ditonton/data/datasources/movie_remote_data_source.dart';
import 'package:ditonton/data/datasources/tvseries_local_data_source.dart';
import 'package:ditonton/data/datasources/tvseries_remote_data_source.dart';
import 'package:ditonton/data/repositories/movie_repository_impl.dart';
import 'package:ditonton/data/repositories/tvseries_repository_impl.dart';
import 'package:ditonton/domain/repositories/movie_repository.dart';
import 'package:ditonton/domain/repositories/tvseries_repository.dart';
import 'package:ditonton/domain/usecases/movies/get_movie_detail.dart';
import 'package:ditonton/domain/usecases/tvshows/get_now_playing_tvseries.dart';
import 'package:ditonton/domain/usecases/tvshows/get_popular_tvseries.dart';
import 'package:ditonton/domain/usecases/tvshows/get_top_rated_tvseries.dart';
import 'package:ditonton/domain/usecases/tvshows/get_tvseries_watchlist_status.dart';
import 'package:ditonton/domain/usecases/tvshows/get_watchlist_tvseries.dart';
import 'package:ditonton/domain/usecases/tvshows/remove_tvseries_watchlist.dart';
import 'package:ditonton/domain/usecases/tvshows/save_tvseries_watchlist.dart';
import 'package:ditonton/domain/usecases/tvshows/search_movies.dart';
import 'package:ditonton/presentation/provider/movies/movie_detail_notifier.dart';
import 'package:ditonton/presentation/provider/movies/movie_list_notifier.dart';
import 'package:ditonton/presentation/provider/movies/movie_search_notifier.dart';
import 'package:ditonton/presentation/provider/movies/popular_movies_notifier.dart';
import 'package:ditonton/presentation/provider/movies/top_rated_movies_notifier.dart';
import 'package:ditonton/presentation/provider/movies/watchlist_movie_notifier.dart';
import 'package:ditonton/presentation/provider/tvshows/now_playing_tvseries_notifier.dart';
import 'package:ditonton/presentation/provider/tvshows/top_rated_tvseries_notifier.dart';
import 'package:ditonton/presentation/provider/tvshows/tvseries_detail_notifier.dart';
import 'package:ditonton/presentation/provider/tvshows/tvseries_list_notifier.dart';
import 'package:ditonton/presentation/provider/tvshows/tvseries_search_notifier.dart';
import 'package:ditonton/presentation/provider/tvshows/watchlist_tvseries_notifier.dart';
import 'package:ditonton/presentation/provider/watchlist_notifier.dart';
import 'package:http/http.dart' as http;
import 'package:get_it/get_it.dart';

import 'common/network_info.dart';
import 'domain/usecases/movies/get_movie_recommendations.dart';
import 'domain/usecases/movies/get_now_playing_movies.dart';
import 'domain/usecases/movies/get_popular_movies.dart';
import 'domain/usecases/movies/get_top_rated_movies.dart';
import 'domain/usecases/movies/get_watchlist_movies.dart';
import 'domain/usecases/movies/get_movie_watchlist_status.dart';
import 'domain/usecases/movies/remove_movies_watchlist.dart';
import 'domain/usecases/movies/save_movies_watchlist.dart';
import 'domain/usecases/movies/search_movies.dart';
import 'domain/usecases/tvshows/get_tvseries_detail.dart';
import 'domain/usecases/tvshows/get_tvseries_recommendations.dart';
import 'presentation/provider/tvshows/popular_tvseries_notifier.dart';

final locator = GetIt.instance;

void init() {
  // provider
  locator.registerFactory(
        () => MovieListNotifier(
      getNowPlayingMovies: locator(),
      getPopularMovies: locator(),
      getTopRatedMovies: locator(),
    ),
  );
  locator.registerFactory(
        () => MovieDetailNotifier(
      getMovieDetail: locator(),
      getMovieRecommendations: locator(),
      getWatchListStatus: locator(),
      saveWatchlist: locator(),
      removeWatchlist: locator(),
    ),
  );
  locator.registerFactory(
        () => MovieSearchNotifier(
      searchMovies: locator(),
    ),
  );
  locator.registerFactory(
        () => PopularMoviesNotifier(
      locator(),
    ),
  );
  locator.registerFactory(
        () => TopRatedMoviesNotifier(
      getTopRatedMovies: locator(),
    ),
  );
  locator.registerFactory(
        () => WatchlistMovieNotifier(
      getWatchlistMovies: locator(),
    ),
  );

  locator.registerFactory(
        () => TvSeriesListNotifier(
      getNowPlayingTvSeries: locator(),
      getPopularTvSeries: locator(),
      getTopRatedTvSeries: locator(),
    ),
  );
  locator.registerFactory(
        () => TvSeriesDetailNotifier(
      getTvSeriesDetail: locator(),
      getTvSeriesRecommendations: locator(),
      getTvSeriesWatchListStatus: locator(),
      saveTvSeriesWatchlist: locator(),
      removeTvSeriesWatchlist: locator(),
    ),
  );
  locator.registerFactory(
        () => TvSeriesSearchNotifier(
      searchTvSeries: locator(),
    ),
  );
  locator.registerFactory(
        () => NowPlayingTvSeriesNotifier(
      locator(),
    ),
  );
  locator.registerFactory(
        () => PopularTvSeriesNotifier(
      locator(),
    ),
  );
  locator.registerFactory(
        () => TopRatedTvSeriesNotifier(
      getTopRatedTvSeries: locator(),
    ),
  );
  locator.registerFactory(
        () => WatchlistTvSeriesNotifier(
      getWatchlistTvSeriess: locator(),
    ),
  );
  locator.registerFactory(
        () => WatchlistNotifier(
          getWatchlistMovies: locator(),
          getWatchlistTvSeries: locator(),
    ),
  );

  // use case
  locator.registerLazySingleton(() => GetNowPlayingMovies(locator()));
  locator.registerLazySingleton(() => GetPopularMovies(locator()));
  locator.registerLazySingleton(() => GetTopRatedMovies(locator()));
  locator.registerLazySingleton(() => GetMovieDetail(locator()));
  locator.registerLazySingleton(() => GetMovieRecommendations(locator()));
  locator.registerLazySingleton(() => SearchMovies(locator()));
  locator.registerLazySingleton(() => GetWatchListStatus(locator()));
  locator.registerLazySingleton(() => SaveMoviesWatchlist(locator()));
  locator.registerLazySingleton(() => RemoveMoviesWatchlist(locator()));
  locator.registerLazySingleton(() => GetWatchlistMovies(locator()));

  locator.registerLazySingleton(() => GetNowPlayingTvSeries(locator()));
  locator.registerLazySingleton(() => GetPopularTvSeries(locator()));
  locator.registerLazySingleton(() => GetTopRatedTvSeries(locator()));
  locator.registerLazySingleton(() => GetTvSeriesDetail(locator()));
  locator.registerLazySingleton(() => GetTvSeriesRecommendations(locator()));
  locator.registerLazySingleton(() => SearchTvSeries(locator()));
  locator.registerLazySingleton(() => GetTvSeriesWatchListStatus(locator()));
  locator.registerLazySingleton(() => SaveTvSeriesWatchlist(locator()));
  locator.registerLazySingleton(() => RemoveTvSeriesWatchlist(locator()));
  locator.registerLazySingleton(() => GetWatchListTvSeries(locator()));

  // repository
  locator.registerLazySingleton<MovieRepository>(
        () => MovieRepositoryImpl(
      remoteDataSource: locator(),
      localDataSource: locator(),
      networkInfo: locator(),
    ),
  );
  locator.registerLazySingleton<TvSeriesRepository>(
        () => TvSeriesRepositoryImpl(
      remoteDataSource: locator(),
      localDataSource: locator(),
      networkInfo: locator(),
    ),
  );

  // data sources
  locator.registerLazySingleton<MovieRemoteDataSource>(
          () => MovieRemoteDataSourceImpl(client: locator()));
  locator.registerLazySingleton<MovieLocalDataSource>(
          () => MovieLocalDataSourceImpl(databaseHelper: locator()));

  locator.registerLazySingleton<TvSeriesRemoteDataSource>(
          () => TvSeriesRemoteDataSourceImpl(client: locator()));
  locator.registerLazySingleton<TvSeriesLocalDataSource>(
          () => TvSeriesLocalDataSourceImpl(databaseHelper: locator()));


  // helper
  locator.registerLazySingleton<DatabaseHelper>(() => DatabaseHelper());

  // network info
  locator.registerLazySingleton<NetworkInfo>(() => NetworkInfoImpl(locator()));

  // external
  locator.registerLazySingleton(() => http.Client());
  locator.registerLazySingleton(() => DataConnectionChecker());
}
