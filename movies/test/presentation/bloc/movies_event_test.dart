
import 'package:flutter_test/flutter_test.dart';
import 'package:movies/presentation/bloc/movies/movies_bloc.dart';

void main() {
  test('Cek if props == input', () {
    expect([], const FetchMoviesData().props);
    expect([1], const FetchMovieDataWithId(1).props);
  });
}