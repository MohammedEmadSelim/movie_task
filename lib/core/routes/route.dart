import 'package:egb_task/core/routes/route_path.dart';
import 'package:egb_task/dashboard.dart';
import 'package:egb_task/features/details_screen/presentaion/controllers/details_cubit/details_cubit.dart';
import 'package:egb_task/features/details_screen/presentaion/screens_ui/details_screen.dart';
import 'package:egb_task/features/home_screen/presentaion/controllers/most_popular_cubit/most_popular_cubit.dart';
import 'package:egb_task/features/home_screen/presentaion/controllers/now_playing_cubit/now_playing_cubit.dart';
import 'package:egb_task/features/home_screen/presentaion/controllers/top_rated_cubit/top_rated_cubit.dart';
import 'package:egb_task/features/home_screen/presentaion/controllers/trending_movies_cubit/trending_movies_cubit.dart';
import 'package:egb_task/features/home_screen/presentaion/controllers/upcoming_movies/up_comping_movies_cubit.dart';
import 'package:egb_task/features/home_screen/presentaion/screens_ui/home_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class AppRoute {
  static Route? generateRoute(RouteSettings settings) {
    Map? arguments = settings.arguments as Map<String, dynamic>?;

    switch (settings.name) {
      case RoutePath.homeScreen:
        return MaterialPageRoute(
          builder: (_) =>
              MultiBlocProvider(
                providers: [
                  BlocProvider(
                    create: (context) => TrendingMoviesCubit(),
                  ),
                  BlocProvider(
                    create: (context) => NowPlayingCubit(),
                  ),
                  BlocProvider(
                    create: (context) => UpCompingMoviesCubit(),
                  ),
                  BlocProvider(
                    create: (context) => TopRatedCubit(),
                  ),
                  BlocProvider(
                    create: (context) => MostPopularCubit(),
                  ),
                ],
                child: MainNavigation(),
              ),
        );
      case RoutePath.detailsScreen:
        return MaterialPageRoute(
          builder: (_) =>
              BlocProvider(
                create: (context) => DetailsCubit(),
                child: DetailsScreen(movieId: arguments!['movie_id'],),
              ),
        );
    }
    return null;
  }
}
