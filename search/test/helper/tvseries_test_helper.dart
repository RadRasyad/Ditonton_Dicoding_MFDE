
import 'package:core/data/datasources/db/database_helper.dart';
import 'package:core/utils/network_info.dart';
import 'package:mockito/annotations.dart';
import 'package:http/http.dart' as http;
import 'package:movies/domain/repositories/movie_repository.dart';
import 'package:tvseries/data/datasources/tvseries_local_data_source.dart';
import 'package:tvseries/data/datasources/tvseries_remote_data_source.dart';
import 'package:tvseries/domain/repisitories/tvseries_repository.dart';

@GenerateMocks([
  MovieRepository,
  TvSeriesRepository,
], customMocks: [
  MockSpec<http.Client>(as: #MockHttpClient)
])
void main() {}
