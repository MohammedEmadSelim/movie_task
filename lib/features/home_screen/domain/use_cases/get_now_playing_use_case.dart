import 'package:egb_task/core/errors/failure.dart';
import 'package:egb_task/core/usecase/usecase.dart';
import 'package:egb_task/features/home_screen/domain/entities/now_playing_entity.dart';
import 'package:egb_task/features/home_screen/domain/repository/base_home_repository.dart';
import 'package:either_dart/src/either.dart';

class GetNowPlayingUseCase extends UseCase<NowPlayingResponseEntity> {
  final BaseHomeRepository baseHomeRepository;

  GetNowPlayingUseCase(this.baseHomeRepository);

  @override
  Future<Either<Failure, NowPlayingResponseEntity>> call() {
    return baseHomeRepository.getNowPlaying();
  }
}
