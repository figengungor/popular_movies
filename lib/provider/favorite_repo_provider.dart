import 'package:flutter/material.dart';
import 'package:popular_movies/bloc/favorite_movies_bloc/favorites_repository.dart';

class FavoriteRepoProvider extends StatelessWidget {
  final FavoritesRepository favoritesRepository;

  final Widget child;

  const FavoriteRepoProvider({@required this.child, this.favoritesRepository});

  static FavoriteRepoProvider of(BuildContext context) {
    return (context.inheritFromWidgetOfExactType(_InheritedFavoriteRepoProvider)
            as _InheritedFavoriteRepoProvider)
        .data;
  }

  @override
  Widget build(BuildContext context) {
    return _InheritedFavoriteRepoProvider(data: this, child: child);
  }
}

class _InheritedFavoriteRepoProvider extends InheritedWidget {
  final FavoriteRepoProvider data;

  _InheritedFavoriteRepoProvider(
      {Key key, @required this.data, @required Widget child})
      : super(key: key, child: child);

  @override
  bool updateShouldNotify(InheritedWidget oldWidget) {
    return true;
  }
}
