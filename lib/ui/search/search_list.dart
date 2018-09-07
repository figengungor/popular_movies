import 'package:confused_travolta_error_view/confused_travolta_error_view.dart';
import 'package:flutter/material.dart';
import 'package:popular_movies/bloc/search_bloc/search_bloc.dart';
import 'package:popular_movies/l10n/localizations.dart';
import 'package:popular_movies/model/list_item.dart';
import 'package:popular_movies/ui/search/search_list_item.dart';

class SearchList extends StatefulWidget {
  final SearchBloc bloc;
  final List<ListItem> movies;

  SearchList(this.bloc, this.movies, {Key key}) : super(key: key);

  @override
  _SearchListState createState() {
    print("------createState: SearchList");
    return _SearchListState();
  }
}

class _SearchListState extends State<SearchList> {
  ScrollController _scrollController = ScrollController();

  @override
  void initState() {
    print("------initState: SearchList");
    _scrollController.addListener(_handleNextPageLoading);
    super.initState();
  }

  @override
  void dispose() {
    _scrollController.removeListener(_handleNextPageLoading);
    _scrollController.dispose();
    super.dispose();
  }

  @override
  void didUpdateWidget(SearchList oldWidget) {
    print("------didUpdateWidget: SearchList");
    super.didUpdateWidget(oldWidget);
  }

  @override
  Widget build(BuildContext context) {
    print("------build: SearchList");
    return RefreshIndicator(
      onRefresh: widget.bloc.refresh,
      child: ListView.builder(
        key: widget.key,
        controller: _scrollController,
        itemCount: widget.movies.length,
        itemBuilder: (BuildContext context, int index) {
          return SearchListItem(widget.movies[index], _onRetry);
        },
      ),
    );
  }

  void _handleNextPageLoading() {
    //Start loading next page when visible content 500 pixels close
    //to end of the scroll.
    if (_scrollController.position.extentAfter < 500) {
      widget.bloc.nextPageSink.add(null);
    }
  }

  void _onRetry() {
    widget.bloc.nextPageRetrySink.add(null);
  }
}
