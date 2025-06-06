/// Returns whether a dynamic value PROBABLY
/// has the isEmpty getter/method by checking
/// standard dart types that contains it.
///
/// This is here to for the 'DRY'
// ignore: inference_failure_on_untyped_parameter
bool? _isEmpty(value) {
  if (value is String) {
    return value.trim().isEmpty;
  }

  if (value is Iterable || value is Map) {
    // ignore: avoid_dynamic_calls
    return value.isEmpty as bool?;
  }

  return false;
}

/// Returns whether a dynamic value PROBABLY
/// has the length getter/method by checking
/// standard dart types that contains it.
///
/// This is here to for the 'DRY'
// ignore: inference_failure_on_untyped_parameter
bool _hasLength(value) => value is Iterable || value is String || value is Map;

/// Obtains a length of a dynamic value
/// by previously validating it's type
///
/// Note: if [value] is double/int
/// it will be taking the .toString
/// length of the given value.
///
/// Note 2: **this may return null!**
///
/// Note 3: null [value] returns null.
// ignore: inference_failure_on_untyped_parameter
int? _obtainDynamicLength(value) {
  if (value == null) {
    // ignore: avoid_returning_null
    return null;
  }

  if (_hasLength(value)) {
    // ignore: avoid_dynamic_calls
    return value.length as int?;
  }

  if (value is int) {
    return value.toString().length;
  }

  if (value is double) {
    return value.toString().replaceAll('.', '').length;
  }

  // ignore: avoid_returning_null
  return null;
}

/// Provide utilities functions
class FluUtils {
  FluUtils();

  /// Checks if data is null.
  // ignore: inference_failure_on_untyped_parameter, type_annotate_public_apis
  bool isNull(value) => value == null;

  /// Checks if data is null or blank (empty or only contains whitespace).
  // ignore: inference_failure_on_untyped_parameter, type_annotate_public_apis
  bool? isNullOrBlank(value) {
    if (isNull(value)) {
      return true;
    }

    // Pretty sure that isNullOrBlank should't be validating
    // iterables... but I'm going to keep this for compatibility.
    return _isEmpty(value);
  }

  /// Checks if data is null or blank (empty or only contains whitespace).
  // ignore: inference_failure_on_untyped_parameter, type_annotate_public_apis
  bool? isBlank(value) => _isEmpty(value);

  /// Checks if string is int or double.
  bool isNum(String value) {
    if (isNull(value)) {
      return false;
    }

    return num.tryParse(value) is num;
  }

  /// Checks if string consist only numeric.
  /// Numeric only doesn't accepting "." which double data type have
  bool isNumericOnly(String s) => hasMatch(s, r'^\d+$');

  /// Checks if string consist only Alphabet. (No Whitespace)
  bool isAlphabetOnly(String s) => hasMatch(s, r'^[a-zA-Z]+$');

  /// Checks if string contains at least one Capital Letter
  bool hasCapitalLetter(String s) => hasMatch(s, '[A-Z]');

  /// Checks if string is boolean.
  bool isBool(String value) {
    if (isNull(value)) {
      return false;
    }

    return value == 'true' || value == 'false';
  }

  /// Checks if string is an video file.
  bool isVideo(String filePath) {
    final ext = filePath.toLowerCase();

    return ext.endsWith('.mp4') ||
        ext.endsWith('.avi') ||
        ext.endsWith('.wmv') ||
        ext.endsWith('.rmvb') ||
        ext.endsWith('.mpg') ||
        ext.endsWith('.mpeg') ||
        ext.endsWith('.3gp');
  }

  /// Checks if string is an image file.
  bool isImage(String filePath) {
    final ext = filePath.toLowerCase();

    return ext.endsWith('.jpg') ||
        ext.endsWith('.jpeg') ||
        ext.endsWith('.png') ||
        ext.endsWith('.gif') ||
        ext.endsWith('.bmp');
  }

