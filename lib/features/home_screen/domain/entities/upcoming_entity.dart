// 1. Upcoming Movie Entity
class UpcomingMovieEntity {
  final int id;
  final String title;
  final String originalTitle;
  final String overview;
  final String? backdropPath;
  final String? posterPath;
  final String releaseDate;
  final double voteAverage;
  final int voteCount;
  final List<int> genreIds;
  final bool adult;
  final String originalLanguage;
  final bool video;
  final double popularity;

  const UpcomingMovieEntity({
    required this.id,
    required this.title,
    required this.originalTitle,
    required this.overview,
    required this.backdropPath,
    required this.posterPath,
    required this.releaseDate,
    required this.voteAverage,
    required this.voteCount,
    required this.genreIds,
    required this.adult,
    required this.originalLanguage,
    required this.video,
    required this.popularity,
  });
}
class UpcomingMoviesResponseEntity {
  final int page;
  final List<UpcomingMovieEntity> results;
  final int totalPages;
  final int totalResults;

  UpcomingMoviesResponseEntity({
    required this.page,
    required this.results,
    required this.totalPages,
    required this.totalResults,
  });
}
