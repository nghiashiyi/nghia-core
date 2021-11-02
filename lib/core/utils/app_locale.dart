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
  static const welcomeTo = 'welcomeTo';
  static const shopName = 'shopName';
  static const welcome = 'welcome';
  static const versionBuild = 'versionBuild';

  static const newClubCard = 'newClubCard';
  static const newSale = 'newSale';
  static const delivery = 'delivery';
  static const myAccount = 'myAccount';
  static const useKokoCanister = 'useKokoCanister';
  static const usePhoneNumber = 'usePhoneNumber';
  static const houseHold = 'houseHold';
  static const commercial = 'commercial';
  static const assignNewClubCard = 'assignNewClubCard';
  static const scanQrCode = 'scanQrCode';
  static const discountCode = 'discountCode';

  static const getCustomerDetailsAppbar = 'getCustomerDetailsAppbar';
  static const scanQrCodeAppbar = 'scanQrCodeAppbar';
  static const customerTypeAppbar = 'customerTypeAppbar';
  static const assignClubCardAppbar = 'assignClubCardAppbar';
  static const successAppbar = 'successAppbar';
  static const errorAppbar = 'errorAppbar';
  static const phoneNumberAppbar = 'phoneNumberAppbar';
  static const oneTimePasscodeAppbar = 'oneTimePasscodeAppbar';
  static const customerNameAppbar = 'customerNameAppbar';
  static const identifyCustomerAppbar = 'identifyCustomerAppbar';
  static const chooseProducts = 'chooseProducts';
  static const addDiscountAppbar = 'addDiscountAppbar';
  static const scanFlyerAppbar = 'scanFlyerAppbar';
  static const enterDiscountCodeAppbar = 'enterDiscountCodeAppbar';
  static const discountAddedAppbar = 'discountAddedAppbar';
  static const reviewAppbar = 'reviewAppbar';
  static const payment = 'payment';

  static const doneBtn = 'doneBtn';
  static const tryAgainBtn = 'tryAgainBtn';
  static const nextBtn = 'nextBtn';
  static const proceedBtn = 'proceedBtn';
  static const nodiscountCodeBtn = 'nodiscountCodeBtn';
  static const canleBtn = 'canleBtn';
  static const confirmBtn = 'confirmBtn';
  static const yesBtn = 'yesBtn';

  static const produceName = 'produceName';
  static const productCode = 'productCode';
  static const productWeight = 'productWeight';
  static const productPrice = 'productPrice';

  static const productTotal = 'productTotal';

  static const qrCode = 'qrCode';

  static const pointCameraScanQr1 = 'pointCameraScanQr1';
  static const pointCameraScanQr2 = 'pointCameraScanQr2';
  static const verifyingQr = 'verifyingQr';
  static const customerIdentified = 'customerIdentified';
  static const userName = 'userName';
  static const userPhoneNumber = 'userPhoneNumber';

  static const orLine = 'orLine';

  static const tapCardDevice = 'tapCardDevice';
  static const takeOutCard1 = 'takeOutCard1';
  static const clubCard = 'clubCard';
  static const takeOutCard2 = 'takeOutCard2';
  static const giveClubCard1 = 'giveClubCard1';
  static const giveClubCard2 = 'giveClubCard2';
  static const newMember = 'newMember';
  static const remindDiscount = 'remindDiscount';

  static const errorScan = 'errorScan';

  static const enterPhoneNumber = 'enterPhoneNumber';
  static const tapNewCustomerFlow = 'tapNewCustomerFlow';
  static const tapExistingCustomerFlow = 'tapExistingCustomerFlow';
  static const enterCodeSMS = 'enterCodeSMS';
  static const askPasscodeSMS1 = 'askPasscodeSMS1';
  static const askPasscodeSMS2 = 'askPasscodeSMS2';

  static const resendOTP = 'resendOTP';
  static const enterCustomerName = 'enterCustomerName';
  static const firstLastName = 'firstLastName';
  static const topInTown = 'topInTown';

  static const flourSugar = 'flourSugar';
  static const dairy = 'dairy';
  static const riceGrain = 'riceGrain';

  static const searchResultFor = 'searchResultFor';

  static const total = 'total';
  static const itemsTotal = 'itemsTotal';
  static const billDetail = 'billDetail';
  static const subTotal = 'subTotal';
  static const itemsSubTotal = 'itemsSubTotal';
  static const quantity = 'quantity';
  static const item = 'item';
  static const unitPrice = 'unitPrice';

  static const pointQrFlyer1 = 'pointQrFlyer1';
  static const pointQrFlyer2 = 'pointQrFlyer2';
  static const enterDiscountCode = 'enterDiscountCode';
  static const egNumber = 'egNumber';
  static const tapError = 'tapError';
  static const tapSuccess = 'tapSuccess';
  static const discountAddedCeleb = 'discountAddedCeleb';
  static const on = 'on';
  static const items = 'items';

  static const kokoClub = 'kokoClub';

  static const discountInvialid = 'discountInvialid';
  static const flyerDiscount = 'flyerDiscount';
  static const deleteItem = 'deleteItem';
  static const removeItem = 'removeItem';
  static const deleteOfThisItem = 'deleteOfThisItem';
  static const kg = 'kg';
  static const tapForError = 'tapForError';
  static const tapForSuccess = 'tapForSuccess';
  static const useClubCard = 'useClubCard';
  static const askTapCard1 = 'askTapCard1';
  static const askTapCard2 = 'askTapCard2';
}

class AppLocales {
  static const en = Locale('en', 'US');

  static Locale getCorrespondingLocal() {
    return [en].firstWhere((element) {
      return element.languageCode == Intl.systemLocale.split('_').first;
    }, orElse: () => en);
  }
}