  /// Checks if string is an audio file.
  bool isAudio(String filePath) {
    final ext = filePath.toLowerCase();

    return ext.endsWith('.mp3') ||
        ext.endsWith('.wav') ||
        ext.endsWith('.wma') ||
        ext.endsWith('.amr') ||
        ext.endsWith('.ogg');
  }

  /// Checks if string is an powerpoint file.
  bool isPPT(String filePath) {
    final ext = filePath.toLowerCase();

    return ext.endsWith('.ppt') || ext.endsWith('.pptx');
  }

  /// Checks if string is an word file.
  bool isWord(String filePath) {
    final ext = filePath.toLowerCase();

    return ext.endsWith('.doc') || ext.endsWith('.docx');
  }

  /// Checks if string is an excel file.
  bool isExcel(String filePath) {
    final ext = filePath.toLowerCase();

    return ext.endsWith('.xls') || ext.endsWith('.xlsx');
  }

  /// Checks if string is an apk file.
  bool isAPK(String filePath) => filePath.toLowerCase().endsWith('.apk');

  /// Checks if string is an pdf file.
  bool isPDF(String filePath) => filePath.toLowerCase().endsWith('.pdf');

  /// Checks if string is an txt file.
  bool isTxt(String filePath) => filePath.toLowerCase().endsWith('.txt');

  /// Checks if string is an chm file.
  bool isChm(String filePath) => filePath.toLowerCase().endsWith('.chm');

  /// Checks if string is a vector file.
  bool isVector(String filePath) => filePath.toLowerCase().endsWith('.svg');

  /// Checks if string is an html file.
  bool isHTML(String filePath) => filePath.toLowerCase().endsWith('.html');

  /// Checks if string is a valid username.
  bool isUsername(String s) =>
      hasMatch(s, r'^[a-zA-Z0-9][a-zA-Z0-9_.]+[a-zA-Z0-9]$');

  /// Checks if string is URL.
  bool isURL(String s) => hasMatch(
        s,
        r"^((((H|h)(T|t)|(F|f))(T|t)(P|p)((S|s)?))\://)?(www.|[a-zA-Z0-9].)[a-zA-Z0-9\-\.]+\.[a-zA-Z]{2,7}(\:[0-9]{1,5})*(/($|[a-zA-Z0-9\.\,\;\?\'\\\+&amp;%\$#\=~_\-]+))*$",
      );

  /// Checks if string is email.
  bool isEmail(String s) => hasMatch(
        s,
        r'^(([^<>()[\]\\.,;:\s@\"]+(\.[^<>()[\]\\.,;:\s@\"]+)*)|(\".+\"))@((\[[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\])|(([a-zA-Z\-0-9]+\.)+[a-zA-Z]{2,}))$',
      );

  /// Checks if string is phone number.
  bool isPhoneNumber(String s) {
    if (s.length > 16 || s.length < 9) return false;
    return hasMatch(s, r'^[+]*[(]{0,1}[0-9]{1,4}[)]{0,1}[-\s\./0-9]*$');
  }

  /// Checks if string is DateTime (UTC or Iso8601).
  bool isDateTime(String s) =>
      hasMatch(s, r'^\d{4}-\d{2}-\d{2}[ T]\d{2}:\d{2}:\d{2}.\d{3}Z?$');

  /// Checks if string is MD5 hash.
  bool isMD5(String s) => hasMatch(s, r'^[a-f0-9]{32}$');

  /// Checks if string is SHA1 hash.
  bool isSHA1(String s) =>
      hasMatch(s, r'(([A-Fa-f0-9]{2}\:){19}[A-Fa-f0-9]{2}|[A-Fa-f0-9]{40})');

  /// Checks if string is SHA256 hash.
  bool isSHA256(String s) =>
      hasMatch(s, r'([A-Fa-f0-9]{2}\:){31}[A-Fa-f0-9]{2}|[A-Fa-f0-9]{64}');

