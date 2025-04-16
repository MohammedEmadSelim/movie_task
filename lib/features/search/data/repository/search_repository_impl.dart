import 'package:egb_task/core/errors/failure.dart';
import 'package:egb_task/features/search/data/data/remote_data_source.dart';
import 'package:egb_task/features/search/data/models/search_model.dart';
import 'package:egb_task/features/search/domain/repository/base_search_repository.dart';
import 'package:either_dart/src/either.dart';

class SearchRepositoryImpl extends BaseSearchRepository {
  final BaseSearchRemoteDataSource baseSearchRemoteDataSource;

  SearchRepositoryImpl(this.baseSearchRemoteDataSource);

  @override
  Future<Either<Failure, SearchResponseModel>> search(String query) {
    return baseSearchRemoteDataSource.search(query);
  }
}
