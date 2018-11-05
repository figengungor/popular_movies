import 'package:intl/intl.dart';

String getYear(String dateStr) {
  try {
    final DateFormat formatter = DateFormat('yyyy-MM-dd');
    final DateTime date = formatter.parseStrict(dateStr);
    return date.year.toString();
  } catch (error) {
    return dateStr;
  }
}

String getFormattedDate(String dateStr) {
  try {
    DateFormat formatter = DateFormat('yyyy-MM-dd');
    final DateTime date = formatter.parseStrict(dateStr);
    formatter = DateFormat('MMM dd, yyyy');
    return formatter.format(date);
  } catch (error) {
    return dateStr;
  }
}
