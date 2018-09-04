import 'dart:collection';
import 'package:confused_travolta_error_view/confused_travolta_error_view.dart';
import 'package:flutter/material.dart';
import 'package:popular_movies/bloc/tagged_images_bloc/tagged_images_bloc.dart';
import 'package:popular_movies/l10n/localizations.dart';
import 'package:popular_movies/model/tagged_image.dart';
import 'package:popular_movies/utils/error_utils.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';
import 'package:popular_movies/data/api_constants.dart';

class TaggedImagesPage extends StatefulWidget {
  final int personId;

  TaggedImagesPage(this.personId);

  @override
  _TaggedImagesPageState createState() => _TaggedImagesPageState();
}

class _TaggedImagesPageState extends State<TaggedImagesPage> {
  TaggedImagesBloc _bloc;

  @override
  void initState() {
    _bloc = TaggedImagesBloc();
    _bloc.personIdSink.add(widget.personId);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text(AppLocalizations.of(context).taggedImages)),
      body: _buildBody(),
    );
  }

  Widget _buildBody() => Stack(
        children: <Widget>[
          StreamBuilder(
              stream: _bloc.taggedImages,
              builder: (BuildContext context,
                  AsyncSnapshot<UnmodifiableListView<TaggedImage>> snapshot) {
                if (snapshot.hasData) {
                  return _buildTaggedImagesList(snapshot.data);
                } else if (snapshot.hasError) {
                  return _buildError(snapshot.error);
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

  Widget _buildError(dynamic error) => ConfusedTravoltaErrorView(
        errorMessage: ErrorUtils.getFriendlyNetworkErrorMessage(context, error),
      );

  Widget _buildTaggedImagesList(
      UnmodifiableListView<TaggedImage> taggedImageList) {
    return StaggeredGridView.countBuilder(
      primary: false,
      crossAxisCount: 4,
      mainAxisSpacing: 4.0,
      crossAxisSpacing: 4.0,
      itemBuilder: (context, index) => _buildListItem(taggedImageList[index]),
      itemCount: taggedImageList.length,
      staggeredTileBuilder: (index) => StaggeredTile.fit(2),
    );
  }

  Widget _buildListItem(TaggedImage taggedImage) {
    String name;
    if (taggedImage.mediaType == 'tv') {
      name = taggedImage.media.asMap['name'];
    } else {
      name = taggedImage.media.asMap['title'];
    }
    return Column(
      children: <Widget>[
        Image.network("$imageUrl$pathPosterW342${taggedImage.filePath}"),
        Padding(
          padding: EdgeInsets.all(4.0),
          child: Text(
            name,
            style: TextStyle(fontWeight: FontWeight.bold),
            textAlign: TextAlign.center,
          ),
        )
      ],
    );
  }
}
