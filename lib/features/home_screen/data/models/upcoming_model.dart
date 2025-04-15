
// 2. Upcoming Movie Model
import 'package:egb_task/features/home_screen/domain/entities/upcoming_entity.dart';

class UpcomingMovieModel extends UpcomingMovieEntity {
  const UpcomingMovieModel({
    required int id,
    required String title,
    required String originalTitle,
    required String overview,
    required String? backdropPath,
    required String? posterPath,
    required String releaseDate,
    required double voteAverage,
    required int voteCount,
    required List<int> genreIds,
    required bool adult,
    required String originalLanguage,
    required bool video,
    required double popularity,
  }) : super(
    id: id,
    title: title,
    originalTitle: originalTitle,
    overview: overview,
    backdropPath: backdropPath,
    posterPath: posterPath,
    releaseDate: releaseDate,
    voteAverage: voteAverage,
    voteCount: voteCount,
    genreIds: genreIds,
    adult: adult,
    originalLanguage: originalLanguage,
    video: video,
    popularity: popularity,
  );

  factory UpcomingMovieModel.fromJson(Map<String, dynamic> json) {
    return UpcomingMovieModel(
      id: json['id'],
      title: json['title'],
      originalTitle: json['original_title'],
      overview: json['overview'],
      backdropPath: json['backdrop_path'],
      posterPath: json['poster_path'],
      releaseDate: json['release_date'],
      voteAverage: (json['vote_average'] as num).toDouble(),
      voteCount: json['vote_count'],
      genreIds: List<int>.from(json['genre_ids']),
      adult: json['adult'],
      originalLanguage: json['original_language'],
      video: json['video'],
      popularity: (json['popularity'] as num).toDouble(),
    );
  }
}

class UpcomingMoviesResponseModel extends UpcomingMoviesResponseEntity {
  UpcomingMoviesResponseModel({
    required super.page,
    required super.results,
    required super.totalPages,
    required super.totalResults,
  });

  factory UpcomingMoviesResponseModel.fromJson(Map<String, dynamic> json) {
    return UpcomingMoviesResponseModel(
      page: json['page'],
      results: (json['results'] as List<dynamic>)
          .map((e) => UpcomingMovieModel.fromJson(e))
          .toList(),
      totalPages: json['total_pages'],
      totalResults: json['total_results'],
    );
  }
}
