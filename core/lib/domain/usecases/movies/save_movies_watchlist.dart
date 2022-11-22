
import 'package:core/domain/repositories/movie_repository.dart';
import 'package:dartz/dartz.dart';
import '../../../utils/failure.dart';
import '../../entities/movies/movie_detail.dart';

class SaveMoviesWatchlist {
  final MovieRepository repository;

  SaveMoviesWatchlist(this.repository);

  Future<Either<Failure, String>> execute(MovieDetail movie) {
    return repository.saveWatchlist(movie);
  }
}
