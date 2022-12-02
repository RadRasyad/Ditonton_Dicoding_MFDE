
part of 'detail_movies_bloc.dart';

abstract class DetailMoviesEvent extends Equatable {
  const DetailMoviesEvent();
}

class FetchMovieDetailDataWithId extends DetailMoviesEvent {
  final int id;
  const FetchMovieDetailDataWithId(this.id);

  @override
  List<Object> get props => [id];
}

class AddWatchlist extends DetailMoviesEvent {
  final MovieDetail detailMovie;

  const AddWatchlist(this.detailMovie);

  @override
  List<Object> get props => [detailMovie];
}

class RemoveWatchlist extends DetailMoviesEvent {
  final MovieDetail movieDetail;

  const RemoveWatchlist(this.movieDetail);

  @override
  List<Object> get props => [movieDetail];
}

class LoadWatchlistStatus extends DetailMoviesEvent {
  final int id;
  const LoadWatchlistStatus(this.id);

  @override
  List<Object> get props => [id];
}