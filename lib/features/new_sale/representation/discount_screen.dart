import 'package:adroit_flutter/core/navigation/navigation_service.dart';
import 'package:adroit_flutter/core/navigation/routes.dart';
import 'package:adroit_flutter/core/utils/app_color.dart';
import 'package:adroit_flutter/core/utils/app_constants.dart';
import 'package:adroit_flutter/core/utils/app_icons.dart';
import 'package:adroit_flutter/core/utils/app_images.dart';
import 'package:adroit_flutter/core/utils/app_locale.dart';
import 'package:adroit_flutter/core/widgets/appbar_cus.dart';
import 'package:adroit_flutter/core/widgets/cus_btn.dart';
import 'package:adroit_flutter/core/widgets/menu_widget.dart';
import 'package:easy_localization/src/public_ext.dart';
import 'package:flutter/material.dart';

class DiscountScreen extends StatefulWidget {
  const DiscountScreen({Key? key}) : super(key: key);

  @override
  _DiscountScreenState createState() => _DiscountScreenState();
}

class _DiscountScreenState extends State<DiscountScreen> {
  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    double height = MediaQuery.of(context).size.height;

    return Scaffold(
      appBar: buildAppBarCus(
          title: LocaleTexts.addDiscountAppbar.tr(),
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
                flex: 2,
                child: Container(
                  width: width,
                  child: MenuWidget(
                    onTap: () {
                      NavigationService.push(Routes.discount_scan);
                    },
                    title: LocaleTexts.scanQrCode.tr(),
                    icon: Container(
                      width: 50,
                      child:
                          AppIcons.qr_code_scanner.widget(fit: BoxFit.fitWidth),
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
                flex: 2,
                child: Container(
                  width: width,
                  child: MenuWidget(
                    onTap: () {},
                    title: LocaleTexts.discountCode.tr(),
                    icon: Container(
                        width: 40,
                        child: AppIcons.pin_code.widget(fit: BoxFit.fitWidth)),
                  ),
                )),
            Expanded(
              flex: 1,
              child: Container(
                margin: EdgeInsets.only(top: paddingCont * 3),
                child: CusBtn(
                    width: width,
                    boderColor: AppColors.darkGray,
                    backgroundColor: AppColors.white,
                    onTap: () {
                      Navigator.pop(context);
                    },
                    insideWidget: Padding(
                      padding: EdgeInsets.all(paddingCont),
                      child: Text(
                        LocaleTexts.nodiscountCodeBtn.tr(),
                        style: TextStyle(
                            color: AppColors.mainBlue,
                            fontSize: 12,
                            fontWeight: FontWeight.w500),
                      ),
                    )),
              ),
            )
          ],
        ),
      ),
    );
    ;
  }
}
