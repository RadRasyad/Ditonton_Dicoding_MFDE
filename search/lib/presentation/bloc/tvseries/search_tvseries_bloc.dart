
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:tvseries/domain/entities/tvseries.dart';
import 'package:rxdart/rxdart.dart';
import 'package:search/domain/usecases/search_tvseries.dart';

part 'search_tvseries_event.dart';
part 'search_tvseries_state.dart';

class SearchTvSeriesBloc extends Bloc<SearchTvSeriesEvent, SearchTvSeriesState> {
  final SearchTvSeries _searchtvseries;

  SearchTvSeriesBloc(this._searchtvseries) : super(SearchTEmpty()) {
    on<OnTQueryChanged>((event, emit) async {
      final query = event.query;

      emit(SearchTLoading());
      final result = await _searchtvseries.execute(query);

      result.fold(
            (failure) {
          emit(SearchTError(failure.message));
        },
            (data) {
          emit(SearchTHasData(data));
        },
      );
    }, transformer: debounce(const Duration(milliseconds: 500)));
  }

  EventTransformer<T> debounce<T>(Duration duration) {
    return (events, mapper) => events.debounceTime(duration).flatMap(mapper);
  }
}