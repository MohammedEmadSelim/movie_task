import 'package:cached_network_image/cached_network_image.dart';
import 'package:egb_task/core/constants/icons.dart';
import 'package:egb_task/core/hive/adaptors/movie_entity.dart';
import 'package:egb_task/core/hive/boxes/boxes.dart';
import 'package:egb_task/core/responsive/dimension.dart';
import 'package:egb_task/core/theme/colors.dart';
import 'package:egb_task/core/widgets/custom_show_dialg.dart';
import 'package:egb_task/core/widgets/custom_svg.dart';
import 'package:egb_task/core/widgets/custom_text.dart';
import 'package:egb_task/core/widgets/tap_effect.dart';
import 'package:egb_task/features/details_screen/presentaion/components/details_taps.dart';
import 'package:egb_task/features/details_screen/presentaion/controllers/details_cubit/details_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:shimmer/shimmer.dart';

class DetailsScreen extends StatefulWidget {
  final int movieId;

  const DetailsScreen({super.key, required this.movieId});

  @override
  State<DetailsScreen> createState() => _DetailsScreenState();
}

class _DetailsScreenState extends State<DetailsScreen> {
  @override
  void initState() {
    context.read<DetailsCubit>().getMovieDetails(widget.movieId);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        actions: [
          BlocConsumer<DetailsCubit, DetailsState>(
            listener: (context, state) {
              // TODO: implement listener
            },
            builder: (context, state) {
              if (state is DetailsLoading) {
                return Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 15),
                  child: Shimmer.fromColors(
                    baseColor: Colors.grey[800]!,
                    highlightColor: Colors.grey[700]!,
                    child: CustomSvgImage(image: AppIcons.addToWatchIcon),
                  ),
                );
              }
              if (state is DetailsSuccess) {
                return Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 15),
                  child: TapEffect(
                      onClick: () {
                        watchListBox.put(state.movieDetails.id.toString(),
                            MovieEntity(id: state.movieDetails.id,
                                title: state.movieDetails.title,
                                posterPath: state.movieDetails.posterPath??'',
                                releaseDate: state.movieDetails.releaseDate,
                                voteAverage: state.movieDetails.voteAverage,
                                genres: state.movieDetails.genres.map((e) => e.name,).toList(),
                                runtime: state.movieDetails.runtime));
                     print(watchListBox.values.length);
                      },
                      child: CustomSvgImage(image: AppIcons.addToWatchIcon)),
                );
              }
              return Container();
            },
          ),
        ],
        backgroundColor: kDarkBackgroundColor,
        iconTheme: const IconThemeData(color: kWhite),
        title: CustomText(
          text: 'Details',
          fontSizes: 16.sp,
          fontWeight: FontWeight.w600,
          textColor: kWhite,
        ),
      ),
      backgroundColor: kDarkBackgroundColor,
      body: SingleChildScrollView(
        child: BlocConsumer<DetailsCubit, DetailsState>(
          listener: (context, state) {
            if (state is DetailsFailure) {
              customShowDialog(context: context, text: state.message);
            }
          },
          builder: (context, state) {
            if (state is DetailsLoading) {
              return SizedBox(
                height: MediaQuery
                    .of(context)
                    .size
                    .height,
                child: const Center(child: CircularProgressIndicator()),
              );
            }
            if (state is DetailsSuccess) {
              final movie = state.movieDetails;
              return Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  SizedBox(height: 24.h),
                  Stack(
                    alignment: Alignment.bottomCenter,
                    children: [
                      SizedBox(
                        height: 380.h,
                        child: Stack(
                          children: [
                            Padding(
                              padding: const EdgeInsets.only(bottom: 20.0),
                              child: ClipRRect(
                                borderRadius: BorderRadius.only(
                                    bottomLeft: Radius.circular(16.r),
                                    bottomRight: Radius.circular(16.r)),
                                child: CachedNetworkImage(
                                  errorWidget: (context, url, error) => const Icon(
                                    Icons.broken_image,
                                  ),
                                  imageUrl:
                                  'https://image.tmdb.org/t/p/w500${movie
                                      .backdropPath}',
                                  height: 300.h,
                                  width: double.infinity,
                                  fit: BoxFit.cover,
                                ),
                              ),
                            ),
                            Positioned(
                              bottom: 120.h,
                              right: 12.w,
                              child: Container(
                                padding: const EdgeInsets.symmetric(
                                    horizontal: 8, vertical: 4),
                                decoration: BoxDecoration(
                                  color: kDarkBackgroundColor.withAlpha(500),
                                  borderRadius: BorderRadius.circular(8),
                                ),
                                child: Row(
                                  children: [
                                    CustomSvgImage(image: AppIcons.star,height: 16.h,),
                                    SizedBox(width: 4.w),
                                    CustomText(
                                      text:
                                      movie.voteAverage.toStringAsFixed(1),
                                      fontSizes: 14.sp,
                                      fontWeight: FontWeight.w600,
                                      textColor: kOrangeStar,
                                    ),
                                  ],
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 16.0),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.end,
                          children: [
                            Row(
                              crossAxisAlignment: CrossAxisAlignment.end,
                              mainAxisAlignment: MainAxisAlignment.start,
                              children: [
                                ClipRRect(
                                  borderRadius: BorderRadius.circular(8),
                                  child: CachedNetworkImage(
                                    errorWidget: (context, url, error) => const Icon(
                                      Icons.broken_image,
                                    ),
                                    imageUrl:
                                    'https://image.tmdb.org/t/p/w500${movie
                                        .posterPath}',
                                    height: 120.h,
                                    width: 70.w,
                                    fit: BoxFit.cover,
                                  ),
                                ),
                                SizedBox(width: 12.w),
                                Expanded(
                                  child: Column(
                                    crossAxisAlignment:
                                    CrossAxisAlignment.start,
                                    mainAxisAlignment: MainAxisAlignment.end,
                                    children: [
                                      CustomText(
                                        text: movie.title,
                                        fontSizes: 18.sp,
                                        fontWeight: FontWeight.bold,
                                        maxLines: 2,
                                        textColor: kWhite,
                                      ),
                                      SizedBox(height: 20.h),
                                    ],
                                  ),
                                ),
                              ],
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                  SizedBox(height: 16.h),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Row(
                        children: [
                          CustomSvgImage(
                              image: AppIcons.calendar, height: 16.h),
                          SizedBox(width: 5.w),
                          CustomText(
                            text: movie.releaseDate
                                .split('-')
                                .first,
                            fontSizes: 13.sp,
                            textColor: kGreyText,
                          ),
                        ],
                      ),
                      SizedBox(
                        height: 16.h,
                        child: VerticalDivider(thickness: 1, color: kGreyText),
                      ),
                      Row(
                        children: [
                          CustomSvgImage(image: AppIcons.clock, height: 16.h),
                          SizedBox(width: 5.w),
                          CustomText(
                            text:
                                 '${movie.runtime} Minutes'
                             ,
                            fontSizes: 13.sp,
                            textColor: kGreyText,
                          ),
                        ],
                      ),
                      SizedBox(
                        height: 16.h,
                        child: VerticalDivider(thickness: 1, color: kGreyText),
                      ),
                      Row(
                        children: [
                          CustomSvgImage(image: AppIcons.ticket, height: 16.h),
                          SizedBox(width: 5.w),
                          CustomText(
                            text: movie.genres.isNotEmpty
                                ? movie.genres.first.name
                                : 'Genre',
                            fontSizes: 13.sp,
                            textColor: kGreyText,
                          ),
                        ],
                      ),
                    ],
                  ),
                  SizedBox(height: 24.h),
                  SizedBox(height: 20.h),
                  DetailsTabs(details: state.movieDetails)
                ],
              );
            }
            return Container();
          },
        ),
      ),
    );
  }
}
