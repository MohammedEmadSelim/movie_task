import 'package:egb_task/features/home_screen/domain/entities/most_popular_entity.dart';



class MostPopularMovieModel extends MostPopularMovieEntity {
  const MostPopularMovieModel({
    required super.id,
    required super.title,
    required super.originalTitle,
    required super.overview,
    required super.posterPath,
    required super.backdropPath,
    required super.releaseDate,
    required super.originalLanguage,
    required super.genreIds,
    required super.popularity,
    required super.voteAverage,
    required super.voteCount,
    required super.video,
    required super.adult,
  });

  factory MostPopularMovieModel.fromJson(Map<String, dynamic> json) {
    return MostPopularMovieModel(
      id: json['id'],
      title: json['title'],
      originalTitle: json['original_title'],
      overview: json['overview'],
      posterPath: json['poster_path'] ?? '',
      backdropPath: json['backdrop_path'] ?? '',
      releaseDate: json['release_date'] ?? '',
      originalLanguage: json['original_language'],
      genreIds: List<int>.from(json['genre_ids']),
      popularity: (json['popularity'] as num).toDouble(),
      voteAverage: (json['vote_average'] as num).toDouble(),
      voteCount: json['vote_count'],
      video: json['video'],
      adult: json['adult'],
    );
  }
}

class MostPopularResponseModel extends MostPopularResponseEntity {
  const MostPopularResponseModel({
    required super.page,
    required super.results,
    required super.totalPages,
    required super.totalResults,
  });

  factory MostPopularResponseModel.fromJson(Map<String, dynamic> json) {
    return MostPopularResponseModel(
      page: json['page'],
      results: List<MostPopularMovieModel>.from(
        json['results'].map((e) => MostPopularMovieModel.fromJson(e)),
      ),
      totalPages: json['total_pages'],
      totalResults: json['total_results'],
    );
  }
}
