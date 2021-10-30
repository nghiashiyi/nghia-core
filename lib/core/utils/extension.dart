import 'package:adroit_flutter/core/utils/string_utils.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'dart:core';
import 'package:easy_localization/easy_localization.dart';

extension IterableExtension<E> on Iterable<E> {
  Iterable<T> mapIndexed<T>(T Function(E e, int i) f) {
    var i = 0;
    return map((e) => f(e, i++));
  }
}

extension DateTimeExtension on DateTime {
  bool isSameDayWith(DateTime other) {
    return this.day == other.day &&
        this.month == other.month &&
        this.year == other.year;
  }

  String get readable =>
      "${DateFormat("EEE, d MMMM yyyy", Intl.defaultLocale).format(this)}"
          .toUpperAllFirstChar;
  String get formatDDMMYYY =>
      "${DateFormat("dd/MM/yyyy", Intl.defaultLocale).format(this)}"
          .toUpperAllFirstChar;

  String toHuman() {
    final timeFormat = DateFormat.jm();
    final dayFormat = DateFormat.EEEE();

    final _dateLocal = toLocal();
    final time = timeFormat.format(_dateLocal);
    final day = dayFormat.format(_dateLocal);
    final fullDate = DateFormat.yMMMEd().format(_dateLocal);
    final fullTime = DateFormat.jm().format(_dateLocal);
    final fullDateTime = "$fullDate\n$fullTime";

    if (isToday) {
      return 'Today at $time';
    } else if (isTomorrow) {
      return 'Tomorrow at $time';
    } else if (isNextWeek) {
      return '$day at $time';
    } else if (isYesterday) {
      return 'Yesterday at $time';
    } else if (isLastWeek) {
      return 'Last $day at $time';
    } else {
      return fullDateTime;
    }
  }

  String get toHumanMultiLine {
    return toHuman().split(' at ').join('\n');
  }

  bool get isToday {
    if (toLocal().isAfter(startOfToday()) && toLocal().isBefore(endOfToday())) {
      return true;
    }
    return false;
  }

  bool get isTomorrow {
    if (toLocal().isAfter(endOfToday()) &&
        toLocal().isBefore(endOfTomorrow())) {
      return true;
    }
    return false;
  }

  bool get isNextWeek {
    if (toLocal().isAfter(endOfToday()) &&
        toLocal().isBefore(endOfNextWeek())) {
      return true;
    }
    return false;
  }

  bool get isYesterday {
    if (toLocal().isAfter(startOfYesterday()) &&
        toLocal().isBefore(startOfToday())) {
      return true;
    }
    return false;
  }

  bool get isLastWeek {
    if (toLocal().isAfter(startOfLastWeek()) &&
        toLocal().isBefore(startOfYesterday())) {
      return true;
    }
    return false;
  }

  DateTime startOfToday() {
    final _now = DateTime.now();
    return DateTime(_now.year, _now.month, _now.day);
  }

  DateTime startOfYesterday() {
    return startOfToday().subtract(Duration(days: 1));
  }

  DateTime startOfLastWeek() {
    return startOfToday().subtract(Duration(days: 7));
  }

  DateTime endOfToday() {
    final _now = DateTime.now();
    return DateTime(_now.year, _now.month, _now.day, 23, 59, 59, 999, 999);
  }

  DateTime endOfTomorrow() {
    return endOfToday().add(Duration(days: 1));
  }

  DateTime endOfNextWeek() {
    return endOfToday().add(Duration(days: 7));
  }
}

extension DurationExtension on Duration {
  Map<String, int> inYearMonthDays({
    bool withYear = true,
    bool withMonth = true,
    bool withDay = true,
  }) {
    if (inDays <= 0) {
      return {
        'year': 0,
        'month': 0,
        'day': 0,
      };
    }

    int _years = 0;
    int _months = 0;
    int _days = 0;
    double _remainder = inDays.toDouble();

    if (withYear) {
      _years = (_remainder / 365.25).floor();
      _remainder -= (_years * 365.25);
    }

    if (withMonth) {
      _months = (_remainder / 30).floor();
      _remainder -= (_months * 30);
    }

    if (withDay) {
      _days = _remainder.toInt();
    }

    return {
      'year': _years,
      'month': _months,
      'day': _days,
    };
  }
}

extension ListExtension<T> on List<T> {
  T? get firstOrNull => isEmpty ? null : first;
  T? get lastOrNull => isEmpty ? null : last;
}

// Reference from https://stackoverflow.com/a/59826129

extension TextUtilsStringExtension on String? {
  /// Returns true if string is:
  /// - null
  /// - empty
  /// - whitespace string.
  ///
  /// Characters considered "whitespace" are listed [here](https://stackoverflow.com/a/59826129/10830091).
  bool get isNullEmptyOrWhitespace => this == null || (this?.isEmpty ?? true) || (this?.trim().isEmpty ?? true);

  String? capitalize() {
    return (this?.isNotEmpty ?? false)
        ? '${this![0].toUpperCase()}${this!.substring(1).toLowerCase()}'
        : this;
  }

  String shorthand({int length = 2, bool transformToUppercase = false}) {
    if (isNullEmptyOrWhitespace) return '';
    final _exp = RegExp(r'\b[a-zA-Z]');
    final _matches = _exp.allMatches(this!);
    if (_matches.isEmpty) return '';
    var _output = _matches.map((match) => match.group(0)).join('');
    if (length > 0 && _output.length > length) {
      _output = _output.substring(0, length);
    }
    return transformToUppercase ? _output.toUpperCase() : _output;
  }
}

