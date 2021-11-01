import 'package:adroit_flutter/core/utils/app_color.dart';
import 'package:adroit_flutter/core/utils/app_constants.dart';
import 'package:adroit_flutter/core/utils/app_icons.dart';
import 'package:adroit_flutter/core/utils/app_locale.dart';
import 'package:adroit_flutter/core/widgets/appbar_cus.dart';
import 'package:adroit_flutter/features/new_sale/representation/product.dart';
import 'package:easy_localization/src/public_ext.dart';
import 'package:flutter/material.dart';

class ReviewScreen extends StatefulWidget {
  const ReviewScreen({Key? key}) : super(key: key);

  @override
  _ReviewScreenState createState() => _ReviewScreenState();
}

class _ReviewScreenState extends State<ReviewScreen> {
  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    double height = MediaQuery.of(context).size.height;
    return Scaffold(
      appBar: buildAppBarCus(
          title: LocaleTexts.reviewAppbar.tr(),
          onTap: () {
            Navigator.pop(context);
          }),
      body: Container(
        width: width,
        height: height,
        color: AppColors.white,
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
            SizedBox(
              height: paddingCont,
            ),
            Row(
              children: [
                SizedBox(
                  width: 20,
                ),
                Text(
                  LocaleTexts.item.tr(),
                  style: TextStyle(
                      color: AppColors.mainBlue,
                      fontSize: 10,
                      fontWeight: FontWeight.w500),
                ),
                SizedBox(
                  width: 45,
                ),
                Text(
                  LocaleTexts.quantity.tr(),
                  style: TextStyle(
                      color: AppColors.mainBlue,
                      fontSize: 10,
                      fontWeight: FontWeight.w500),
                ),
                SizedBox(
                  width: 20,
                ),
                Text(
                  LocaleTexts.unitPrice.tr(),
                  style: TextStyle(
                      color: AppColors.mainBlue,
                      fontSize: 10,
                      fontWeight: FontWeight.w500),
                ),
                SizedBox(
                  width: 18,
                ),
                Text(
                  LocaleTexts.total.tr().toUpperCase(),
                  style: TextStyle(
                      color: AppColors.mainBlue,
                      fontSize: 10,
                      fontWeight: FontWeight.w500),
                ),
              ],
            ),
            SizedBox(
              height: paddingCont,
            ),
            Expanded(
                child: ListView.builder(
                    itemCount: productAddeds.length,
                    itemBuilder: (context, index) {
                      Product productAdded = productAddeds[index];
                      return Container(
                        width: width,
                        height: 70,
                        padding: EdgeInsets.all(paddingCont),
                        color: (index % 2) == 0
                            ? AppColors.lightGray
                            : AppColors.white,
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Expanded(
                              child: Row(
                                children: [
                                  Container(
                                    height: 50,
                                    width: 50,
                                    padding: EdgeInsets.all(paddingCont / 2),
                                    decoration: BoxDecoration(
                                        color: AppColors.white,
                                        border: Border.all(
                                            color: AppColors.darkGray),
                                        borderRadius: BorderRadius.circular(6)),
                                    child: Image.network(
                                      productAdded.urlImage,
                                      fit: BoxFit.fitHeight,
                                    ),
                                  ),
                                  SizedBox(
                                    width: 10,
                                  ),
                                  GestureDetector(
                                    onTap: () {
                                      showModalBottomSheet<void>(
                                        elevation: 0,
                                        backgroundColor: Colors.transparent,
                                        context: context,
                                        builder: (BuildContext context) {
                                          return StatefulBuilder(builder:
                                              (context, StateSetter setState) {
                                            return Container(
                                              height: height,
                                              child: Column(
                                                children: [
                                                  Expanded(
                                                      flex: 2,
                                                      child: Container(
                                                        color: AppColors
                                                            .transparent,
                                                        child: GestureDetector(
                                                            onTap: () {
                                                              Navigator.pop(
                                                                  context);
                                                            },
                                                            child: AppIcons
                                                                .close
                                                                .widget()),
                                                      )),
                                                  Expanded(
                                                      flex: 3,
                                                      child: Container(
                                                        color: AppColors
                                                            .mainYellow,
                                                        padding: EdgeInsets.all(
                                                          paddingCont,
                                                        ),
                                                        child: Row(
                                                          children: [
                                                            Container(
                                                              height: 60,
                                                              width: 60,
                                                              padding:
                                                                  EdgeInsets.all(
                                                                      paddingCont /
                                                                          2),
                                                              decoration: BoxDecoration(
                                                                  color:
                                                                      AppColors
                                                                          .white,
                                                                  borderRadius:
                                                                      BorderRadius
                                                                          .circular(
                                                                              6)),
                                                              child:
                                                                  Image.network(
                                                                productAdded
                                                                    .urlImage,
                                                                fit: BoxFit
                                                                    .fitHeight,
                                                              ),
                                                            ),
                                                            SizedBox(
                                                              width:
                                                                  paddingCont,
                                                            ),
                                                            Column(
                                                              crossAxisAlignment:
                                                                  CrossAxisAlignment
                                                                      .start,
                                                              mainAxisAlignment:
                                                                  MainAxisAlignment
                                                                      .spaceBetween,
                                                              children: [
                                                                Text(
                                                                  '${productAdded.productName} - ${productAdded.productWeight}kg',
                                                                  style: TextStyle(
                                                                      fontSize:
                                                                          subTitleTextSize,
                                                                      fontWeight:
                                                                          FontWeight
                                                                              .w500),
                                                                ),
                                                                Text(
                                                                  '${productAdded.productCode}',
                                                                  style: TextStyle(
                                                                      fontWeight:
                                                                          FontWeight
                                                                              .bold,
                                                                      fontSize:
                                                                          titleTextSize),
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
                                                        padding: EdgeInsets.all(
                                                            paddingCont),
                                                        child: Column(
                                                          mainAxisAlignment:
                                                              MainAxisAlignment
                                                                  .spaceAround,
                                                          children: [
                                                            Text(
                                                              LocaleTexts
                                                                  .quantity
                                                                  .tr(),
                                                              style: TextStyle(
                                                                  fontSize: 12,
                                                                  fontWeight:
                                                                      FontWeight
                                                                          .w500),
                                                            ),
                                                            Container(
                                                              width: 180,
                                                              height: 45,
                                                              padding:
                                                                  EdgeInsets
                                                                      .all(3),
                                                              decoration: BoxDecoration(
                                                                  color: AppColors
                                                                      .mediumGray,
                                                                  borderRadius:
                                                                      BorderRadius
                                                                          .circular(
                                                                              40)),
                                                              child: Row(
                                                                mainAxisAlignment:
                                                                    MainAxisAlignment
                                                                        .spaceBetween,
                                                                children: [
                                                                  GestureDetector(
                                                                      onTap:
                                                                          () {
                                                                        setState(
                                                                            () {
                                                                          if (productAddeds.length >
                                                                              0) {
                                                                            productAddeds.remove(productAddeds);
                                                                          }
                                                                        });
                                                                      },
                                                                      child: isFinish
                                                                          ? AppIcons.delete_circle.widget(
                                                                              height: 40,
                                                                            )
                                                                          : AppIcons.remove_circle.widget(height: 40, color: (productAddeds.length > 0) ? AppColors.mainBlue : null)),
                                                                  Text(
                                                                    productAddeds
                                                                        .length
                                                                        .toString(),
                                                                    style: TextStyle(
                                                                        fontSize:
                                                                            24,
                                                                        fontWeight:
                                                                            FontWeight.w700),
                                                                  ),
                                                                  GestureDetector(
                                                                      onTap:
                                                                          () {
                                                                        setState(
                                                                            () {
                                                                          productAddeds
                                                                              .add(productAdded);
                                                                          print(
                                                                              productAddeds.length);
                                                                        });
                                                                      },
                                                                      child: AppIcons
                                                                          .add_circle
                                                                          .widget(
                                                                              height: 40)),
                                                                ],
                                                              ),
                                                            ),
                                                            GestureDetector(
                                                              onTap: () {
                                                                setState(() {
                                                                  isFinish =
                                                                      true;
                                                                });
                                                                Navigator.pop(
                                                                    context);
                                                              },
                                                              child: Container(
                                                                height: 50,
                                                                padding: EdgeInsets
                                                                    .symmetric(
                                                                        horizontal:
                                                                            paddingCont),
                                                                margin: EdgeInsets
                                                                    .symmetric(
                                                                        horizontal:
                                                                            paddingCont),
                                                                decoration: BoxDecoration(
                                                                    color: AppColors
                                                                        .mainBlue,
                                                                    borderRadius:
                                                                        BorderRadius.circular(
                                                                            38)),
                                                                child: Row(
                                                                  mainAxisAlignment:
                                                                      MainAxisAlignment
                                                                          .spaceBetween,
                                                                  children: [
                                                                    AppIcons
                                                                        .arrow_forward
                                                                        .widget(
                                                                            color:
                                                                                AppColors.mainBlue),
                                                                    Text(
                                                                      LocaleTexts
                                                                          .confirmBtn
                                                                          .tr(),
                                                                      style:
                                                                          btnTextStyle,
                                                                    ),
                                                                    AppIcons
                                                                        .arrow_forward
                                                                        .widget()
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
                                    child: Container(
                                      alignment: Alignment.center,
                                      height: 35,
                                      width: 70,
                                      padding: EdgeInsets.symmetric(
                                          horizontal: paddingCont),
                                      margin: EdgeInsets.symmetric(
                                          horizontal: paddingCont),
                                      decoration: BoxDecoration(
                                          color: AppColors.mainBlue,
                                          borderRadius:
                                              BorderRadius.circular(38)),
                                      child: Text(
                                        productAddeds.length.toString(),
                                        style: btnTextStyle,
                                      ),
                                    ),
                                  ),
                                  SizedBox(
                                    width: 10,
                                  ),
                                  Text(
                                    'x ${productAdded.productPrice.toString()}',
                                    style:
                                        TextStyle(fontWeight: FontWeight.w500),
                                  ),
                                ],
                              ),
                            ),
                            Text(
                              ' ${(productAdded.productPrice * productAddeds.length).toString()}',
                              style: TextStyle(fontWeight: FontWeight.bold),
                            ),
                            SizedBox(
                              width: paddingCont,
                            ),
                            AppIcons.delete_circle.widget(
                              height: 25,
                            )
                          ],
                        ),
                      );
                    }))
          ],
        ),
      ),
    );
  }
}
