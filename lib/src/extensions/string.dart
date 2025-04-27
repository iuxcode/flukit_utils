import 'package:flukit_core/flukit_core.dart';
import 'package:flukit_utils/flukit_utils.dart';

// ignore: public_member_api_docs
extension StringUtils on String {
  /// Discover if the String is a valid number
  bool get isNum => Flu.utils.isNum(this);

  /// Discover if the String is numeric only
  bool get isNumericOnly => Flu.utils.isNumericOnly(this);

  /// Extracts numeric characters from the string.
  /// Can specify if only the first word should be considered.
  /// Returns a string containing only numeric characters.
  String numericOnly({bool firstWordOnly = false}) =>
      Flu.utils.numericOnly(this, firstWordOnly: firstWordOnly);

  /// Discover if the String is alphanumeric only
  bool get isAlphabetOnly => Flu.utils.isAlphabetOnly(this);

  /// Discover if the String is a boolean
  bool get isBool => Flu.utils.isBool(this);

  /// Discover if the String is a vector
  bool get isVectorFileName => Flu.utils.isVector(this);

  /// Discover if the String is a ImageFileName
  bool get isImageFileName => Flu.utils.isImage(this);

  /// Discover if the String is a AudioFileName
  bool get isAudioFileName => Flu.utils.isAudio(this);

  /// Discover if the String is a VideoFileName
  bool get isVideoFileName => Flu.utils.isVideo(this);

  /// Discover if the String is a TxtFileName
  bool get isTxtFileName => Flu.utils.isTxt(this);

  /// Discover if the String is a Document Word
  bool get isDocumentFileName => Flu.utils.isWord(this);

  /// Discover if the String is a Document Excel
  bool get isExcelFileName => Flu.utils.isExcel(this);

  /// Discover if the String is a Document Powerpoint
  bool get isPPTFileName => Flu.utils.isPPT(this);

  /// Discover if the String is a APK File
  bool get isAPKFileName => Flu.utils.isAPK(this);

  /// Discover if the String is a PDF file
  bool get isPDFFileName => Flu.utils.isPDF(this);

  /// Discover if the String is a HTML file
  bool get isHTMLFileName => Flu.utils.isHTML(this);

  /// Discover if the String is a URL file
  bool get isURL => Flu.utils.isURL(this);

  /// Discover if the String is a Email
  bool get isEmail => Flu.utils.isEmail(this);

  /// Discover if the String is a Phone Number
  bool get isPhoneNumber => Flu.utils.isPhoneNumber(this);

  /// Discover if the String is a DateTime
  bool get isDateTime => Flu.utils.isDateTime(this);

  /// Discover if the String is a MD5 Hash
  bool get isMD5 => Flu.utils.isMD5(this);

  /// Discover if the String is a SHA1 Hash
  bool get isSHA1 => Flu.utils.isSHA1(this);

  /// Discover if the String is a SHA256 Hash
  bool get isSHA256 => Flu.utils.isSHA256(this);

  /// Discover if the String is a binary value
  bool get isBinary => Flu.utils.isBinary(this);

  /// Discover if the String is a valid ipv4
  bool get isIPv4 => Flu.utils.isIPv4(this);

  /// Returns whether the string is a valid IPv6 address.
  bool get isIPv6 => Flu.utils.isIPv6(this);

  /// Discover if the String is a Hexadecimal
  bool get isHexadecimal => Flu.utils.isHexadecimal(this);

  /// Discover if the String is a palindrome
  bool get isPalindrom => Flu.utils.isPalindrom(this);

  /// Discover if the String is a passport number
  bool get isPassport => Flu.utils.isPassport(this);

  /// Discover if the String is a currency
  bool get isCurrency => Flu.utils.isCurrency(this);

  /// Discover if the String is a CPF number
  bool get isCpf => Flu.utils.isCpf(this);

  /// Discover if the String is a CNPJ number
  bool get isCnpj => Flu.utils.isCnpj(this);

  /// Discover if the String is a case insensitive
  bool isCaseInsensitiveContains(String b) =>
      Flu.utils.isCaseInsensitiveContains(this, b);

  /// Discover if the String is a case sensitive and contains any value
  bool isCaseInsensitiveContainsAny(String b) =>
      Flu.utils.isCaseInsensitiveContainsAny(this, b);

  /// capitalize the String
  String? get capitalize => Flu.utils.capitalize(this);

  /// Capitalize the first letter of the String
  String? get capitalizeFirst => Flu.utils.capitalizeFirst(this);

  /// remove all whitespace from the String
  String get removeAllWhitespace => Flu.utils.removeAllWhitespace(this);

  /// converter the String
  String? get camelCase => Flu.utils.camelCase(this);

  /// Discover if the String is a valid URL
  String? get paramCase => Flu.utils.paramCase(this);

  /// add segments to the String
  String createPath([Iterable<dynamic>? segments]) {
    final path = startsWith('/') ? this : '/$this';
    return Flu.utils.createPath(path, segments);
  }

  /// capitalize only first letter in String words to upper case
  String capitalizeAllWordsFirstLetter() =>
      Flu.utils.capitalizeAllWordsFirstLetter(this);
}
