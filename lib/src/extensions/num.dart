import 'dart:async';
import 'package:flukit_utils/src/_utils.dart';

// ignore: public_member_api_docs
extension NumExt on num {
  /// Returns true if the number is lower than [b], otherwise returns false.
  bool isLowerThan(num b) => FluUtils.isLowerThan(this, b);

  /// Returns true if the number is greater than [b], otherwise returns false.
  bool isGreaterThan(num b) => FluUtils.isGreaterThan(this, b);

  /// Returns true if the number is equal to [b], otherwise returns false.
  bool isEqual(num b) => FluUtils.isEqual(this, b);

  /// A function that returns the absolute value of the input number.
  num toPositive() {
    if (isNegative) {
      return -this;
    }

    return this;
  }

  /// Utility to delay some callback (or code execution).
  /// TODO: Add a separated implementation of delay() with the ability
  /// to stop it.
  ///
  /// Sample:
  /// ```
  /// void main() async {
  ///   print('+ wait for 2 seconds');
  ///   await 2.delay();
  ///   print('- 2 seconds completed');
  ///   print('+ callback in 1.2sec');
  ///   1.delay(() => print('- 1.2sec callback called'));
  ///   print('currently running callback 1.2sec');
  /// }
  ///```
  Future<dynamic> delay([FutureOr<dynamic> Function()? callback]) async =>
      Future.delayed(
        Duration(milliseconds: (this * 1000).round()),
        callback,
      );
}
