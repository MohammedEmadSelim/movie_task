import 'package:egb_task/core/errors/failure.dart';
import 'package:egb_task/features/search/data/models/search_model.dart';
import 'package:either_dart/either.dart';

abstract class BaseSearchRepository {

  Future<Either<Failure, SearchResponseModel>> search(String query);
}