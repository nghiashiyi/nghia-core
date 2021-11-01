import 'package:adroit_flutter/core/navigation/navigation_service.dart';
import 'package:adroit_flutter/core/navigation/routes.dart';
import 'package:adroit_flutter/core/utils/app_color.dart';
import 'package:adroit_flutter/core/utils/app_constants.dart';
import 'package:adroit_flutter/core/utils/app_images.dart';
import 'package:adroit_flutter/core/utils/app_locale.dart';
import 'package:adroit_flutter/core/widgets/alert_confirm.dart';
import 'package:adroit_flutter/core/widgets/appbar_cus.dart';
import 'package:easy_localization/src/public_ext.dart';
import 'package:flutter/material.dart';

class ScanCanisterScreen extends StatefulWidget {
  ScanCanisterScreen({
    Key? key,
  }) : super(key: key);

  @override
  _ScanCanisterScreenState createState() => _ScanCanisterScreenState();
}

class _ScanCanisterScreenState extends State<ScanCanisterScreen> {
  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    double height = MediaQuery.of(context).size.height;

    return Scaffold(
      appBar: buildAppBarCus(
          title: LocaleTexts.scanQrCode.tr(),
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
                          builder: (BuildContext context) => AlertDialogConfirm(
                            confirmOnTap: () {
                              NavigationService.push(
                                  Routes.identify_customer_type,
                                  arguments: 'scan');
                            },
                          ),
                        );
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
                  child: Stack(
                    children: [
                      Container(
                        child: AppImages.canister_img
                            .widget(height: height, fit: BoxFit.fill),
                      ),
                      Row(
                        children: [
                          Expanded(
                            child: Container(
                              margin: EdgeInsets.only(left: 15, right: 5),
                              child: RichText(
                                text: TextSpan(
                                  text: LocaleTexts.pointCameraScanQr1.tr(),
                                  style: TextStyle(color: AppColors.black),
                                  children: <TextSpan>[
                                    TextSpan(
                                      text: LocaleTexts.qrCode.tr(),
                                      style: TextStyle(
                                          fontWeight: FontWeight.bold),
                                    ),
                                    TextSpan(
                                        text:
                                            LocaleTexts.pointCameraScanQr2.tr(),
                                        style:
                                            TextStyle(color: AppColors.black)),
                                  ],
                                ),
                              ),
                            ),
                          ),
                          Expanded(child: Container()),
                        ],
                      ),
                    ],
                  ))
            ],
          )),
    );
  }
}
