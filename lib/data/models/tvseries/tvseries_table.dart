
import 'package:ditonton/domain/entities/tvseries/tvseries.dart';
import 'package:ditonton/domain/entities/tvseries/tvseries_detail.dart';
import 'package:equatable/equatable.dart';

import 'tvseries_model.dart';

class TvSeriesTable extends Equatable {
  final int id;
  final String? title;
  final String? posterPath;
  final String? overview;

  TvSeriesTable({
    required this.id,
    required this.title,
    required this.posterPath,
    required this.overview,
  });

  factory TvSeriesTable.fromEntity(TvSeriesDetail TvSeries) => TvSeriesTable(
        id: TvSeries.id,
        title: TvSeries.title,
        posterPath: TvSeries.posterPath,
        overview: TvSeries.overview,
      );

  factory TvSeriesTable.fromMap(Map<String, dynamic> map) => TvSeriesTable(
        id: map['id'],
        title: map['title'],
        posterPath: map['posterPath'],
        overview: map['overview'],
      );

  factory TvSeriesTable.fromDTO(TvSeriesModel TvSeries) => TvSeriesTable(
    id: TvSeries.id,
    title: TvSeries.title,
    posterPath: TvSeries.posterPath,
    overview: TvSeries.overview,
  );

  Map<String, dynamic> toJson() => {
        'id': id,
        'title': title,
        'posterPath': posterPath,
        'overview': overview,
      };

  TvSeries toEntity() => TvSeries.watchlist(
        id: id,
        overview: overview,
        posterPath: posterPath,
        title: title,
      );

  @override
  List<Object?> get props => [id, title, posterPath, overview];

}
