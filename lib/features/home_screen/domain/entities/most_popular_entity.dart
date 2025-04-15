class MostPopularMovieEntity {
  final int id;
  final String title;
  final String originalTitle;
  final String overview;
  final String posterPath;
  final String backdropPath;
  final String releaseDate;
  final String originalLanguage;
  final List<int> genreIds;
  final double popularity;
  final double voteAverage;
  final int voteCount;
  final bool video;
  final bool adult;

  const MostPopularMovieEntity({
    required this.id,
    required this.title,
    required this.originalTitle,
    required this.overview,
    required this.posterPath,
    required this.backdropPath,
    required this.releaseDate,
    required this.originalLanguage,
    required this.genreIds,
    required this.popularity,
    required this.voteAverage,
    required this.voteCount,
    required this.video,
    required this.adult,
  });
}

class MostPopularResponseEntity {
  final int page;
  final List<MostPopularMovieEntity> results;
  final int totalPages;
  final int totalResults;

  const MostPopularResponseEntity({
    required this.page,
    required this.results,
    required this.totalPages,
    required this.totalResults,
  });
}
