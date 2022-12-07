
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
import 'package:tvseries/presentation/bloc/tvseries/tvseries_bloc.dart';
import 'package:tvseries/presentation/bloc/tvseries/tvseries_bloc.dart';
import 'package:tvseries/presentation/bloc/tvseries/tvseries_bloc.dart';
import 'package:tvseries/presentation/bloc/tvseries/tvseries_bloc.dart';
import 'package:tvseries/presentation/bloc/tvseries/tvseries_bloc.dart';
import 'package:tvseries/presentation/pages/top_rated_tvseries_page.dart';
import '../../dummy_data/dummy_objects.dart';

class MockTopRatedTvSeriesBloc extends MockBloc<TvSeriesEvent, TvSeriesState>
    implements TopRatedTvSeriesBloc {}

class TvSeriesStateFake extends Fake implements TvSeriesState {}

class TvSeriesEventFake extends Fake implements TvSeriesEvent {}

void main() {
  late MockTopRatedTvSeriesBloc mockBloc;

  setUpAll(() {
    registerFallbackValue(TvSeriesEventFake());
    registerFallbackValue(TvSeriesStateFake());
  });

  setUp(() {
    mockBloc = MockTopRatedTvSeriesBloc();
  });

  Widget _makeTestableWidget(Widget body) {
    return BlocProvider<TopRatedTvSeriesBloc>.value(
      value: mockBloc,
      child: MaterialApp(
        home: body,
      ),
    );
  }

  testWidgets('Page should display center progress bar when loading',
          (WidgetTester tester) async {
        when(() => mockBloc.state).thenReturn(LoadingData());

        final progressBarFinder = find.byType(CircularProgressIndicator);
        final centerFinder = find.byType(Center);

        await tester.pumpWidget(_makeTestableWidget(TopRatedTvSeriesPage()));

        expect(centerFinder, findsOneWidget);
        expect(progressBarFinder, findsOneWidget);
      });

  testWidgets('Page should display ListView when data is loaded',
          (WidgetTester tester) async {
        when(() => mockBloc.state).thenReturn(LoadedData(testTvSeriesList));

        final listViewFinder = find.byType(ListView);

        await tester.pumpWidget(_makeTestableWidget(TopRatedTvSeriesPage()));

        expect(listViewFinder, findsOneWidget);
      });

  testWidgets('Page should not display progressbar and listview when Error',
          (WidgetTester tester) async {
        when(() => mockBloc.state).thenReturn(ErrorData('Error message'));

        final progressBarFinder = find.byType(CircularProgressIndicator);
        final listViewFinder = find.byType(ListView);

        await tester.pumpWidget(_makeTestableWidget(TopRatedTvSeriesPage()));

        expect(progressBarFinder, findsNothing);
        expect(listViewFinder, findsNothing);
      });

  testWidgets('Page should not display progressbar and listview when Empty',
          (WidgetTester tester) async {
        when(() => mockBloc.state).thenReturn(EmptyData());

        final progressBarFinder = find.byType(CircularProgressIndicator);
        final listViewFinder = find.byType(ListView);

        await tester.pumpWidget(_makeTestableWidget(TopRatedTvSeriesPage()));

        expect(progressBarFinder, findsNothing);
        expect(listViewFinder, findsNothing);
      });
}