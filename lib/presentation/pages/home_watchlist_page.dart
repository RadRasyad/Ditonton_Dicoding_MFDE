
import 'package:cached_network_image/cached_network_image.dart';
import 'package:ditonton/common/constants.dart';
import 'package:ditonton/domain/entities/movies/movie.dart';
import 'package:ditonton/domain/entities/tvseries/tvseries.dart';
import 'package:ditonton/presentation/pages/movie/movie_detail_page.dart';
import 'package:ditonton/presentation/pages/movie/popular_movies_page.dart';
import 'package:ditonton/presentation/pages/movie/search_movie_page.dart';
import 'package:ditonton/presentation/pages/movie/top_rated_movies_page.dart';
import 'package:ditonton/common/state_enum.dart';
import 'package:ditonton/presentation/pages/movie/watchlist_movies_page.dart';
import 'package:ditonton/presentation/pages/tvseries/tvseries_detail_page.dart';
import 'package:ditonton/presentation/pages/tvseries/watchlist_tvseries_page.dart';
import 'package:ditonton/presentation/provider/movies/movie_list_notifier.dart';
import 'package:ditonton/presentation/provider/watchlist_notifier.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class HomeWatchlistPage extends StatefulWidget {
  static const ROUTE_NAME = '/home_watchlist';

  @override
  _HomeWatchlistPageState createState() => _HomeWatchlistPageState();
}

class _HomeWatchlistPageState extends State<HomeWatchlistPage> {
  @override
  void initState() {
    super.initState();
    Future.microtask(
            () => Provider.of<WatchlistNotifier>(context, listen: false)
          ..getWatchlistMovie()
          ..getWatchlistTvSeriess());
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Watchlist'),
        leading: IconButton(
          onPressed: () => Navigator.pop(context),
          icon: Icon(Icons.arrow_back),
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              _buildSubHeading(
                title: 'Movies',
                onTap: () =>
                    Navigator.pushNamed(context, WatchlistMoviesPage.ROUTE_NAME),
              ),
              Consumer<WatchlistNotifier>(builder: (context, data, child) {
                final state = data.listMoviesState;
                if (state == RequestState.Loading) {
                  return Center(
                    child: CircularProgressIndicator(),
                  );
                } else if (state == RequestState.Loaded) {
                  return MovieList(data.listMovies);
                } else {
                  return Text('Failed');
                }
              }),
              _buildSubHeading(
                title: 'Tv Series',
                onTap: () =>
                    Navigator.pushNamed(context, WatchlistTvSeriesPage.ROUTE_NAME),
              ),
              Consumer<WatchlistNotifier>(builder: (context, data, child) {
                final state = data.listTvSeriesState;
                if (state == RequestState.Loading) {
                  return Center(
                    child: CircularProgressIndicator(),
                  );
                } else if (state == RequestState.Loaded) {
                  return TvSeriesList(data.listTvSeries);
                } else {
                  return Text('Failed');
                }
              }),
            ],
          ),
        ),
      ),
    );
  }

  Row _buildSubHeading({required String title, required Function() onTap}) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(
          title,
          style: kHeading6,
        ),
        InkWell(
          onTap: onTap,
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Row(
              children: [Text('See More'), Icon(Icons.arrow_forward_ios)],
            ),
          ),
        ),
      ],
    );
  }
}

class MovieList extends StatelessWidget {
  final List<Movie> movies;

  MovieList(this.movies);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 200,
      child: ListView.builder(
        scrollDirection: Axis.horizontal,
        itemBuilder: (context, index) {
          final movie = movies[index];
          return Container(
            padding: const EdgeInsets.all(8),
            child: InkWell(
              onTap: () {
                Navigator.pushNamed(
                  context,
                  MovieDetailPage.ROUTE_NAME,
                  arguments: movie.id,
                );
              },
              child: ClipRRect(
                borderRadius: BorderRadius.all(Radius.circular(16)),
                child: CachedNetworkImage(
                  imageUrl: '$BASE_IMAGE_URL${movie.posterPath}',
                  placeholder: (context, url) => Center(
                    child: CircularProgressIndicator(),
                  ),
                  errorWidget: (context, url, error) => Icon(Icons.error),
                ),
              ),
            ),
          );
        },
        itemCount: movies.length,
      ),
    );
  }

}

class TvSeriesList extends StatelessWidget {
  final List<TvSeries> tvSeries;

  TvSeriesList(this.tvSeries);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 200,
      child: ListView.builder(
        scrollDirection: Axis.horizontal,
        itemBuilder: (context, index) {
          final tvS = tvSeries[index];
          return Container(
            padding: const EdgeInsets.all(8),
            child: InkWell(
              onTap: () {
                Navigator.pushNamed(
                  context,
                  TvSeriesDetailPage.ROUTE_NAME,
                  arguments: tvS.id,
                );
              },
              child: ClipRRect(
                borderRadius: BorderRadius.all(Radius.circular(16)),
                child: CachedNetworkImage(
                  imageUrl: '$BASE_IMAGE_URL${tvS.posterPath}',
                  placeholder: (context, url) => Center(
                    child: CircularProgressIndicator(),
                  ),
                  errorWidget: (context, url, error) => Icon(Icons.error),
                ),
              ),
            ),
          );
        },
        itemCount: tvSeries.length,
      ),
    );
  }

}