import 'package:flutter/material.dart';
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
      title: 'Popular Movies',
      theme: ThemeData(
        primarySwatch: Colors.blue,
        accentColor: Colors.pink,
        buttonColor: Colors.pink,
      ),
      routes: {
        '/': (context) => HomePage(),
      },
    );
  }
}
