import 'dart:async';
import 'dart:io';

import 'package:flutter/material.dart';

class ErrorMessage extends StatelessWidget {
  final dynamic error;
  final VoidCallback onRetry;

  ErrorMessage(this.error, {this.onRetry});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Text(
              _getFriendlyErrorMessage(error),
              textAlign: TextAlign.center,
            ),
            onRetry != null
                ? FlatButton(
                    onPressed: onRetry,
                    child: Text('RETRY'),
                    textColor: Theme.of(context).buttonColor,
                  )
                : Container(),
          ],
        ),
      ),
    );
  }

  String _getFriendlyErrorMessage(error) {
    switch (error.runtimeType) {
      case TimeoutException:
        return "Connection timeout.";
      case SocketException:
        return "No Internet. Open your Internet connection.";
      default:
        return error.toString();
    }
  }
}
