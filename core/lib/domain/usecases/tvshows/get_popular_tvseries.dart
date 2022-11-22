
import 'package:dartz/dartz.dart';
import '../../../utils/failure.dart';
import '../../entities/tvseries/tvseries.dart';
import '../../repositories/tvseries_repository.dart';

class GetPopularTvSeries {
  final TvSeriesRepository repository;

  GetPopularTvSeries(this.repository);

  Future<Either<Failure, List<TvSeries>>> execute() {
    return repository.getPopularTvSeries();
  }
}
