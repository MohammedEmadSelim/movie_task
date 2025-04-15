// Entity class - domain layer
class MovieEntity {
  final int id;
  final String? title;
  final String? name;
  final String overview;
  final String? posterPath;
  final String? backdropPath;
  final String mediaType;
  final bool adult;
  final String originalLanguage;
  final List<int> genreIds;
  final double popularity;
  final String? releaseDate;
  final String? firstAirDate;
  final double voteAverage;
  final int voteCount;
  final List<String>? originCountry;

  MovieEntity({
    required this.id,
    required this.title,
    required this.name,
    required this.overview,
    required this.posterPath,
    required this.backdropPath,
    required this.mediaType,
    required this.adult,
    required this.originalLanguage,
    required this.genreIds,
    required this.popularity,
    required this.releaseDate,
    required this.firstAirDate,
    required this.voteAverage,
    required this.voteCount,
    required this.originCountry,
  });
}
