import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class LocaleTexts {
  static const appName = 'appName';
}

class AppLocales {
  static const en = Locale('en', 'US');

  static Locale getCorrespondingLocal() {
    return [en].firstWhere((element) {
      return element.languageCode == Intl.systemLocale.split('_').first;
    }, orElse: () => en);
  }
}
