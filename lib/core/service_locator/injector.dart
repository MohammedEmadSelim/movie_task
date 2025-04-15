import 'package:dio/dio.dart';
import 'package:egb_task/core/constants/api_endpoints.dart';
import 'package:egb_task/core/data_source/dio_backend.dart';
import 'package:egb_task/core/data_source/logging_interceptor.dart';
import 'package:egb_task/features/home_screen/data/data_source/remote_data_source.dart';
import 'package:egb_task/features/home_screen/data/repository/home_repository_implementaion.dart';
import 'package:egb_task/features/home_screen/domain/use_cases/get_most_popular_use_case.dart';
import 'package:egb_task/features/home_screen/domain/use_cases/get_now_playing_use_case.dart';
import 'package:egb_task/features/home_screen/domain/use_cases/get_top_rated_use_case.dart';
import 'package:egb_task/features/home_screen/domain/use_cases/get_trending_all_use_cases.dart';
import 'package:egb_task/features/home_screen/domain/use_cases/get_upcoming_movies.dart';
import 'package:get_it/get_it.dart';

final sl = GetIt.instance;

Future<void> init() async {
  ////////////////////////////////////// UseCase ///////////////////////////////////////

  sl.registerLazySingleton<GetTrendingAllUseCases>(
    () => GetTrendingAllUseCases(
      sl.get<HomeRepositoryImplementation>(),
    ),
  );
  sl.registerLazySingleton<GetNowPlayingUseCase>(
    () => GetNowPlayingUseCase(
      sl.get<HomeRepositoryImplementation>(),
    ),
  );
  sl.registerLazySingleton<GetUpcomingMoviesUseCase>(
    () => GetUpcomingMoviesUseCase(
      sl.get<HomeRepositoryImplementation>(),
    ),
  );
  sl.registerLazySingleton<GetTopRatedUseCase>(
    () => GetTopRatedUseCase(
      sl.get<HomeRepositoryImplementation>(),
    ),
  );
  sl.registerLazySingleton<GetMostPopularUseCase>(
    () => GetMostPopularUseCase(
      sl.get<HomeRepositoryImplementation>(),
    ),
  );
  ////////////////////////////////////// Repository ///////////////////////////////////////
  sl.registerLazySingleton<HomeRepositoryImplementation>(
    () => HomeRepositoryImplementation(sl.get<RemoteDataSource>()),
  );

////////////////////////////////////// remote data source ///////////////////////////////////////
  sl.registerLazySingleton<RemoteDataSource>(
    () => RemoteDataSource(),
  );

  ////////////////////////////////////// Network ///////////////////////////////////////
  sl.registerLazySingleton<DioBackend>(() => DioBackend(
      loggingInterceptor: sl(), dio: sl(), baseUrl: ApiEndpoints.baseUrl));
  sl.registerLazySingleton<Dio>(() => Dio());
  sl.registerLazySingleton<LoggingInterceptor>(() => LoggingInterceptor());
}
