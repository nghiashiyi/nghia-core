import 'package:adroit_flutter/core/utils/app_color.dart';
import 'package:adroit_flutter/core/utils/app_icons.dart';
import 'package:adroit_flutter/core/utils/app_locale.dart';
import 'package:adroit_flutter/core/utils/utils.dart';
import 'package:adroit_flutter/core/widgets/appbar_cus.dart';
import 'package:easy_localization/src/public_ext.dart';
import 'package:flutter/material.dart';

class PaymentResultScreen extends StatefulWidget {
  const PaymentResultScreen({Key? key}) : super(key: key);

  @override
  _PaymentResultScreenState createState() => _PaymentResultScreenState();
}

class _PaymentResultScreenState extends State<PaymentResultScreen> {
  String totalPrice = '200 ${LocaleTexts.ksh.tr()}';
  String discountPrice = '100 ${LocaleTexts.ksh.tr()}';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: buildCloseAppBarCus(
          title: LocaleTexts.paymentComplete.tr(),
          onTap: () {
            Navigator.pop(context);
          }),
      body: SafeArea(
          child: ListView(
        children: [
          SizedBox(height: 40),
          AppIcons.check_icon.widget(width: 120, height: 120),
          SizedBox(height: 20),
          Text(
            totalPrice,
            style: TextStyle(fontSize: 32, color: AppColors.black, fontWeight: FontWeight.bold),
            textAlign: TextAlign.center,
          ),
          SizedBox(height: 10),
          Text(
            'Oct 18, 1:32 PM',
            style: TextStyle(fontSize: 14, color: AppColors.black),
            textAlign: TextAlign.center,
          ),
          _detail()
        ],
      )),
    );
  }

  Widget _detail() {
    return Container(
      margin: EdgeInsets.only(top: 92, left: 15, right: 15, bottom: 24),
      decoration: BoxDecoration(
        color: AppColors.lightGray,
        borderRadius: BorderRadius.circular(5)
      ),
      child: Column(
          children: [
            Container(
              decoration: BoxDecoration(
                  color: AppColors.mainBlue,
                  borderRadius: BorderRadius.only(topRight: Radius.circular(5), topLeft: Radius.circular(5))
              ),
              height: 46,
              width: double.infinity,
              padding: EdgeInsets.symmetric(horizontal: 20),
              child: Align(
                alignment: Alignment.centerLeft,
                child: Text(
                  '${LocaleTexts.orderId.tr()}: 123456',
                  style: TextStyle(fontSize: 16, color: AppColors.white),
                  textAlign: TextAlign.center,
                ),
              ),
            ),
            _rowContent(label: LocaleTexts.paid.tr(), content: 'aaaa'),
            _rowContent(label: LocaleTexts.memberName.tr(), content: 'aaaa'),
            _rowContent(label: LocaleTexts.discountOnNextSale.tr(), content: 'aaaa'),
            _rowContent(label: LocaleTexts.discountExpired.tr(), content: 'aaaa', showDivider: false),
            SizedBox(height: 15)
          ],
      ),
    );
  }

  _rowContent({String? label, String? content, bool showDivider = true}) {
    return Column(
      children: [
        Container(
          height: 75,
          margin: EdgeInsets.symmetric(horizontal: 20),
          child: Align(
            alignment: Alignment.centerLeft,
            child: RichText(
              text: TextSpan(
                text: '$label ',
                style: TextStyle(color: AppColors.black, fontSize: 18, fontFamily: "Montserrat", height: 1.5),
                children: <TextSpan>[
                  TextSpan(
                    text: content,
                    style: TextStyle(color: AppColors.black, fontSize: 18, height: 1.5, fontWeight: FontWeight.bold),
                  ),
                ],
              ),
            ),
          ),
        ),
       if(showDivider) Container(
          width: double.infinity,
          height: 1,
          color: AppColors.otherGray2,
        )
      ],
    );
  }
}
