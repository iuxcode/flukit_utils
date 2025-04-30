import 'package:intl/intl.dart';
import 'package:timeago/timeago.dart' as tago;

// ignore: public_member_api_docs
extension DateTimeExt on DateTime {
  /// Get only the time from a date
  String timeString(
    DateTime date, {
    bool seconds = false,
    String? locale,
  }) =>
      format(date, 'HH:mm${seconds ? ':ss' : ''}', locale);

  /// Creates a new DateFormat, using the format specified by [pattern].
  String format(
    DateTime date, [
    String pattern = 'EEEE, MMM dd',
    String? locale,
  ]) =>
      DateFormat(pattern, locale).format(date);

  /// Formats provided [DateTime] to a fuzzy time like 'a moment ago'
  String timeago(DateTime dateTime, {String locale = 'en'}) =>
      tago.format(dateTime, locale: locale);
}
