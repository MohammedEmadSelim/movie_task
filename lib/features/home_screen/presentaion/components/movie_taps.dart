import 'package:egb_task/core/theme/colors.dart';
import 'package:egb_task/features/home_screen/presentaion/components/home_screen_movie_taps/now_playing_tab.dart';
import 'package:egb_task/features/home_screen/presentaion/components/home_screen_movie_taps/popular_tap.dart';
import 'package:egb_task/features/home_screen/presentaion/components/home_screen_movie_taps/top_rated_tap.dart';
import 'package:egb_task/features/home_screen/presentaion/components/home_screen_movie_taps/upcoming_tap.dart';
import 'package:egb_task/features/home_screen/presentaion/components/moive_category_grid.dart';
import 'package:flutter/material.dart';

class MovieTabs extends StatefulWidget {
  const MovieTabs({super.key});

  @override
  State<MovieTabs> createState() => _MovieTabsState();
}

class _MovieTabsState extends State<MovieTabs> with TickerProviderStateMixin {
  late TabController _tabController;
  final List<String> _tabs = [
    'Now playing',
    'Upcoming',
    'Top rated',
    'Popular'
  ];
  final List<Widget> taps = [
    NowPlayingTab(),
    UpcomingTab(),
    TopRatedTab(),
    MostPopularTab(),
  ];

  @override
  void initState() {
    super.initState();
    _tabController = TabController(length: _tabs.length, vsync: this);
  }

  @override
  void dispose() {
    _tabController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        TabBar(
          dividerColor: kDarkBackgroundColor,
          tabAlignment: TabAlignment.start,
          padding: EdgeInsets.zero,
          // removes extra padding
          labelPadding: const EdgeInsets.symmetric(horizontal: 12),
          controller: _tabController,
          labelColor: Colors.white,
          unselectedLabelColor: const Color(0xFF67686D),
          labelStyle: const TextStyle(fontWeight: FontWeight.bold),
          indicatorColor: kGreyText,
          indicatorWeight: 2.5,
          isScrollable: true,
          tabs: _tabs.map((title) => Tab(text: title)).toList(),
        ),
        const SizedBox(height: 12),
        SizedBox(
          height: 300, // Adjust as needed
          child: TabBarView(
            controller: _tabController,
            children: taps,
          ),
        ),
      ],
    );
  }
}
