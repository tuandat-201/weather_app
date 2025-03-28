import 'package:intl/intl.dart';
import 'package:weather_app/data/model/models.dart';

class Helper {
  const Helper._();

  static String dateTimeToString(DateTime date) {
    return DateFormat('yyyy-MM-dd HH:mm').format(date);
  }

  static DateTime stringToDateTime(String dateString) {
    return DateFormat('yyyy-MM-dd HH:mm').parse(dateString);
  }

  static String convertTimeTo24HourTime(String time) {
    DateTime date = DateFormat("H:mm a").parse(time);
    return DateFormat.Hm().format(date);
  }

  static String convertDateTo24HourTime(String time) {
    DateTime date = DateFormat("yyyy-MM-dd HH:mm").parse(time);
    if (date.hour != 0) {
      return DateFormat.Hm().format(date);
    } else {
      return DateFormat('HH:mm (dd/MM)').format(date);
    }
  }

  static String convertDateToShorter(String dateString) {
    DateTime date = DateFormat("yyyy-MM-dd").parse(dateString);

    return DateFormat('dd/MM').format(date);
  }

  static String getWeatherIcon(int code, bool isDay) {
    for (var item in weatherIcons) {
      if (item['code'] == code) {
        return isDay ? item['day'] : item['night'];
      }
    }
    return "";
  }
}
