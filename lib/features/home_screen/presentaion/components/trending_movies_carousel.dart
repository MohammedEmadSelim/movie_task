import 'package:carousel_slider/carousel_slider.dart';
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
        return ClipRRect(
          borderRadius: BorderRadius.circular(20),
          child: Image.network(
            'https://image.tmdb.org/t/p/w500${movie.posterPath}',
            fit: BoxFit.cover,
            errorBuilder: (_, __, ___) => const Center(child: Icon(Icons.broken_image)),
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
