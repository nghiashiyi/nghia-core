import 'package:adroit_flutter/core/navigation/navigation_service.dart';
import 'package:adroit_flutter/core/navigation/routes.dart';
import 'package:adroit_flutter/core/utils/app_color.dart';
import 'package:adroit_flutter/core/utils/app_constants.dart';
import 'package:adroit_flutter/core/utils/app_icons.dart';
import 'package:adroit_flutter/core/utils/app_locale.dart';
import 'package:adroit_flutter/core/widgets/appbar_cus.dart';
import 'package:adroit_flutter/core/widgets/product_catalogue.dart';
import 'package:adroit_flutter/features/new_sale/representation/product.dart';
import 'package:easy_localization/src/public_ext.dart';
import 'package:flutter/material.dart';

class ChooseProductScreen extends StatefulWidget {
  const ChooseProductScreen({Key? key}) : super(key: key);

  @override
  _ChooseProductScreenState createState() => _ChooseProductScreenState();
}

class _ChooseProductScreenState extends State<ChooseProductScreen> {
  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    double height = MediaQuery.of(context).size.height;
    return Scaffold(
      appBar: buildAppBarCus(
          title: LocaleTexts.chooseProducts.tr(),
          onTap: () {
            Navigator.pop(context);
          }),
      body: Container(
        width: width,
        height: height,
        child: Stack(
          children: [
            Column(
              children: [
                Material(
                  color: AppColors.white,
                  elevation: 2,
                  child: Container(
                    height: 35,
                    child: Padding(
                      padding: EdgeInsets.symmetric(horizontal: paddingCont),
                      child: Row(
                        children: [
                          AppIcons.person.widget(fit: BoxFit.cover),
                          SizedBox(
                            width: paddingCont / 2,
                          ),
                          Text(
                            LocaleTexts.userName.tr(),
                            style: TextStyle(
                                fontSize: 15, fontWeight: FontWeight.w500),
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
                Expanded(
                    child: SingleChildScrollView(
                  child: Container(
                    width: width,
                    padding: EdgeInsets.all(paddingCont),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          LocaleTexts.flourSugar.tr(),
                          style: TextStyle(
                              color: AppColors.mainBlue,
                              fontSize: 12,
                              fontWeight: FontWeight.w500),
                        ),
                        Container(
                          width: width,
                          height: 170,
                          child: GridView.builder(
                              physics: NeverScrollableScrollPhysics(),
                              gridDelegate:
                                  SliverGridDelegateWithFixedCrossAxisCount(
                                crossAxisCount: 4,
                              ),
                              itemCount: 7,
                              itemBuilder: (context, index) {
                                Product exampleProduct = exampleProducts[index];
                                return ProductCatalogue(
                                  exampleProduct: exampleProduct,
                                  product: exampleProduct,
                                );
                              }),
                        ),
                        Text(
                          LocaleTexts.dairy.tr(),
                          style: TextStyle(
                              color: AppColors.mainBlue,
                              fontSize: 12,
                              fontWeight: FontWeight.w500),
                        ),
                        Container(
                          width: width,
                          height: 170,
                          child: GridView.builder(
                              physics: NeverScrollableScrollPhysics(),
                              gridDelegate:
                                  SliverGridDelegateWithFixedCrossAxisCount(
                                crossAxisCount: 4,
                              ),
                              itemCount: 6,
                              itemBuilder: (context, index) {
                                Product exampleProduct =
                                    exampleProducts[index + 1];
                                return ProductCatalogue(
                                  exampleProduct: exampleProduct,
                                  product: exampleProduct,
                                );
                              }),
                        ),
                        Text(
                          LocaleTexts.riceGrain.tr(),
                          style: TextStyle(
                              color: AppColors.mainBlue,
                              fontSize: 12,
                              fontWeight: FontWeight.w500),
                        ),
                        Container(
                          width: width,
                          height: 300,
                          child: GridView.builder(
                              physics: NeverScrollableScrollPhysics(),
                              gridDelegate:
                                  SliverGridDelegateWithFixedCrossAxisCount(
                                crossAxisCount: 4,
                              ),
                              itemCount: 10,
                              itemBuilder: (context, index) {
                                Product exampleProduct =
                                    exampleProducts[index + 1];
                                return ProductCatalogue(
                                  exampleProduct: exampleProduct,
                                  product: exampleProduct,
                                );
                              }),
                        ),
                      ],
                    ),
                  ),
                ))
              ],
            ),
            isFinish
                ? Align(
                    alignment: Alignment.bottomCenter,
                    child: Container(
                      width: width,
                      height: 70,
                      color: AppColors.white,
                      padding: EdgeInsets.all(paddingCont),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Column(
                            mainAxisAlignment: MainAxisAlignment.spaceAround,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                '${LocaleTexts.total.tr()} ${productAddeds[0].productCode}',
                                style: TextStyle(
                                    fontWeight: FontWeight.bold, fontSize: 16),
                              ),
                              Text(
                                '(${productAddeds.length}) ${LocaleTexts.itemsTotal.tr()}',
                                style: TextStyle(
                                    fontWeight: FontWeight.w400, fontSize: 12),
                              ),
                            ],
                          ),
                          GestureDetector(
                            onTap: () {
                              NavigationService.push(Routes.review);
                            },
                            child: Container(
                              height: 50,
                              padding:
                                  EdgeInsets.symmetric(horizontal: paddingCont),
                              margin:
                                  EdgeInsets.symmetric(horizontal: paddingCont),
                              decoration: BoxDecoration(
                                  color: AppColors.mainBlue,
                                  borderRadius: BorderRadius.circular(38)),
                              child: Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  AppIcons.arrow_forward
                                      .widget(color: AppColors.mainBlue),
                                  Text(
                                    LocaleTexts.proceedBtn.tr(),
                                    style: btnTextStyle,
                                  ),
                                  AppIcons.arrow_forward.widget()
                                ],
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  )
                : Container(),
            Positioned(
              right: 10,
              bottom: isFinish ? 85 : 10,
              child: FloatingActionButton(
                onPressed: () {
                  setState(() {
                    isFinish = false;
                  });
                  NavigationService.push(Routes.search_product);
                },
                child: AppIcons.search.widget(),
                backgroundColor: AppColors.mainYellow,
              ),
            )
          ],
        ),
      ),
    );
  }
}
