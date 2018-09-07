import 'dart:collection';

import 'package:confused_travolta_error_view/confused_travolta_error_view.dart';
import 'package:flutter/material.dart';
import 'package:popular_movies/bloc/search_bloc/search_bloc.dart';
import 'package:popular_movies/bloc/search_bloc/search_repository.dart';
import 'package:popular_movies/bloc/settings_bloc/settings_repository.dart';
import 'package:popular_movies/l10n/localizations.dart';
import 'package:popular_movies/model/list_item.dart';
import 'package:popular_movies/ui/search/search_list.dart';
import 'package:popular_movies/utils/error_utils.dart';

class SearchPage extends StatefulWidget {
  final SettingsRepository settingsRepository;

  SearchPage(this.settingsRepository);

  @override
  _SearchPageState createState() => _SearchPageState();
}

class _SearchPageState extends State<SearchPage> {
  bool _isClearButtonVisible = false;
  TextEditingController _controller = TextEditingController();
  SearchBloc _bloc;

  @override
  void initState() {
    _bloc = SearchBloc(SearchRepository(), widget.settingsRepository);
    super.initState();
  }

  @override
  void dispose() {
    _bloc.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Theme(
          data: Theme.of(context).copyWith(primaryColor: Colors.white),
          child: TextField(
            autofocus: true,
            controller: _controller,
            style: TextStyle(color: Colors.white, fontSize: 17.0),
            cursorColor: Colors.white,
            decoration: InputDecoration(
              hintText: AppLocalizations.of(context).search,
              hintStyle: TextStyle(color: Colors.white70, fontSize: 17.0),
              border: InputBorder.none,
              suffixIcon: _isClearButtonVisible
                  ? IconButton(
                      icon: Icon(Icons.clear),
                      onPressed: () {
                        _controller.clear();
                        _bloc.querySink.add('');
                        setState(() => _isClearButtonVisible = false);
                      },
                    )
                  : null,
            ),
            onChanged: (value) {
              if (value.length > 0 && !_isClearButtonVisible) {
                setState(() => _isClearButtonVisible = true);
              } else if (value.length == 0) {
                setState(() => _isClearButtonVisible = false);
              }
              _bloc.querySink.add(value);
            },
          ),
        ),
      ),
      body: _buildBody(),
    );
  }

  _buildBody() {
    return Stack(
      children: <Widget>[
        StreamBuilder<UnmodifiableListView<ListItem>>(
          initialData: UnmodifiableListView([]),
            stream: _bloc.movies,
            builder: (BuildContext context,
                AsyncSnapshot<UnmodifiableListView<ListItem>> snapshot) {
              if (snapshot.hasData) {
                print("Snapshot data ${snapshot.data}  SearchPage");
                return SearchList(_bloc, snapshot.data);
              } else if (snapshot.hasError) {
                return ConfusedTravoltaErrorView(
                  errorMessage: ErrorUtils.getFriendlyNetworkErrorMessage(
                      context, snapshot.error),
                  onTapRetryButton: _onRetry,
                  retryButtonText: AppLocalizations.of(context).retry,
                );
              } else {
                return Container();
              }
            }),
        StreamBuilder(
            initialData: false,
            stream: _bloc.isLoading,
            builder: (BuildContext context, AsyncSnapshot<bool> snapshot) {
              return snapshot.data
                  ? Center(child: CircularProgressIndicator())
                  : Container();
            }),
      ],
    );
  }

  void _onRetry() {
    _bloc.nextPageRetrySink.add(null);
  }
}
