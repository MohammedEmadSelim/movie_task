import 'package:egb_task/features/search/domain/entities/search_enitty.dart';


class SearchMovieModel extends SearchMovieEntity {
  const SearchMovieModel({
    required super.id,
    required super.title,
    super.originalTitle,
    required super.overview,
    super.posterPath,
    super.backdropPath,
    required super.releaseDate,
    required super.genreIds,
    required super.voteAverage,
    required super.voteCount,
    required super.popularity,
    required super.originalLanguage,
    required super.adult,
    required super.video,
  });

  factory SearchMovieModel.fromJson(Map<String, dynamic> json) {
    return SearchMovieModel(
      id: json['id'],
      title: json['title'],
      originalTitle: json['original_title'],
      overview: json['overview'],
      posterPath: json['poster_path'],
      backdropPath: json['backdrop_path'],
      releaseDate: json['release_date'],
      genreIds: List<int>.from(json['genre_ids']),
      voteAverage: (json['vote_average'] as num).toDouble(),
      voteCount: json['vote_count'],
      popularity: (json['popularity'] as num).toDouble(),
      originalLanguage: json['original_language'],
      adult: json['adult'],
      video: json['video'],
    );
  }
}


class SearchResponseModel extends SearchResponseEntity {
  const SearchResponseModel({
    required super.page,
    required super.results,
    required super.totalPages,
    required super.totalResults,
  });

  factory SearchResponseModel.fromJson(Map<String, dynamic> json) {
    return SearchResponseModel(
      page: json['page'],
      results: List<SearchMovieModel>.from(
        (json['results'] as List).map((e) => SearchMovieModel.fromJson(e)),
      ),
      totalPages: json['total_pages'],
      totalResults: json['total_results'],
    );
  }
}
