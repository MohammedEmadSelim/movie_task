part of 'details_cubit.dart';

@immutable
sealed class DetailsState {}

final class DetailsInitial extends DetailsState {}
final class DetailsLoading extends DetailsState {}
final class DetailsFailure extends DetailsState {
  final String message;
  DetailsFailure({required this.message});
}
final class DetailsSuccess extends DetailsState {
  final MovieDetailsEntity movieDetails;
  DetailsSuccess({required this.movieDetails});
}
