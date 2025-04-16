import 'package:egb_task/core/constants/icons.dart';
import 'package:egb_task/core/responsive/dimension.dart';
import 'package:egb_task/core/theme/colors.dart';
import 'package:egb_task/core/widgets/custom_show_dialg.dart';
import 'package:egb_task/core/widgets/custom_svg.dart';
import 'package:egb_task/core/widgets/custom_text.dart';
import 'package:egb_task/core/widgets/custom_text_field.dart';
import 'package:egb_task/features/home_screen/presentaion/components/movie_taps.dart';
import 'package:egb_task/features/home_screen/presentaion/components/trending_movies_carousel.dart';
import 'package:egb_task/features/home_screen/presentaion/components/trending_movies_shimmer.dart';
import 'package:egb_task/features/home_screen/presentaion/controllers/trending_movies_cubit/trending_movies_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({
    super.key,
  });

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  TextEditingController searchController = TextEditingController();
  FocusNode searchFocusNode = FocusNode();

  @override
  void initState() {
    context.read<TrendingMoviesCubit>().getTrendingMovies();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(
        horizontal: 15.w,
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          SizedBox(
            height: 80.h,
          ),
          CustomText(
            text: 'What do you want to watch?',
            textColor: kWhite,
            fontSizes: 20.sp,
            fontWeight: FontWeight.w600,
          ),
          SizedBox(
            height: 24.h,
          ),
          CustomTextField(
            focusNode: searchFocusNode,
            hint: 'Search',
            controller: searchController,
            suffix: CustomSvgImage(
              boxFit: BoxFit.none,
              image: AppIcons.search,
              height: 16.h,
              width: 16.h,
              color: kGreyText,
            ),
          ),
          SizedBox(
            height: 21.h,
          ),
          BlocConsumer<TrendingMoviesCubit, TrendingMoviesState>(
            listener: (context, state) {
              if (state is TrendingMoviesFailure) {
                customShowDialog(context: context, text: state.message);
              }
            },
            builder: (context, state) {
              if (state is TrendingMoviesLoading) {
                return TrendingCarouselShimmer();
              }
              if (state is TrendingMoviesSuccess) {
                return TrendingMoviesCarousel(movies: state.movies);
              }
              return Container(
                child: CustomText(text: "an error occur", textColor: kRed),
              );
            },
          ),
          SizedBox(height: 60.h,),
          MovieTabs()
        ],
      ),
    );
  }
}
