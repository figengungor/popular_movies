import 'dart:async';
import 'dart:io';
import 'package:flutter/material.dart';
import 'package:popular_movies/l10n/localizations.dart';

String getFriendlyNetworkErrorMessage(BuildContext context, dynamic error) {
  if (error is TimeoutException) {
    return AppLocalizations.of(context).connectionTimeOutError;
  }
  if (error is SocketException) {
    return AppLocalizations.of(context).noInternetError;
  } else {
    return error.toString();
  }
}