/// - [isNullOrEmpty], [isNullEmptyOrFalse] are from [this StackOverflow answer](https://stackoverflow.com/a/59826129/10830091)
extension GeneralUtilsObjectExtension on Object? {
  /// Returns true if object is:
  /// - null `Object`
  bool get isNull => this == null;

  /// Returns true if object is NOT:
  /// - null `Object`
  bool get isNotNull => this != null;

  /// Returns true if object is:
  /// - null `Object`
  /// - empty `String`
  /// - empty `Iterable` (list, map, set, ...)
  bool get isNullOrEmpty =>
      isNull || _isStringObjectEmpty || _isIterableObjectEmpty;

  /// Returns true if object is:
  /// - null `Object`
  /// - empty `String`
  /// - empty `Iterable` (list, map, set, ...)
  /// - false `bool`
  bool get isNullEmptyOrFalse =>
      isNull ||
      _isStringObjectEmpty ||
      _isIterableObjectEmpty ||
      _isBoolObjectFalse;

  /// Returns true if object is:
  /// - null `Object`
  /// - empty `String`
  /// - empty `Iterable` (list, map, set, ...)
  /// - false `bool`
  /// - zero `num`
  bool get isNullEmptyFalseOrZero =>
      isNull ||
      _isStringObjectEmpty ||
      _isIterableObjectEmpty ||
      _isBoolObjectFalse ||
      _isNumObjectZero;

  // ------- PRIVATE EXTENSION HELPERS -------
  /// **Private helper**
  ///
  /// If `String` object, return String's method `isEmpty`
  ///
  /// Otherwise return `false` to not affect logical-OR expression. As `false` denotes undefined or N/A since object is not `String`
  bool get _isStringObjectEmpty =>
      (this is String) ? (this as String).isEmpty : false;

  /// **Private helper**
  ///
  /// If `Iterable` object, return Iterable's method `isEmpty`
  ///
  /// Otherwise return `false` to not affect logical-OR expression. As `false` denotes undefined or N/A since object is not `Iterable`
  bool get _isIterableObjectEmpty =>
      (this is Iterable) ? (this as Iterable).isEmpty : false;

  /// **Private helper**
  ///
  /// If `bool` object, return `isFalse` expression
  ///
  /// Otherwise return `false` to not affect logical-OR expression. As `false` denotes undefined or N/A since object is not `bool`
  bool get _isBoolObjectFalse =>
      (this is bool) ? (this as bool) == false : false;

  /// **Private helper**
  ///
  /// If `num` object, return `isZero` expression
  ///
  /// Otherwise return `false` to not affect logical-OR expression. As `false` denotes undefined or N/A since object is not `num`
  bool get _isNumObjectZero => (this is num) ? (this as num) == 0 : false;
}

extension BuildContextExtension on BuildContext {
  Size get screenSize => MediaQuery.of(this).size;

  MediaQueryData get mediaQueryData => MediaQuery.of(this);
}

extension CustomCapitalization on String {
  String get toUpperFirstChar => isEmpty ? this : StringUtils.capitalize(this);

  String get toUpperAllFirstChar =>
      StringUtils.capitalize(this, allWords: true);

  String get ignoreBreakLine => this.replaceAll('\n', '');

  String get normalize {
    var currentText = this;
    for (int i = 1; i < specialCharacters.length; i++) {
      for (int j = 0; j < specialCharacters[i].length; j++)
        currentText = currentText.replaceAll(
            specialCharacters[i][j], specialCharacters[0][i - 1]);
    }
    return currentText.replaceAll(RegExp(r"[^\s\w]"), '');
  }

  String get noHttpAndWWW => this
      .replaceAll('http://', '')
      .replaceAll('https://', '')
      .replaceAll('www.', '');

  String get toUsername =>
      this.normalize.replaceAll(' ', '').toLowerCase().ignoreBreakLine;
}

const List<String> specialCharacters = [
  "aAeEoOuUiIdDyY",
  "áàạảãâấầậẩẫăắằặẳẵ",
  "ÁÀẠẢÃÂẤẦẬẨẪĂẮẰẶẲẴ",
  "éèẹẻẽêếềệểễ",
  "ÉÈẸẺẼÊẾỀỆỂỄ",
  "óòọỏõôốồộổỗơớờợởỡ",
  "ÓÒỌỎÕÔỐỒỘỔỖƠỚỜỢỞỠ",
  "úùụủũưứừựửữ",
  "ÚÙỤỦŨƯỨỪỰỬỮ",
  "íìịỉĩ",
  "ÍÌỊỈĨ",
  "đ",
  "Đ",
  "ýỳỵỷỹ",
  "ÝỲỴỶỸ"
];

extension HexColor on Color {
  /// String is in the format "aabbcc" or "ffaabbcc" with an optional leading "#".
  static Color fromHex(String hexString) {
    final buffer = StringBuffer();
    if (hexString.length == 6 || hexString.length == 7) buffer.write('ff');
    buffer.write(hexString.replaceFirst('#', ''));
    return Color(int.parse(buffer.toString(), radix: 16));
  }

  /// Prefixes a hash sign if [leadingHashSign] is set to `true` (default is `true`).
  String toHex({bool leadingHashSign = true}) => '${leadingHashSign ? '#' : ''}'
      '${alpha.toRadixString(16).padLeft(2, '0')}'
      '${red.toRadixString(16).padLeft(2, '0')}'
      '${green.toRadixString(16).padLeft(2, '0')}'
      '${blue.toRadixString(16).padLeft(2, '0')}';
}