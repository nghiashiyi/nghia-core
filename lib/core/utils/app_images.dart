import 'package:adroit_flutter/core/widgets/app_image.dart';
import 'package:flutter/services.dart';
import 'package:flutter/widgets.dart';

/// How to use as Widget
/// ```
/// AppImages.sample.widget()
/// ````
abstract class AppImages {
  AppImages._();

  static const String _assetPath = "assets/images/";

  static AppImageBuilder get sample =>
      AppImageBuilder(_assetPath + 'sample.png');
}

class AppImageBuilder {
  final String assetPath;

  AppImageBuilder(this.assetPath);

  Widget widget(
      {Key? key,
      bool matchTextDirection = false,
      AssetBundle? bundle,
      String? package,
      double? width,
      double? height,
      BoxFit fit = BoxFit.contain,
      Alignment alignment = Alignment.center,
      Color? color,
      BorderRadius? borderRadius,
      Widget? placeholder,
      String? errorImageUrl,
      int? memCacheHeight}) {
    return AppImage(
      assetPath,
      key: key,
      width: width,
      height: height,
      fit: fit,
      color: color,
      alignment: alignment,
      placeholder: placeholder,
      errorImageUrl: errorImageUrl,
      memCacheHeight: memCacheHeight,
    );
  }
}
