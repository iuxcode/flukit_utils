import 'package:flukit_core/flukit_core.dart';

/// Text utilities extensions on [Flukit]
extension FluTextUtils on Flukit {
  /// Generate [DateTime] from timestamp || must be integer
  DateTime dateFromTimestamp(int timestamp) =>
      DateTime.fromMillisecondsSinceEpoch(timestamp * 1000);
}
