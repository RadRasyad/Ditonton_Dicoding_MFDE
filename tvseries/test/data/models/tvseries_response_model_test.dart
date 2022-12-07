
import 'dart:convert';
import 'package:flutter_test/flutter_test.dart';
import 'package:tvseries/data/model/tvseries_model.dart';
import 'package:tvseries/data/model/tvseries_response.dart';
import '../../json_reader.dart';

void main() {
  final tTvSeriesModel = TvSeriesModel(
    backdropPath: '/5kkw5RT1OjTAMh3POhjo5LdaACZ.jpg',
    firstAirDate: '2021-10-12',
    genreIds: [80, 10765],
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


  final tTvSeriesResponseModel =
      TvSeriesResponse(tvSeriesList: <TvSeriesModel>[tTvSeriesModel]);
  group('fromJson', () {
    test('should return a valid model from JSON', () async {
      // arrange
      final Map<String, dynamic> jsonMap =
          json.decode(readJson('dummy_data/tvseries_airing_today.json'));
      // act
      final result = TvSeriesResponse.fromJson(jsonMap);
      // assert
      expect(result, tTvSeriesResponseModel);
    });
  });

  group('toJson', () {
    test('should return a JSON map containing proper data', () async {
      // arrange

      // act
      final result = tTvSeriesResponseModel.toJson();
      // assert
      final expectedJsonMap = {
        "results": [
          {
            "backdrop_path": '/5kkw5RT1OjTAMh3POhjo5LdaACZ.jpg',
            "first_air_date": '2021-10-12',
            "genre_ids": [80, 10765],
            "id": 90462,
            "name": 'Chucky',
            "original_country": ["US"],
            "original_language": 'en',
            "original_title": 'Chucky',
            "overview": 'After a vintage Chucky doll turns up at a suburban yard sale, an idyllic American town is thrown into chaos as a series of horrifying murders begin to expose the town’s hypocrisies and secrets. Meanwhile, the arrival of enemies — and allies — from Chucky’s past threatens to expose the truth behind the killings, as well as the demon doll’s untold origins.',
            "popularity": 3545.458,
            "poster_path": '/kY0BogCM8SkNJ0MNiHB3VTM86Tz.jpg',
            'release_date': '2021-10-12',
            "vote_average": 7.9,
            "vote_count": 3466,
          }
        ],
      };
      expect(result, expectedJsonMap);
    });
  });
}
