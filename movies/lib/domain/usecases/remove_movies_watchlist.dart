
import 'package:movies/domain/entities/movie_detail.dart';
import '../repositories/movie_repository.dart';
import 'package:dartz/dartz.dart';
import 'package:core/core.dart';

class RemoveMoviesWatchlist {
  final MovieRepository repository;

  RemoveMoviesWatchlist(this.repository);

  Future<Either<Failure, String>> execute(MovieDetail movie) {
    return repository.removeWatchlist(movie);
  }
}
