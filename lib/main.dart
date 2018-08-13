import 'package:flutter/material.dart';
import 'package:popular_movies/bloc/movie_bloc.dart';
import 'package:popular_movies/bloc/movie_repository.dart';
import 'package:popular_movies/pages/home/home_page.dart';

void main() {
  final MovieBloc bloc = MovieBloc(MovieRepository());
  runApp(MyApp(bloc: bloc));
}

class MyApp extends StatelessWidget {
  final MovieBloc bloc;
  MyApp({this.bloc});

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
        '/': (context) => HomePage(bloc: bloc),
      },
    );
  }
}
