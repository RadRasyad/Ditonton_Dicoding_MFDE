
import 'package:flutter_test/flutter_test.dart';
import 'package:tvseries/presentation/bloc/tvseries/tvseries_bloc.dart';

void main() {
  test('Cek if props == input', () {
    expect([], const FetchTvSeriesData().props);
    expect([2], const FetchTvSeriesDataWithId(2).props);
  });
}