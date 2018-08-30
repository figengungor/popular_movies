import 'package:confused_travolta_error_view/confused_travolta_error_view.dart';
import 'package:flutter/material.dart';
import 'package:popular_movies/bloc/person_detail_bloc/person_detail_bloc.dart';
import 'package:popular_movies/model/external_ids.dart';
import 'package:popular_movies/model/person_detail.dart';
import 'package:popular_movies/ui/common/social_icon.dart';
import 'package:popular_movies/ui/tagged_images/tagged_images_page.dart';
import 'package:popular_movies/utils/error_utils.dart';
import 'package:popular_movies/data/api_constants.dart';

class PersonDetailPage extends StatefulWidget {
  final int personId;
  final String personName;

  PersonDetailPage(this.personId, this.personName);

  @override
  _PersonDetailPageState createState() => _PersonDetailPageState();
}

class _PersonDetailPageState extends State<PersonDetailPage> {
  PersonDetailBloc _bloc;

  @override
  void initState() {
    _bloc = PersonDetailBloc();
    _bloc.personIdSink.add(widget.personId);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('${widget.personName}'),
      ),
      body: _buildBody(),
    );
  }

  Widget _buildBody() => Stack(
        children: <Widget>[
          StreamBuilder(
              stream: _bloc.personDetail,
              builder:
                  (BuildContext context, AsyncSnapshot<PersonDetail> snapshot) {
                if (snapshot.hasData) {
                  return _buildPersonDetail(snapshot.data);
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

  Widget _buildPersonDetail(PersonDetail personDetail) {
    print("$imageUrl$pathPosterW342${personDetail.profilePath}");
    return SingleChildScrollView(
      child: Center(
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            children: <Widget>[
              _buildProfilePhoto(
                  "$imageUrl$pathPosterW342${personDetail.profilePath}"),
              _buildVerticalSpace(space: 16.0),
              _buildDates(personDetail.birthday, personDetail.deathday),
              _buildVerticalSpace(),
              _buildBirthPlace(personDetail.placeOfBirth),
              _buildVerticalSpace(space: 16.0),
              _buildSocialIcons(personDetail.externalIds),
              _buildVerticalSpace(space: 16.0),
              _buildTaggedImagesButton(),
              _buildVerticalSpace(space: 16.0),
              _buildBiography(personDetail.biography)
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildError(dynamic error) => ConfusedTravoltaErrorView(
        errorMessage: ErrorUtils.getFriendlyNetworkErrorMessage(error),
      );

  Widget _buildVerticalSpace({double space}) => SizedBox(
        height: space ?? 8.0,
      );

  Widget _buildHorizontalSpace({double space}) => SizedBox(
        width: space ?? 8.0,
      );

  Widget _buildProfilePhoto(String profileUrl) => CircleAvatar(
        radius: 100.0,
        backgroundImage: NetworkImage(profileUrl),
        backgroundColor: Theme.of(context).primaryColor,
      );

  Widget _buildDates(String birthDay, String deathDay) =>
      Text("${birthDay ?? ''} - ${deathDay ?? ''}");

  Widget _buildBirthPlace(String placeOfBirth) =>
      placeOfBirth == null ? Container() : Text(placeOfBirth);

  Widget _buildSocialIcons(ExternalIds ids, {iconSize = 32.0}) => Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          SocialIcon(
            iconPath: "assets/icons/twitter.png",
            url: "https://twitter.com/",
            id: ids.twitterId,
          ),
          _buildHorizontalSpace(),
          SocialIcon(
            iconPath: "assets/icons/facebook.png",
            url: "https://www.facebook.com/",
            id: ids.facebookId,
          ),
          _buildHorizontalSpace(),
          SocialIcon(
            iconPath: "assets/icons/instagram.png",
            url: "https://www.instagram.com/",
            id: ids.instagramId,
          ),
        ],
      );

  Widget _buildBiography(String biography) => Text(biography);

  Widget _buildTaggedImagesButton() {
    return RaisedButton(
      onPressed: () {
        _openTaggedImagesPage();
      },
      child: Text(
        'Tagged Images',
        style: TextStyle(color: Colors.white),
      ),
      color: Theme.of(context).accentColor,
    );
  }

  void _openTaggedImagesPage() {
    Navigator.push(context, MaterialPageRoute(builder: (BuildContext context) {
      return TaggedImagesPage(widget.personId);
    }));
  }
}
