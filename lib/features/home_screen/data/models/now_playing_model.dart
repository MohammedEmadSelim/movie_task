import 'package:egb_task/features/home_screen/domain/entities/now_playing_entity.dart';


class NowPlayingMovieModel extends NowPlayingMovieEntity {
  const NowPlayingMovieModel({
    required super.id,
    required super.title,
    required super.originalTitle,
    required super.overview,
    required super.posterPath,
    required super.backdropPath,
    required super.releaseDate,
    required super.voteAverage,
    required super.voteCount,
    required super.genreIds,
    required super.adult,
  });

  factory NowPlayingMovieModel.fromJson(Map<String, dynamic> json) {
    return NowPlayingMovieModel(
      id: json['id'],
      title: json['title'] ?? '',
      originalTitle: json['original_title'] ?? '',
      overview: json['overview'] ?? '',
      posterPath: json['poster_path'] ?? '',
      backdropPath: json['backdrop_path'] ?? '',
      releaseDate: json['release_date'] ?? '',
      voteAverage: (json['vote_average'] as num?)?.toDouble() ?? 0.0,
      voteCount: json['vote_count'] ?? 0,
      genreIds: List<int>.from(json['genre_ids'] ?? []),
      adult: json['adult'] ?? false,
    );
  }
}

class DateRangeModel extends DateRangeEntity {
  const DateRangeModel({
    required super.maximum,
    required super.minimum,
  });

  factory DateRangeModel.fromJson(Map<String, dynamic> json) {
    return DateRangeModel(
      maximum: json['maximum'] ?? '',
      minimum: json['minimum'] ?? '',
    );
  }
}

class NowPlayingResponseModel extends NowPlayingResponseEntity {
  const NowPlayingResponseModel({
    required super.dates,
    required super.page,
    required super.results,
    required super.totalPages,
    required super.totalResults,
  });

  factory NowPlayingResponseModel.fromJson(Map<String, dynamic> json) {
    return NowPlayingResponseModel(
      dates: DateRangeModel.fromJson(json['dates'] ?? {}),
      page: json['page'] ?? 1,
      results: (json['results'] as List<dynamic>)
          .map((item) => NowPlayingMovieModel.fromJson(item))
          .toList(),
      totalPages: json['total_pages'] ?? 1,
      totalResults: json['total_results'] ?? 0,
    );
  }
}
