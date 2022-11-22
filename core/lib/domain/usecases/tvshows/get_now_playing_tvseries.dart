
import 'package:core/domain/repositories/tvseries_repository.dart';
import 'package:dartz/dartz.dart';

import '../../../utils/failure.dart';
import '../../entities/tvseries/tvseries.dart';

class GetNowPlayingTvSeries {
  final TvSeriesRepository repository;

  GetNowPlayingTvSeries(this.repository);

  Future<Either<Failure, List<TvSeries>>> execute() {
    return repository.getNowPlayingTvSeries();
  }
}
