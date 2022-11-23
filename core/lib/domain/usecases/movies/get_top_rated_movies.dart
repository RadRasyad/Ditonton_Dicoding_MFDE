
import 'package:core/domain/repositories/movie_repository.dart';
import 'package:dartz/dartz.dart';
import '../../../utils/failure.dart';
import '../../entities/movies/movie.dart';

class GetTopRatedMovies {
  final MovieRepository repository;

  GetTopRatedMovies(this.repository);

  Future<Either<Failure, List<Movie>>> execute() {
    return repository.getTopRatedMovies();
  }
}