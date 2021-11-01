import 'package:adroit_flutter/core/navigation/navigation_service.dart';
import 'package:adroit_flutter/core/navigation/routes.dart';
import 'package:adroit_flutter/core/utils/app_color.dart';
import 'package:adroit_flutter/core/utils/app_constants.dart';
import 'package:adroit_flutter/core/utils/app_icons.dart';
import 'package:adroit_flutter/core/utils/app_locale.dart';
import 'package:easy_localization/src/public_ext.dart';
import 'package:flutter/material.dart';

class AlertDialogLoading extends StatelessWidget {
  AlertDialogLoading(
      {Key? key,
      this.needHeaderFooter = false,
      required this.onTapHeader,
      required this.onTapFooter})
      : super(key: key);

  final bool needHeaderFooter;
  Function() onTapHeader;
  Function() onTapFooter;

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      content: Container(
        height: 200,
        width: 200,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            needHeaderFooter
                ? GestureDetector(
                    onTap: onTapHeader,
                    child: Text(
                      LocaleTexts.tapNewCustomerFlow.tr(),
                      style: TextStyle(fontSize: 9, color: AppColors.darkGray),
                    ),
                  )
                : Container(),
            Column(
              children: [
                AppIcons.pre_loader_anim.widget(),
                Text(LocaleTexts.verifyingQr.tr())
              ],
            ),
            needHeaderFooter
                ? GestureDetector(
                    onTap: onTapFooter,
                    child: Text(
                      LocaleTexts.tapExistingCustomerFlow.tr(),
                      style: TextStyle(fontSize: 9, color: AppColors.darkGray),
                    ),
                  )
                : Container(),
          ],
        ),
      ),
    );
  }
}
