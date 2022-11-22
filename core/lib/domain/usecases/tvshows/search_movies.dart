
import 'package:dartz/dartz.dart';
import '../../../utils/failure.dart';
import '../../entities/tvseries/tvseries.dart';
import '../../repositories/tvseries_repository.dart';

class SearchTvSeries {
  final TvSeriesRepository repository;

  SearchTvSeries(this.repository);

  Future<Either<Failure, List<TvSeries>>> execute(String query) {
    return repository.searchTvSeries(query);
  }
}
