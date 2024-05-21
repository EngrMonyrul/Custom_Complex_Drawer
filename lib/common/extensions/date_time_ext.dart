import 'package:intl/intl.dart';

const defaultDateFormat = "dd MMM, yyyy";
const defaultTimeFormat = "hh:mm:ss";

extension DateTimeX on DateTime {
  String dateFormat({String pattern = defaultDateFormat}) =>
      DateFormat(pattern).format(this);

  String timeFormat({String pattern = defaultTimeFormat}) =>
      DateFormat(pattern).format(this);
}
