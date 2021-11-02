import 'package:adroit_flutter/core/navigation/navigation_service.dart';
import 'package:adroit_flutter/core/navigation/routes.dart';
import 'package:adroit_flutter/core/utils/app_color.dart';
import 'package:adroit_flutter/core/utils/app_constants.dart';
import 'package:adroit_flutter/core/utils/app_icons.dart';
import 'package:adroit_flutter/core/utils/app_locale.dart';
import 'package:adroit_flutter/core/widgets/appbar_cus.dart';
import 'package:adroit_flutter/core/widgets/cus_btn.dart';
import 'package:easy_localization/src/public_ext.dart';
import 'package:flutter/material.dart';

class DiscountFailureScreen extends StatefulWidget {
  const DiscountFailureScreen({Key? key}) : super(key: key);

  @override
  _DiscountFailureScreenState createState() => _DiscountFailureScreenState();
}

class _DiscountFailureScreenState extends State<DiscountFailureScreen> {
  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    double height = MediaQuery.of(context).size.height;
    return Scaffold(
      appBar: buildAppBarCus(
          title: LocaleTexts.errorAppbar.tr(),
          onTap: () {
            Navigator.pop(context);
          }),
      body: Column(
        children: [
          Expanded(
              flex: 5,
              child: Padding(
                padding: const EdgeInsets.all(10),
                child: Column(
                  children: [
                    Expanded(
                        child: Column(
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      children: [
                        Align(
                            alignment: Alignment.center,
                            child: AppIcons.false_icon.widget()),
                        Text(
                          LocaleTexts.discountInvialid.tr(),
                          textAlign: TextAlign.center,
                          style: TextStyle(
                              color: AppColors.black,
                              fontSize: subTitleTextSize),
                        ),
                      ],
                    ))
                  ],
                ),
              )),
          Expanded(
              flex: 2,
              child: Padding(
                padding: const EdgeInsets.all(10),
                child: Column(
                  children: [
                    CusBtn(
                      width: width,
                      borderColor: AppColors.mainBlue,
                      backgroundColor: AppColors.mainBlue,
                      onTap: () {},
                      insideWidget: Padding(
                        padding: EdgeInsets.all(paddingCont),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Padding(
                              padding: const EdgeInsets.only(right: 10),
                              child: AppIcons.refresh_icon
                                  .widget(color: AppColors.mainBlue),
                            ),
                            Expanded(
                              child: Center(
                                child: Text(
                                  LocaleTexts.tryAgainBtn.tr(),
                                  style: btnTextStyle,
                                ),
                              ),
                            ),
                            Padding(
                              padding: const EdgeInsets.only(right: 10),
                              child: AppIcons.refresh_icon
                                  .widget(color: AppColors.white),
                            ),
                          ],
                        ),
                      ),
                    ),
                    SizedBox(
                      height: 10,
                    ),
                    CusBtn(
                        width: width,
                        borderColor: AppColors.mainBlue,
                        backgroundColor: AppColors.white,
                        onTap: () {
                          NavigationService.push(Routes.home,
                              replace: true, clean: true);
                        },
                        insideWidget: Text(
                          LocaleTexts.canleBtn.tr(),
                          style:
                              btnTextStyle.copyWith(color: AppColors.mainBlue),
                        ))
                  ],
                ),
              ))
        ],
      ),
    );
  }
}
