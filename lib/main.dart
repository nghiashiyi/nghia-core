import 'package:adroit_flutter/app.dart';
import 'package:adroit_flutter/core/utils/flavor_config.dart';
import 'package:adroit_flutter/core/utils/utils.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:firebase_core/firebase_core.dart';

import 'di.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await EasyLocalization.ensureInitialized();
  await Firebase.initializeApp();
  await FlavorConfig.instance.init(Flavors.prod);

  setupLocator(flavorConfig: FlavorConfig.instance);

  runApp(EasyLocalization(
      supportedLocales: [AppLocales.en],
      path: AppPaths.assetTranslationsPath,
      fallbackLocale: AppLocales.en,
      child: KoKoApp()));
}

