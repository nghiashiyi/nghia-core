import 'package:adroit_flutter/core/navigation/navigation_service.dart';
import 'package:adroit_flutter/core/navigation/routes.dart';
import 'package:adroit_flutter/core/utils/app_color.dart';
import 'package:adroit_flutter/core/utils/app_constants.dart';
import 'package:adroit_flutter/core/utils/app_icons.dart';
import 'package:adroit_flutter/core/utils/app_locale.dart';
import 'package:adroit_flutter/core/widgets/appbar_cus.dart';
import 'package:adroit_flutter/core/widgets/user_info_panel.dart';
import 'package:easy_localization/src/public_ext.dart';
import 'package:flutter/material.dart';

class NewCardScreen extends StatefulWidget {
  const NewCardScreen({Key? key}) : super(key: key);

  @override
  _NewCardScreenState createState() => _NewCardScreenState();
}

class _NewCardScreenState extends State<NewCardScreen> {
  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    double height = MediaQuery.of(context).size.height;

    return Scaffold(
      appBar: buildAppBarCus(
          title: LocaleTexts.assignClubCardAppbar.tr(),
          onTap: () {
            Navigator.pop(context);
          }),
      body: Container(
        width: width,
        height: height,
        color: AppColors.white,
        child: Column(
          children: [
            UserInfoPanel(width: width),
            Expanded(
                child: Container(
              width: width,
              margin: EdgeInsets.all(10),
              child: Column(
                children: [
                  Expanded(
                    flex: 2,
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(
                          LocaleTexts.tapCardDevice.tr(),
                          style: TextStyle(
                            fontSize: titleTextSize,
                            fontWeight: FontWeight.w500,
                          ),
                        ),
                        SizedBox(
                          height: paddingCont * 2,
                        ),
                        RichText(
                          textAlign: TextAlign.center,
                          text: TextSpan(
                            text: LocaleTexts.takeOutCard1.tr(),
                            style: TextStyle(
                                color: AppColors.black,
                                fontSize: subTitleTextSize),
                            children: <TextSpan>[
                              TextSpan(
                                text: LocaleTexts.clubCard.tr(),
                                style: TextStyle(
                                    fontWeight: FontWeight.bold,
                                    fontSize: subTitleTextSize),
                              ),
                              TextSpan(
                                  text: LocaleTexts.takeOutCard2.tr(),
                                  style: TextStyle(
                                      color: AppColors.black,
                                      fontSize: subTitleTextSize)),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                  Expanded(
                      flex: 4,
                      child: GestureDetector(
                        onTap: () {
                          NavigationService.push(Routes.new_card_success,
                              replace: true, clean: true);
                        },
                        child: Container(
                          alignment: Alignment.center,
                          child: AppIcons.car_tap_anim.widget(),
                        ),
                      )),
                ],
              ),
            ))
          ],
        ),
      ),
    );
  }
}
