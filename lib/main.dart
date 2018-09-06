import 'package:flutter/material.dart';
import 'package:popular_movies/bloc/favorite_movies_bloc/favorites_repository.dart';
import 'package:popular_movies/bloc/settings_bloc/settings_repository.dart';
import 'package:popular_movies/l10n/localizations.dart';
import 'package:popular_movies/provider/favorite_repo_provider.dart';
import 'package:popular_movies/provider/settings_repo_provider.dart';
import 'package:popular_movies/ui/home/home_page.dart';
import 'package:flutter_localizations/flutter_localizations.dart';

void main() {
  runApp(
    SettingsRepoProvider(
      settingsRepository: SettingsRepository(),
      child: FavoriteRepoProvider(
        favoritesRepository: FavoritesRepository(),
        child: MyApp(),
      ),
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
        Locale('ar', ''),
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
              repo: FavoriteRepoProvider.of(context).favoritesRepository,
              settingsRepository:
                  SettingsRepoProvider.of(context).settingsRepository,
            ),
      },
    );
  }
}
