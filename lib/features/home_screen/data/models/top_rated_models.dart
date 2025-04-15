
import 'package:egb_task/features/home_screen/domain/entities/top_rated_entity.dart';

class TopRatedMovieModel extends TopRatedMovieEntity {
  const TopRatedMovieModel({
    required super.id,
    required super.title,
    required super.originalTitle,
    required super.overview,
    required super.posterPath,
    required super.backdropPath,
    required super.genreIds,
    required super.releaseDate,
    required super.originalLanguage,
    required super.adult,
    required super.video,
    required super.popularity,
    required super.voteAverage,
    required super.voteCount,
  });

  factory TopRatedMovieModel.fromJson(Map<String, dynamic> json) {
    return TopRatedMovieModel(
      id: json['id'],
      title: json['title'],
      originalTitle: json['original_title'],
      overview: json['overview'],
      posterPath: json['poster_path'] ?? '',
      backdropPath: json['backdrop_path'] ?? '',
      genreIds: List<int>.from(json['genre_ids']),
      releaseDate: json['release_date'] ?? '',
      originalLanguage: json['original_language'] ?? '',
      adult: json['adult'] ?? false,
      video: json['video'] ?? false,
      popularity: (json['popularity'] as num).toDouble(),
      voteAverage: (json['vote_average'] as num).toDouble(),
      voteCount: json['vote_count'],
    );
  }
}


class TopRatedResponseModel extends TopRatedResponseEntity {
  const TopRatedResponseModel({
    required super.page,
    required super.results,
    required super.totalPages,
    required super.totalResults,
  });

  factory TopRatedResponseModel.fromJson(Map<String, dynamic> json) {
    return TopRatedResponseModel(
      page: json['page'],
      results: List<TopRatedMovieModel>.from(
        json['results'].map((e) => TopRatedMovieModel.fromJson(e)),
      ),
      totalPages: json['total_pages'],
      totalResults: json['total_results'],
    );
  }
}

