import 'package:adroit_flutter/core/navigation/navigation_service.dart';
import 'package:adroit_flutter/core/navigation/routes.dart';
import 'package:adroit_flutter/core/utils/app_color.dart';
import 'package:adroit_flutter/core/utils/app_constants.dart';
import 'package:adroit_flutter/core/utils/app_icons.dart';
import 'package:adroit_flutter/core/utils/app_locale.dart';
import 'package:adroit_flutter/core/widgets/appbar_cus.dart';
import 'package:adroit_flutter/core/widgets/cus_btn.dart';
import 'package:adroit_flutter/core/widgets/user_info_panel.dart';
import 'package:easy_localization/src/public_ext.dart';
import 'package:flutter/material.dart';

class DiscountSuccessScreen extends StatefulWidget {
  const DiscountSuccessScreen({Key? key}) : super(key: key);

  @override
  _DiscountSuccessScreenState createState() => _DiscountSuccessScreenState();
}

class _DiscountSuccessScreenState extends State<DiscountSuccessScreen> {
  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    double height = MediaQuery.of(context).size.height;
    return Scaffold(
      appBar: buildAppBarCus(
          title: LocaleTexts.discountAddedAppbar.tr(),
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
                        Stack(
                          children: [
                            Align(
                                alignment: Alignment.center,
                                child: AppIcons.firework_celeb.widget()),
                            Align(
                                alignment: Alignment.center,
                                child: AppIcons.gold_star.widget())
                          ],
                        ),
                        Column(
                          children: [
                            RichText(
                              textAlign: TextAlign.center,
                              text: TextSpan(
                                text: LocaleTexts.discountAddedCeleb.tr(),
                                style: TextStyle(
                                    color: AppColors.black,
                                    fontWeight: FontWeight.bold,
                                    fontSize: titleTextSize),
                                children: <TextSpan>[
                                  TextSpan(
                                    text: LocaleTexts.on.tr(),
                                    style: TextStyle(
                                        fontSize: titleTextSize,
                                        fontWeight: FontWeight.w400),
                                  ),
                                ],
                              ),
                            ),
                            RichText(
                              textAlign: TextAlign.center,
                              text: TextSpan(
                                text: LocaleTexts.kokoClub.tr(),
                                style: TextStyle(
                                    color: AppColors.black,
                                    fontWeight: FontWeight.bold,
                                    fontSize: titleTextSize),
                                children: <TextSpan>[
                                  TextSpan(
                                    text: LocaleTexts.items.tr(),
                                    style: TextStyle(
                                        fontSize: titleTextSize,
                                        fontWeight: FontWeight.w400),
                                  ),
                                ],
                              ),
                            ),
                          ],
                        ),
                      ],
                    ))
                  ],
                ),
              )),
          Padding(
            padding: const EdgeInsets.all(10),
            child: CusBtn(
                width: width,
                boderColor: AppColors.mainBlue,
                backgroundColor: AppColors.mainBlue,
                onTap: () {
                  NavigationService.push(
                    Routes.review,
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
                )),
          )
        ],
      ),
    );
  }
}
