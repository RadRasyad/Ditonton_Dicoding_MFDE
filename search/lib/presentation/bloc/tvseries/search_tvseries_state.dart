
part of 'search_tvseries_bloc.dart';

abstract class SearchTvSeriesState extends Equatable {
  const SearchTvSeriesState();

  @override
  List<Object> get props => [];
}

class SearchTEmpty extends SearchTvSeriesState {}

class SearchTLoading extends SearchTvSeriesState {}

class SearchTError extends SearchTvSeriesState {
  final String message;

  SearchTError(this.message);

  @override
  List<Object> get props => [message];
}

class SearchTHasData extends SearchTvSeriesState {
  final List<TvSeries> result;

  SearchTHasData(this.result);

  @override
  List<Object> get props => [result];
}