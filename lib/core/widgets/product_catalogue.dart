import 'package:adroit_flutter/core/utils/app_color.dart';
import 'package:adroit_flutter/core/utils/app_constants.dart';
import 'package:adroit_flutter/core/utils/app_icons.dart';
import 'package:adroit_flutter/core/utils/app_locale.dart';
import 'package:adroit_flutter/features/new_sale/representation/product.dart';
import 'package:easy_localization/src/public_ext.dart';
import 'package:flutter/material.dart';

class ProductCatalogue extends StatefulWidget {
  const ProductCatalogue({
    Key? key,
    required this.exampleProduct,
    required this.product,
  }) : super(key: key);

  final Product exampleProduct;
  final Product product;

  @override
  State<ProductCatalogue> createState() => _ProductCatalogueState();
}

class _ProductCatalogueState extends State<ProductCatalogue> {
  getBorderColor() {
    if (productAddeds.length > 1 && widget.product.id == 1) {
      return Padding(
        padding: EdgeInsets.all(paddingCont / 4),
        child: Material(
          elevation: 5,
          borderRadius: BorderRadius.circular(6),
          child: Stack(
            children: [
              Container(
                constraints: BoxConstraints.expand(),
                decoration: BoxDecoration(
                    border: Border.all(color: AppColors.mainYellow, width: 1),
                    borderRadius: BorderRadius.circular(6)),
                child: Container(
                    margin: EdgeInsets.all(paddingCont / 2),
                    child: Image.network(widget.exampleProduct.urlImage)),
              ),
              Align(
                alignment: Alignment.topRight,
                child: Container(
                  height: 20,
                  width: 27,
                  alignment: Alignment.center,
                  decoration: BoxDecoration(
                      color: AppColors.mainBlue,
                      borderRadius:
                          BorderRadius.only(topRight: Radius.circular(6))),
                  child: Text(
                    productAddeds.length.toString(),
                    style: TextStyle(
                        color: AppColors.white,
                        fontSize: 12,
                        fontWeight: FontWeight.w500),
                  ),
                ),
              )
            ],
          ),
        ),
      );
    } else {
      return Padding(
        padding: EdgeInsets.all(paddingCont / 4),
        child: Container(
          decoration: BoxDecoration(
              border: Border.all(color: AppColors.darkGray),
              borderRadius: BorderRadius.circular(6)),
          child: Container(
              margin: EdgeInsets.all(paddingCont / 2),
              child: Image.network(widget.exampleProduct.urlImage)),
        ),
      );
    }
    ;
  }

  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    double height = MediaQuery.of(context).size.height;
    return GestureDetector(
      onTap: () {
        showModalBottomSheet<void>(
          elevation: 0,
          backgroundColor: Colors.transparent,
          context: context,
          builder: (BuildContext context) {
            return StatefulBuilder(builder: (context, StateSetter setState) {
              return Container(
                height: height,
                child: Column(
                  children: [
                    Expanded(
                        flex: 2,
                        child: Container(
                          color: AppColors.transparent,
                          child: GestureDetector(
                              onTap: () {
                                Navigator.pop(context);
                              },
                              child: AppIcons.close.widget()),
                        )),
                    Expanded(
                        flex: 3,
                        child: Container(
                          color: AppColors.mainYellow,
                          padding: EdgeInsets.all(
                            paddingCont,
                          ),
                          child: Row(
                            children: [
                              Container(
                                height: 60,
                                width: 60,
                                padding: EdgeInsets.all(paddingCont / 2),
                                decoration: BoxDecoration(
                                    color: AppColors.white,
                                    borderRadius: BorderRadius.circular(6)),
                                child: Image.network(
                                  widget.product.urlImage,
                                  fit: BoxFit.fitHeight,
                                ),
                              ),
                              SizedBox(
                                width: paddingCont,
                              ),
                              Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  Text(
                                    '${widget.product.productName} - ${widget.product.productWeight}kg',
                                    style: TextStyle(
                                        fontSize: subTitleTextSize,
                                        fontWeight: FontWeight.w500),
                                  ),
                                  Text(
                                    '${widget.product.productCode}',
                                    style: TextStyle(
                                        fontWeight: FontWeight.bold,
                                        fontSize: titleTextSize),
                                  ),
                                ],
                              )
                            ],
                          ),
                        )),
                    Expanded(
                        flex: 6,
                        child: Container(
                          color: AppColors.white,
                          padding: EdgeInsets.all(paddingCont),
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.spaceAround,
                            children: [
                              Text(
                                LocaleTexts.quantity.tr(),
                                style: TextStyle(
                                    fontSize: 12, fontWeight: FontWeight.w500),
                              ),
                              Container(
                                width: 180,
                                height: 45,
                                padding: EdgeInsets.all(3),
                                decoration: BoxDecoration(
                                    color: AppColors.mediumGray,
                                    borderRadius: BorderRadius.circular(40)),
                                child: Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                    GestureDetector(
                                        onTap: () {
                                          setState(() {
                                            if (productAddeds.length > 0) {
                                              productAddeds
                                                  .remove(widget.product);
                                            }
                                          });
                                        },
                                        child: isFinish
                                            ? AppIcons.delete_circle.widget(
                                                height: 40,
                                              )
                                            : AppIcons.remove_circle.widget(
                                                height: 40,
                                                color:
                                                    (productAddeds.length > 0)
                                                        ? AppColors.mainBlue
                                                        : null)),
                                    Text(
                                      productAddeds.length.toString(),
                                      style: TextStyle(
                                          fontSize: 24,
                                          fontWeight: FontWeight.w700),
                                    ),
                                    GestureDetector(
                                        onTap: () {
                                          setState(() {
                                            productAddeds.add(widget.product);
                                            print(productAddeds.length);
                                          });
                                        },
                                        child: AppIcons.add_circle
                                            .widget(height: 40)),
                                  ],
                                ),
                              ),
                              GestureDetector(
                                onTap: () {
                                  setState(() {
                                    getBorderColor();
                                    isFinish = true;
                                  });
                                  Navigator.pop(context);
                                },
                                child: Container(
                                  height: 50,
                                  padding: EdgeInsets.symmetric(
                                      horizontal: paddingCont),
                                  margin: EdgeInsets.symmetric(
                                      horizontal: paddingCont),
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
                                        LocaleTexts.confirmBtn.tr(),
                                        style: btnTextStyle,
                                      ),
                                      AppIcons.arrow_forward.widget()
                                    ],
                                  ),
                                ),
                              ),
                            ],
                          ),
                        )),
                  ],
                ),
              );
            });
          },
        );
      },
      child: getBorderColor(),
    );
  }
}
