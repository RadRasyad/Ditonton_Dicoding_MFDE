
import 'package:dartz/dartz.dart';
import '../../../utils/failure.dart';
import '../../entities/tvseries/tvseries.dart';
import '../../repositories/tvseries_repository.dart';

class GetWatchListTvSeries {
  final TvSeriesRepository _repository;

  GetWatchListTvSeries(this._repository);

  Future<Either<Failure, List<TvSeries>>> execute() {
    return _repository.getWatchlistTvSeries();
  }
}
