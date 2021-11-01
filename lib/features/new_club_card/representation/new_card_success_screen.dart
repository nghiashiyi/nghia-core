import 'package:adroit_flutter/core/navigation/navigation_service.dart';
import 'package:adroit_flutter/core/navigation/routes.dart';
import 'package:adroit_flutter/core/utils/app_color.dart';
import 'package:adroit_flutter/core/utils/app_constants.dart';
import 'package:adroit_flutter/core/utils/app_icons.dart';
import 'package:adroit_flutter/core/utils/app_locale.dart';
import 'package:adroit_flutter/core/widgets/cus_btn.dart';
import 'package:adroit_flutter/core/widgets/user_info_panel.dart';
import 'package:easy_localization/src/public_ext.dart';
import 'package:flutter/material.dart';

class NewCardSuccessScreen extends StatefulWidget {
  const NewCardSuccessScreen({Key? key}) : super(key: key);

  @override
  _NewCardSuccessScreenState createState() => _NewCardSuccessScreenState();
}

class _NewCardSuccessScreenState extends State<NewCardSuccessScreen> {
  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    double height = MediaQuery.of(context).size.height;
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        backgroundColor: AppColors.mainYellow,
        title: Text(
          LocaleTexts.successAppbar.tr(),
          style: TextStyle(
              color: AppColors.mainBlue,
              fontSize: 18,
              fontWeight: FontWeight.w500),
        ),
      ),
      body: Column(
        children: [
          UserInfoPanel(width: width),
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
                                child: AppIcons.two_hearts.widget()),
                            Align(
                                alignment: Alignment.center,
                                child: AppIcons.check_icon.widget())
                          ],
                        ),
                        RichText(
                          textAlign: TextAlign.center,
                          text: TextSpan(
                            text: LocaleTexts.giveClubCard1.tr(),
                            style: TextStyle(
                                color: AppColors.black,
                                fontSize: titleTextSize),
                            children: <TextSpan>[
                              TextSpan(
                                text: LocaleTexts.clubCard.tr(),
                                style: TextStyle(
                                    fontWeight: FontWeight.bold,
                                    fontSize: titleTextSize),
                              ),
                              TextSpan(
                                  text: LocaleTexts.giveClubCard2.tr(),
                                  style: TextStyle(
                                      color: AppColors.black,
                                      fontSize: titleTextSize)),
                              TextSpan(
                                text: LocaleTexts.newMember.tr(),
                                style: TextStyle(
                                    fontWeight: FontWeight.bold,
                                    fontSize: titleTextSize),
                              ),
                            ],
                          ),
                        ),
                        Text(
                          LocaleTexts.remindDiscount.tr(),
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
                      boderColor: AppColors.mainBlue,
                      backgroundColor: AppColors.mainBlue,
                      onTap: () {
                        NavigationService.push(Routes.new_card_failure,
                            replace: true, clean: true);
                      },
                      insideWidget: Padding(
                        padding: EdgeInsets.all(paddingCont),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            AppIcons.shopping_cart
                                .widget(color: AppColors.mainYellow),
                            Text(
                              LocaleTexts.newSale.tr(),
                              style: btnTextStyle,
                            )
                          ],
                        ),
                      ),
                    ),
                    SizedBox(
                      height: 10,
                    ),
                    CusBtn(
                        width: width,
                        boderColor: AppColors.mainBlue,
                        backgroundColor: AppColors.white,
                        onTap: () {
                          NavigationService.push(Routes.home,
                              replace: true, clean: true);
                        },
                        insideWidget: Text(
                          LocaleTexts.doneBtn.tr(),
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
