import 'package:adroit_flutter/core/navigation/navigation_service.dart';
import 'package:adroit_flutter/core/navigation/routes.dart';
import 'package:adroit_flutter/core/utils/app_color.dart';
import 'package:adroit_flutter/core/utils/app_constants.dart';
import 'package:adroit_flutter/core/utils/app_icons.dart';
import 'package:adroit_flutter/core/utils/app_locale.dart';
import 'package:adroit_flutter/core/widgets/menu_widget.dart';
import 'package:easy_localization/src/public_ext.dart';
import 'package:flutter/material.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    double height = MediaQuery.of(context).size.height;
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        automaticallyImplyLeading: false,
        title: AppIcons.koko_club_logo.widget(),
        centerTitle: true,
        backgroundColor: AppColors.mainYellow,
      ),
      body: Container(
        width: width,
        height: height,
        margin: EdgeInsets.only(bottom: paddingCont, top: paddingCont * 2),
        child: Column(
          children: [
            Text(
              LocaleTexts.welcomeTo.tr(),
              style: TextStyle(
                  color: AppColors.mainBlue, fontSize: subTitleTextSize),
            ),
            Text(
              LocaleTexts.shopName.tr(),
              style: TextStyle(
                  color: AppColors.black,
                  fontSize: 36,
                  fontWeight: FontWeight.w500),
            ),
            Expanded(
              child: GridView.count(
                primary: false,
                padding: const EdgeInsets.all(20),
                crossAxisSpacing: 10,
                mainAxisSpacing: 10,
                crossAxisCount: 2,
                children: <Widget>[
                  MenuWidget(
                    onTap: () {
                      NavigationService.push(
                        Routes.identify_customer,
                      );
                    },
                    title: LocaleTexts.newClubCard.tr(),
                    icon: Container(
                        width: 40,
                        child: AppIcons.logo_card.widget(fit: BoxFit.fitWidth)),
                  ),
                  MenuWidget(
                    onTap: () {},
                    title: LocaleTexts.newSale.tr(),
                    icon: Container(
                        width: 40,
                        child: AppIcons.shopping_cart
                            .widget(fit: BoxFit.fitWidth)),
                  ),
                  MenuWidget(
                    onTap: () {},
                    mainColor: AppColors.white,
                    circleColor: AppColors.lightGray,
                    titleColor: AppColors.mainBlue,
                    title: LocaleTexts.delivery.tr(),
                    icon: Container(
                        width: 40,
                        child: AppIcons.local_shipping
                            .widget(fit: BoxFit.fitWidth)),
                  ),
                  MenuWidget(
                    onTap: () {},
                    mainColor: AppColors.white,
                    circleColor: AppColors.lightGray,
                    titleColor: AppColors.mainBlue,
                    title: LocaleTexts.myAccount.tr(),
                    icon: Container(
                        width: 40,
                        child:
                            AppIcons.account_box.widget(fit: BoxFit.fitWidth)),
                  ),
                ],
              ),
            ),
            Text(
              LocaleTexts.versionBuild.tr(),
              style: TextStyle(
                  color: AppColors.darkGray,
                  fontSize: 14,
                  fontWeight: FontWeight.w400),
            )
          ],
        ),
      ),
    );
  }
}
