import 'package:adroit_flutter/core/navigation/navigation_service.dart';
import 'package:adroit_flutter/core/navigation/routes.dart';
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

class PhoneNumberScreen extends StatefulWidget {
  const PhoneNumberScreen({Key? key}) : super(key: key);

  @override
  _PhoneNumberScreenState createState() => _PhoneNumberScreenState();
}

class _PhoneNumberScreenState extends State<PhoneNumberScreen> {
  @override
  Widget build(BuildContext context) {
    final double width = MediaQuery.of(context).size.width;
    final double height = MediaQuery.of(context).size.height;
    return Scaffold(
      appBar: buildAppBarCus(
          title: LocaleTexts.phoneNumberAppbar,
          onTap: () {
            Navigator.pop(context);
          }),
      body: Container(
        margin: EdgeInsets.all(paddingCont),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SizedBox(
              height: paddingCont,
            ),
            Text(
              LocaleTexts.enterPhoneNumber.tr(),
              style: titleTextStyle,
            ),
            SizedBox(
              height: paddingCont * 2,
            ),
            TextField(
              keyboardType: TextInputType.phone,
              decoration: InputDecoration(
                  focusedBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.all(Radius.circular(4)),
                    borderSide: BorderSide(width: 1, color: AppColors.mainBlue),
                  ),
                  border: OutlineInputBorder(
                      borderSide:
                          BorderSide(color: AppColors.mainBlue, width: 1)),
                  labelText: LocaleTexts.phoneNumberAppbar.tr(),
                  labelStyle: TextStyle(color: AppColors.mainYellow)),
            ),
            SizedBox(
              height: paddingCont,
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
                      onTapHeader: () {
                        NavigationService.push(Routes.customer_name);
                      },
                      onTapFooter: () {
                        showDialog<String>(
                          context: context,
                          builder: (BuildContext context) => AlertDialogConfirm(
                            confirmOnTap: () {},
                          ),
                        );
                      },
                    ),
                  );
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