import 'package:flutter/cupertino.dart';

import 'app_color.dart';

class AppPaths {
  static const assetTranslationsPath = 'assets/translations';
}

class DateFormats {
  static const MMddHHmm = 'MMM dd - HH:mm';
  static const yyyyMMdd = 'yyyy-MM-dd';
  static const ddMMMyyyy = 'dd MMM yyyy';
}

class FirestoreCollections {
  static final String stockCollectionName = 'stocks';
  static final String tagCollectionName = 'tags';
  static final String contentCollectionName = 'contents';
  static final String playbookCollectionName = 'playbooks';
  static final String publicationCollectionName = 'publications';
}

final double titleTextSize = 18;
final double subTitleTextSize = 14;

final double textSize = 14;

final double paddingCont = 10;

final TextStyle btnTextStyle = TextStyle(
    fontSize: 14, color: AppColors.white, fontWeight: FontWeight.w500);
final TextStyle titleTextStyle =
    TextStyle(fontSize: titleTextSize, fontWeight: FontWeight.bold);
