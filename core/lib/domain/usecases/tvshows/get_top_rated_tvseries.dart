
import 'package:core/domain/entities/tvseries/tvseries.dart';
import 'package:dartz/dartz.dart';
import '../../../utils/failure.dart';
import '../../repositories/tvseries_repository.dart';

class GetTopRatedTvSeries {
  final TvSeriesRepository repository;

  GetTopRatedTvSeries(this.repository);

  Future<Either<Failure, List<TvSeries>>> execute() {
    return repository.getTopRatedTvSeries();
  }
}
