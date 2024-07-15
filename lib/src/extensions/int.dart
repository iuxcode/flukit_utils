// ignore: public_member_api_docs
extension IntExt on int {
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

  /// format seconds to time
  String timeLeft(int value) {
    int h;
    int m;
    int s;

    h = value ~/ 3600;
    m = (value - h * 3600) ~/ 60;
    s = value - (h * 3600) - (m * 60);

    final hourLeft = h.toString().length < 2 ? '0$h' : h.toString();
    final minuteLeft = m.toString().length < 2 ? '0$m' : m.toString();
    final secondsLeft = s.toString().length < 2 ? '0$s' : s.toString();

    return '$hourLeft : $minuteLeft : $secondsLeft';
  }

  /// Get time from seconds || must be integer
  String timeFromSeconds(int seconds) {
    const secondsInOneHour = 3600;
    const secondsInOneMinute = 60;
    String text;

    if (seconds > secondsInOneHour) {
      final hours = seconds / secondsInOneHour;
      final h = hours.toInt();
      final m = int.tryParse(hours.toString().split('.')[1]);

      text = '${h}m ${m != null ? '${m}s' : ''}';
    } else if (seconds > secondsInOneMinute) {
      final minutes = (seconds / secondsInOneHour) * secondsInOneMinute;
      final m = minutes.toInt();

      /// TODO(iuxcode): review this!
      //int? s = int.tryParse(minutes.toString().split('.')[1]);

      text = '${m}m';
    } else {
      text = '${seconds}s';
    }

    return text;
  }
}
