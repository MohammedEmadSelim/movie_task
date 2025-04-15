import 'package:dio/dio.dart';
import 'package:egb_task/core/routes/route.dart';
import 'package:egb_task/core/routes/route_path.dart';
import 'package:egb_task/core/service_locator/injector.dart' as injector;
import 'package:egb_task/core/utilts/my_bloc_observer.dart';
import 'package:egb_task/features/home_screen/presentaion/screens_ui/home_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

void main() {
  injector.init();
  Bloc.observer = MyBlocObserver();

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