  /// Checks if string is SSN (Social Security Number).
  bool isSSN(String s) => hasMatch(
        s,
        // ignore: lines_longer_than_80_chars
        r'^(?!0{3}|6{3}|9[0-9]{2})[0-9]{3}-?(?!0{2})[0-9]{2}-?(?!0{4})[0-9]{4}$',
      );

  /// Checks if string is binary.
  bool isBinary(String s) => hasMatch(s, r'^[0-1]+$');

  /// Checks if string is IPv4.
  bool isIPv4(String s) =>
      hasMatch(s, r'^(?:(?:^|\.)(?:2(?:5[0-5]|[0-4]\d)|1?\d?\d)){4}$');

  /// Checks if string is IPv6.
  bool isIPv6(String s) => hasMatch(
        s,
        r'^((([0-9A-Fa-f]{1,4}:){7}[0-9A-Fa-f]{1,4})|(([0-9A-Fa-f]{1,4}:){6}:[0-9A-Fa-f]{1,4})|(([0-9A-Fa-f]{1,4}:){5}:([0-9A-Fa-f]{1,4}:)?[0-9A-Fa-f]{1,4})|(([0-9A-Fa-f]{1,4}:){4}:([0-9A-Fa-f]{1,4}:){0,2}[0-9A-Fa-f]{1,4})|(([0-9A-Fa-f]{1,4}:){3}:([0-9A-Fa-f]{1,4}:){0,3}[0-9A-Fa-f]{1,4})|(([0-9A-Fa-f]{1,4}:){2}:([0-9A-Fa-f]{1,4}:){0,4}[0-9A-Fa-f]{1,4})|(([0-9A-Fa-f]{1,4}:){6}((\b((25[0-5])|(1\d{2})|(2[0-4]\d)|(\d{1,2}))\b)\.){3}(\b((25[0-5])|(1\d{2})|(2[0-4]\d)|(\d{1,2}))\b))|(([0-9A-Fa-f]{1,4}:){0,5}:((\b((25[0-5])|(1\d{2})|(2[0-4]\d)|(\d{1,2}))\b)\.){3}(\b((25[0-5])|(1\d{2})|(2[0-4]\d)|(\d{1,2}))\b))|(::([0-9A-Fa-f]{1,4}:){0,5}((\b((25[0-5])|(1\d{2})|(2[0-4]\d)|(\d{1,2}))\b)\.){3}(\b((25[0-5])|(1\d{2})|(2[0-4]\d)|(\d{1,2}))\b))|([0-9A-Fa-f]{1,4}::([0-9A-Fa-f]{1,4}:){0,5}[0-9A-Fa-f]{1,4})|(::([0-9A-Fa-f]{1,4}:){0,6}[0-9A-Fa-f]{1,4})|(([0-9A-Fa-f]{1,4}:){1,7}:))$',
      );

  /// Checks if string is hexadecimal.
  /// Example: HexColor => #12F
  bool isHexadecimal(String s) =>
      hasMatch(s, r'^#?([0-9a-fA-F]{3}|[0-9a-fA-F]{6})$');

  /// Checks if string is Palindrom.
  bool isPalindrom(String string) {
    final cleanString = string
        .toLowerCase()
        .replaceAll(RegExp(r'\s+'), '')
        .replaceAll(RegExp('[^0-9a-zA-Z]+'), '');

    for (var i = 0; i < cleanString.length; i++) {
      if (cleanString[i] != cleanString[cleanString.length - i - 1]) {
        return false;
      }
    }

    return true;
  }

  /// Checks if all data have same value.
  /// Example: 111111 -> true, wwwww -> true, 1,1,1,1 -> true
  bool isOneAKind(List<dynamic> value) {
    if (!isNullOrBlank(value)!) {
      final first = value[0];
      final len = value.length;

      for (var i = 0; i < len; i++) {
        if (value[i] != first) {
          return false;
        }
      }

      return true;
    }

    if (value is int) {
      final stringValue = value.toString();
      final first = stringValue[0];

      for (var i = 0; i < stringValue.length; i++) {
        if (stringValue[i] != first) {
          return false;
        }
      }

      return true;
    }

    return false;
  }

