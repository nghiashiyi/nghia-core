import 'package:adroit_flutter/core/utils/app_color.dart';
import 'package:adroit_flutter/core/utils/app_constants.dart';
import 'package:adroit_flutter/core/utils/app_icons.dart';
import 'package:flutter/material.dart';

AppBar buildAppBarCus({required String title, required Function() onTap}) {
  return AppBar(
    elevation: 0,
    automaticallyImplyLeading: false,
    title: Row(
      children: [
        GestureDetector(
          onTap: onTap,
          child: AppIcons.arrow_back.widget(fit: BoxFit.fill),
        ),
        SizedBox(
          width: paddingCont * 3 / 2,
        ),
        Text(
          title,
          style: TextStyle(
              color: AppColors.mainBlue,
              fontSize: 20,
              fontWeight: FontWeight.w500),
        ),
      ],
    ),
    backgroundColor: AppColors.mainYellow,
  );
}

AppBar buildCloseAppBarCus({required String title, required Function() onTap}) {
  return AppBar(
    elevation: 0,
    automaticallyImplyLeading: false,
    title: Row(
      children: [
        SizedBox(
          width: paddingCont * 3 / 2,
        ),
        Expanded(
          child: Text(
            title,
            style: TextStyle(
                color: AppColors.mainBlue,
                fontSize: 20,
                fontWeight: FontWeight.w500),
          ),
        ),
        GestureDetector(
          onTap: onTap,
          child: AppIcons.close.widget(fit: BoxFit.fill),
        ),
      ],
    ),
    backgroundColor: AppColors.mainYellow,
  );
}
