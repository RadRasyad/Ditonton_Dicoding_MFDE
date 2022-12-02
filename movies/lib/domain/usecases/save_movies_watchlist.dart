
import 'package:movies/domain/entities/movie_detail.dart';
import '../repositories/movie_repository.dart';
import 'package:dartz/dartz.dart';
import 'package:core/core.dart';

class SaveMoviesWatchlist {
  final MovieRepository repository;

  SaveMoviesWatchlist(this.repository);

  Future<Either<Failure, String>> execute(MovieDetail movie) {
    return repository.saveWatchlist(movie);
  }
}
