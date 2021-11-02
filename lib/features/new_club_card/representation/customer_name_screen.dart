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

class CustomerNameScreen extends StatefulWidget {
  const CustomerNameScreen({Key? key}) : super(key: key);

  @override
  _CustomerNameScreenState createState() => _CustomerNameScreenState();
}

class _CustomerNameScreenState extends State<CustomerNameScreen> {
  @override
  Widget build(BuildContext context) {
    final double width = MediaQuery.of(context).size.width;
    final double height = MediaQuery.of(context).size.height;
    return Scaffold(
      appBar: buildAppBarCus(
          title: LocaleTexts.customerNameAppbar.tr(),
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
              LocaleTexts.enterCustomerName.tr(),
              style: titleTextStyle,
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
                  labelText: LocaleTexts.customerNameAppbar.tr(),
                  labelStyle: TextStyle(color: AppColors.mainYellow)),
            ),
            SizedBox(
              height: paddingCont * 2,
            ),
            CusBtn(
                width: width,
                borderColor: AppColors.mainBlue,
                backgroundColor: AppColors.mainBlue,
                onTap: () {
                  NavigationService.push(Routes.identify_customer_type,
                      arguments: 'phone_number');
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
