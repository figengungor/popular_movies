import 'package:flutter/material.dart';
import 'package:popular_movies/bloc/favorite_movies_bloc/favorites_repository.dart';
import 'package:popular_movies/l10n/localizations.dart';
import 'package:popular_movies/provider/favorite_repo_provider.dart';
import 'package:popular_movies/ui/home/home_page.dart';
import 'package:flutter_localizations/flutter_localizations.dart';

void main() {
  runApp(
    FavoriteRepoProvider(
      favoritesRepository: FavoritesRepository(),
      child: MyApp(),
    ),
  );
}

class MyApp extends StatelessWidget {
  MyApp();

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      localizationsDelegates: [
        AppLocalizationsDelegate(),
        GlobalMaterialLocalizations.delegate,
        GlobalWidgetsLocalizations.delegate,
      ],
      supportedLocales: [
        Locale('en', ''),
        Locale('tr', ''),
      ],
      debugShowCheckedModeBanner: false,
      onGenerateTitle: (BuildContext context) =>
          AppLocalizations.of(context).appTitle,
      theme: ThemeData(
        primarySwatch: Colors.blue,
        accentColor: Colors.pink,
        buttonColor: Colors.pink,
      ),
      routes: {
        '/': (context) => HomePage(
            repo: FavoriteRepoProvider.of(context).favoritesRepository),
      },
    );
  }
}
