class NowPlayingMovieEntity {
  final int id;
  final String title;
  final String originalTitle;
  final String overview;
  final String posterPath;
  final String backdropPath;
  final String releaseDate;
  final double voteAverage;
  final int voteCount;
  final List<int> genreIds;
  final bool adult;

  const NowPlayingMovieEntity({
    required this.id,
    required this.title,
    required this.originalTitle,
    required this.overview,
    required this.posterPath,
    required this.backdropPath,
    required this.releaseDate,
    required this.voteAverage,
    required this.voteCount,
    required this.genreIds,
    required this.adult,
  });
}
class NowPlayingResponseEntity {
  final DateRangeEntity dates;
  final int page;
  final List<NowPlayingMovieEntity> results;
  final int totalPages;
  final int totalResults;

  const NowPlayingResponseEntity({
    required this.dates,
    required this.page,
    required this.results,
    required this.totalPages,
    required this.totalResults,
  });
}
class DateRangeEntity {
  final String maximum;
  final String minimum;

  const DateRangeEntity({
    required this.maximum,
    required this.minimum,
  });
}
