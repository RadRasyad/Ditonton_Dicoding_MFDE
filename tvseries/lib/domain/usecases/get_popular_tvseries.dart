
import 'package:dartz/dartz.dart';
import 'package:core/core.dart';
import 'package:tvseries/domain/entities/tvseries.dart';
import 'package:tvseries/domain/repisitories/tvseries_repository.dart';

class GetPopularTvSeries {
  final TvSeriesRepository repository;

  GetPopularTvSeries(this.repository);

  Future<Either<Failure, List<TvSeries>>> execute() {
    return repository.getPopularTvSeries();
  }
}
