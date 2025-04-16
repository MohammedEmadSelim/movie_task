import 'package:cached_network_image/cached_network_image.dart';
import 'package:egb_task/core/routes/route_path.dart';
import 'package:egb_task/core/widgets/tap_effect.dart';
import 'package:egb_task/features/home_screen/domain/entities/upcoming_entity.dart';
import 'package:egb_task/features/home_screen/presentaion/controllers/upcoming_movies/up_comping_movies_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class UpcomingTab extends StatefulWidget {
  const UpcomingTab({super.key});

  @override
  State<UpcomingTab> createState() => _UpcomingTabState();
}

class _UpcomingTabState extends State<UpcomingTab> {
  @override
  void initState() {
    super.initState();
    context.read<UpCompingMoviesCubit>().getUpcomingMoviesData();
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<UpCompingMoviesCubit, UpCompingMoviesState>(
      builder: (context, state) {
        if (state is UpCompingMoviesLoading) {
          return _buildShimmerGrid();
        } else if (state is UpCompingMoviesSuccess) {
          return _buildMovieGrid(state.movies);
        } else if (state is UpCompingMoviesFailure) {
          return Center(
            child: Text(state.message, style: const TextStyle(color: Colors.white)),
          );
        } else {
          return const SizedBox.shrink();
        }
      },
    );
  }

  Widget _buildMovieGrid(List<UpcomingMovieEntity> movies) {
    return GridView.builder(
      padding: const EdgeInsets.all(16),
      itemCount: movies.length,
      gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 3,
        mainAxisSpacing: 16,
        crossAxisSpacing: 12,
        childAspectRatio: 0.68,
      ),
      itemBuilder: (context, index) {
        final movie = movies[index];
        return TapEffect(
          onClick: () {
            Navigator.pushNamed(context, RoutePath.detailsScreen,
                arguments: {'movie_id': movie.id});
          },
          child: ClipRRect(
            borderRadius: BorderRadius.circular(12),
            child: CachedNetworkImage(
              imageUrl: 'https://image.tmdb.org/t/p/w500${movie.posterPath}',
              fit: BoxFit.cover,
              placeholder: (context, url) => Container(color: Colors.grey[800]),
              errorWidget: (context, url, error) =>
              const Icon(Icons.error, color: Colors.white),
            ),
          ),
        );      },
    );
  }

  Widget _buildShimmerGrid() {
    return GridView.builder(
      padding: const EdgeInsets.all(16),
      itemCount: 6,
      gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 3,
        mainAxisSpacing: 16,
        crossAxisSpacing: 12,
        childAspectRatio: 0.68,
      ),
      itemBuilder: (_, __) => Container(
        decoration: BoxDecoration(
          color: Colors.grey[800],
          borderRadius: BorderRadius.circular(12),
        ),
      ),
    );
  }
}
