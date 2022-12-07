

import 'package:bloc_test/bloc_test.dart';
import 'package:core/utils/state_enum.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';
import 'package:tvseries/presentation/bloc/detailtvseries/detail_tvseries_bloc.dart';
import 'package:tvseries/presentation/bloc/tvseries/tvseries_bloc.dart';
import 'package:tvseries/presentation/pages/tvseries_detail_page.dart';
import '../../dummy_data/dummy_objects.dart';

class MockTvSeriesDetailBloc extends MockBloc<DetailTvSeriesEvent, DetailTvSeriesState>
    implements TvSeriesDetailBloc {}

class TvSeriesEventFake extends Fake implements DetailTvSeriesEvent {}

class TvSeriesStateFake extends Fake implements DetailTvSeriesState {}

class MockTvSeriesRecommendations extends MockBloc<TvSeriesEvent, TvSeriesState>
    implements RecommendationTvSeriesBloc {}

void main() {
  late MockTvSeriesDetailBloc mockBloc;
  late MockTvSeriesRecommendations mockBlocRecom;

  setUpAll(() {
    registerFallbackValue(TvSeriesEventFake());
    registerFallbackValue(TvSeriesStateFake());
  });

  setUp(() {
    mockBloc = MockTvSeriesDetailBloc();
    mockBlocRecom = MockTvSeriesRecommendations();
  });

  Widget _makeTestableWidget(Widget body) {
    return MultiBlocProvider(
      providers: [
        BlocProvider<TvSeriesDetailBloc>.value(value: mockBloc),
        BlocProvider<RecommendationTvSeriesBloc>.value(value: mockBlocRecom),
      ],
      child: MaterialApp(
        home: body,
      ),
    );
  }

  testWidgets(' Page should display Progressbar when TvSeriesDetail loading',
          (WidgetTester tester) async {
        when(() => mockBloc.state).thenReturn(
            DetailTvSeriesState.initial().copyWith(state: RequestState.Loading));

        final progressBarFinder = find.byType(CircularProgressIndicator);

        await tester.pumpWidget(_makeTestableWidget(TvSeriesDetailPage(id: 1)));

        expect(progressBarFinder, findsOneWidget);
      });

  testWidgets(' Page should display Progressbar when recommendation loading',
          (WidgetTester tester) async {
        when(() => mockBloc.state).thenReturn(DetailTvSeriesState.initial().copyWith(
          state: RequestState.Loaded,
          isAddedToWatchlist: false,
          tvSeriesDetail: testTvSeriesDetail,
        ));
        when(() => mockBlocRecom.state).thenReturn(LoadingData());

        final progressBarFinder = find.byType(CircularProgressIndicator).first;

        await tester.pumpWidget(_makeTestableWidget(TvSeriesDetailPage(id: 1)));

        expect(progressBarFinder, findsOneWidget);
      });

  testWidgets(
      'Watchlist button should display add icon when TvShow not added to watchlist',
          (WidgetTester tester) async {
        when(() => mockBloc.state).thenReturn(DetailTvSeriesState.initial().copyWith(
          state: RequestState.Loaded,
          isAddedToWatchlist: false,
          tvSeriesDetail: testTvSeriesDetail,
        ));
        when(() => mockBlocRecom.state).thenReturn(LoadedData(testTvSeriesList));

        final watchlistButtonIcon = find.byIcon(Icons.add);

        await tester.pumpWidget(_makeTestableWidget(TvSeriesDetailPage(id: 1)));

        expect(watchlistButtonIcon, findsOneWidget);
      });

  testWidgets(
      'Watchlist button should display check icon when Movie is added to wathclist',
          (WidgetTester tester) async {
        when(() => mockBloc.state).thenReturn(DetailTvSeriesState.initial().copyWith(
          state: RequestState.Loaded,
          tvSeriesDetail: testTvSeriesDetail,
          isAddedToWatchlist: true,
        ));
        when(() => mockBlocRecom.state).thenReturn(LoadedData(testTvSeriesList));

        final watchlistButtonIcon = find.byIcon(Icons.check);

        await tester.pumpWidget(_makeTestableWidget(TvSeriesDetailPage(id: 1)));

        expect(watchlistButtonIcon, findsOneWidget);
      });
}