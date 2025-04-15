import 'package:dio/dio.dart';
import 'package:egb_task/core/network/api_util.dart';
import 'package:egb_task/core/routes/route.dart';
import 'package:egb_task/core/routes/route_path.dart';
import 'package:egb_task/features/home_screen/presentaion/screens_ui/home_screen.dart';
import 'package:flutter/material.dart';

void main() {
  ApiUtil(Dio());
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      onGenerateRoute: AppRoute.generateRoute,
      initialRoute: RoutePath.homeScreen,
    );
  }
}
