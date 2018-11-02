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
  const SearchPage(this.settingsRepository);
  final SettingsRepository settingsRepository;

  @override
  _SearchPageState createState() => _SearchPageState();
}

class _SearchPageState extends State<SearchPage> {
  bool _isClearButtonVisible = false;
  final TextEditingController _controller = TextEditingController();
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
            style: const TextStyle(color: Colors.white, fontSize: 17.0),
            cursorColor: Colors.white,
            decoration: InputDecoration(
              hintText: AppLocalizations.of(context).search,
              hintStyle: const TextStyle(color: Colors.white70, fontSize: 17.0),
              border: InputBorder.none,
              suffixIcon: _isClearButtonVisible
                  ? IconButton(
                      icon: const Icon(Icons.clear),
                      onPressed: () {
                        _controller.clear();
                        _bloc.querySink.add('');
                        setState(() => _isClearButtonVisible = false);
                      },
                    )
                  : null,
            ),
            onChanged: (String value) {
              if (value.isNotEmpty && !_isClearButtonVisible) {
                setState(() => _isClearButtonVisible = true);
              } else if (value.isEmpty) {
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

  Widget _buildBody() {
    return Stack(
      children: <Widget>[
        StreamBuilder<UnmodifiableListView<ListItem>>(
            initialData: UnmodifiableListView<ListItem>(<ListItem>[]),
            stream: _bloc.movies,
            builder: (BuildContext context,
                AsyncSnapshot<UnmodifiableListView<ListItem>> snapshot) {
              if (snapshot.hasData) {
                print('Snapshot data ${snapshot.data}  SearchPage');
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
        StreamBuilder<ViewStatus>(
          initialData: ViewStatus.Empty,
          stream: _bloc.viewStatus,
          builder: (BuildContext context, AsyncSnapshot<ViewStatus> snapshot) {
            if (snapshot.data == ViewStatus.None) {
              return Container();
            } else if (snapshot.data == ViewStatus.NotFound) {
              return ConfusedTravoltaErrorView(
                  errorMessage:
                      AppLocalizations.of(context).searchNoDataFoundMessage);
            } else {
              return Center(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    const Icon(
                      Icons.search,
                      size: 90.0,
                      color: Colors.grey,
                    ),
                    const SizedBox(
                      height: 16.0,
                    ),
                    Text(
                      AppLocalizations.of(context).searchEmptyViewMessage,
                      style: const TextStyle(fontSize: 18.0),
                    ),
                  ],
                ),
              );
            }
          },
        ),
        StreamBuilder<bool>(
          initialData: false,
          stream: _bloc.isLoading,
          builder: (BuildContext context, AsyncSnapshot<bool> snapshot) {
            return snapshot.data
                ? const Center(child: CircularProgressIndicator())
                : Container();
          },
        ),
      ],
    );
  }

  void _onRetry() {
    _bloc.nextPageRetrySink.add(null);
  }
}
