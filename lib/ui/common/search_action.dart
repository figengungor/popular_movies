import 'package:flutter/material.dart';
import 'package:popular_movies/provider/settings_repo_provider.dart';
import 'package:popular_movies/ui/search/search_page.dart';

class SearchAction extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return IconButton(icon: Icon(Icons.search), onPressed: () => _openSearchPage(context),);
  }

  void _openSearchPage(BuildContext context) {
    Navigator.push(
          context,
          MaterialPageRoute(
            builder: (BuildContext context) {
              return SearchPage(SettingsRepoProvider.of(context).settingsRepository);
            },
          ),
        );
  }
}
