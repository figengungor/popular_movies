import 'package:flutter/material.dart';
import 'package:popular_movies/bloc/favorite_movies_bloc/favorites_repository.dart';

class FavoriteRepoProvider extends StatefulWidget {

  final FavoritesRepository favoritesRepository;

  final Widget child;

  FavoriteRepoProvider({
    @required this.child,
    this.favoritesRepository
  });

  static _FavoriteRepoProviderState of(BuildContext context) {
    return (context.inheritFromWidgetOfExactType(
        _InheritedFavoriteRepoProvider) as _InheritedFavoriteRepoProvider).data;
  }

  @override
  _FavoriteRepoProviderState createState() => _FavoriteRepoProviderState();
}

class _FavoriteRepoProviderState extends State<FavoriteRepoProvider> {

  FavoritesRepository favoritesRepository;


  @override
  void initState() {
    favoritesRepository = widget.favoritesRepository;
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return _InheritedFavoriteRepoProvider(data: this, child: widget.child);
  }
}

class _InheritedFavoriteRepoProvider extends InheritedWidget {
  final _FavoriteRepoProviderState data;

  _InheritedFavoriteRepoProvider({
    Key key,
    @required this.data,
    @required Widget child
  }) : super(key: key, child: child);

  @override
  bool updateShouldNotify(InheritedWidget oldWidget) {
    return true;
  }

}