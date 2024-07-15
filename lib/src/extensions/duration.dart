import 'dart:async';

/// Duration utilities.
extension DurationExt on Duration {
  /// Utility to delay some callback (or code execution).
  ///
  /// Sample:
  /// ```
  /// void main() async {
  ///   final _delay = 3.seconds;
  ///   print('+ wait $_delay');
  ///   await _delay.delay();
  ///   print('- finish wait $_delay');
  ///   print('+ callback in 700ms');
  ///   await 0.7.seconds.delay(() {
  /// }
  ///```
  Future<dynamic> delay([FutureOr<dynamic> Function()? callback]) async =>
      Future.delayed(this, callback);

  /// Duration to formatted string
  /// Eg. To `1:20:10:01`
  String formatted(
    Duration duration, {
    bool withHours = false,
    bool withMilliseconds = false,
  }) {
    final hours = duration.inHours;
    final minutes = duration.inMinutes;
    final seconds = duration.inSeconds % 60;
    final milliseconds = withMilliseconds
        ? ',${(duration.inMilliseconds % 1000).toString()[0]}'
        : '';

    final h = withHours && hours > 0
        ? '${hours < 10 ? "$hours" : hours.toString()}:'
        : '';
    final min = minutes < 10 && minutes != 0 ? '0$minutes' : minutes.toString();
    final sec = seconds < 10 ? '0$seconds' : seconds.toString();

    return '$h:$min:$sec:$milliseconds';
  }
}
