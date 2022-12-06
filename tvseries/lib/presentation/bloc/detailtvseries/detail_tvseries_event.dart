
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

class AddWatchlist extends DetailTvSeriesEvent {
  final TvSeriesDetail detailTvSeries;

  const AddWatchlist(this.detailTvSeries);

  @override
  List<Object> get props => [detailTvSeries];
}

class RemoveWatchlist extends DetailTvSeriesEvent {
  final TvSeriesDetail tvSeriesDetail;

  const RemoveWatchlist(this.tvSeriesDetail);

  @override
  List<Object> get props => [tvSeriesDetail];
}

class LoadWatchlistStatus extends DetailTvSeriesEvent {
  final int id;
  const LoadWatchlistStatus(this.id);

  @override
  List<Object> get props => [id];
}