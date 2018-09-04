import 'dart:async';
import 'dart:io';
import 'package:flutter/material.dart';
import 'package:popular_movies/l10n/localizations.dart';

class ErrorUtils {
  static String getFriendlyNetworkErrorMessage(BuildContext context, dynamic error) {
    switch (error.runtimeType) {
      case TimeoutException:
        return AppLocalizations.of(context).connectionTimeOutError;
      case SocketException:
        return AppLocalizations.of(context).noInternetError;
      default:
        return error.toString();
    }
  }
}
