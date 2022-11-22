
import 'package:core/domain/repositories/movie_repository.dart';
import 'package:dartz/dartz.dart';
import '../../../utils/failure.dart';
import '../../entities/movies/movie_detail.dart';

class RemoveMoviesWatchlist {
  final MovieRepository repository;

  RemoveMoviesWatchlist(this.repository);

  Future<Either<Failure, String>> execute(MovieDetail movie) {
    return repository.removeWatchlist(movie);
  }
}
