import 'package:flutter/material.dart';
import 'package:popular_movies/utils/error_utils.dart';

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
              ErrorUtils.getFriendlyNetworkErrorMessage(error),
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
}
