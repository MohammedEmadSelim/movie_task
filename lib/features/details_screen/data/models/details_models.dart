import 'package:egb_task/features/details_screen/domain/entities/details_entity.dart';

class MovieDetailsModel extends MovieDetailsEntity {
  MovieDetailsModel({
    required super.adult,
    super.backdropPath,
    required super.budget,
    required List<GenreModel> genres,
    required super.homepage,
    required super.id,
    required super.imdbId,
    required super.originCountry,
    required super.originalLanguage,
    required super.originalTitle,
    required super.overview,
    required super.popularity,
    super.posterPath,
    required List<ProductionCompanyModel> productionCompanies,
    required List<ProductionCountryModel> productionCountries,
    required super.releaseDate,
    required super.revenue,
    required super.runtime,
    required List<SpokenLanguageModel> spokenLanguages,
    required super.status,
    required super.tagline,
    required super.title,
    required super.video,
    required super.voteAverage,
    required super.voteCount,
  }) : super(
          genres: genres,
          productionCompanies: productionCompanies,
          productionCountries: productionCountries,
          spokenLanguages: spokenLanguages,
        );

  factory MovieDetailsModel.fromJson(Map<String, dynamic> json) {
    return MovieDetailsModel(
      adult: json['adult'],
      backdropPath: json['backdrop_path'],
      budget: json['budget'],
      genres: (json['genres'] as List)
          .map((genre) => GenreModel.fromJson(genre))
          .toList(),
      homepage: json['homepage'],
      id: json['id'],
      imdbId: json['imdb_id'],
      originCountry: List<String>.from(json['origin_country']),
      originalLanguage: json['original_language'],
      originalTitle: json['original_title'],
      overview: json['overview'],
      popularity: (json['popularity'] as num).toDouble(),
      posterPath: json['poster_path'],
      productionCompanies: (json['production_companies'] as List)
          .map((e) => ProductionCompanyModel.fromJson(e))
          .toList(),
      productionCountries: (json['production_countries'] as List)
          .map((e) => ProductionCountryModel.fromJson(e))
          .toList(),
      releaseDate: json['release_date'],
      revenue: json['revenue'],
      runtime: json['runtime'],
      spokenLanguages: (json['spoken_languages'] as List)
          .map((e) => SpokenLanguageModel.fromJson(e))
          .toList(),
      status: json['status'],
      tagline: json['tagline'],
      title: json['title'],
      video: json['video'],
      voteAverage: (json['vote_average'] as num).toDouble(),
      voteCount: json['vote_count'],
    );
  }
}

class GenreModel extends GenreEntity {
  GenreModel({
    required super.id,
    required super.name,
  });

  factory GenreModel.fromJson(Map<String, dynamic> json) {
    return GenreModel(
      id: json['id'],
      name: json['name'],
    );
  }
}

class ProductionCompanyModel extends ProductionCompanyEntity {
  ProductionCompanyModel({
    required super.id,
    required super.name,
    super.logoPath,
    required super.originCountry,
  });

  factory ProductionCompanyModel.fromJson(Map<String, dynamic> json) {
    return ProductionCompanyModel(
      id: json['id'],
      name: json['name'],
      logoPath: json['logo_path'],
      originCountry: json['origin_country'],
    );
  }
}

class ProductionCountryModel extends ProductionCountryEntity {
  ProductionCountryModel({
    required super.iso3166_1,
    required super.name,
  });

  factory ProductionCountryModel.fromJson(Map<String, dynamic> json) {
    return ProductionCountryModel(
      iso3166_1: json['iso_3166_1'],
      name: json['name'],
    );
  }
}

class SpokenLanguageModel extends SpokenLanguageEntity {
  SpokenLanguageModel({
    required super.englishName,
    required super.iso639_1,
    required super.name,
  });

  factory SpokenLanguageModel.fromJson(Map<String, dynamic> json) {
    return SpokenLanguageModel(
      englishName: json['english_name'],
      iso639_1: json['iso_639_1'],
      name: json['name'],
    );
  }
}
