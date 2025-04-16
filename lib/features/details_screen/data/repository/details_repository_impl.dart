import 'package:egb_task/core/errors/failure.dart';
import 'package:egb_task/features/details_screen/data/data/details_data_source.dart';
import 'package:egb_task/features/details_screen/domain/entities/details_entity.dart';
import 'package:egb_task/features/details_screen/domain/repository/base_details_screen_repositpory.dart';
import 'package:either_dart/src/either.dart';

class DetailsRepositoryImpl extends BaseDetailsScreenRepository {
  final BaseDetailsDataSource detailsDataSource;

  DetailsRepositoryImpl(this.detailsDataSource);

  @override
  Future<Either<Failure, MovieDetailsEntity>> getMovieDetails(int movieId) {
    return detailsDataSource.getMovieDetails(movieId);
  }
}
