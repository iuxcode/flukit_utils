import 'package:flukit_utils/src/_utils.dart';

// ignore: public_member_api_docs
extension StringExt on String {
  /// Discover if the String is a valid number
  bool get isNum => FluUtils.isNum(this);

  /// Discover if the String is numeric only
  bool get isNumericOnly => FluUtils.isNumericOnly(this);

  /// Extracts numeric characters from the string.
  /// Can specify if only the first word should be considered.
  /// Returns a string containing only numeric characters.
  String numericOnly({bool firstWordOnly = false}) =>
      FluUtils.numericOnly(this, firstWordOnly: firstWordOnly);

  /// Discover if the String is alphanumeric only
  bool get isAlphabetOnly => FluUtils.isAlphabetOnly(this);

  /// Discover if the String is a boolean
  bool get isBool => FluUtils.isBool(this);

  /// Discover if the String is a vector
  bool get isVectorFileName => FluUtils.isVector(this);

  /// Discover if the String is a ImageFileName
  bool get isImageFileName => FluUtils.isImage(this);

  /// Discover if the String is a AudioFileName
  bool get isAudioFileName => FluUtils.isAudio(this);

  /// Discover if the String is a VideoFileName
  bool get isVideoFileName => FluUtils.isVideo(this);

  /// Discover if the String is a TxtFileName
  bool get isTxtFileName => FluUtils.isTxt(this);

  /// Discover if the String is a Document Word
  bool get isDocumentFileName => FluUtils.isWord(this);

  /// Discover if the String is a Document Excel
  bool get isExcelFileName => FluUtils.isExcel(this);

  /// Discover if the String is a Document Powerpoint
  bool get isPPTFileName => FluUtils.isPPT(this);

  /// Discover if the String is a APK File
  bool get isAPKFileName => FluUtils.isAPK(this);

  /// Discover if the String is a PDF file
  bool get isPDFFileName => FluUtils.isPDF(this);

  /// Discover if the String is a HTML file
  bool get isHTMLFileName => FluUtils.isHTML(this);

  /// Discover if the String is a URL file
  bool get isURL => FluUtils.isURL(this);

  /// Discover if the String is a Email
  bool get isEmail => FluUtils.isEmail(this);

  /// Discover if the String is a Phone Number
  bool get isPhoneNumber => FluUtils.isPhoneNumber(this);

  /// Discover if the String is a DateTime
  bool get isDateTime => FluUtils.isDateTime(this);

  /// Discover if the String is a MD5 Hash
  bool get isMD5 => FluUtils.isMD5(this);

  /// Discover if the String is a SHA1 Hash
  bool get isSHA1 => FluUtils.isSHA1(this);

  /// Discover if the String is a SHA256 Hash
  bool get isSHA256 => FluUtils.isSHA256(this);

  /// Discover if the String is a binary value
  bool get isBinary => FluUtils.isBinary(this);

  /// Discover if the String is a valid ipv4
  bool get isIPv4 => FluUtils.isIPv4(this);

  /// Returns whether the string is a valid IPv6 address.
  bool get isIPv6 => FluUtils.isIPv6(this);

  /// Discover if the String is a Hexadecimal
  bool get isHexadecimal => FluUtils.isHexadecimal(this);

  /// Discover if the String is a palindrome
  bool get isPalindrom => FluUtils.isPalindrom(this);

  /// Discover if the String is a passport number
  bool get isPassport => FluUtils.isPassport(this);

  /// Discover if the String is a currency
  bool get isCurrency => FluUtils.isCurrency(this);

  /// Discover if the String is a CPF number
  bool get isCpf => FluUtils.isCpf(this);

  /// Discover if the String is a CNPJ number
  bool get isCnpj => FluUtils.isCnpj(this);

  /// Discover if the String is a case insensitive
  bool isCaseInsensitiveContains(String b) =>
      FluUtils.isCaseInsensitiveContains(this, b);

  /// Discover if the String is a case sensitive and contains any value
  bool isCaseInsensitiveContainsAny(String b) =>
      FluUtils.isCaseInsensitiveContainsAny(this, b);

  /// capitalize the String
  String capitalize() => FluUtils.capitalize(this) ?? this;

  /// Capitalize the first letter of the String
  String capitalizeFirst() => FluUtils.capitalizeFirst(this) ?? this;

  /// remove all whitespace from the String
  String get removeAllWhitespace => FluUtils.removeAllWhitespace(this);

  /// converter the String
  String? get camelCase => FluUtils.camelCase(this);

  /// Discover if the String is a valid URL
  String? get paramCase => FluUtils.paramCase(this);

  /// add segments to the String
  String createPath([Iterable<dynamic>? segments]) {
    final path = startsWith('/') ? this : '/$this';
    return FluUtils.createPath(path, segments);
  }

  /// capitalize only first letter in String words to upper case
  String capitalizeAllWordsFirstLetter() =>
      FluUtils.capitalizeAllWordsFirstLetter(this);

  /// Eg `John doe` to `JD`
  String toAvatarLabel(String text) {
    var label = text;
    final array = label.split(' ');

    if (array.length >= 2) {
      label = array[0][0] + array[array.length - 1][0];
    } else {
      label = text[0];
    }

    return label.toLowerCase();
  }
}
