import 'package:intl/intl.dart';

class DateTimeHelper {
  static String formatDateDb = 'y-MM-dd';
  static String formatDateHuman = 'dd MMM yyyy';

  static String formatDbToHuman({required String date}) {
    var parse = DateFormat(formatDateDb).parse(date);
    var format = DateFormat(formatDateHuman).format(parse);

    return format;
  }
}
