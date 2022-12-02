part of 'movies_bloc.dart';

abstract class MoviesEvent extends Equatable {
  const MoviesEvent();
}

class FetchMoviesData extends MoviesEvent {
  const FetchMoviesData();

  @override
  List<Object> get props => [];
}

class FetchMovieDataWithId extends MoviesEvent {
  final int id;
  const FetchMovieDataWithId(this.id);

  @override
  List<Object> get props => [id];
}