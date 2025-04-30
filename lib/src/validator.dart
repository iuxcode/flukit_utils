import 'package:flukit_core/flukit_core.dart';
import 'package:phone_numbers_parser/phone_numbers_parser.dart';

// ignore: public_member_api_docs
extension ValidatorExt on Flukit {
  /// Verify if the [phoneNumber] is a correct
  bool validatePhoneNumber(String phoneNumber) {
    return PhoneNumber.parse(phoneNumber).isValid();
  }

  /// Verify if the [email] is correct.
  Future<bool> validateEmail(String email, [RegExp? regExp]) async {
    // Regular expression for email validation
    final emailRegex = regExp ??
        RegExp(
          r"^[a-zA-Z0-9.a-zA-Z0-9.!#$%&'*+/=?^_`{|}~-]+@[a-zA-Z0-9-]+(?:\.[a-zA-Z0-9-]+)*$",
        );

    // Check if the email matches the regex
    return emailRegex.hasMatch(email);
  }

  /// Verify if the [password] is correct.
  Future<bool> validatePassword(
    String password, {
    int minLength = 8,
    int maxLength = 12,
    bool requireSpecialCharacters = false,
    bool requireCapitalLetters = false,
    RegExp? regExp,
  }) async {
    // Check if custom regex is provided
    if (regExp != null) {
      return regExp.hasMatch(password);
    }

    // Check length
    if (password.length < minLength || password.length > maxLength) {
      return false;
    }

    // Check for special characters
    if (requireSpecialCharacters &&
        !RegExp(r'[!@#$%^&*(),.?":{}|<>]').hasMatch(password)) {
      return false;
    }

    // Check for capital letters
    if (requireCapitalLetters && !password.contains(RegExp('[A-Z]'))) {
      return false;
    }

    // All checks passed
    return true;
  }
}
