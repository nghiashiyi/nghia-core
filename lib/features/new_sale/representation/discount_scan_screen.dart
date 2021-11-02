import 'package:adroit_flutter/core/navigation/navigation_service.dart';
import 'package:adroit_flutter/core/navigation/routes.dart';
import 'package:adroit_flutter/core/utils/app_color.dart';
import 'package:adroit_flutter/core/utils/app_images.dart';
import 'package:adroit_flutter/core/utils/app_locale.dart';
import 'package:adroit_flutter/core/widgets/alert_confirm.dart';
import 'package:adroit_flutter/core/widgets/alert_loading.dart';
import 'package:adroit_flutter/core/widgets/appbar_cus.dart';
import 'package:easy_localization/src/public_ext.dart';
import 'package:flutter/material.dart';

class DiscountScanScreen extends StatefulWidget {
  const DiscountScanScreen({Key? key}) : super(key: key);

  @override
  _DiscountScanScreenState createState() => _DiscountScanScreenState();
}

class _DiscountScanScreenState extends State<DiscountScanScreen> {
  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    double height = MediaQuery.of(context).size.height;

    return Scaffold(
      appBar: buildAppBarCus(
          title: LocaleTexts.scanFlyerAppbar.tr(),
          onTap: () {
            Navigator.pop(context);
          }),
      body: Container(
          width: width,
          height: height,
          child: Column(
            children: [
              Expanded(
                flex: 3,
                child: Container(
                  color: AppColors.black,
                  child: Center(
                    child: GestureDetector(
                      onTap: () {
                        showDialog<String>(
                            context: context,
                            builder: (BuildContext context) => GestureDetector(
                                  onTap: () {
                                    NavigationService.push(
                                        Routes.discount_success);
                                  },
                                  child: AlertDialogLoading(
                                      onTapHeader: () {}, onTapFooter: () {}),
                                ));
                      },
                      child: Container(
                        height: 140,
                        width: 140,
                        color: AppColors.white,
                      ),
                    ),
                  ),
                ),
              ),
              Expanded(
                flex: 1,
                child: Container(
                  alignment: Alignment.center,
                  child: RichText(
                    text: TextSpan(
                      text: LocaleTexts.pointQrFlyer1.tr(),
                      style: TextStyle(color: AppColors.black),
                      children: <TextSpan>[
                        TextSpan(
                          text: LocaleTexts.qrCode.tr(),
                          style: TextStyle(fontWeight: FontWeight.bold),
                        ),
                        TextSpan(
                            text: LocaleTexts.pointQrFlyer2.tr(),
                            style: TextStyle(color: AppColors.black)),
                      ],
                    ),
                  ),
                ),
              )
            ],
          )),
    );
  }
}
