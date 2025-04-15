class TopRatedMovieEntity {
  final int id;
  final String title;
  final String originalTitle;
  final String overview;
  final String posterPath;
  final String backdropPath;
  final List<int> genreIds;
  final String releaseDate;
  final String originalLanguage;
  final bool adult;
  final bool video;
  final double popularity;
  final double voteAverage;
  final int voteCount;

  const TopRatedMovieEntity({
    required this.id,
    required this.title,
    required this.originalTitle,
    required this.overview,
    required this.posterPath,
    required this.backdropPath,
    required this.genreIds,
    required this.releaseDate,
    required this.originalLanguage,
    required this.adult,
    required this.video,
    required this.popularity,
    required this.voteAverage,
    required this.voteCount,
  });
}
class TopRatedResponseEntity {
  final int page;
  final List<TopRatedMovieEntity> results;
  final int totalPages;
  final int totalResults;

  const TopRatedResponseEntity({
    required this.page,
    required this.results,
    required this.totalPages,
    required this.totalResults,
  });
}
