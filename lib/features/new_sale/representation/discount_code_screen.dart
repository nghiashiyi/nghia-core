import 'package:adroit_flutter/core/navigation/navigation_service.dart';
import 'package:adroit_flutter/core/navigation/routes.dart';
import 'package:adroit_flutter/core/utils/app_color.dart';
import 'package:adroit_flutter/core/utils/app_constants.dart';
import 'package:adroit_flutter/core/utils/app_icons.dart';
import 'package:adroit_flutter/core/utils/app_locale.dart';
import 'package:adroit_flutter/core/widgets/alert_loading.dart';
import 'package:adroit_flutter/core/widgets/appbar_cus.dart';
import 'package:adroit_flutter/core/widgets/cus_btn.dart';
import 'package:easy_localization/src/public_ext.dart';
import 'package:flutter/material.dart';

class DiscountCodeScreen extends StatefulWidget {
  const DiscountCodeScreen({Key? key}) : super(key: key);

  @override
  _DiscountCodeScreenState createState() => _DiscountCodeScreenState();
}

class _DiscountCodeScreenState extends State<DiscountCodeScreen> {
  @override
  Widget build(BuildContext context) {
    final double width = MediaQuery.of(context).size.width;
    final double height = MediaQuery.of(context).size.height;
    return Scaffold(
      appBar: buildAppBarCus(
          title: LocaleTexts.enterDiscountCode.tr(),
          onTap: () {
            Navigator.pop(context);
          }),
      body: Container(
        margin: EdgeInsets.only(
            left: paddingCont, right: paddingCont, top: paddingCont * 2),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              LocaleTexts.enterDiscountCode.tr(),
              style: titleTextStyle,
            ),
            SizedBox(
              height: paddingCont * 2,
            ),
            TextField(
              keyboardType: TextInputType.number,
              decoration: InputDecoration(
                  focusedBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.all(Radius.circular(4)),
                    borderSide: BorderSide(width: 1, color: AppColors.mainBlue),
                  ),
                  border: OutlineInputBorder(
                      borderSide:
                          BorderSide(color: AppColors.mainBlue, width: 1)),
                  labelText: LocaleTexts.discountCode.tr(),
                  labelStyle: TextStyle(color: AppColors.mainYellow)),
            ),
            SizedBox(
              height: paddingCont * 2,
            ),
            Text(
              LocaleTexts.egNumber.tr(),
              style: TextStyle(
                  color: AppColors.darkGray, fontSize: titleTextSize / 2),
            ),
            SizedBox(
              height: paddingCont,
            ),
            CusBtn(
                width: width,
                boderColor: AppColors.mainBlue,
                backgroundColor: AppColors.mainBlue,
                onTap: () {
                  showDialog<String>(
                      context: context,
                      builder: (BuildContext context) => AlertDialogLoading(
                          needHeaderFooter: true,
                          headerText: LocaleTexts.tapError.tr(),
                          footerText: LocaleTexts.tapForSuccess.tr(),
                          onTapHeader: () {
                            NavigationService.push(Routes.discount_failure);
                          },
                          onTapFooter: () {
                            NavigationService.push(Routes.discount_success);
                          }));
                },
                insideWidget: Padding(
                  padding: EdgeInsets.all(paddingCont),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      AppIcons.arrow_forward.widget(color: AppColors.mainBlue),
                      Text(
                        LocaleTexts.nextBtn.tr(),
                        style: btnTextStyle,
                      ),
                      AppIcons.arrow_forward.widget()
                    ],
                  ),
                ))
          ],
        ),
      ),
    );
  }
}
