import 'package:flutter/material.dart';
import 'package:popular_movies/bloc/settings_bloc/settings_bloc.dart';

class LanguageSetting extends StatefulWidget {
  final SettingsBloc bloc;

  LanguageSetting(this.bloc);

  @override
  _LanguageSettingState createState() => _LanguageSettingState();
}

class _LanguageSettingState extends State<LanguageSetting> {
  final languagesMap = {
    'tr': 'Türkçe',
    'en': 'English',
    'fr': 'Français',
    'de': 'Deuthch',
    'ar': 'العربية',
    'es': 'Español',
  };

  @override
  void initState() {
    widget.bloc.getContentLanguage();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return StreamBuilder<String>(
      stream: widget.bloc.contentLanguage,
      builder: (BuildContext context, AsyncSnapshot<String> snapshot) {
        if (snapshot.hasData) {
          return _buildLanguageSetting(snapshot.data);
        } else if (snapshot.hasError) {
          return _buildErrorView(snapshot.error);
        }
        return Container();
      },
    );
  }

  Widget _buildLanguageSetting(String language) {
    return FlatButton.icon(
      textColor: Colors.white,
      icon: Icon(Icons.language),
      label: Text(language),
      onPressed: () {
        _showSingleChoiceAlertDialog(languagesMap, language);
      },
    );
  }

  Widget _buildErrorView(Object error) {
    print(error.toString());
    return Container();
  }

  _showSingleChoiceAlertDialog(Map<String, String> languagesMap, String language) {
    showDialog(
        context: context,
        builder: (context) =>
            LanguageChoiceDialog(languagesMap, language, _onLanguageChanged));
  }

  _onLanguageChanged(String language) {
    widget.bloc.contentLanguageSink.add(language);
  }
}

class LanguageChoiceDialog extends StatefulWidget {
  final Map<String, String> languagesMap;
  final String initialLanguage;
  final ValueChanged<String> onLanguageChanged;

  LanguageChoiceDialog(this.languagesMap, this.initialLanguage,
      this.onLanguageChanged);

  @override
  _LanguageChoiceDialogState createState() => _LanguageChoiceDialogState();
}

class _LanguageChoiceDialogState extends State<LanguageChoiceDialog> {
  String _language;

  @override
  void initState() {
    _language = widget.initialLanguage;
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      contentPadding: EdgeInsets.all(0.0),
      title: Text('Content Language'),
      content: _buildContent(),
      actions: <Widget>[
        FlatButton(
          child: Text('CANCEL'),
          onPressed: () {
            Navigator.pop(context);
          },
        ),
        FlatButton(
          child: Text('OK'),
          onPressed: () {
            Navigator.pop(context);
            widget.onLanguageChanged(_language);
          },
        )
      ],
    );
  }

  _buildContent() {
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: <Widget>[
        SizedBox(
          height: 24.0,
        ),
        Divider(
          height: 0.0,
        ),
        ListView(
          shrinkWrap: true,
          children: widget.languagesMap.keys
              .map(
                (languageKey) =>
                RadioListTile(
                  title: Text(widget.languagesMap[languageKey]),
                  value: languageKey,
                  groupValue: _language,
                  onChanged: (value) {
                    setState(() {
                      _language = value;
                    });
                  },
                ),
          )
              .toList(),
        ),
        Divider(
          height: 0.0,
        ),
      ],
    );
  }
}
