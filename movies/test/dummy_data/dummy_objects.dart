

import 'package:core/domain/entities/genre.dart';
import 'package:movies/data/model/movie_table.dart';
import 'package:movies/domain/entities/movie.dart';
import 'package:movies/domain/entities/movie_detail.dart';
import 'package:tvseries/data/model/tvseries_table.dart';
import 'package:tvseries/domain/entities/tvseries.dart';
import 'package:tvseries/domain/entities/tvseries_detail.dart';

final testMovie = Movie(
  adult: false,
  backdropPath: '/muth4OYamXf41G2evdrLEg8d3om.jpg',
  genreIds: [14, 28],
  id: 557,
  originalTitle: 'Spider-Man',
  overview:
  'After being bitten by a genetically altered spider, nerdy high school student Peter Parker is endowed with amazing powers to become the Amazing superhero known as Spider-Man.',
  popularity: 60.441,
  posterPath: '/rweIrveL43TaxUN0akQEaAXL6x0.jpg',
  releaseDate: '2002-05-01',
  title: 'Spider-Man',
  video: false,
  voteAverage: 7.2,
  voteCount: 13507,
);

final testMovieList = [testMovie];

final testMovieDetail = MovieDetail(
  adult: false,
  backdropPath: 'backdropPath',
  genres: [Genre(id: 1, name: 'Action')],
  id: 1,
  originalTitle: 'originalTitle',
  overview: 'overview',
  posterPath: 'posterPath',
  releaseDate: 'releaseDate',
  runtime: 120,
  title: 'title',
  voteAverage: 1,
  voteCount: 1,
);

final testMovieCache = MovieTable(
  id: 557,
  overview:
  'After being bitten by a genetically altered spider, nerdy high school student Peter Parker is endowed with amazing powers to become the Amazing superhero known as Spider-Man.',
  posterPath: '/rweIrveL43TaxUN0akQEaAXL6x0.jpg',
  title: 'Spider-Man',
);

final testMovieCacheMap = {
  'id': 557,
  'overview':
  'After being bitten by a genetically altered spider, nerdy high school student Peter Parker is endowed with amazing powers to become the Amazing superhero known as Spider-Man.',
  'posterPath': '/rweIrveL43TaxUN0akQEaAXL6x0.jpg',
  'title': 'Spider-Man',
};

final testMovieFromCache = Movie.watchlist(
  id: 557,
  overview:
  'After being bitten by a genetically altered spider, nerdy high school student Peter Parker is endowed with amazing powers to become the Amazing superhero known as Spider-Man.',
  posterPath: '/rweIrveL43TaxUN0akQEaAXL6x0.jpg',
  title: 'Spider-Man',
);

final testWatchlistMovie = Movie.watchlist(
  id: 1,
  title: 'title',
  posterPath: 'posterPath',
  overview: 'overview',
);

final testMovieTable = MovieTable(
  id: 1,
  title: 'title',
  posterPath: 'posterPath',
  overview: 'overview',
);

final testMovieMap = {
  'id': 1,
  'overview': 'overview',
  'posterPath': 'posterPath',
  'title': 'title',
};


final testTvSeries = TvSeries(
  backdropPath: '/5kkw5RT1OjTAMh3POhjo5LdaACZ.jpg',
  firstAirDate: '2021-10-12',
  genreIds: [
    80,
    10765
  ],
  id: 90462,
  name: 'Chucky',
  originCountry: ["US"],
  originalLanguage: 'en',
  originalName: 'Chucky',
  overview: 'After a vintage Chucky doll turns up at a suburban yard sale, an idyllic American town is thrown into chaos as a series of horrifying murders begin to expose the town’s hypocrisies and secrets. Meanwhile, the arrival of enemies — and allies — from Chucky’s past threatens to expose the truth behind the killings, as well as the demon doll’s untold origins.',
  popularity: 3545.458,
  posterPath: '/kY0BogCM8SkNJ0MNiHB3VTM86Tz.jpg',
  voteAverage: 7.9,
  voteCount: 3466,
);

final testTvSeriesList = [testTvSeries];

final testTvSeriesDetail = TvSeriesDetail(
    backdropPath: '/rkB4LyZHo1NHXFEDHl9vSD9r1lI.jpg',
    genres: [
      Genre(id: 16, name: 'Animation'),
      Genre(id: 10765, name: 'Sci-Fi & Fantasy'),
      Genre(id: 10759, name: 'Action & Adventure'),
      Genre(id: 18, name: 'Drama')
    ],
    id: 94605,
    numberOfEpisodes: 9,
    numberOfSeasons: 2,
    name: 'Arcane',
    overview: 'Amid the stark discord of twin cities Piltover and Zaun, two sisters fight on rival sides of a war between magic technologies and clashing convictions.',
    popularity: 98.417,
    posterPath: '/fqldf2t8ztc9aiwn3k6mlX3tvRT.jpg',
    status: 'Returning Series',
    voteAverage: 8.7,
    voteCount: 2676
);

final testTvSeriesCache = TvSeriesTable(
  id: 90462,
  overview:
  'After a vintage Chucky doll turns up at a suburban yard sale, an idyllic American town is thrown into chaos as a series of horrifying murders begin to expose the town’s hypocrisies and secrets. Meanwhile, the arrival of enemies — and allies — from Chucky’s past threatens to expose the truth behind the killings, as well as the demon doll’s untold origins.',
  posterPath: '/kY0BogCM8SkNJ0MNiHB3VTM86Tz.jpg',
  title: 'Chucky',
);

final testTvSeriesCacheMap = {
  'id': 90462,
  'overview':
  'After a vintage Chucky doll turns up at a suburban yard sale, an idyllic American town is thrown into chaos as a series of horrifying murders begin to expose the town’s hypocrisies and secrets. Meanwhile, the arrival of enemies — and allies — from Chucky’s past threatens to expose the truth behind the killings, as well as the demon doll’s untold origins.',
  'posterPath': '/kY0BogCM8SkNJ0MNiHB3VTM86Tz.jpg',
  'title': 'Chucky',
};

final testTvSeriesFromCache = TvSeries.watchlist(
  id: 90462,
  overview:
  'After a vintage Chucky doll turns up at a suburban yard sale, an idyllic American town is thrown into chaos as a series of horrifying murders begin to expose the town’s hypocrisies and secrets. Meanwhile, the arrival of enemies — and allies — from Chucky’s past threatens to expose the truth behind the killings, as well as the demon doll’s untold origins.',
  posterPath: '/kY0BogCM8SkNJ0MNiHB3VTM86Tz.jpg',
  name: 'Chucky',
);

final testWatchlistTvSeries = TvSeries.watchlist(
  id: 2,
  name: 'title',
  posterPath: 'posterPath',
  overview: 'overview',
);

final testTvSeriesTable = TvSeriesTable(
  id: 2,
  title: 'title',
  posterPath: 'posterPath',
  overview: 'overview',
);

final testTvSeriesTable2 = TvSeriesTable(
  id: 94605,
  title: 'Arcane',
  posterPath: '/fqldf2t8ztc9aiwn3k6mlX3tvRT.jpg',
  overview: 'Amid the stark discord of twin cities Piltover and Zaun, two sisters fight on rival sides of a war between magic technologies and clashing convictions.',
);

final testTvSeriesMap = {
  'id': 2,
  'overview': 'overview',
  'posterPath': 'posterPath',
  'title': 'title',
};