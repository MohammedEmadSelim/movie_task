part of 'up_comping_movies_cubit.dart';

@immutable
sealed class UpCompingMoviesState {}

final class UpCompingMoviesInitial extends UpCompingMoviesState {}

final class UpCompingMoviesLoading extends UpCompingMoviesState {}

final class UpCompingMoviesFailure extends UpCompingMoviesState {
  final String message;

  UpCompingMoviesFailure({required this.message});
}

final class UpCompingMoviesSuccess extends UpCompingMoviesState {
  final List<UpcomingMovieEntity> movies;

  UpCompingMoviesSuccess({required this.movies});
}
