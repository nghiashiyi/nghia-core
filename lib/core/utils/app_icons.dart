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

  static AppImageBuilder get test => AppImageBuilder(_assetPath + 'test.svg');

  static AppImageBuilder get tagHealthcare =>
      AppImageBuilder(_assetPath + 'tag_healthcare.svg');

  static AppImageBuilder get thumbUp =>
      AppImageBuilder(_assetPath + 'thumb_up.svg');

  static AppImageBuilder get rightArrow =>
      AppImageBuilder(_assetPath + 'right_arrow.svg');

  static AppImageBuilder get expand =>
      AppImageBuilder(_assetPath + 'expand.svg');

  static AppImageBuilder get account_box =>
      AppImageBuilder(_assetPath + 'account_box.svg');

  static AppImageBuilder get logo_card =>
      AppImageBuilder(_assetPath + 'logo_card.svg');

  static AppImageBuilder get local_shipping =>
      AppImageBuilder(_assetPath + 'local_shipping.svg');

  static AppImageBuilder get phone => AppImageBuilder(_assetPath + 'phone.svg');

  static AppImageBuilder get shopping_cart =>
      AppImageBuilder(_assetPath + 'shopping_cart.svg');

  static AppImageBuilder get arrow_back =>
      AppImageBuilder(_assetPath + 'arrow_back.svg');

  static AppImageBuilder get arrow_forward =>
      AppImageBuilder(_assetPath + 'arrow_forward.svg');

  static AppImageBuilder get business =>
      AppImageBuilder(_assetPath + 'business.svg');

  static AppImageBuilder get car_tap_anim =>
      AppImageBuilder(_assetPath + 'car_tap_anim.svg');

  static AppImageBuilder get check_icon =>
      AppImageBuilder(_assetPath + 'check_icon.svg');

  static AppImageBuilder get false_icon =>
      AppImageBuilder(_assetPath + 'false_icon.svg');

  static AppImageBuilder get home => AppImageBuilder(_assetPath + 'home.svg');

  static AppImageBuilder get person =>
      AppImageBuilder(_assetPath + 'person.svg');

  static AppImageBuilder get phone_icon =>
      AppImageBuilder(_assetPath + 'phone_icon.svg');

  static AppImageBuilder get pre_loader_anim =>
      AppImageBuilder(_assetPath + 'pre_loader_anim.svg');

  static AppImageBuilder get refresh_icon =>
      AppImageBuilder(_assetPath + 'refresh_icon.svg');

  static AppImageBuilder get koko_club_logo =>
      AppImageBuilder(_assetPath + 'koko_club_logo.svg');

  static AppImageBuilder get two_hearts =>
      AppImageBuilder(_assetPath + 'two_hearts.svg');

  static AppImageBuilder get koko_club_card =>
      AppImageBuilder(_assetPath + 'koko_club_card.svg');

  static AppImageBuilder get search =>
      AppImageBuilder(_assetPath + 'search.svg');

  static AppImageBuilder get close_blue =>
      AppImageBuilder(_assetPath + 'close_blue.svg');

  static AppImageBuilder get add_circle =>
      AppImageBuilder(_assetPath + 'add_circle.svg');

  static AppImageBuilder get delete_circle =>
      AppImageBuilder(_assetPath + 'delete_circle.svg');

  static AppImageBuilder get remove_circle =>
      AppImageBuilder(_assetPath + 'remove_circle.svg');

  static AppImageBuilder get close => AppImageBuilder(_assetPath + 'close.svg');

  static AppImageBuilder get delete_icon =>
      AppImageBuilder(_assetPath + 'delete_icon.svg');

  static AppImageBuilder get firework_celeb =>
      AppImageBuilder(_assetPath + 'firework_celeb.svg');

  static AppImageBuilder get gold_star =>
      AppImageBuilder(_assetPath + 'gold_star.svg');

  static AppImageBuilder get pin_code =>
      AppImageBuilder(_assetPath + 'pin_code.svg');

  static AppImageBuilder get qr_code_scanner =>
      AppImageBuilder(_assetPath + 'qr_code_scanner.svg');

  static AppImageBuilder get koko_icon =>
      AppImageBuilder(_assetPath + 'koko_icon.svg');
  static AppImageBuilder get close =>
      AppImageBuilder(_assetPath + 'close.svg');
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
