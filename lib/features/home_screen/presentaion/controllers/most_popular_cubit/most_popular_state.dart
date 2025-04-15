part of 'most_popular_cubit.dart';

@immutable
sealed class MostPopularState {}

final class MostPopularInitial extends MostPopularState {}
final class MostPopularLoading extends MostPopularState {}
final class MostPopularFailure extends MostPopularState {
  final String message;
  MostPopularFailure({required this.message});
}
final class MostPopularSuccess extends MostPopularState {
  final List<MostPopularMovieEntity>  movies;
  MostPopularSuccess({required this.movies});
}

