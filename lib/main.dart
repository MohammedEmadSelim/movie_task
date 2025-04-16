import 'package:egb_task/core/hive/adaptors/movie_entity.dart';
import 'package:egb_task/core/hive/boxes/boxes.dart';
import 'package:egb_task/core/routes/route.dart';
import 'package:egb_task/core/routes/route_path.dart';
import 'package:egb_task/core/service_locator/injector.dart' as injector;
import 'package:egb_task/core/utilts/my_bloc_observer.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hive_flutter/hive_flutter.dart';

void main() async{
  WidgetsFlutterBinding.ensureInitialized();
  await Hive.initFlutter();
  Hive.registerAdapter(MovieEntityAdapter()); // custom adapter
  watchListBox = await Hive.openBox<MovieEntity>('watchlist');
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
