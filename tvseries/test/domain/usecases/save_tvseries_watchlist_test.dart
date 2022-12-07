
import 'package:dartz/dartz.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/mockito.dart';
import 'package:tvseries/domain/usecases/save_tvseries_watchlist.dart';
import '../../../../movies/test/dummy_data/dummy_objects.dart';
import '../../helpers/tvseries_test_helper.mocks.dart';

void main() {
  late SaveTvSeriesWatchlist usecase;
  late MockTvSeriesRepository mockTvSeriesRepository;

  setUp(() {
    mockTvSeriesRepository = MockTvSeriesRepository();
    usecase = SaveTvSeriesWatchlist(mockTvSeriesRepository);
  });

  test('should save TvSeries to the repository', () async {
    // arrange
    when(mockTvSeriesRepository.saveTvSeriesWatchlist(testTvSeriesDetail))
        .thenAnswer((_) async => Right('Added to Watchlist'));
    // act
    final result = await usecase.execute(testTvSeriesDetail);
    // assert
    verify(mockTvSeriesRepository.saveTvSeriesWatchlist(testTvSeriesDetail));
    expect(result, Right('Added to Watchlist'));
  });
}
