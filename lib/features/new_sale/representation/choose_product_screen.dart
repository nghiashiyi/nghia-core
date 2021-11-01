import 'package:adroit_flutter/core/navigation/navigation_service.dart';
import 'package:adroit_flutter/core/navigation/routes.dart';
import 'package:adroit_flutter/core/utils/app_color.dart';
import 'package:adroit_flutter/core/utils/app_constants.dart';
import 'package:adroit_flutter/core/utils/app_icons.dart';
import 'package:adroit_flutter/core/utils/app_locale.dart';
import 'package:adroit_flutter/core/widgets/appbar_cus.dart';
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
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          NavigationService.push(Routes.search_product);
        },
        child: AppIcons.search.widget(),
        backgroundColor: AppColors.mainYellow,
      ),
      body: Container(
        width: width,
        height: height,
        child: Column(
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
                                exampleProduct: exampleProduct);
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
                            Product exampleProduct = exampleProducts[index];
                            return ProductCatalogue(
                                exampleProduct: exampleProduct);
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
                            Product exampleProduct = exampleProducts[index];
                            return ProductCatalogue(
                                exampleProduct: exampleProduct);
                          }),
                    ),
                  ],
                ),
              ),
            ))
          ],
        ),
      ),
    );
  }
}

class ProductCatalogue extends StatelessWidget {
  const ProductCatalogue({
    Key? key,
    required this.exampleProduct,
  }) : super(key: key);

  final Product exampleProduct;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.all(paddingCont / 4),
      child: Container(
        decoration: BoxDecoration(
            border: Border.all(color: AppColors.darkGray),
            borderRadius: BorderRadius.circular(6)),
        child: Container(
            margin: EdgeInsets.all(paddingCont / 2),
            child: Image.network(exampleProduct.urlImage)),
      ),
    );
  }
}
