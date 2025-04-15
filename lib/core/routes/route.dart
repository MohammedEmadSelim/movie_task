import 'package:egb_task/core/routes/route_path.dart';
import 'package:egb_task/dashboard.dart';
import 'package:egb_task/features/home_screen/presentaion/screens_ui/home_screen.dart';
import 'package:flutter/material.dart';

class AppRoute {
  static Route? generateRoute(RouteSettings settings) {
    Map? arguments = settings.arguments as Map<String, dynamic>?;

    switch (settings.name) {
      case RoutePath.homeScreen:
        return MaterialPageRoute(builder: (_) => const MainNavigation());
    }
    return null;
  }
}
