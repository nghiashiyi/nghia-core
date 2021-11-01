import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

/// How to use:
/// LocaleTexts.appName.tr()
///
/// Example:
/// ```
/// import 'package:adroit_flutter/core/utils/utils.dart';
///
/// ...
///   @override
///   Widget build(BuildContext context) {
///     return Container(
///       child: Text(LocaleTexts.appName.tr())
///     );
///     return MaterialApp(
///       localizationsDelegates: context.localizationDelegates,
///       supportedLocales: context.supportedLocales,
///       locale: context.locale,
///       theme: ThemeData(
///         fontFamily: "Montserrat",
///       ),
///       initialRoute: Routes.main,
///       onGenerateRoute: generateRoute,
///       debugShowCheckedModeBanner: false,
///       navigatorKey: NavigationService.globalNavigatorKey,
///     );
///   }
/// ```
///
class LocaleTexts {
  static const appName = 'appName';
  static const welcomeTo = 'Welcome to';
  static const shopName = 'Shop Name';
  static const welcome = 'Welcome!';
  static const versionBuild = 'Version 0 - Build A';

  static const newClubCard = 'NEW CLUB CARD';
  static const newSale = 'NEW SALE';
  static const delivery = 'DELIVERY';
  static const myAccount = 'MY ACCOUNT';
  static const useKokoCanister = 'USE KOKO CANISTER';
  static const usePhoneNumber = 'USE PHONE NUMBER';
  static const houseHold = 'HOUSEHOLD';
  static const commercial = 'COMMERCIAL';
  static const assignNewClubCard = 'ASSIGN NEW CLUB CARD';
  static const scanQrCode = 'SCAN QR CODE';
  static const discountCode = 'DISCOUNT CODE';

  static const getCustomerDetailsAppbar = 'Get Customer Detail';
  static const scanQrCodeAppbar = 'Scan QR Code';
  static const customerTypeAppbar = 'Customer Type';
  static const assignClubCardAppbar = 'Assign Club Card';
  static const successAppbar = 'Success!';
  static const errorAppbar = 'Error!';
  static const phoneNumberAppbar = 'Phone Number';
  static const oneTimePasscodeAppbar = 'One-Time Passcode';
  static const customerNameAppbar = 'Customer Name';
  static const identifyCustomerAppbar = 'Identify Customer';
  static const chooseProducts = 'Choose Product';
  static const addDiscountAppbar = 'Add Discount?';
  static const scanFlyerAppbar = 'Scan Flyer QR Code';
  static const enterDiscountCodeAppbar = 'Enter Discount Code';
  static const discountAddedAppbar = 'Discount Added!';
  static const reviewAppbar = 'Review';
  static const payment = 'Payment';

  static const doneBtn = 'DONE';
  static const tryAgainBtn = 'TRY AGAIN';
  static const nextBtn = 'NEXT';
  static const proceedBtn = 'PROCEED';
  static const nodiscountCodeBtn = 'NO DISCOUNT CODE';
  static const canleBtn = 'CANCLE';
  static const confirmBtn = 'CONFIRM';
  static const yesBtn = 'YES';

  static const produceName = 'Joggo Maize Meal';
  static const productCode = 'KSH 110';
  static const productWeight = '2';
  static const productPrice = '250';

  static const productTotal = '4';

  static const qrCode = 'QR Code';

  static const pointCameraScanQr1 = 'Point the camera at the ';
  static const pointCameraScanQr2 = ' printed below the canister';
  static const verifyingQr = 'Verifying QR Code \n please wait...';
  static const customerIdentified = 'Customer identified';
  static const userName = 'Djembe Juma';
  static const userPhoneNumber = '981-765421';

  static const orLine = 'OR';

  static const tapCardDevice = 'Tap the Club Card on the Devide';
  static const takeOutCard1 = 'Take out a new ';
  static const clubCard = 'Club Card ';
  static const takeOutCard2 =
      ' and Tap it on the Device to link it to the Customer';
  static const giveClubCard1 = 'Give the ';
  static const giveClubCard2 = ' to the \n';
  static const newMember = 'New Member!';
  static const remindDiscount =
      'Remind them to use it every time for extra KOKO Club discount.';

  static const errorScan =
      'The was an error while scanning the card. \n Please try again.';

  static const enterPhoneNumber = 'Enter Customer Phone\nNumber';
  static const tapNewCustomerFlow = 'Tap for new customer flow';
  static const tapExistingCustomerFlow = 'Tap for existing customer flow';
  static const enterCodeSMS = 'Enter Code from SMS';
  static const askPasscodeSMS =
      'Ask Customer to give you the One-Time Passcode sent to them via SMS.';

  static const waitTime = '1:59';

  static const resendOTP = 'Resend OTP - $waitTime sec';
  static const enterCustomerName = 'Enter Customer Name';
  static const firstLastName = 'Firtname Lastname';
  static const topInTown = 'Top In Town';

  static const flourSugar = 'FLOUR & SUGAR';
  static const dairy = 'DAIRY';
  static const riceGrain = 'RICE & GRAINS';

  static const searchResultFor = 'SEARCH RESULTS FOR';

  static const total = 'Total';
  static const itemsTotal = '($productTotal) Items';
  static const billDetail = 'BILL DETAIL';
  static const subTotal = 'Sub total';
  static const itemsSubTotal = '($productTotal Items)';
  static const quantity = 'QUANTITY';
  static const item = 'ITEM';
  static const unitPrice = 'UNIT PRICE';

  static const pointQrFlyer =
      'Point the camera at the QR Code print on the flyer';
  static const enterDiscountCode = 'Enter The Discount Code';
  static const egNumber = 'eg. 07XX XXXXXX';
  static const tapError = 'Tap for Error';
  static const tapSuccess = 'Tap for Success';
  static const discountAddedCeleb = 'KSH 10 OFF on \n Koko Club Items!';
  static const discountInvialid = 'Invialid Discount Code.\nPlease try again.';
  static const flyerDiscount = 'Flyer 10 Discount';
  static const deleteItem = 'Delete ($productTotal) of this item?';
}

class AppLocales {
  static const en = Locale('en', 'US');

  static Locale getCorrespondingLocal() {
    return [en].firstWhere((element) {
      return element.languageCode == Intl.systemLocale.split('_').first;
    }, orElse: () => en);
  }
}
