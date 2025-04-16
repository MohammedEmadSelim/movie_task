import 'package:hive/hive.dart';

part 'movie_entity.g.dart';

@HiveType(typeId: 0)
class MovieEntity extends HiveObject {
  @HiveField(0)
  final int id;

  @HiveField(1)
  final String title;

  @HiveField(2)
  final String posterPath;

  @HiveField(3)
  final String releaseDate;

  @HiveField(4)
  final double voteAverage;

  @HiveField(5)
  final List<String> genres;

  @HiveField(6)
  final int runtime;

   MovieEntity({
    required this.id,
    required this.title,
    required this.posterPath,
    required this.releaseDate,
    required this.voteAverage,
    required this.genres,
    required this.runtime,
  });
}
