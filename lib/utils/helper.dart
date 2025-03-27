import 'package:intl/intl.dart';

class Helper {
  const Helper._();

  static String dateTimeToString(DateTime date) {
    return DateFormat('yyyy-MM-dd HH:mm').format(date);
  }

  static DateTime stringToDateTime(String dateString) {
    return DateFormat('yyyy-MM-dd HH:mm').parse(dateString);
  }
}
