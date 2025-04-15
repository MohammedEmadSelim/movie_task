import 'package:flutter/material.dart';

class MovieCategoryGrid extends StatelessWidget {
  final String category;

  const MovieCategoryGrid({super.key, required this.category});

  @override
  Widget build(BuildContext context) {
    // You can fetch data based on category here using Bloc or Cubit
    final dummyMovies = List.generate(
      6,
          (index) => "https://image.tmdb.org/t/p/w500/ce3prrjh9ZehEl5JinNqr4jIeaB.jpg",
    );

    return GridView.builder(
      padding: const EdgeInsets.symmetric(horizontal: 16),
      shrinkWrap: true,
      itemCount: dummyMovies.length,
      gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 3,
        mainAxisSpacing: 16,
        crossAxisSpacing: 12,
        childAspectRatio: 0.6,
      ),
      itemBuilder: (_, index) {
        return ClipRRect(
          borderRadius: BorderRadius.circular(12),
          child: Image.network(dummyMovies[index], fit: BoxFit.cover),
        );
      },
    );
  }
}
