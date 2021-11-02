import 'package:adroit_flutter/core/navigation/navigation_service.dart';
import 'package:adroit_flutter/core/navigation/routes.dart';
import 'package:adroit_flutter/core/utils/app_color.dart';
import 'package:adroit_flutter/core/utils/app_icons.dart';
import 'package:adroit_flutter/core/utils/app_images.dart';
import 'package:adroit_flutter/core/utils/app_locale.dart';
import 'package:adroit_flutter/core/widgets/app_image.dart';
import 'package:adroit_flutter/core/widgets/appbar_cus.dart';
import 'package:adroit_flutter/core/widgets/menu_widget.dart';
import 'package:adroit_flutter/features/new_club_card/representation/scan_canister_screen.dart';
import 'package:easy_localization/src/public_ext.dart';
import 'package:flutter/material.dart';

class IdentifyCustomer2Screen extends StatefulWidget {
  const IdentifyCustomer2Screen({Key? key}) : super(key: key);

  @override
  _IdentifyCustomer2ScreenState createState() =>
      _IdentifyCustomer2ScreenState();
}

class _IdentifyCustomer2ScreenState extends State<IdentifyCustomer2Screen> {
  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    double height = MediaQuery.of(context).size.height;

    return Scaffold(
      appBar: buildAppBarCus(
          title: LocaleTexts.getCustomerDetailsAppbar.tr(),
          onTap: () {
            Navigator.pop(context);
          }),
      body: Container(
        width: width,
        height: height,
        margin: EdgeInsets.symmetric(horizontal: 15, vertical: 24),
        child: Column(
          children: [
            Expanded(
                child: Container(
              width: width,
              child: MenuWidget(
                onTap: () {
                  NavigationService.push(Routes.tap_club_card,
                      arguments: 'card');
                },
                title: LocaleTexts.useClubCard.tr(),
                icon: Container(
                  width: 50,
                  child: AppIcons.logo_card.widget(fit: BoxFit.fitWidth),
                ),
              ),
            )),
            Container(
              height: 30,
              child: Row(
                children: [
                  Expanded(
                    child: Container(
                      height: 1,
                      color: AppColors.darkGray,
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 5),
                    child: Text(LocaleTexts.orLine.tr()),
                  ),
                  Expanded(
                    child: Container(
                      height: 1,
                      color: AppColors.darkGray,
                    ),
                  ),
                ],
              ),
            ),
            Expanded(
                child: Container(
              width: width,
              child: MenuWidget(
                onTap: () {
                  NavigationService.push(Routes.phone_number);
                },
                title: LocaleTexts.usePhoneNumber.tr(),
                icon: Container(
                    width: 40,
                    child: AppIcons.phone_icon.widget(fit: BoxFit.fitWidth)),
              ),
            )),
          ],
        ),
      ),
    );
  }
}
