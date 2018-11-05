import 'dart:collection';
import 'package:confused_travolta_error_view/confused_travolta_error_view.dart';
import 'package:flutter/material.dart';
import 'package:popular_movies/model/list_item.dart';
import 'package:popular_movies/bloc/movie_bloc/movie_bloc.dart';
import 'package:popular_movies/l10n/localizations.dart';
import 'package:popular_movies/ui/home/movie_list.dart';
import 'package:popular_movies/utils/error_utils.dart';

class MoviePage extends StatefulWidget {
  final MovieBloc bloc;

  const MoviePage(this.bloc, {Key key}) : super(key: key);

  @override
  _MoviePageState createState() => _MoviePageState();
}

class _MoviePageState extends State<MoviePage> {
  @override
  void initState() {
    if (widget.bloc.isListEmpty()) {
      widget.bloc.firstPageSink.add(null);
    }
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: <Widget>[
        StreamBuilder<UnmodifiableListView<ListItem>>(
            stream: widget.bloc.movies,
            builder: (BuildContext context,
                AsyncSnapshot<UnmodifiableListView<ListItem>> snapshot) {
              if (snapshot.hasData) {
                print('Snapshot data ${snapshot.data}  MoviePage');
                return MovieList(widget.bloc, snapshot.data, key: widget.key);
              } else if (snapshot.hasError) {
                return ConfusedTravoltaErrorView(
                  errorMessage:
                      getFriendlyNetworkErrorMessage(context, snapshot.error),
                  onTapRetryButton: _onRetry,
                  retryButtonText: AppLocalizations.of(context).retry,
                );
              } else {
                return Container();
              }
            }),
        StreamBuilder<bool>(
            initialData: false,
            stream: widget.bloc.isLoading,
            builder: (BuildContext context, AsyncSnapshot<bool> snapshot) {
              return snapshot.data
                  ? const Center(child: CircularProgressIndicator())
                  : Container();
            }),
      ],
    );
  }

  void _onRetry() {
    widget.bloc.firstPageSink.add(null);
  }
}
