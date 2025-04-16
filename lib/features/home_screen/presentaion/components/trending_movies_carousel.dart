import 'package:cached_network_image/cached_network_image.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:egb_task/core/routes/route_path.dart';
import 'package:egb_task/core/widgets/tap_effect.dart';
import 'package:egb_task/features/home_screen/domain/entities/trending_all_entity.dart';
import 'package:flutter/material.dart';

class TrendingMoviesCarousel extends StatelessWidget {
  final List<MovieEntity> movies;

  const TrendingMoviesCarousel({Key? key, required this.movies}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return CarouselSlider.builder(
      itemCount: movies.length,
      itemBuilder: (context, index, realIndex) {
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
              const Icon(Icons.broken_image, color: Colors.white),
            ),
          ),
        );
      },
      options: CarouselOptions(
        height: 250,
        enlargeCenterPage: true,
        autoPlay: true,
        autoPlayInterval: const Duration(seconds: 4),
        viewportFraction: 0.6,
        initialPage: 0,
      ),
    );
  }
}
