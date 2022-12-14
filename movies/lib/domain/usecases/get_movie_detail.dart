
import 'package:dartz/dartz.dart';
import 'package:movies/domain/entities/movie_detail.dart';
import 'package:core/core.dart';
import '../repositories/movie_repository.dart';

class GetMovieDetail {
  final MovieRepository repository;

  GetMovieDetail(this.repository);

  Future<Either<Failure, MovieDetail>> execute(int id) {
    return repository.getMovieDetail(id);
  }
}
