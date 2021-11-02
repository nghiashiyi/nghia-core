import 'package:adroit_flutter/core/navigation/navigation_service.dart';
import 'package:adroit_flutter/core/navigation/routes.dart';
import 'package:flutter/material.dart';
import 'package:adroit_flutter/core/utils/app_color.dart';
import 'package:adroit_flutter/core/utils/app_constants.dart';
import 'package:adroit_flutter/core/utils/app_icons.dart';
import 'package:adroit_flutter/core/utils/app_locale.dart';
import 'package:adroit_flutter/core/widgets/alert_confirm.dart';
import 'package:adroit_flutter/core/widgets/alert_loading.dart';
import 'package:adroit_flutter/core/widgets/appbar_cus.dart';
import 'package:adroit_flutter/core/widgets/cus_btn.dart';
import 'package:easy_localization/src/public_ext.dart';
import 'package:flutter/material.dart';

class OtpScreen extends StatefulWidget {
  OtpScreen({Key? key, required this.type}) : super(key: key);
  late String type;
  @override
  _OtpScreenState createState() => _OtpScreenState();
}

class _OtpScreenState extends State<OtpScreen> {
  @override
  Widget build(BuildContext context) {
    final double width = MediaQuery.of(context).size.width;
    final double height = MediaQuery.of(context).size.height;
    return Scaffold(
      appBar: buildAppBarCus(
          title: LocaleTexts.oneTimePasscodeAppbar.tr(),
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
              LocaleTexts.enterCodeSMS.tr(),
              style: titleTextStyle,
            ),
            SizedBox(
              height: paddingCont * 2,
            ),
            RichText(
              textAlign: TextAlign.left,
              text: TextSpan(
                text: LocaleTexts.askPasscodeSMS1.tr(),
                style: TextStyle(
                    color: AppColors.black, fontSize: subTitleTextSize),
                children: <TextSpan>[
                  TextSpan(
                    text: LocaleTexts.oneTimePasscodeAppbar.tr(),
                    style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: subTitleTextSize),
                  ),
                  TextSpan(
                      text: LocaleTexts.askPasscodeSMS2.tr(),
                      style: TextStyle(
                          color: AppColors.black, fontSize: subTitleTextSize)),
                ],
              ),
            ),
            SizedBox(
              height: paddingCont * 2,
            ),
            TextField(
              keyboardType: TextInputType.name,
              decoration: InputDecoration(
                  focusedBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.all(Radius.circular(4)),
                    borderSide: BorderSide(width: 1, color: AppColors.mainBlue),
                  ),
                  border: OutlineInputBorder(
                      borderSide:
                          BorderSide(color: AppColors.mainBlue, width: 1)),
                  labelText:
                      LocaleTexts.oneTimePasscodeAppbar.tr().toUpperCase(),
                  labelStyle: TextStyle(color: AppColors.mainYellow)),
            ),
            SizedBox(
              height: paddingCont * 2,
            ),
            CusBtn(
                width: width,
                boderColor: AppColors.mainBlue,
                backgroundColor: AppColors.mainBlue,
                onTap: () {
                  if (widget.type == 'new_sale') {
                    NavigationService.push(Routes.choose_product);
                  } else {
                    NavigationService.push(Routes.new_card);
                  }
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
                )),
            SizedBox(
              height: paddingCont * 2,
            ),
            Container(
              width: width,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    LocaleTexts.resendOTP.tr(),
                    textAlign: TextAlign.center,
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
