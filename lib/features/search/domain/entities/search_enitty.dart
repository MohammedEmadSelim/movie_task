class SearchResponseEntity {
  final int page;
  final List<SearchMovieEntity> results;
  final int totalPages;
  final int totalResults;

  const SearchResponseEntity({
    required this.page,
    required this.results,
    required this.totalPages,
    required this.totalResults,
  });
}
class SearchMovieEntity {
  final int id;
  final String title;
  final String? originalTitle;
  final String overview;
  final String? posterPath;
  final String? backdropPath;
  final String releaseDate;
  final List<int> genreIds;
  final double voteAverage;
  final int voteCount;
  final double popularity;
  final String originalLanguage;
  final bool adult;
  final bool video;

  const SearchMovieEntity({
    required this.id,
    required this.title,
    this.originalTitle,
    required this.overview,
    this.posterPath,
    this.backdropPath,
    required this.releaseDate,
    required this.genreIds,
    required this.voteAverage,
    required this.voteCount,
    required this.popularity,
    required this.originalLanguage,
    required this.adult,
    required this.video,
  });
}
