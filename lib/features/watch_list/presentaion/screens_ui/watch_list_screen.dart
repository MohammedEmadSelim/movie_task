import 'package:cached_network_image/cached_network_image.dart';
import 'package:egb_task/core/routes/route.dart';
import 'package:egb_task/core/routes/route_path.dart';
import 'package:egb_task/core/widgets/custom_text.dart';
import 'package:egb_task/core/theme/colors.dart';
import 'package:egb_task/core/responsive/dimension.dart';
import 'package:egb_task/core/constants/icons.dart';
import 'package:egb_task/core/widgets/custom_svg.dart';
import 'package:egb_task/core/widgets/tap_effect.dart';
import 'package:flutter/material.dart';
import 'package:hive_flutter/hive_flutter.dart';

import '../../../../core/hive/adaptors/movie_entity.dart';

class WatchListScreen extends StatelessWidget {
  const WatchListScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: kDarkBackgroundColor,
      appBar: AppBar(
        backgroundColor: kDarkBackgroundColor,
        title: CustomText(
          text: 'Watch list',
          fontSizes: 16.sp,
          fontWeight: FontWeight.w600,
          textColor: Colors.white,
        ),
        centerTitle: true,
        iconTheme: const IconThemeData(color: Colors.white),
      ),
      body: ValueListenableBuilder(
        valueListenable: Hive.box<MovieEntity>('watchlist').listenable(),
        builder: (context, Box<MovieEntity> box, _) {
          if (box.isEmpty) {
            return const Center(
              child: Text(
                'No movies in your watchlist yet.',
                style: TextStyle(color: Colors.white),
              ),
            );
          }

          return ListView.builder(
            padding: EdgeInsets.symmetric(horizontal: 16.w, vertical: 12.h),
            itemCount: box.length,
            itemBuilder: (context, index) {
              final movie = box.getAt(index);
              return TapEffect(
                onClick: () {
                  Navigator.pushNamed(context, RoutePath.detailsScreen,arguments: {'movie_id':movie!.id});
                },
                child: Padding(
                  padding: const EdgeInsets.only(bottom: 20),
                  child: Row(
                    children: [
                      ClipRRect(
                        borderRadius: BorderRadius.circular(12),
                        child: CachedNetworkImage(
                          imageUrl:
                              'https://image.tmdb.org/t/p/w500${movie?.posterPath}',
                          height: 100.h,
                          width: 70.w,
                          fit: BoxFit.cover,
                        ),
                      ),
                      SizedBox(width: 12.w),
                      Expanded(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            CustomText(
                              text: movie?.title ?? '',
                              fontSizes: 16.sp,
                              fontWeight: FontWeight.bold,
                              textColor: Colors.white,
                              maxLines: 1,
                              overFlowText: TextOverflow.ellipsis,
                            ),
                            SizedBox(height: 6.h),
                            Row(
                              children: [
                                CustomSvgImage(
                                  image: AppIcons.star,
                                  height: 16.h,
                                ),
                                SizedBox(width: 4.w),
                                CustomText(
                                  text: '9.0',
                                  // Optional: add rating to model if needed
                                  fontSizes: 13.sp,
                                  textColor: kOrangeStar,
                                ),
                              ],
                            ),
                            SizedBox(height: 4.h),
                            Row(
                              children: [
                                CustomSvgImage(
                                  image: AppIcons.ticket,
                                  height: 14.h,
                                  color: kWhite,
                                ),
                                SizedBox(width: 5.w),
                                CustomText(
                                    text: 'Action',
                                    fontSizes: 12.sp,
                                    textColor: kWhite),
                              ],
                            ),
                            SizedBox(height: 4.h),
                            Row(
                              children: [
                                CustomSvgImage(
                                  image: AppIcons.calendar,
                                  height: 14.h,
                                  color: kWhite,
                                ),
                                SizedBox(width: 5.w),
                                CustomText(
                                    text: movie?.releaseDate ?? '',
                                    fontSizes: 12.sp,
                                    textColor: kWhite),
                              ],
                            ),
                            SizedBox(height: 4.h),
                            Row(
                              children: [
                                Icon(Icons.schedule, size: 14, color: kWhite),
                                SizedBox(width: 5.w),
                                CustomText(
                                    text: '139 minutes',
                                    fontSizes: 12.sp,
                                    textColor: kWhite),
                              ],
                            ),
                          ],
                        ),
                      )
                    ],
                  ),
                ),
              );
            },
          );
        },
      ),
    );
  }
}