  /// Checks if string is Passport No.
  bool isPassport(String s) => hasMatch(s, r'^(?!^0+$)[a-zA-Z0-9]{6,9}$');

  /// Checks if string is Currency.
  bool isCurrency(String s) => hasMatch(
        s,
        r'^(S?\$|\₩|Rp|\¥|\€|\₹|\₽|fr|R\$|R)?[ ]?[-]?([0-9]{1,3}[,.]([0-9]{3}[,.])*[0-9]{3}|[0-9]+)([,.][0-9]{1,2})?( ?(USD?|AUD|NZD|CAD|CHF|GBP|CNY|EUR|JPY|IDR|MXN|NOK|KRW|TRY|INR|RUB|BRL|ZAR|SGD|MYR))?$',
      );

  /// Checks if length of data is GREATER than maxLength.
  // ignore: type_annotate_public_apis
// ignore: inference_failure_on_untyped_parameter, type_annotate_public_apis
  bool isLengthGreaterThan(value, int maxLength) {
    final length = _obtainDynamicLength(value);

    if (length == null) {
      return false;
    }

    return length > maxLength;
  }

  /// Checks if length of data is GREATER OR EQUAL to maxLength.
  // ignore: type_annotate_public_apis, inference_failure_on_untyped_parameter
  bool isLengthGreaterOrEqual(value, int maxLength) {
    final length = _obtainDynamicLength(value);

    if (length == null) {
      return false;
    }

    return length >= maxLength;
  }

  /// Checks if length of data is LESS than maxLength.
  // ignore: inference_failure_on_untyped_parameter, type_annotate_public_apis
  bool isLengthLessThan(value, int maxLength) {
    final length = _obtainDynamicLength(value);
    if (length == null) {
      return false;
    }

    return length < maxLength;
  }

  /// Checks if length of data is LESS OR EQUAL to maxLength.
  // ignore: inference_failure_on_untyped_parameter, type_annotate_public_apis
  bool isLengthLessOrEqual(value, int maxLength) {
    final length = _obtainDynamicLength(value);

    if (length == null) {
      return false;
    }

    return length <= maxLength;
  }

  /// Checks if length of data is EQUAL to maxLength.
  // ignore: inference_failure_on_untyped_parameter, type_annotate_public_apis
  bool isLengthEqualTo(value, int otherLength) {
    final length = _obtainDynamicLength(value);

    if (length == null) {
      return false;
    }

    return length == otherLength;
  }

  /// Checks if length of data is BETWEEN minLength to maxLength.
  // ignore: inference_failure_on_untyped_parameter, type_annotate_public_apis
  bool isLengthBetween(value, int minLength, int maxLength) {
    if (isNull(value)) {
      return false;
    }

    return isLengthGreaterOrEqual(value, minLength) &&
        isLengthLessOrEqual(value, maxLength);
  }

  /// Checks if a contains b (Treating or interpreting upper- and lowercase
  /// letters as being the same).
  bool isCaseInsensitiveContains(String a, String b) =>
      a.toLowerCase().contains(b.toLowerCase());

  /// Checks if a contains b or b contains a (Treating or
  /// interpreting upper- and lowercase letters as being the same).
  bool isCaseInsensitiveContainsAny(String a, String b) {
    final lowA = a.toLowerCase();
    final lowB = b.toLowerCase();

    return lowA.contains(lowB) || lowB.contains(lowA);
  }

  /// Checks if num a LOWER than num b.
  bool isLowerThan(num a, num b) => a < b;

  /// Checks if num a GREATER than num b.
  bool isGreaterThan(num a, num b) => a > b;

