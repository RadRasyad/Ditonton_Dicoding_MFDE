
part of 'detail_tvseries_bloc.dart';

abstract class DetailTvSeriesEvent extends Equatable {
  const DetailTvSeriesEvent();
}

class FetchTvSeriesDetailDataWithId extends DetailTvSeriesEvent {
  final int id;
  const FetchTvSeriesDetailDataWithId(this.id);

  @override
  List<Object> get props => [id];
}

class TAddWatchlist extends DetailTvSeriesEvent {
  final TvSeriesDetail detailTvSeries;

  const TAddWatchlist(this.detailTvSeries);

  @override
  List<Object> get props => [detailTvSeries];
}

class TRemoveWatchlist extends DetailTvSeriesEvent {
  final TvSeriesDetail tvSeriesDetail;

  const TRemoveWatchlist(this.tvSeriesDetail);

  @override
  List<Object> get props => [tvSeriesDetail];
}

class TLoadWatchlistStatus extends DetailTvSeriesEvent {
  final int id;
  const TLoadWatchlistStatus(this.id);

  @override
  List<Object> get props => [id];
}