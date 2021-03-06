import 'package:adroit_flutter/core/widgets/app_image.dart';
import 'package:flutter/services.dart';
import 'package:flutter/widgets.dart';

/// How to use as Widget
/// ```
/// AppIcons.expand.widget()
/// ````
abstract class AppIcons {
  AppIcons._();

  static const String _assetPath = "assets/icons/";

  static AppImageBuilder get tagHealthcare =>
      AppImageBuilder(_assetPath + 'tag_healthcare.svg');

  static AppImageBuilder get thumbUp =>
      AppImageBuilder(_assetPath + 'thumb_up.svg');

  static AppImageBuilder get rightArrow =>
      AppImageBuilder(_assetPath + 'right_arrow.svg');

  static AppImageBuilder get expand =>
      AppImageBuilder(_assetPath + 'expand.svg');
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