  /// Checks if num a EQUAL than num b.
  bool isEqual(num a, num b) => a == b;

  /// Check if num is a cnpj
// ignore: inference_failure_on_untyped_parameter
  bool isCnpj(String cnpj) {
    // Obter somente os números do CNPJ
    final numbers = cnpj.replaceAll(RegExp('[^0-9]'), '');

    // Testar se o CNPJ possui 14 dígitos
    if (numbers.length != 14) {
      return false;
    }

    // Testar se todos os dígitos do CNPJ são iguais
    if (RegExp(r'^(\d)\1*$').hasMatch(numbers)) {
      return false;
    }

    // Dividir dígitos
    final digits = numbers.split('').map(int.parse).toList();

    // Calcular o primeiro dígito verificador
    var calcDv1 = 0;
    var j = 0;
    for (final i in Iterable<int>.generate(12, (i) => i < 4 ? 5 - i : 13 - i)) {
      calcDv1 += digits[j++] * i;
    }
    calcDv1 %= 11;
    final dv1 = calcDv1 < 2 ? 0 : 11 - calcDv1;

    // Testar o primeiro dígito verificado
    if (digits[12] != dv1) {
      return false;
    }

    // Calcular o segundo dígito verificador
    var calcDv2 = 0;
    j = 0;
    for (final i in Iterable<int>.generate(13, (i) => i < 5 ? 6 - i : 14 - i)) {
      calcDv2 += digits[j++] * i;
    }
    calcDv2 %= 11;
    final dv2 = calcDv2 < 2 ? 0 : 11 - calcDv2;

    // Testar o segundo dígito verificador
    if (digits[13] != dv2) {
      return false;
    }

    return true;
  }

  /// Checks if the cpf is valid.
  bool isCpf(String cpf) {
    // if (cpf == null) {
    //   return false;
    // }

    // get only the numbers
    final numbers = cpf.replaceAll(RegExp('[^0-9]'), '');
    // Test if the CPF has 11 digits
    if (numbers.length != 11) {
      return false;
    }
    // Test if all CPF digits are the same
    if (RegExp(r'^(\d)\1*$').hasMatch(numbers)) {
      return false;
    }

    // split the digits
    final digits = numbers.split('').map(int.parse).toList();

    // Calculate the first verifier digit
    var calcDv1 = 0;
    for (final i in Iterable<int>.generate(9, (i) => 10 - i)) {
      calcDv1 += digits[10 - i] * i;
    }
    calcDv1 %= 11;

    final dv1 = calcDv1 < 2 ? 0 : 11 - calcDv1;

    // Tests the first verifier digit
    if (digits[9] != dv1) {
      return false;
    }

    // Calculate the second verifier digit
    var calcDv2 = 0;
    for (final i in Iterable<int>.generate(10, (i) => 11 - i)) {
      calcDv2 += digits[11 - i] * i;
    }
    calcDv2 %= 11;

    final dv2 = calcDv2 < 2 ? 0 : 11 - calcDv2;

    // Test the second verifier digit
    if (digits[10] != dv2) {
      return false;
    }

    return true;
  }

  /// Capitalize each word inside string
  /// Example: your name => Your Name, your name => Your name
  String? capitalize(String value) {
    if (isNull(value)) return null;
    if (isBlank(value)!) return value;
    return value.split(' ').map(capitalizeFirst).join(' ');
  }

  /// Uppercase first letter inside string and let the others lowercase
  /// Example: your name => Your name
  String? capitalizeFirst(String s) {
    if (isNull(s)) return null;
    if (isBlank(s)!) return s;
    return s[0].toUpperCase() + s.substring(1).toLowerCase();
  }

  /// Remove all whitespace inside string
  /// Example: your name => yourname
  String removeAllWhitespace(String value) => value.replaceAll(' ', '');

