import 'package:cached_network_image/cached_network_image.dart';
import 'package:egb_task/features/home_screen/domain/entities/most_popular_entity.dart';
import 'package:egb_task/features/home_screen/presentaion/controllers/most_popular_cubit/most_popular_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class MostPopularTab extends StatefulWidget {
  const MostPopularTab({super.key});

  @override
  State<MostPopularTab> createState() => _MostPopularTabState();
}

class _MostPopularTabState extends State<MostPopularTab> {
  @override
  void initState() {
    super.initState();
    context.read<MostPopularCubit>().getMostPopular();
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<MostPopularCubit, MostPopularState>(
      builder: (context, state) {
        if (state is MostPopularLoading) {
          return _buildShimmerGrid();
        } else if (state is MostPopularSuccess) {
          return _buildMovieGrid(state.movies);
        } else if (state is MostPopularFailure) {
          return Center(
            child: Text(state.message, style: const TextStyle(color: Colors.white)),
          );
        } else {
          return const SizedBox.shrink(); // Fallback
        }
      },
    );
  }

  Widget _buildMovieGrid(List<MostPopularMovieEntity> movies) {
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
        return ClipRRect(
          borderRadius: BorderRadius.circular(12),
          child: CachedNetworkImage(
            imageUrl: 'https://image.tmdb.org/t/p/w500${movie.posterPath}',
            fit: BoxFit.cover,
            placeholder: (context, url) => Container(color: Colors.grey[800]),
            errorWidget: (context, url, error) => const Icon(Icons.error, color: Colors.white),
          ),
        );
      },
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
