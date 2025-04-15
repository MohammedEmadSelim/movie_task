import 'package:egb_task/core/errors/failure.dart';
import 'package:egb_task/features/home_screen/domain/entities/most_popular_entity.dart';
import 'package:egb_task/features/home_screen/domain/entities/now_playing_entity.dart';
import 'package:egb_task/features/home_screen/domain/entities/top_rated_entity.dart';
import 'package:egb_task/features/home_screen/domain/entities/trending_all_entity.dart';
import 'package:egb_task/features/home_screen/domain/entities/upcoming_entity.dart';
import 'package:either_dart/either.dart';

abstract class BaseHomeRepository {
  Future<Either<Failure, List<MovieEntity>>> getTrendingAll();
  Future<Either<Failure, NowPlayingResponseEntity>> getNowPlaying();
  Future<Either<Failure, UpcomingMoviesResponseEntity>> getUpcoming();
  Future<Either<Failure, TopRatedResponseEntity>> getTopRated();
  Future<Either<Failure, MostPopularResponseEntity>> getMostPopular();
}