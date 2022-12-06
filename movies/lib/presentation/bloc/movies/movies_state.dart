part of 'movies_bloc.dart';

abstract class MoviesState extends Equatable {
  const MoviesState();

  @override
  List<Object> get props => [];
}

class MEmptyData extends MoviesState {}

class MLoadingData extends MoviesState {}

class MErrorData extends MoviesState {
  final String message;

  const MErrorData(this.message);

  @override
  List<Object> get props => [message];
}

class MLoadedData extends MoviesState {
  final List<Movie> result;

  const MLoadedData(this.result);

  @override
  List<Object> get props => [result];
}