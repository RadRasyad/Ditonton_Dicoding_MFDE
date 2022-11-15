import 'package:dartz/dartz.dart';
import 'package:ditonton/common/failure.dart';
import 'package:ditonton/domain/entities/tvseries/tvseries_detail.dart';
import 'package:ditonton/domain/repositories/tvseries_repository.dart';

class RemoveTvSeriesWatchlist {
  final TvSeriesRepository repository;

  RemoveTvSeriesWatchlist(this.repository);

  Future<Either<Failure, String>> execute(TvSeriesDetail tvSeries) {
    return repository.removeTvSeriesWatchlist(tvSeries);
  }
}
