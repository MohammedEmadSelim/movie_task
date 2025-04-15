import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:shimmer/shimmer.dart';

class TrendingCarouselShimmer extends StatelessWidget {
  const TrendingCarouselShimmer({super.key});

  @override
  Widget build(BuildContext context) {
    return Shimmer.fromColors(
      baseColor: Colors.grey.shade800,
      highlightColor: Colors.grey.shade700,
      child: CarouselSlider.builder(
        itemCount: 5,
        itemBuilder: (context, index, realIndex) {
          return Container(
            margin: const EdgeInsets.symmetric(horizontal: 8),
            height: 250,
            decoration: BoxDecoration(
              color: Colors.grey[900],
              borderRadius: BorderRadius.circular(20),
            ),
          );
        },
        options: CarouselOptions(
          height: 250,
          viewportFraction: 0.6,
          enlargeCenterPage: true,
        ),
      ),
    );
  }
}
