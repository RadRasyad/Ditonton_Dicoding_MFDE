import 'package:ditonton/domain/entities/genre.dart';
import 'package:equatable/equatable.dart';

class TvSeriesDetail extends Equatable {
  TvSeriesDetail({
    required this.backdropPath,
    required this.genres,
    required this.id,
    required this.numberOfEpisodes,
    required this.numberOfSeasons,
    required this.name,
    required this.overview,
    required this.popularity,
    required this.posterPath,
    required this.status,
    required this.voteAverage,
    required this.voteCount,
  });

  String? backdropPath;
  List<Genre> genres;
  int id;
  int numberOfEpisodes;
  int numberOfSeasons;
  String name;
  String overview;
  double popularity;
  String posterPath;
  String status;
  double voteAverage;
  int voteCount;

  @override
  List<Object?> get props => [
    backdropPath,
    genres,
    id,
    numberOfEpisodes,
    numberOfSeasons,
    name,
    overview,
    popularity,
    posterPath,
    status,
    voteAverage,
    voteCount
  ];
}