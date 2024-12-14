import 'package:intl/intl.dart';

class DifferentTimeClass {
  static int calculateMinutes(String time1, String time2) {
    DateFormat format1 = DateFormat.Hm();
    DateFormat format2 = DateFormat.Hms();

    DateTime t1 = format1.parse(time1);
    DateTime t2 = format2.parse(time2);

    int minutes = t2.difference(t1).inMinutes;
    if (minutes < 0) {
      return 0;
    }
    return minutes;
  }

  static int calculateHours(String time1, String time2) {
    DateFormat format = DateFormat.Hm();

    DateTime t1 = format.parse(time1);
    DateTime t2 = format.parse(time2);

    int hours = t2.difference(t1).inHours;

    return hours;
  }
}
