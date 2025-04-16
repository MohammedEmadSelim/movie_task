import 'package:egb_task/features/details_screen/domain/entities/details_entity.dart';
import 'package:flutter/material.dart';
import 'package:egb_task/core/theme/colors.dart';

class DetailsTabs extends StatefulWidget {
  final MovieDetailsEntity details;

  const DetailsTabs({super.key, required this.details});

  @override
  State<DetailsTabs> createState() => _DetailsTabsState();
}

class _DetailsTabsState extends State<DetailsTabs> with TickerProviderStateMixin {
  late TabController _tabController;

  final List<String> _tabs = [
    'About Movie',
    'Reviews',
    'Cast',
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
    final movie = widget.details;

    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 14.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          TabBar(
            dividerColor: kDarkBackgroundColor,
            controller: _tabController,
            labelColor: Colors.white,
            unselectedLabelColor: const Color(0xFF67686D),
            indicatorColor: kGreyText,
            indicatorWeight: 2.5,
            labelPadding: const EdgeInsets.symmetric(horizontal: 12),
            isScrollable: true,
            labelStyle: const TextStyle(fontWeight: FontWeight.bold),
            tabs: _tabs.map((e) => Tab(text: e)).toList(),
          ),
          const SizedBox(height: 12),
          SizedBox(
            height: 220,
            child: TabBarView(
              controller: _tabController,
              children: [
                // About Movie Tab
                Padding(
                  padding: const EdgeInsets.only(top: 8.0),
                  child: Text(
                    movie.overview,
                    style: const TextStyle(
                      color: Colors.white,
                      height: 1.6,
                      fontSize: 14,
                    ),
                  ),
                ),
                // Reviews Tab
                const Center(
                  child: Text(
                    'No reviews yet.',
                    style: TextStyle(color: Colors.white),
                  ),
                ),
                // Cast Tab
                Center(
                  child: Text(
                    movie.genres.map((e) => e.name).join(', '), // Example placeholder
                    style: const TextStyle(color: Colors.white),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
