import 'dart:math';

import 'package:intl/intl.dart';

// ignore: public_member_api_docs
extension DoubleExt on double {
  /// Returns the value of the number with the specified number
  /// of digits after the decimal point.
  double toPrecision(int fractionDigits) {
    final mod = pow(10, fractionDigits.toDouble()).toDouble();
    return (this * mod).round().toDouble() / mod;
  }

  /// Returns a [Duration] representing the value of the number in milliseconds.
  Duration get milliseconds => Duration(microseconds: (this * 1000).round());

  /// Returns a [Duration] representing the value of the number in milliseconds.
  Duration get ms => milliseconds;

  /// Returns a [Duration] representing the value of the number in seconds.
  Duration get seconds => Duration(milliseconds: (this * 1000).round());

  /// Returns a [Duration] representing the value of the number in minutes.
  Duration get minutes =>
      Duration(seconds: (this * Duration.secondsPerMinute).round());

  /// Returns a [Duration] representing the value of the number in hours.
  Duration get hours =>
      Duration(minutes: (this * Duration.minutesPerHour).round());

  /// Returns a [Duration] representing the value of the number in days.
  Duration get days => Duration(hours: (this * Duration.hoursPerDay).round());

  /// A number format for compact representations,
  /// e.g. "1.2M" instead of "1,200,000".
  String get compactFormat => NumberFormat.compact().format(this);
}
