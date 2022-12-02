
part of 'detail_movies_bloc.dart';

class DetailMoviesState extends Equatable {
  final MovieDetail? movieDetail;
  final String watchlistMessage;
  final bool isAddedToWatchlist;
  final RequestState state;

  const DetailMoviesState({
    required this.movieDetail,
    required this.watchlistMessage,
    required this.isAddedToWatchlist,
    required this.state,
  });

  DetailMoviesState copyWith({
    MovieDetail? movieDetail,
    String? watchlistMessage,
    bool? isAddedToWatchlist,
    RequestState? state,
  }) {
    return DetailMoviesState(
      movieDetail: movieDetail ?? this.movieDetail,
      watchlistMessage: watchlistMessage ?? this.watchlistMessage,
      isAddedToWatchlist: isAddedToWatchlist ?? this.isAddedToWatchlist,
      state: state ?? this.state,
    );
  }

  factory DetailMoviesState.initial() {
    return const DetailMoviesState(
      movieDetail: null,
      watchlistMessage: '',
      isAddedToWatchlist: false,
      state: RequestState.Empty,
    );
  }

  @override
  List<Object> get props => [
    watchlistMessage,
    isAddedToWatchlist,
    state,
  ];
}