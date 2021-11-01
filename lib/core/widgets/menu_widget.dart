import 'package:adroit_flutter/core/utils/app_color.dart';
import 'package:adroit_flutter/core/utils/app_constants.dart';
import 'package:flutter/material.dart';

class MenuWidget extends StatelessWidget {
  final Function() onTap;
  final Color mainColor;
  final Color circleColor;
  final Color titleColor;
  final String title;
  final Widget icon;
  const MenuWidget(
      {Key? key,
      required this.onTap,
      this.mainColor = AppColors.mainBlue,
      this.circleColor = AppColors.white,
      this.titleColor = AppColors.white,
      required this.icon,
      required this.title})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        padding: EdgeInsets.all(paddingCont),
        decoration: BoxDecoration(
            color: mainColor, borderRadius: BorderRadius.circular(10)),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            CircleAvatar(
              backgroundColor: circleColor,
              radius: 35,
              child: icon,
            ),
            SizedBox(
              height: 20,
            ),
            Text(
              title,
              style: TextStyle(
                  color: titleColor, fontSize: 12, fontWeight: FontWeight.w500),
            ),
          ],
        ),
      ),
    );
  }
}
