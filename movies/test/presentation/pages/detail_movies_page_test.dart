

import 'package:bloc_test/bloc_test.dart';
import 'package:core/utils/state_enum.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';
import 'package:movies/presentation/bloc/detailmovies/detail_movies_bloc.dart';
import 'package:movies/presentation/bloc/movies/movies_bloc.dart';
import 'package:movies/presentation/pages/movie_detail_page.dart';
import '../../dummy_data/dummy_objects.dart';

class MockMoviesDetailBloc extends MockBloc<DetailMoviesEvent, DetailMoviesState>
    implements MoviesDetailBloc {}

class MovieStateFake extends Fake implements DetailMoviesEvent {}

class MovieEventFake extends Fake implements DetailMoviesState {}

class MockRecommendationMovieBloc extends MockBloc<MoviesEvent, MoviesState>
    implements RecommendationMoviesBloc {}

void main() {
  late MockMoviesDetailBloc mockBloc;
  late MockRecommendationMovieBloc mockBlocRecom;

  setUpAll(() {
    registerFallbackValue(MovieEventFake());
    registerFallbackValue(MovieStateFake());
  });

  setUp(() {
    mockBloc = MockMoviesDetailBloc();
    mockBlocRecom = MockRecommendationMovieBloc();
  });

  Widget _makeTestableWidget(Widget body) {
    return MultiBlocProvider(
      providers: [
        BlocProvider<MoviesDetailBloc>.value(value: mockBloc),
        BlocProvider<RecommendationMoviesBloc>.value(value: mockBlocRecom),
      ],
      child: MaterialApp(
        home: body,
      ),
    );
  }

  testWidgets(' Page should display Progressbar when Moviedetail loading',
          (WidgetTester tester) async {
        when(() => mockBloc.state).thenReturn(
            DetailMoviesState.initial().copyWith(state: RequestState.Loading));

        final progressBarFinder = find.byType(CircularProgressIndicator);

        await tester.pumpWidget(_makeTestableWidget(MovieDetailPage(id: 1)));

        expect(progressBarFinder, findsOneWidget);
      });

  testWidgets(' Page should display Progressbar when recommendation loading',
          (WidgetTester tester) async {
        when(() => mockBloc.state).thenReturn(DetailMoviesState.initial().copyWith(
          state: RequestState.Loaded,
          isAddedToWatchlist: false,
          movieDetail: testMovieDetail,
        ));
        when(() => mockBlocRecom.state).thenReturn(MLoadingData());

        final progressBarFinder = find.byType(CircularProgressIndicator).first;

        await tester.pumpWidget(_makeTestableWidget(MovieDetailPage(id: 1)));

        expect(progressBarFinder, findsOneWidget);
      });

  testWidgets(
      'Watchlist button should display add icon when Tv Show not added to watchlist',
          (WidgetTester tester) async {
        when(() => mockBloc.state).thenReturn(DetailMoviesState.initial().copyWith(
          state: RequestState.Loaded,
          isAddedToWatchlist: false,
          movieDetail: testMovieDetail,
        ));
        when(() => mockBlocRecom.state).thenReturn(MLoadedData(testMovieList));

        final watchlistButtonIcon = find.byIcon(Icons.add);

        await tester.pumpWidget(_makeTestableWidget(MovieDetailPage(id: 1)));

        expect(watchlistButtonIcon, findsOneWidget);
      });

  testWidgets(
      'Watchlist button should display check icon when Movie is added to wathclist',
          (WidgetTester tester) async {
        when(() => mockBloc.state).thenReturn(DetailMoviesState.initial().copyWith(
          state: RequestState.Loaded,
          movieDetail: testMovieDetail,
          isAddedToWatchlist: true,
        ));
        when(() => mockBlocRecom.state).thenReturn(MLoadedData(testMovieList));

        final watchlistButtonIcon = find.byIcon(Icons.check);

        await tester.pumpWidget(_makeTestableWidget(MovieDetailPage(id: 1)));

        expect(watchlistButtonIcon, findsOneWidget);
      });
}