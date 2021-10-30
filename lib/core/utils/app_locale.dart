import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

/// How to use:
/// LocaleTexts.appName.tr()
///
/// Example:
/// ```
/// import 'package:adroit_flutter/core/utils/utils.dart';
///
/// ...
///   @override
///   Widget build(BuildContext context) {
///     return Container(
///       child: Text(LocaleTexts.appName.tr())
///     );
///     return MaterialApp(
///       localizationsDelegates: context.localizationDelegates,
///       supportedLocales: context.supportedLocales,
///       locale: context.locale,
///       theme: ThemeData(
///         fontFamily: "Montserrat",
///       ),
///       initialRoute: Routes.main,
///       onGenerateRoute: generateRoute,
///       debugShowCheckedModeBanner: false,
///       navigatorKey: NavigationService.globalNavigatorKey,
///     );
///   }
/// ```
///
class LocaleTexts {
  static const appName = 'appName';
  static const welcomeTo = 'welcomeTo';
}

class AppLocales {
  static const en = Locale('en', 'US');

  static Locale getCorrespondingLocal() {
    return [en].firstWhere((element) {
      return element.languageCode == Intl.systemLocale.split('_').first;
    }, orElse: () => en);
  }
}
