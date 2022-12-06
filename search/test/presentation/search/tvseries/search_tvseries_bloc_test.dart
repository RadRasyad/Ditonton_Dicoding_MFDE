
import 'package:bloc_test/bloc_test.dart';
import 'package:core/utils/failure.dart';
import 'package:dartz/dartz.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';
import 'package:search/domain/usecases/search_tvseries.dart';
import 'package:search/presentation/bloc/tvseries/search_tvseries_bloc.dart';
import 'package:tvseries/domain/entities/tvseries.dart';

import 'search_tvseries_bloc_test.mocks.dart';

@GenerateMocks([SearchTvSeries])
void main() {

  late SearchTvSeriesBloc searchTvSeriesBloc;
  late MockSearchTvSeries mockSearchTvSeries;

  setUp(() {
    mockSearchTvSeries = MockSearchTvSeries();
    searchTvSeriesBloc = SearchTvSeriesBloc(mockSearchTvSeries);
  });

  test('initial state should be empty', () {
    expect(searchTvSeriesBloc.state, SearchTEmpty());
  });

  final testTvSeries = TvSeries(
    backdropPath: '/5kkw5RT1OjTAMh3POhjo5LdaACZ.jpg',
    firstAirDate: '2021-10-12',
    genreIds: [
      80,
      10765
    ],
    id: 90462,
    name: 'Chucky',
    originCountry: ["US"],
    originalLanguage: 'en',
    originalName: 'Chucky',
    overview: 'After a vintage Chucky doll turns up at a suburban yard sale, an idyllic American town is thrown into chaos as a series of horrifying murders begin to expose the town’s hypocrisies and secrets. Meanwhile, the arrival of enemies — and allies — from Chucky’s past threatens to expose the truth behind the killings, as well as the demon doll’s untold origins.',
    popularity: 3545.458,
    posterPath: '/kY0BogCM8SkNJ0MNiHB3VTM86Tz.jpg',
    voteAverage: 7.9,
    voteCount: 3466,
  );
  final testTvSeriesList = <TvSeries>[testTvSeries];
  final tQuery = 'Chucky';

  blocTest<SearchTvSeriesBloc, SearchTvSeriesState>(
    'Should emit [Loading, HasData] when data is gotten successfully',
    build: () {
      when(mockSearchTvSeries.execute(tQuery))
          .thenAnswer((_) async => Right(testTvSeriesList));
      return searchTvSeriesBloc;
    },
    act: (bloc) => bloc.add(OnTQueryChanged(tQuery)),
    wait: const Duration(milliseconds: 500),
    expect: () => [
      SearchTLoading(),
      SearchTHasData(testTvSeriesList),
    ],
    verify: (bloc) {
      verify(mockSearchTvSeries.execute(tQuery));
    },
  );

  blocTest<SearchTvSeriesBloc, SearchTvSeriesState>(
    'Should emit [Loading, Error] when get search is unsuccessful',
    build: () {
      when(mockSearchTvSeries.execute(tQuery))
          .thenAnswer((_) async => Left(ServerFailure('Server Failure')));
      return searchTvSeriesBloc;
    },
    act: (bloc) => bloc.add(OnTQueryChanged(tQuery)),
    wait: const Duration(milliseconds: 500),
    expect: () => [
      SearchTLoading(),
      SearchTError('Server Failure'),
    ],
    verify: (bloc) {
      verify(mockSearchTvSeries.execute(tQuery));
    },
  );


}