  /// Camelcase string
  /// Example: your name => yourName
  String? camelCase(String value) {
    if (isNullOrBlank(value)!) {
      return null;
    }

    final separatedWords =
        value.split(RegExp(r'[!@#<>?":`~;[\]\\|=+)(*&^%-\s_]+'));
    var newString = '';

    for (final word in separatedWords) {
      // ignore: use_string_buffers
      newString += word[0].toUpperCase() + word.substring(1).toLowerCase();
    }

    return newString[0].toLowerCase() + newString.substring(1);
  }

  /// credits to "ReCase" package.
  final RegExp _upperAlphaRegex = RegExp('[A-Z]');
  final _symbolSet = {' ', '.', '/', '_', r'\', '-'};
  List<String> _groupIntoWords(String text) {
    final sb = StringBuffer();
    final words = <String>[];
    final isAllCaps = text.toUpperCase() == text;

    for (var i = 0; i < text.length; i++) {
      final char = text[i];
      final nextChar = i + 1 == text.length ? null : text[i + 1];
      if (_symbolSet.contains(char)) {
        continue;
      }
      sb.write(char);
      final isEndOfWord = nextChar == null ||
          (_upperAlphaRegex.hasMatch(nextChar) && !isAllCaps) ||
          _symbolSet.contains(nextChar);
      if (isEndOfWord) {
        words.add('$sb');
        sb.clear();
      }
    }
    return words;
  }

  /// snake_case
  String? snakeCase(String? text, {String separator = '_'}) {
    if (isNullOrBlank(text)!) {
      return null;
    }
    return _groupIntoWords(text!)
        .map((word) => word.toLowerCase())
        .join(separator);
  }

  /// param-case
  String? paramCase(String? text) => snakeCase(text, separator: '-');

  /// Extract numeric value of string
  /// Example: OTP 12312 27/04/2020 => 1231227042020ß
  /// If firstword only is true, then the example return is "12312"
  /// (first found numeric word)
  String numericOnly(String s, {bool firstWordOnly = false}) {
    var numericOnlyStr = '';

    for (var i = 0; i < s.length; i++) {
      if (isNumericOnly(s[i])) {
        numericOnlyStr += s[i];
      }
      if (firstWordOnly && numericOnlyStr.isNotEmpty && s[i] == ' ') {
        break;
      }
    }

    return numericOnlyStr;
  }

  /// Capitalize only the first letter of each word in a string
  /// Example: flukit will make it easy  => Flukit Will Make It Easy
  /// Example 2 : this is an example text => This Is An Example Text
  String capitalizeAllWordsFirstLetter(String s) {
    final lowerCasedString = s.toLowerCase();
    final stringWithoutExtraSpaces = lowerCasedString.trim();

    if (stringWithoutExtraSpaces.isEmpty) {
      return '';
    }
    if (stringWithoutExtraSpaces.length == 1) {
      return stringWithoutExtraSpaces.toUpperCase();
    }

    final stringWordsList = stringWithoutExtraSpaces.split(' ');
    final capitalizedWordsFirstLetter = stringWordsList
        .map(
          (word) {
            if (word.trim().isEmpty) return '';
            return word.trim();
          },
        )
        .where(
          (word) => word != '',
        )
        .map(
          (word) {
            if (word.startsWith(RegExp(r'[\n\t\r]'))) {
              return word;
            }
            return word[0].toUpperCase() + word.substring(1).toLowerCase();
          },
        )
        .toList();
    final finalResult = capitalizedWordsFirstLetter.join(' ');
    return finalResult;
  }

  /// Checks whether this regular expression has a match in the [value]
  bool hasMatch(String value, String pattern) =>
      RegExp(pattern).hasMatch(value);

  /// Create navigation path
  String createPath(String path, [Iterable<dynamic>? segments]) {
    if (segments == null || segments.isEmpty) {
      return path;
    }
    final list = segments.map((e) => '/$e');
    return path + list.join();
  }
}
