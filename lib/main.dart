import 'package:flutter/material.dart';
import 'package:popular_movies/bloc/movie_bloc.dart';
import 'package:popular_movies/bloc/movie_repository.dart';
import 'package:popular_movies/pages/home/home_page.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  MyApp();

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
        buttonColor: Colors.pink,
      ),
      routes: {
        '/': (context) => HomePage(),
      },
    );
  }
}
