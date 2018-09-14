import 'package:intl/intl.dart';

class DateUtils {
  static String getYear(String dateStr) {
    try {
      var formatter = new DateFormat('yyyy-MM-dd');
      DateTime date = formatter.parseStrict(dateStr);
      return date.year.toString();
    } catch (error) {
      return dateStr;
    }
  }
}
