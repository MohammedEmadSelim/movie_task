import 'package:egb_task/core/constants/icons.dart';
import 'package:egb_task/core/theme/colors.dart';
import 'package:egb_task/core/widgets/custom_nav_icon.dart';
import 'package:egb_task/features/home_screen/presentaion/screens_ui/home_screen.dart';
import 'package:egb_task/features/search/presentaion/screens_ui/search_screen.dart';
import 'package:egb_task/features/watch_list/presentaion/screens_ui/watch_list_screen.dart';
import 'package:flutter/material.dart';

class MainNavigation extends StatefulWidget {
  const MainNavigation({Key? key}) : super(key: key);

  @override
  State<MainNavigation> createState() => _MainNavigationState();
}

class _MainNavigationState extends State<MainNavigation> {
  int _currentIndex = 0;

  final List<Widget> _screens = const [
    HomeScreen(),
    SearchScreen(),
    WatchListScreen(),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: kDarkBackgroundColor,
      body: _screens[_currentIndex],
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: _currentIndex,
        backgroundColor: kDarkBackgroundColor,
        selectedItemColor: kAccentBlue,
        unselectedItemColor: kGreyText,
        type: BottomNavigationBarType.fixed,
        onTap: (index) => setState(() => _currentIndex = index),
        items: [
          BottomNavigationBarItem(
            icon: CustomNavIcon(
                assetName: AppIcons.home,isActive: _currentIndex == 0,),
            label: 'Home',
          ),
          BottomNavigationBarItem(
            icon: CustomNavIcon(
              assetName: AppIcons.search,isActive: _currentIndex == 1,),
            label: 'Search',
          ),
          BottomNavigationBarItem(
            icon: CustomNavIcon(
              assetName: AppIcons.watchList,isActive: _currentIndex == 2,),
            label: 'Watch list',
          ),
        ],
      ),
    );
  }
}
