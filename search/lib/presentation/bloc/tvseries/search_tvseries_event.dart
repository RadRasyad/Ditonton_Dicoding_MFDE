
part of 'search_tvseries_bloc.dart';

abstract class SearchTvSeriesEvent extends Equatable {
  const SearchTvSeriesEvent();

  @override
  List<Object> get props => [];
}

class OnTQueryChanged extends SearchTvSeriesEvent {
  final String query;

  OnTQueryChanged(this.query);

  @override
  List<Object> get props => [query];
}