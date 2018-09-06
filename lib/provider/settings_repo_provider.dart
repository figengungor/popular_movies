import 'package:flutter/material.dart';
import 'package:popular_movies/bloc/favorite_movies_bloc/favorites_repository.dart';
import 'package:popular_movies/bloc/settings_bloc/settings_repository.dart';

class SettingsRepoProvider extends StatelessWidget {
  final SettingsRepository settingsRepository;

  final Widget child;

  SettingsRepoProvider({@required this.child, this.settingsRepository});

  static SettingsRepoProvider of(BuildContext context) {
    return (context.inheritFromWidgetOfExactType(_InheritedSettingsRepoProvider)
            as _InheritedSettingsRepoProvider)
        .data;
  }

  @override
  Widget build(BuildContext context) {
    return _InheritedSettingsRepoProvider(data: this, child: child);
  }
}

class _InheritedSettingsRepoProvider extends InheritedWidget {
  final SettingsRepoProvider data;

  _InheritedSettingsRepoProvider(
      {Key key, @required this.data, @required Widget child})
      : super(key: key, child: child);

  @override
  bool updateShouldNotify(InheritedWidget oldWidget) {
    return true;
  }
}
