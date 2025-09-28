import 'package:flutter/material.dart';
import 'package:tmdb/features/movie_list/presentation/screens/movie_list_screen.dart';

import 'core/di/service_locator.dart';

void main() async{
  WidgetsFlutterBinding.ensureInitialized();
  await initDependencies();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'TMDB',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
      ),
      home: MovieListScreen(),
    );
  }
}
