import 'package:cached_network_image/cached_network_image.dart';
import 'package:egb_task/core/constants/icons.dart';
import 'package:egb_task/core/responsive/dimension.dart';
import 'package:egb_task/core/routes/route_path.dart';
import 'package:egb_task/core/theme/colors.dart';
import 'package:egb_task/core/widgets/custom_svg.dart';
import 'package:egb_task/core/widgets/custom_text_field.dart';
import 'package:egb_task/core/widgets/tap_effect.dart';
import 'package:egb_task/features/search/presentaion/controllers/search_cubit/search_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class SearchScreen extends StatefulWidget {
  const SearchScreen({
    super.key,
  });

  @override
  State<SearchScreen> createState() => _SearchScreenState();
}

class _SearchScreenState extends State<SearchScreen> {
  FocusNode searchFocusNode = FocusNode();
  TextEditingController searchController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
        create: (context) => SearchCubit(),
        child: BlocConsumer<SearchCubit, SearchState>(
          listener: (context, state) {},
          builder: (context, state) {
            return Padding(
              padding: const EdgeInsets.symmetric(horizontal: 15.0),
              child: Column(
                children: [
                  SizedBox(height: 80.h),
                  CustomTextField(
                    onFieldSubmitted: (p0) {
                      context.read<SearchCubit>().search(searchController.text);
                    },
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
                  SizedBox(height: 20.h),
                  if (state is SearchInitial)
                    const Center(child: Text('Search for a movie',style: TextStyle(color: Colors.white),)),
                  if (state is SearchLoading)
                    const Center(child: CircularProgressIndicator()),
                  if (state is SearchSuccess)
                   state.movies.isEmpty? const Center(child: Text('No results found',style: TextStyle(color: Colors.white),)):
                    Expanded(
                      child: ListView.builder(
                        padding: EdgeInsets.zero,
                        itemCount: state.movies.length,
                        itemBuilder: (context, index) {
                          final movie = state.movies[index];
                          return Padding(
                            padding: EdgeInsets.symmetric(vertical: 8.h),
                            child: Row(
                              children: [
                                TapEffect(
                                  onClick: () {
                                    Navigator.pushNamed(context, RoutePath.detailsScreen,
                                        arguments: {'movie_id': movie.id});
                                  },
                                  child: ClipRRect(
                                    borderRadius: BorderRadius.circular(12),
                                    child: CachedNetworkImage(
                                      errorWidget: (context, url, error) => const Icon(
                                        Icons.image,
                                      ),
                                      imageUrl:
                                      'https://image.tmdb.org/t/p/w500${movie.posterPath}',
                                      width: 80.w,
                                      height: 120.h,
                                      fit: BoxFit.cover,
                                    ),
                                  ),
                                ),
                                SizedBox(width: 12.w),
                                Expanded(
                                  child: Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      Text(
                                        movie.title,
                                        style: TextStyle(
                                          fontSize: 16.sp,
                                          fontWeight: FontWeight.bold,
                                          color: Colors.white,
                                        ),
                                        maxLines: 2,
                                        overflow: TextOverflow.ellipsis,
                                      ),
                                      SizedBox(height: 4.h),
                                      Text(
                                        '⭐ ${movie.voteAverage}',
                                        style: TextStyle(
                                          color: Colors.amber,
                                          fontSize: 14.sp,
                                        ),
                                      ),
                                      SizedBox(height: 2.h),
                                      Text(
                                        '📅 ${movie.releaseDate}',
                                        style: TextStyle(
                                          fontSize: 12.sp,
                                          color: kGreyText,
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                              ],
                            ),
                          );
                        },
                      ),
                    ),
                  if (state is SearchFailure)
                    Center(
                      child: Text(
                        state.message,
                        style: const TextStyle(color: Colors.white),
                      ),
                    ),
                ],
              ),
            );
          },
        ));
  }
}
