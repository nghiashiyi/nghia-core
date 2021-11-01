import 'package:adroit_flutter/core/navigation/navigation_service.dart';
import 'package:adroit_flutter/core/navigation/routes.dart';
import 'package:adroit_flutter/core/utils/app_constants.dart';
import 'package:flutter/material.dart';
import 'package:adroit_flutter/core/utils/app_color.dart';
import 'package:adroit_flutter/core/utils/app_icons.dart';
import 'package:adroit_flutter/core/utils/app_locale.dart';
import 'package:adroit_flutter/core/widgets/cus_btn.dart';
import 'package:adroit_flutter/core/widgets/user_info_panel.dart';
import 'package:easy_localization/src/public_ext.dart';
import 'package:flutter/material.dart';

class NewCardFailureScreen extends StatefulWidget {
  const NewCardFailureScreen({Key? key}) : super(key: key);

  @override
  _NewCardFailureScreenState createState() => _NewCardFailureScreenState();
}

class _NewCardFailureScreenState extends State<NewCardFailureScreen> {
  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    double height = MediaQuery.of(context).size.height;
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        backgroundColor: AppColors.mainYellow,
        title: Text(
          LocaleTexts.errorAppbar.tr(),
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
                        Align(
                            alignment: Alignment.center,
                            child: AppIcons.false_icon.widget()),
                        Text(
                          LocaleTexts.errorScan,
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
                        boderColor: AppColors.mainBlue,
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
