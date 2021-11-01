import 'package:adroit_flutter/core/utils/app_color.dart';
import 'package:adroit_flutter/core/utils/app_icons.dart';
import 'package:adroit_flutter/core/utils/app_locale.dart';
import 'package:easy_localization/src/public_ext.dart';
import 'package:flutter/material.dart';

class UserInfoPanel extends StatelessWidget {
  const UserInfoPanel({
    Key? key,
    required this.width,
  }) : super(key: key);

  final double width;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: width,
      height: 65,
      padding: EdgeInsets.all(10),
      color: AppColors.lightGray,
      child: Row(
        children: [
          Container(
            decoration: BoxDecoration(
              shape: BoxShape.circle,
              color: AppColors.mainYellow,
            ),
            child: AppIcons.person.widget(),
          ),
          SizedBox(
            width: 10,
          ),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(LocaleTexts.userName.tr()),
              Text(LocaleTexts.userPhoneNumber.tr())
            ],
          )
        ],
      ),
    );
  }
}
