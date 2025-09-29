import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hive_flutter/adapters.dart';
import 'package:tmdb/features/app/main_screen.dart';
import 'package:tmdb/features/movie_list/presentation/screens/movie_list_screen.dart';

import 'core/di/service_locator.dart';
import 'features/movie_list/data/models/movie_model.dart';
import 'features/movie_list/presentation/bloc/movie_list_bloc.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await initDependencies();
  await Hive.initFlutter();
  Hive.registerAdapter(MovieModelAdapter()); // اینو build_runner برات ساخته
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'TMDB',
      theme: ThemeData(colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple)),
      home: MainPage()
    );
  }
}
