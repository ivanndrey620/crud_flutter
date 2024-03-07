import 'package:intl/intl.dart';

class DateUtil {
  const DateUtil();

  static String today() {
    final format = DateFormat('dd/MM/yy');
    return format.format(DateTime.now());
  }
}

extension OnDateTimeExtension on DateTime {
  String prettyDate() {
    final format = DateFormat('dd/MM/yy');
    return format.format(this);
  }
}
