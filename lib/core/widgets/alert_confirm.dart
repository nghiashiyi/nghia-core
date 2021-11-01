import 'package:adroit_flutter/core/navigation/navigation_service.dart';
import 'package:adroit_flutter/core/navigation/routes.dart';
import 'package:adroit_flutter/core/utils/app_color.dart';
import 'package:adroit_flutter/core/utils/app_constants.dart';
import 'package:adroit_flutter/core/utils/app_icons.dart';
import 'package:adroit_flutter/core/utils/app_locale.dart';
import 'package:easy_localization/src/public_ext.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class AlertDialogConfirm extends StatelessWidget {
  AlertDialogConfirm({
    Key? key,
    required this.confirmOnTap,
  }) : super(key: key);
  Function() confirmOnTap;
  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      content: Container(
        height: 200,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            Expanded(
              flex: 1,
              child: Text(
                LocaleTexts.customerIdentified.tr(),
                style: TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.w500,
                    color: AppColors.black),
              ),
            ),
            Expanded(
              flex: 3,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Container(
                    width: 70,
                    height: 70,
                    decoration: BoxDecoration(
                      shape: BoxShape.circle,
                      color: AppColors.mainYellow,
                    ),
                    child: Container(
                        child: AppIcons.person.widget(
                      fit: BoxFit.fill,
                    )),
                  ),
                  Text(
                    LocaleTexts.userName.tr(),
                    style: TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.w500,
                        color: AppColors.black),
                  ),
                  Text(
                    LocaleTexts.userPhoneNumber.tr(),
                    style: TextStyle(
                        fontSize: 14,
                        fontWeight: FontWeight.w400,
                        color: AppColors.darkGray),
                  ),
                ],
              ),
            ),
            SizedBox(
              height: 10,
            ),
            Expanded(
              flex: 1,
              child: Container(
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Expanded(
                      child: GestureDetector(
                        onTap: () {
                          Navigator.pop(context);
                        },
                        child: Container(
                          alignment: Alignment.center,
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(38),
                              border: Border.all(color: AppColors.mainBlue)),
                          child: Text(
                            LocaleTexts.canleBtn.tr(),
                            style: btnTextStyle.copyWith(
                                color: AppColors.mainBlue),
                          ),
                        ),
                      ),
                    ),
                    SizedBox(
                      width: 10,
                    ),
                    Expanded(
                      child: GestureDetector(
                        onTap: confirmOnTap,
                        child: Container(
                          alignment: Alignment.center,
                          decoration: BoxDecoration(
                              color: AppColors.mainBlue,
                              borderRadius: BorderRadius.circular(38),
                              border: Border.all(color: AppColors.mainBlue)),
                          child: Text(
                            LocaleTexts.confirmBtn.tr(),
                            style: TextStyle(
                                color: AppColors.white,
                                fontSize: 12,
                                fontWeight: FontWeight.w500),
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
