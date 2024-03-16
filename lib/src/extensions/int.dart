// ignore: public_member_api_docs
extension DurationExt on int {
  /// Returns a [Duration] representing the value of the number in seconds.
  Duration get seconds => Duration(seconds: this);

  /// Returns a [Duration] representing the value of the number in days.
  Duration get days => Duration(days: this);

  /// Returns a [Duration] representing the value of the number in hours.
  Duration get hours => Duration(hours: this);

  /// Returns a [Duration] representing the value of the number in minutes.
  Duration get minutes => Duration(minutes: this);

  /// Returns a [Duration] representing the value of the number in milliseconds.
  Duration get milliseconds => Duration(milliseconds: this);

  /// Returns a [Duration] representing the value of the number in milliseconds.
  Duration get ms => milliseconds;

  /// Returns a [Duration] representing the value of the number in microseconds.
  Duration get microseconds => Duration(microseconds: this);
}
