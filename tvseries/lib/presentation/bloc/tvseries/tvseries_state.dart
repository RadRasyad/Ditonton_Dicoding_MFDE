part of 'tvseries_bloc.dart';

abstract class TvSeriesState extends Equatable {
  const TvSeriesState();

  @override
  List<Object> get props => [];
}

class EmptyData extends TvSeriesState {}

class LoadingData extends TvSeriesState {}

class ErrorData extends TvSeriesState {
  final String message;

  const ErrorData(this.message);

  @override
  List<Object> get props => [message];
}

class LoadedData extends TvSeriesState {
  final List<TvSeries> result;

  const LoadedData(this.result);

  @override
  List<Object> get props => [result];
}