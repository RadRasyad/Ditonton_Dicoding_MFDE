
import 'package:core/domain/repositories/tvseries_repository.dart';
import 'package:dartz/dartz.dart';

import '../../../utils/failure.dart';
import '../../entities/tvseries/tvseries_detail.dart';


class SaveTvSeriesWatchlist {
  final TvSeriesRepository repository;

  SaveTvSeriesWatchlist(this.repository);

  Future<Either<Failure, String>> execute(TvSeriesDetail tvSeries) {
    return repository.saveTvSeriesWatchlist(tvSeries);
  }
}
