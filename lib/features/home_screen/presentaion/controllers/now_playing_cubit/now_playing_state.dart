part of 'now_playing_cubit.dart';

@immutable
sealed class NowPlayingState {}

final class NowPlayingInitial extends NowPlayingState {}

final class NowPlayingLoading extends NowPlayingState {}
final class NowPlayingFailure extends NowPlayingState {
  final String message;
  NowPlayingFailure({required this.message});
}
final class NowPlayingSuccess extends NowPlayingState {
  final  List<NowPlayingMovieEntity> movies;
  NowPlayingSuccess({required this.movies});
}
