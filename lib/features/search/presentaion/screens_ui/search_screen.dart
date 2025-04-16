import 'package:cached_network_image/cached_network_image.dart';
import 'package:egb_task/core/constants/icons.dart';
import 'package:egb_task/core/responsive/dimension.dart';
import 'package:egb_task/core/routes/route_path.dart';
import 'package:egb_task/core/theme/colors.dart';
import 'package:egb_task/core/widgets/custom_svg.dart';
import 'package:egb_task/core/widgets/custom_text.dart';
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
                    const Center(child: CustomText(text: 'Search for a movie', textColor: Colors.white)),
                  if (state is SearchLoading)
                    const Center(child: CircularProgressIndicator()),
                  if (state is SearchSuccess)
                    state.movies.isEmpty ? const Center(child: CustomText(text: 'No results found', textColor: Colors.white)) :
                    Expanded(
                      child: ListView.builder(
                        padding: EdgeInsets.zero,
                        itemCount: state.movies.length,
                        itemBuilder: (context, index) {
                          final movie = state.movies[index];
                          return TapEffect(
                            onClick: () {
                              Navigator.pushNamed(context, RoutePath.detailsScreen,
                                  arguments: {'movie_id': movie.id});
                            },
                            child: Padding(
                              padding: EdgeInsets.symmetric(vertical: 8.h),
                              child: Row(
                                children: [
                                  ClipRRect(
                                    borderRadius: BorderRadius.circular(12),
                                    child: CachedNetworkImage(
                                      errorWidget: (context, url, error) => const Icon(
                                        Icons.broken_image,
                                      ),
                                      imageUrl:
                                      'https://image.tmdb.org/t/p/w500${movie.posterPath}',
                                      width: 80.w,
                                      height: 120.h,
                                      fit: BoxFit.cover,
                                    ),
                                  ),
                                  SizedBox(width: 12.w),
                                  Expanded(
                                    child: Column(
                                      crossAxisAlignment:
                                      CrossAxisAlignment.start,
                                      children: [
                                        CustomText(
                                          text: movie.title,
                                          fontSizes: 16.sp,
                                          fontWeight: FontWeight.bold,
                                          textColor: Colors.white,
                                          maxLines: 2,
                                        ),
                                        SizedBox(height: 4.h),
                                        Row(
                                          children: [
                                            CustomSvgImage(image: AppIcons.star,height: 16.h,),
                                            SizedBox(width: 4.h),
                                            CustomText(
                                              text: '${movie.voteAverage}',
                                              fontSizes: 14.sp,
                                              textColor: kOrangeStar,
                                            ),
                                          ],
                                        ),
                                        SizedBox(height: 2.h),
                                        Row(
                                          children: [
                                            CustomSvgImage(image: AppIcons.calendar,height: 16.h,),
                                            SizedBox(width: 4.h),
                                            CustomText(
                                              text: '${movie.releaseDate}',
                                              fontSizes: 12.sp,
                                              textColor: kGreyText,
                                            ),
                                          ],
                                        ),
                                      ],
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          );
                        },
                      ),
                    ),
                  if (state is SearchFailure)
                    Center(
                      child: CustomText(
                        text: state.message,
                        textColor: Colors.white,
                      ),
                    ),
                ],
              ),
            );
          },
        ));
  }
}