import 'package:cached_network_image/cached_network_image.dart';
import 'package:egb_task/core/routes/route_path.dart';
import 'package:egb_task/core/widgets/tap_effect.dart';
import 'package:egb_task/features/home_screen/domain/entities/now_playing_entity.dart';
import 'package:egb_task/features/home_screen/presentaion/controllers/now_playing_cubit/now_playing_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class NowPlayingTab extends StatefulWidget {
  const NowPlayingTab({super.key});

  @override
  State<NowPlayingTab> createState() => _NowPlayingTabState();
}

class _NowPlayingTabState extends State<NowPlayingTab> {
  @override
  void initState() {
    super.initState();
    context.read<NowPlayingCubit>().getNowPlaying();
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<NowPlayingCubit, NowPlayingState>(
      builder: (context, state) {
        if (state is NowPlayingLoading) {
          return _buildShimmerGrid();
        } else if (state is NowPlayingSuccess) {
          return _buildMovieGrid(state.movies);
        } else if (state is NowPlayingFailure) {
          return Center(
            child: Text(state.message,
                style: const TextStyle(color: Colors.white)),
          );
        } else {
          return const SizedBox.shrink(); // For NowPlayingInitial or fallback
        }
      },
    );
  }

  Widget _buildMovieGrid(List<NowPlayingMovieEntity> movies) {
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
