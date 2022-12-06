
import 'package:bloc_test/bloc_test.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';
import 'package:movies/presentation/bloc/movies/movies_bloc.dart';
import 'package:movies/presentation/pages/popular_movies_page.dart';
import 'package:movies/presentation/pages/top_rated_movies_page.dart';
import 'package:movies/presentation/pages/top_rated_movies_page.dart';
import 'package:movies/presentation/pages/top_rated_movies_page.dart';
import 'package:movies/presentation/pages/top_rated_movies_page.dart';
import '../../dummy_data/dummy_objects.dart';

class MockTopRatedMoviesBloc extends MockBloc<MoviesEvent, MoviesState>
    implements TopRatedMoviesBloc {}

class MovieStateFake extends Fake implements MoviesState {}

class MovieEventFake extends Fake implements MoviesEvent {}

void main() {
  late MockTopRatedMoviesBloc mockBloc;

  setUpAll(() {
    registerFallbackValue(MovieEventFake());
    registerFallbackValue(MovieStateFake());
  });

  setUp(() {
    mockBloc = MockTopRatedMoviesBloc();
  });

  Widget _makeTestableWidget(Widget body) {
    return BlocProvider<TopRatedMoviesBloc>.value(
      value: mockBloc,
      child: MaterialApp(
        home: body,
      ),
    );
  }

  testWidgets('Page should display center progress bar when loading',
          (WidgetTester tester) async {
        when(() => mockBloc.state).thenReturn(MLoadingData());

        final progressBarFinder = find.byType(CircularProgressIndicator);
        final centerFinder = find.byType(Center);

        await tester.pumpWidget(_makeTestableWidget(TopRatedMoviesPage()));

        expect(centerFinder, findsOneWidget);
        expect(progressBarFinder, findsOneWidget);
      });

  testWidgets('Page should display ListView when data is loaded',
          (WidgetTester tester) async {
        when(() => mockBloc.state).thenReturn(MLoadedData(testMovieList));

        final listViewFinder = find.byType(ListView);

        await tester.pumpWidget(_makeTestableWidget(TopRatedMoviesPage()));

        expect(listViewFinder, findsOneWidget);
      });

  testWidgets('Page should not display progressbar and listview when Error',
          (WidgetTester tester) async {
        when(() => mockBloc.state).thenReturn(MErrorData('Error message'));

        final progressBarFinder = find.byType(CircularProgressIndicator);
        final listViewFinder = find.byType(ListView);

        await tester.pumpWidget(_makeTestableWidget(TopRatedMoviesPage()));

        expect(progressBarFinder, findsNothing);
        expect(listViewFinder, findsNothing);
      });

  testWidgets('Page should not display progressbar and listview when Empty',
          (WidgetTester tester) async {
        when(() => mockBloc.state).thenReturn(MEmptyData());

        final progressBarFinder = find.byType(CircularProgressIndicator);
        final listViewFinder = find.byType(ListView);

        await tester.pumpWidget(_makeTestableWidget(TopRatedMoviesPage()));

        expect(progressBarFinder, findsNothing);
        expect(listViewFinder, findsNothing);
      });
}