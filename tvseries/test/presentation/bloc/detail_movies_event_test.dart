
import 'package:flutter_test/flutter_test.dart';
import 'package:movies/presentation/bloc/detailmovies/detail_movies_bloc.dart';
import '../../../../movies/test/dummy_data/dummy_objects.dart';

void main() {
  test('Cek if props == input', () {
    expect([1], const FetchMovieDetailDataWithId(1).props);
    expect([testMovieDetail], AddWatchlist(testMovieDetail).props);
    expect([testMovieDetail], RemoveWatchlist(testMovieDetail).props);
    expect([1], const LoadWatchlistStatus(1).props);
  });
}