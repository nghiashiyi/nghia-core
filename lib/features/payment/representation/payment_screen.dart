import 'package:adroit_flutter/core/utils/app_color.dart';
import 'package:adroit_flutter/core/utils/app_icons.dart';
import 'package:adroit_flutter/core/utils/app_locale.dart';
import 'package:adroit_flutter/core/utils/utils.dart';
import 'package:adroit_flutter/core/widgets/alert_failed.dart';
import 'package:adroit_flutter/core/widgets/alert_loading.dart';
import 'package:adroit_flutter/core/widgets/alert_success.dart';
import 'package:adroit_flutter/core/widgets/appbar_cus.dart';
import 'package:adroit_flutter/core/widgets/cus_btn.dart';
import 'package:easy_localization/src/public_ext.dart';
import 'package:flutter/material.dart';

class PaymentScreen extends StatefulWidget {
  const PaymentScreen({Key? key}) : super(key: key);

  @override
  _PaymentScreenState createState() => _PaymentScreenState();
}

class _PaymentScreenState extends State<PaymentScreen> {
  bool _isAgent = true;
  String totalItems = '4 ${LocaleTexts.items.tr()}';
  String totalPrice = '200 ${LocaleTexts.ksh.tr()}';
  String cardPrice = '1,200 ${LocaleTexts.ksh.tr()}';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: buildAppBarCus(
          title: LocaleTexts.payment.tr(),
          onTap: () {
            Navigator.pop(context);
          }),
      body: SafeArea(
          child: Column(
        children: [
          _userInfo(),
          _totalItems(),
          Expanded(
              child: ListView(
            physics: BouncingScrollPhysics(),
            padding: const EdgeInsets.symmetric(horizontal: 15),
            children: [
              SizedBox(height: 20),
              _cardTitle(),
              SizedBox(height: paddingCont),
              _card(),
              SizedBox(height: 70),
              _pinTitle(),
              SizedBox(height: 10),
              _pinDescription(),
              SizedBox(height: 30),
              _textField(),
              SizedBox(height: 20),
              _button(),
              SizedBox(height: 27),
            ],
          ))
        ],
      )),
    );
  }

  Widget _userInfo() {
    return Material(
      color: AppColors.white,
      elevation: 2,
      child: Container(
        height: 35,
        padding: const EdgeInsets.symmetric(horizontal: 15),
        child: Row(
          children: [
            AppIcons.person.widget(fit: BoxFit.cover),
            SizedBox(
              width: paddingCont / 2,
            ),
            Text(
              LocaleTexts.userName.tr(),
              style: TextStyle(fontSize: 15, fontWeight: FontWeight.w500),
            ),
          ],
        ),
      ),
    );
  }

  Widget _totalItems() {
    return Container(
      height: 69,
      padding: EdgeInsets.symmetric(horizontal: 15),
      color: AppColors.lightGray,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text(
            LocaleTexts.total.tr(),
            style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
          ),
          SizedBox(
            width: paddingCont,
          ),
          Text(
            totalItems,
            style: TextStyle(fontSize: 18, color: AppColors.otherLightGray),
          ),
          Spacer(),
          Text(
            totalPrice,
            style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
          ),
        ],
      ),
    );
  }

  Widget _cardTitle() {
    return Align(
      alignment: Alignment.center,
      child: Text(
        _isAgent ? LocaleTexts.cashPaymentViaAgent.tr() : LocaleTexts.directCustomerWalletPayment.tr(),
        style: TextStyle(fontSize: 14, color: AppColors.otherBlack),
        textAlign: TextAlign.center,
      ),
    );
  }

  Widget _card() {
    Color textColor = _isAgent ? AppColors.white : AppColors.black;
    return Container(
      height: 176,
      padding: EdgeInsets.symmetric(horizontal: 30),
      decoration: BoxDecoration(
          color: _isAgent ? AppColors.otherBlack2 : AppColors.otherLightBlue2, borderRadius: BorderRadius.circular(16)),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                SizedBox(
                  height: 37,
                ),
                Container(
                    height: 53,
                    child: Text(_isAgent ? LocaleTexts.agentName.tr() : LocaleTexts.userName.tr(),
                        style: TextStyle(fontSize: 18, color: textColor, fontWeight: FontWeight.w500))),
                Text(_isAgent ? LocaleTexts.agentBalance.tr() : LocaleTexts.customerBalance.tr(),
                    style: TextStyle(fontSize: 14, color: textColor)),
                SizedBox(
                  height: 5,
                ),
                Text(
                  cardPrice,
                  style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold, color: textColor),
                ),
              ],
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(top: 30),
            child: AppIcons.koko_icon
                .widget(width: 40, height: 40, color: _isAgent ? AppColors.mainYellow : AppColors.white),
          ),
        ],
      ),
    );
  }

  Widget _pinTitle() {
    return Text(
      '${_isAgent ? LocaleTexts.agent.tr() : LocaleTexts.customer.tr()} ${LocaleTexts.myKokoPin.tr()}',
      style: TextStyle(fontSize: 28, color: AppColors.black),
    );
  }

  Widget _pinDescription() {
    return _isAgent ? _pinAgentDesc() : _pinCustomerDesc();
  }

  Widget _pinCustomerDesc() {
    return RichText(
      text: TextSpan(
        text: LocaleTexts.customerDescPin.tr(),
        style: TextStyle(color: AppColors.black, fontSize: subTitleTextSize, fontFamily: "Montserrat", height: 1.5),
        children: <TextSpan>[
          TextSpan(
            text: LocaleTexts.myKokoPin.tr(),
            style: TextStyle(fontWeight: FontWeight.bold, fontSize: subTitleTextSize),
          ),
          TextSpan(text: LocaleTexts.toPay.tr(), style: TextStyle(color: AppColors.black, fontSize: subTitleTextSize)),
          TextSpan(
            text: totalPrice,
            style: TextStyle(fontWeight: FontWeight.bold, fontSize: subTitleTextSize),
          ),
          TextSpan(
              text: '${LocaleTexts.forLocale.tr()}$totalItems.',
              style: TextStyle(color: AppColors.black, fontSize: subTitleTextSize)),
        ],
      ),
    );
  }

  Widget _pinAgentDesc() {
    return RichText(
      text: TextSpan(
        text: LocaleTexts.pleaseEnterYour.tr(),
        style: TextStyle(color: AppColors.black, fontSize: subTitleTextSize, fontFamily: "Montserrat", height: 1.5),
        children: <TextSpan>[
          TextSpan(
            text: LocaleTexts.myKokoPin.tr(),
            style: TextStyle(fontWeight: FontWeight.bold, fontSize: subTitleTextSize),
          ),
          TextSpan(text: LocaleTexts.toPay.tr(), style: TextStyle(color: AppColors.black, fontSize: subTitleTextSize)),
          TextSpan(
            text: totalPrice,
            style: TextStyle(fontWeight: FontWeight.bold, fontSize: subTitleTextSize),
          ),
          TextSpan(text: LocaleTexts.and.tr(), style: TextStyle(color: AppColors.black, fontSize: subTitleTextSize)),
          TextSpan(
            text: LocaleTexts.collectCash.tr(),
            style: TextStyle(fontWeight: FontWeight.bold, fontSize: subTitleTextSize),
          ),
          TextSpan(
              text: '${LocaleTexts.fromTheCustomer.tr()}.',
              style: TextStyle(color: AppColors.black, fontSize: subTitleTextSize)),
        ],
      ),
    );
  }

  Widget _textField() {
    return TextField(
      keyboardType: TextInputType.number,
      decoration: InputDecoration(
          focusedBorder: OutlineInputBorder(
            borderRadius: BorderRadius.all(Radius.circular(4)),
            borderSide: BorderSide(width: 1, color: AppColors.mainBlue),
          ),
          border: OutlineInputBorder(borderSide: BorderSide(color: AppColors.mainBlue, width: 1)),
          labelText: LocaleTexts.myKokoPin.tr(),
          labelStyle: TextStyle(color: AppColors.mainYellow)),
    );
  }

  Widget _button() {
    return CusBtn(
        width: MediaQuery.of(context).size.width,
        borderColor: AppColors.mainBlue,
        backgroundColor: AppColors.mainBlue,
        onTap: () {
          showDialog<String>(
            context: context,
            builder: (BuildContext context) => AlertDialogLoading(
              needHeaderFooter: true,
              headerText: 'Tap for Error',
              footerText: 'Tap for Success',
              onTapHeader: () {
                Navigator.of(context).pop();
                _showDialogFailed();
              },
              onTapFooter: () {
                Navigator.of(context).pop();
                _showDialogSuccess();
              },
            ),
          );
        },
        insideWidget: Padding(
          padding: EdgeInsets.all(paddingCont),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              AppIcons.arrow_forward.widget(color: AppColors.mainBlue),
              Text(
                LocaleTexts.nextBtn.tr(),
                style: btnTextStyle,
              ),
              AppIcons.arrow_forward.widget()
            ],
          ),
        ));
  }

  void _showDialogFailed() {
    showDialog<String>(
      context: context,
      builder: (BuildContext context) => AlertDialogFailed(
        retryOnTap: () {
          Navigator.of(context).pop();
        },
        title: LocaleTexts.paymentFailed.tr(),
        description: LocaleTexts.tryAgainOrCancel.tr(),
      ),
    );
  }

  void _showDialogSuccess() {
    showDialog<String>(
      context: context,
      builder: (BuildContext context) => AlertDialogSuccess(
        title: LocaleTexts.paymentSuccessful.tr(),
        description: _isAgent
            ? LocaleTexts.agentDescriptionPaymentSuccess.tr()
            : LocaleTexts.customerDescriptionPaymentSuccess.tr(),
      ),
    );
  }
}
