import 'package:adroit_flutter/core/widgets/app_image.dart';
import 'package:flutter/services.dart';
import 'package:flutter/widgets.dart';

abstract class AdroitIcons {
  AdroitIcons._();

  static const String _assetPath = "assets/icons/";

  static AdroitImageBuilder get tagHealthcare =>
      AdroitImageBuilder(_assetPath + 'tag_healthcare.svg');

  static AdroitImageBuilder get thumbUp =>
      AdroitImageBuilder(_assetPath + 'thumb_up.svg');

  static AdroitImageBuilder get rightArrow =>
      AdroitImageBuilder(_assetPath + 'right_arrow.svg');

  static AdroitImageBuilder get expand =>
      AdroitImageBuilder(_assetPath + 'expand.svg');
}

class AdroitImageBuilder {
  final String assetPath;

  AdroitImageBuilder(this.assetPath);

  Widget widget({
    Key? key,
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
    int? memCacheHeight
  }) {
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