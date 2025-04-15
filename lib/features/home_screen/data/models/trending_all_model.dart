// Model class - data layer
import 'package:egb_task/features/home_screen/domain/entities/trending_all_entity.dart';

class MovieModel extends MovieEntity {
  MovieModel({
    required int id,
    String? title,
    String? name,
    required String overview,
    String? posterPath,
    String? backdropPath,
    required String mediaType,
    required bool adult,
    required String originalLanguage,
    required List<int> genreIds,
    required double popularity,
    String? releaseDate,
    String? firstAirDate,
    required double voteAverage,
    required int voteCount,
    List<String>? originCountry,
  }) : super(
          id: id,
          title: title,
          name: name,
          overview: overview,
          posterPath: posterPath,
          backdropPath: backdropPath,
          mediaType: mediaType,
          adult: adult,
          originalLanguage: originalLanguage,
          genreIds: genreIds,
          popularity: popularity,
          releaseDate: releaseDate,
          firstAirDate: firstAirDate,
          voteAverage: voteAverage,
          voteCount: voteCount,
          originCountry: originCountry,
        );

  factory MovieModel.fromJson(Map<String, dynamic> json) => MovieModel(
        id: json['id'],
        title: json['title'],
        name: json['name'],
        overview: json['overview'] ?? '',
        posterPath: json['poster_path'],
        backdropPath: json['backdrop_path'],
        mediaType: json['media_type'],
        adult: json['adult'],
        originalLanguage: json['original_language'],
        genreIds: List<int>.from(json['genre_ids']),
        popularity: (json['popularity'] as num).toDouble(),
        releaseDate: json['release_date'],
        firstAirDate: json['first_air_date'],
        voteAverage: (json['vote_average'] as num).toDouble(),
        voteCount: json['vote_count'],
        originCountry: json['origin_country'] != null
            ? List<String>.from(json['origin_country'])
            : null,
      );
}
