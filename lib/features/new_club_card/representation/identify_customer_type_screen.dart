import 'package:adroit_flutter/core/navigation/navigation_service.dart';
import 'package:adroit_flutter/core/navigation/routes.dart';
import 'package:adroit_flutter/core/utils/app_color.dart';
import 'package:adroit_flutter/core/utils/app_icons.dart';
import 'package:adroit_flutter/core/utils/app_images.dart';
import 'package:adroit_flutter/core/utils/app_locale.dart';
import 'package:adroit_flutter/core/widgets/app_image.dart';
import 'package:adroit_flutter/core/widgets/appbar_cus.dart';
import 'package:adroit_flutter/core/widgets/menu_widget.dart';
import 'package:easy_localization/src/public_ext.dart';
import 'package:flutter/material.dart';

class IdentifyCustomerTypeScreen extends StatefulWidget {
  IdentifyCustomerTypeScreen({Key? key, required this.type}) : super(key: key);
  late String type;
  @override
  _IdentifyCustomerTypeScreenState createState() =>
      _IdentifyCustomerTypeScreenState();
}

class _IdentifyCustomerTypeScreenState
    extends State<IdentifyCustomerTypeScreen> {
  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    double height = MediaQuery.of(context).size.height;
    print(widget.type);
    return Scaffold(
      appBar: buildAppBarCus(
          title: LocaleTexts.customerTypeAppbar.tr(),
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
                  NavigationService.push(Routes.new_card);
                },
                mainColor: AppColors.mainBlue,
                title: LocaleTexts.houseHold.tr(),
                icon: Container(
                    width: 40,
                    child: AppIcons.home.widget(fit: BoxFit.fitWidth)),
                circleColor: AppColors.white,
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
                  NavigationService.push(Routes.new_card);
                },
                mainColor: AppColors.mainBlue,
                title: LocaleTexts.commercial.tr(),
                icon: Container(
                    width: 40,
                    child: AppIcons.business.widget(fit: BoxFit.fitWidth)),
                circleColor: AppColors.white,
              ),
            )),
          ],
        ),
      ),
    );
  }
}
