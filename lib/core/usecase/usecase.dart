
import 'package:egb_task/core/errors/failure.dart';
import 'package:either_dart/either.dart';

abstract class UseCase<T> {
  Future<Either<Failure, T>> call();
}
abstract class UseCaseWithParam<T, Parameters> {
  Future<Either<Failure, T>> call(Parameters parameters);
}

