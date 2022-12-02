
part of 'detail_tvseries_bloc.dart';

class DetailTvSeriesState extends Equatable {
  final TvSeriesDetail? tvSeriesDetail;
  final String watchlistMessage;
  final bool isAddedToWatchlist;
  final RequestState state;

  const DetailTvSeriesState({
    required this.tvSeriesDetail,
    required this.watchlistMessage,
    required this.isAddedToWatchlist,
    required this.state,
  });

  DetailTvSeriesState copyWith({
    TvSeriesDetail? tvSeriesDetail,
    String? watchlistMessage,
    bool? isAddedToWatchlist,
    RequestState? state,
  }) {
    return DetailTvSeriesState(
      tvSeriesDetail: tvSeriesDetail ?? this.tvSeriesDetail,
      watchlistMessage: watchlistMessage ?? this.watchlistMessage,
      isAddedToWatchlist: isAddedToWatchlist ?? this.isAddedToWatchlist,
      state: state ?? this.state,
    );
  }

  factory DetailTvSeriesState.initial() {
    return const DetailTvSeriesState(
      tvSeriesDetail: null,
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