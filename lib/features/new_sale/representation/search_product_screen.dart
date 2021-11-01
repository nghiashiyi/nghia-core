import 'package:adroit_flutter/core/utils/app_color.dart';
import 'package:adroit_flutter/core/utils/app_constants.dart';
import 'package:adroit_flutter/core/utils/app_icons.dart';
import 'package:adroit_flutter/core/utils/app_locale.dart';
import 'package:adroit_flutter/core/widgets/appbar_cus.dart';
import 'package:adroit_flutter/core/widgets/product_catalogue.dart';
import 'package:adroit_flutter/features/new_sale/representation/product.dart';
import 'package:easy_localization/src/public_ext.dart';
import 'package:flutter/material.dart';

class SearchProductScreen extends StatefulWidget {
  const SearchProductScreen({Key? key}) : super(key: key);

  @override
  _SearchProductScreenState createState() => _SearchProductScreenState();
}

class _SearchProductScreenState extends State<SearchProductScreen> {
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
            Container(
              height: 35,
              color: AppColors.lightGray,
              padding: EdgeInsets.symmetric(horizontal: paddingCont / 2),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Row(
                    children: [
                      Text(
                        LocaleTexts.searchResultFor.tr(),
                        style: TextStyle(
                            color: AppColors.mainBlue,
                            fontSize: 12,
                            fontWeight: FontWeight.w500),
                      ),
                    ],
                  ),
                  Container(
                      height: 30,
                      child: AppIcons.close_blue.widget(fit: BoxFit.fitHeight)),
                ],
              ),
            ),
            Container(
              width: width,
              height: height * 0.6,
              child: GridView.builder(
                  physics: NeverScrollableScrollPhysics(),
                  gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 4,
                  ),
                  itemCount: 4,
                  itemBuilder: (context, index) {
                    Product exampleProduct = exampleProducts[index];
                    return ProductCatalogue(
                      exampleProduct: exampleProduct,
                      product: exampleProduct,
                    );
                  }),
            ),
            Container(
              child: Row(
                children: [],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
