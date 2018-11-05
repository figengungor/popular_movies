import 'package:flutter/material.dart';
import 'package:popular_movies/bloc/settings_bloc/settings_bloc.dart';
import 'package:easy_dialogs/single_choice_confirmation_dialog.dart';

class LanguageSetting extends StatefulWidget {
  const LanguageSetting(this.bloc);
  final SettingsBloc bloc;
  @override
  _LanguageSettingState createState() => _LanguageSettingState();
}

class _LanguageSettingState extends State<LanguageSetting> {
  final Map<String, String> languagesMap = <String,String>{
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
      icon: const Icon(Icons.language),
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

  void _showSingleChoiceAlertDialog(
      Map<String, String> languagesMap, String language) {
    showDialog<void>(
        context: context,
        builder: (_) =>
            SingleChoiceConfirmationDialog<String>(
              title: const Text('Choose a language'),
                initialValue:language,
                items:languagesMap.keys.toList(),
                itemBuilder: (String key) => Text(languagesMap[key]),
                onSubmitted: _onLanguageChanged));
  }

  void _onLanguageChanged(String language) {
    widget.bloc.contentLanguageSink.add(language);
  }
}
