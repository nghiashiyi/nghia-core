import 'package:adroit_flutter/core/navigation/routes.dart';
import 'package:adroit_flutter/features/home/representation/home_2_screen.dart';
import 'package:adroit_flutter/features/home/representation/home_screen.dart';
import 'package:adroit_flutter/features/new_club_card/representation/customer_name_screen.dart';
import 'package:adroit_flutter/features/new_sale/representation/discount_failure_screen.dart';
import 'package:adroit_flutter/features/new_sale/representation/discount_scan_screen.dart';
import 'package:adroit_flutter/features/new_club_card/representation/identify_customer_screen.dart';
import 'package:adroit_flutter/features/new_club_card/representation/identify_customer_type_screen.dart';
import 'package:adroit_flutter/features/new_club_card/representation/new_card_failure_screen.dart';
import 'package:adroit_flutter/features/new_club_card/representation/new_card_screen.dart';
import 'package:adroit_flutter/features/new_club_card/representation/new_card_success_screen.dart';
import 'package:adroit_flutter/features/new_club_card/representation/otp_screen.dart';
import 'package:adroit_flutter/features/new_club_card/representation/phone_number_screen.dart';
import 'package:adroit_flutter/features/new_club_card/representation/review_screen.dart';
import 'package:adroit_flutter/features/new_club_card/representation/scan_canister_screen.dart';
import 'package:adroit_flutter/features/new_sale/representation/discount_screen.dart';
import 'package:adroit_flutter/features/new_sale/representation/choose_product_screen.dart';
import 'package:adroit_flutter/features/new_sale/representation/discount_success_screen.dart';
import 'package:adroit_flutter/features/new_sale/representation/search_product_screen.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

Route<Object>? generateRoute(RouteSettings settings) {
  debugPrint('\n=============== >> Navigating to: ${settings.name}\n');
  final args = settings.arguments;

  switch (settings.name) {
    case Routes.root:
      return _buildRoute(settings: settings, screen: Container());
    case Routes.home:
      return _buildRoute(settings: settings, screen: HomeScreen());
    case Routes.identify_customer:
      return _buildRoute(settings: settings, screen: IdentifyCustomerScreen());
    case Routes.scan_canister:
      return _buildRoute(settings: settings, screen: ScanCanisterScreen());
    case Routes.identify_customer_type:
      return _buildRoute(
          settings: settings,
          screen: IdentifyCustomerTypeScreen(
            type: args.toString(),
          ));
    case Routes.new_card:
      return _buildRoute(settings: settings, screen: NewCardScreen());
    case Routes.new_card_success:
      return _buildRoute(settings: settings, screen: NewCardSuccessScreen());
    case Routes.new_card_failure:
      return _buildRoute(settings: settings, screen: NewCardFailureScreen());
    case Routes.phone_number:
      return _buildRoute(settings: settings, screen: PhoneNumberScreen());
    case Routes.customer_name:
      return _buildRoute(settings: settings, screen: CustomerNameScreen());
    case Routes.home_2:
      return _buildRoute(settings: settings, screen: Home2Screen());
    case Routes.otp:
      return _buildRoute(settings: settings, screen: OtpScreen());
    case Routes.choose_product:
      return _buildRoute(settings: settings, screen: ChooseProductScreen());
    case Routes.search_product:
      return _buildRoute(settings: settings, screen: SearchProductScreen());
    case Routes.review:
      return _buildRoute(settings: settings, screen: ReviewScreen());
    case Routes.discount:
      return _buildRoute(settings: settings, screen: DiscountScreen());
    case Routes.discount_scan:
      return _buildRoute(settings: settings, screen: DiscountScanScreen());
    case Routes.discount_success:
      return _buildRoute(settings: settings, screen: DiscountSuccessScreen());
    case Routes.discount_failure:
      return _buildRoute(settings: settings, screen: DiscountFailureScreen());
    default:
      return _errorRoute();
  }
}

Route<Object>? _errorRoute() {
  return MaterialPageRoute(builder: (_) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Error'),
      ),
      body: Center(
        child: Text('ERROR'),
      ),
    );
  });
}

Route<Object>? _buildRoute(
    {required RouteSettings settings, required Widget screen}) {
  return MaterialPageRoute(
    settings: settings,
    builder: (context) {
      return screen;
    },
  );
}

MaterialPageRoute _buildNoAnimationRoute(
        {required RouteSettings settings, required Widget screen}) =>
    NoAnimationMaterialPageRoute(
      settings: settings,
      builder: (context) {
        return screen;
      },
    );

class NoAnimationMaterialPageRoute<T> extends MaterialPageRoute<T> {
  NoAnimationMaterialPageRoute({
    required WidgetBuilder builder,
    required RouteSettings settings,
    bool maintainState = true,
    bool fullscreenDialog = false,
  }) : super(
            builder: builder,
            maintainState: maintainState,
            settings: settings,
            fullscreenDialog: fullscreenDialog);

  @override
  Widget buildTransitions(BuildContext context, Animation<double> animation,
      Animation<double> secondaryAnimation, Widget child) {
    return child;
  }
}

class FadePageRoute<T> extends PageRoute<T> {
  final Widget child;

  FadePageRoute(this.child);

  @override
  Color get barrierColor => Colors.black;

  @override
  String get barrierLabel => '';

  @override
  bool get maintainState => true;

  @override
  Duration get transitionDuration => Duration(milliseconds: 700);

  @override
  Widget buildPage(BuildContext context, Animation<double> animation,
      Animation<double> secondaryAnimation) {
    return FadeTransition(
      opacity: animation,
      child: child,
    );
  }
}
