import 'package:adroit_flutter/core/navigation/navigation_service.dart';
import 'package:adroit_flutter/core/navigation/routes.dart';
import 'package:adroit_flutter/core/utils/app_color.dart';
import 'package:adroit_flutter/core/utils/app_constants.dart';
import 'package:adroit_flutter/core/utils/app_icons.dart';
import 'package:adroit_flutter/core/utils/app_images.dart';
import 'package:adroit_flutter/core/utils/app_locale.dart';
import 'package:adroit_flutter/core/widgets/menu_widget.dart';
import 'package:easy_localization/src/public_ext.dart';
import 'package:flutter/material.dart';

class Home2Screen extends StatefulWidget {
  const Home2Screen({Key? key}) : super(key: key);

  @override
  _Home2ScreenState createState() => _Home2ScreenState();
}

class _Home2ScreenState extends State<Home2Screen> {
  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    double height = MediaQuery.of(context).size.height;
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        automaticallyImplyLeading: false,
        title: AppIcons.koko_club_logo.widget(width: 200),
        backgroundColor: AppColors.mainYellow,
      ),
      body: Container(
        width: width,
        height: height,
        margin: EdgeInsets.only(
            bottom: paddingCont,
            top: paddingCont * 2,
            left: paddingCont,
            right: paddingCont),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              LocaleTexts.welcome.tr(),
              style: TextStyle(
                  color: AppColors.mainBlue,
                  fontSize: subTitleTextSize,
                  fontWeight: FontWeight.w500),
            ),
            Text(
              LocaleTexts.firstLastName.tr(),
              style: TextStyle(
                  color: AppColors.black,
                  fontSize: 22,
                  fontWeight: FontWeight.w500),
            ),
            SizedBox(
              height: paddingCont,
            ),
            Text(
              LocaleTexts.shopName.tr().toUpperCase(),
              style: TextStyle(
                  color: AppColors.mainBlue,
                  fontSize: 10,
                  fontWeight: FontWeight.w500),
            ),
            Text(
              LocaleTexts.topInTown.tr(),
              style: TextStyle(
                  color: AppColors.black,
                  fontSize: titleTextSize,
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
                  Menu2Widget(
                    icon: AppIcons.koko_club_card.widget(width: 80),
                    title: LocaleTexts.assignNewClubCard.tr(),
                    onTap: () {
                      NavigationService.push(Routes.identify_customer);
                    },
                  ),
                  Menu2Widget(
                    icon: AppImages.shopping_color.widget(width: 70),
                    title: LocaleTexts.newSale.tr(),
                    onTap: () {},
                  ),
                  Menu2Widget(
                    icon: AppImages.shipping_color.widget(width: 70),
                    title: LocaleTexts.delivery.tr(),
                    onTap: () {},
                  ),
                  Menu2Widget(
                    icon: AppImages.user_color.widget(width: 70),
                    title: LocaleTexts.myAccount.tr(),
                    onTap: () {},
                  ),
                ],
              ),
            ),
            Container(
              width: width,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    LocaleTexts.versionBuild.tr(),
                    style: TextStyle(
                        color: AppColors.darkGray,
                        fontSize: 14,
                        fontWeight: FontWeight.w400),
                  ),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}

class Menu2Widget extends StatelessWidget {
  const Menu2Widget(
      {Key? key, required this.icon, required this.title, required this.onTap})
      : super(key: key);
  final Widget icon;
  final String title;
  final Function() onTap;
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        padding: EdgeInsets.all(paddingCont),
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(10),
            border: Border.all(color: AppColors.darkGray)),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            icon,
            SizedBox(
              height: paddingCont,
            ),
            Text(
              title,
              textAlign: TextAlign.center,
              style: TextStyle(
                  color: AppColors.mainBlue,
                  fontSize: 12,
                  fontWeight: FontWeight.w500),
            )
          ],
        ),
      ),
    );
  }
}
