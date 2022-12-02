part of 'movies_bloc.dart';

abstract class MoviesState extends Equatable {
  const MoviesState();

  @override
  List<Object> get props => [];
}

class EmptyData extends MoviesState {}

class LoadingData extends MoviesState {}

class ErrorData extends MoviesState {
  final String message;

  const ErrorData(this.message);

  @override
  List<Object> get props => [message];
}

class LoadedData extends MoviesState {
  final List<Movie> result;

  const LoadedData(this.result);

  @override
  List<Object> get props => [result];
}