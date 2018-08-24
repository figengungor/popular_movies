import 'dart:async';

import 'dart:io';

class ErrorUtils {
  static String getFriendlyNetworkErrorMessage(error) {
    switch (error.runtimeType) {
      case TimeoutException:
        return "Connection timeout.";
      case SocketException:
        return "You have no Internet connection.";
      default:
        return error.toString();
    }
  }
}
