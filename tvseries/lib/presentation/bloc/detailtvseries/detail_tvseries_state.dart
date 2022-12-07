
part of 'detail_tvseries_bloc.dart';

class DetailTvSeriesState extends Equatable {
  final TvSeriesDetail? tvSeriesDetail;
  final String watchlistMessage;
  final bool isAddedToWatchlist;
  final RequestState tstate;

  const DetailTvSeriesState({
    required this.tvSeriesDetail,
    required this.watchlistMessage,
    required this.isAddedToWatchlist,
    required this.tstate,
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
      tstate: state ?? this.tstate,
    );
  }

  factory DetailTvSeriesState.initial() {
    return const DetailTvSeriesState(
      tvSeriesDetail: null,
      watchlistMessage: '',
      isAddedToWatchlist: false,
      tstate: RequestState.Empty,
    );
  }

  @override
  List<Object> get props => [
    watchlistMessage,
    isAddedToWatchlist,
    tstate,
  ];
}