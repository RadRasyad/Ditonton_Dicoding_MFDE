//
// import 'package:cached_network_image/cached_network_image.dart';
// import 'package:core/presentation/provider/watchlist_notifier.dart';
// import 'package:core/styles/text_styles.dart';
// import 'package:core/utils/constants.dart';
// import 'package:core/utils/state_enum.dart';
// import 'package:core/utils/utils.dart';
// import 'package:flutter/material.dart';
// import 'package:movies/domain/entities/movie.dart';
// import 'package:provider/provider.dart';
// import 'package:tvseries/domain/entities/tvseries.dart';
//
// import '../../utils/routes.dart';
//
// class HomeWatchlistPage extends StatefulWidget {
//   static const ROUTE_NAME = '/home_watchlist';
//
//   @override
//   _HomeWatchlistPageState createState() => _HomeWatchlistPageState();
// }
//
// class _HomeWatchlistPageState extends State<HomeWatchlistPage> with RouteAware {
//
//   @override
//   void initState() {
//     super.initState();
//     Future.microtask(
//             () => Provider.of<WatchlistNotifier>(context, listen: false)
//           ..getWatchlistMovie()
//           ..getWatchlistTvSeriess());
//   }
//
//   @override
//   void didChangeDependencies() {
//     super.didChangeDependencies();
//     routeObserver.subscribe(this, ModalRoute.of(context)!);
//   }
//
//   void didPopNext() {
//     Provider.of<WatchlistNotifier>(context, listen: false)
//       ..getWatchlistMovie()
//       ..getWatchlistTvSeriess();
//   }
//
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         title: const Text('Watchlist'),
//         leading: IconButton(
//           onPressed: () => Navigator.pop(context),
//           icon: const Icon(Icons.arrow_back),
//         ),
//       ),
//       body: Padding(
//         padding: const EdgeInsets.all(8.0),
//         child: SingleChildScrollView(
//           child: Column(
//             crossAxisAlignment: CrossAxisAlignment.start,
//             children: [
//               _buildSubHeading(
//                 title: 'Movies',
//                 onTap: () =>
//                     Navigator.pushNamed(context, WATCHLIST_MOVIE_ROUTE),
//               ),
//               Consumer<WatchlistNotifier>(builder: (context, data, child) {
//                 final state = data.listMoviesState;
//                 if (state == RequestState.Loading) {
//                   return Center(
//                     child: CircularProgressIndicator(),
//                   );
//                 } else if (state == RequestState.Loaded) {
//                   return MovieList(data.listMovies);
//                 } else {
//                   return Text('Failed');
//                 }
//               }),
//               _buildSubHeading(
//                 title: 'Tv Series',
//                 onTap: () =>
//                     Navigator.pushNamed(context, WATCHLIST_TVSERIES_ROUTE),
//               ),
//               Consumer<WatchlistNotifier>(builder: (context, data, child) {
//                 final state = data.listTvSeriesState;
//                 if (state == RequestState.Loading) {
//                   return Center(
//                     child: CircularProgressIndicator(),
//                   );
//                 } else if (state == RequestState.Loaded) {
//                   return TvSeriesList(data.listTvSeries);
//                 } else {
//                   return Text('Failed');
//                 }
//               }),
//             ],
//           ),
//         ),
//       ),
//     );
//   }
//
//   Row _buildSubHeading({required String title, required Function() onTap}) {
//     return Row(
//       mainAxisAlignment: MainAxisAlignment.spaceBetween,
//       children: [
//         Text(
//           title,
//           style: kHeading6,
//         ),
//         InkWell(
//           onTap: onTap,
//           child: Padding(
//             padding: const EdgeInsets.all(8.0),
//             child: Row(
//               children: [Text('See More'), Icon(Icons.arrow_forward_ios)],
//             ),
//           ),
//         ),
//       ],
//     );
//   }
//
//   @override
//   void dispose() {
//     routeObserver.unsubscribe(this);
//     super.dispose();
//   }
// }
//
// class MovieList extends StatelessWidget {
//   final List<Movie> movies;
//
//   MovieList(this.movies);
//
//   @override
//   Widget build(BuildContext context) {
//     return Container(
//       height: 200,
//       child: ListView.builder(
//         scrollDirection: Axis.horizontal,
//         itemBuilder: (context, index) {
//           final movie = movies[index];
//           return Container(
//             padding: const EdgeInsets.all(8),
//             child: InkWell(
//               onTap: () {
//                 Navigator.pushNamed(
//                   context,
//                   MOVIE_DETAIL_ROUTE,
//                   arguments: movie.id,
//                 );
//               },
//               child: ClipRRect(
//                 borderRadius: const BorderRadius.all(Radius.circular(16)),
//                 child: CachedNetworkImage(
//                   imageUrl: '$BASE_IMAGE_URL${movie.posterPath}',
//                   placeholder: (context, url) => const Center(
//                     child: CircularProgressIndicator(),
//                   ),
//                   errorWidget: (context, url, error) => Icon(Icons.error),
//                 ),
//               ),
//             ),
//           );
//         },
//         itemCount: movies.length,
//       ),
//     );
//   }
//
// }
//
// class TvSeriesList extends StatelessWidget {
//   final List<TvSeries> tvSeries;
//
//   TvSeriesList(this.tvSeries);
//
//   @override
//   Widget build(BuildContext context) {
//     return Container(
//       height: 200,
//       child: ListView.builder(
//         scrollDirection: Axis.horizontal,
//         itemBuilder: (context, index) {
//           final tvS = tvSeries[index];
//           return Container(
//             padding: const EdgeInsets.all(8),
//             child: InkWell(
//               onTap: () {
//                 Navigator.pushNamed(
//                   context,
//                   TVSERIES_DETAIL_ROUTE,
//                   arguments: tvS.id,
//                 );
//               },
//               child: ClipRRect(
//                 borderRadius: const BorderRadius.all(Radius.circular(16)),
//                 child: CachedNetworkImage(
//                   imageUrl: '$BASE_IMAGE_URL${tvS.posterPath}',
//                   placeholder: (context, url) => const Center(
//                     child: CircularProgressIndicator(),
//                   ),
//                   errorWidget: (context, url, error) => Icon(Icons.error),
//                 ),
//               ),
//             ),
//           );
//         },
//         itemCount: tvSeries.length,
//       ),
//     );
//   }
//
// }