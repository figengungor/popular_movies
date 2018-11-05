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

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      localizationsDelegates: const <LocalizationsDelegate<dynamic>>[
        AppLocalizationsDelegate(),
        GlobalMaterialLocalizations.delegate,
        GlobalWidgetsLocalizations.delegate,
      ],
      supportedLocales: const <Locale>[
        Locale('en', ''),
        Locale('tr', ''),
        Locale('ar', ''),
      ],
      debugShowCheckedModeBanner: false,
      onGenerateTitle: (BuildContext context) =>
          AppLocalizations.of(context).appTitle,
      theme: ThemeData(
        primaryColorBrightness: Brightness.dark,
        primaryColor: Colors.black,
        primaryTextTheme: ThemeData.dark().primaryTextTheme.copyWith(
          title: TextStyle(color: Colors.green)
        ),
        accentColor: Colors.pink,
        buttonColor: Colors.pink,
        fontFamily: 'Abel'
      ),
      routes: <String, WidgetBuilder>{
        '/': (BuildContext context) => HomePage(
              repo: FavoriteRepoProvider.of(context).favoritesRepository,
              settingsRepository:
                  SettingsRepoProvider.of(context).settingsRepository,
            ),
      },
    );
  }
}
