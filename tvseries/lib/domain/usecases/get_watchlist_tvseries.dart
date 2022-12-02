
import 'package:dartz/dartz.dart';
import 'package:core/core.dart';
import 'package:tvseries/domain/entities/tvseries.dart';
import 'package:tvseries/domain/repisitories/tvseries_repository.dart';

class GetWatchListTvSeries {
  final TvSeriesRepository _repository;

  GetWatchListTvSeries(this._repository);

  Future<Either<Failure, List<TvSeries>>> execute() {
    return _repository.getWatchlistTvSeries();
  }
}
