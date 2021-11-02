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

class ReviewScreen extends StatefulWidget {
  ReviewScreen({Key? key, required this.isFinishDiscount}) : super(key: key);
  late String isFinishDiscount;
  @override
  _ReviewScreenState createState() => _ReviewScreenState();
}

class _ReviewScreenState extends State<ReviewScreen> {
  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    double height = MediaQuery.of(context).size.height;

    bool isDiscount = (widget.isFinishDiscount == 'finish_discount');
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
            Expanded(
              child: Stack(
                children: [
                  SingleChildScrollView(
                    child: Column(
                      children: [
                        SizedBox(
                          height: paddingCont,
                        ),
                        Row(
                          children: [
                            SizedBox(
                              width: paddingCont * 2,
                            ),
                            Text(
                              LocaleTexts.item.tr(),
                              style: TextStyle(
                                  color: AppColors.mainBlue,
                                  fontSize: 10,
                                  fontWeight: FontWeight.w500),
                            ),
                            SizedBox(
                              width: paddingCont * 4,
                            ),
                            Text(
                              LocaleTexts.quantity.tr(),
                              style: TextStyle(
                                  color: AppColors.mainBlue,
                                  fontSize: 10,
                                  fontWeight: FontWeight.w500),
                            ),
                            SizedBox(
                              width: paddingCont * 2,
                            ),
                            Text(
                              LocaleTexts.unitPrice.tr(),
                              style: TextStyle(
                                  color: AppColors.mainBlue,
                                  fontSize: 10,
                                  fontWeight: FontWeight.w500),
                            ),
                            SizedBox(
                              width: paddingCont * 2,
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
                        Container(
                          height: height * 0.4,
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
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
                                    children: [
                                      Expanded(
                                        child: Row(
                                          children: [
                                            Container(
                                              height: 50,
                                              width: 50,
                                              padding: EdgeInsets.all(
                                                  paddingCont / 2),
                                              decoration: BoxDecoration(
                                                  color: AppColors.white,
                                                  border: Border.all(
                                                      color:
                                                          AppColors.darkGray),
                                                  borderRadius:
                                                      BorderRadius.circular(6)),
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
                                                  backgroundColor:
                                                      Colors.transparent,
                                                  context: context,
                                                  builder:
                                                      (BuildContext context) {
                                                    return StatefulBuilder(
                                                        builder: (context,
                                                            StateSetter
                                                                setState) {
                                                      return Container(
                                                        height: height,
                                                        child: Column(
                                                          children: [
                                                            Expanded(
                                                                flex: 2,
                                                                child:
                                                                    Container(
                                                                  color: AppColors
                                                                      .transparent,
                                                                  child:
                                                                      GestureDetector(
                                                                          onTap:
                                                                              () {
                                                                            Navigator.pop(context);
                                                                          },
                                                                          child: AppIcons
                                                                              .close
                                                                              .widget()),
                                                                )),
                                                            Expanded(
                                                                flex: 3,
                                                                child:
                                                                    Container(
                                                                  color: AppColors
                                                                      .mainYellow,
                                                                  padding:
                                                                      EdgeInsets
                                                                          .all(
                                                                    paddingCont,
                                                                  ),
                                                                  child: Row(
                                                                    children: [
                                                                      Container(
                                                                        height:
                                                                            60,
                                                                        width:
                                                                            60,
                                                                        padding:
                                                                            EdgeInsets.all(paddingCont /
                                                                                2),
                                                                        decoration: BoxDecoration(
                                                                            color:
                                                                                AppColors.white,
                                                                            borderRadius: BorderRadius.circular(6)),
                                                                        child: Image
                                                                            .network(
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
                                                                            CrossAxisAlignment.start,
                                                                        mainAxisAlignment:
                                                                            MainAxisAlignment.spaceBetween,
                                                                        children: [
                                                                          Text(
                                                                            '${productAdded.productName} - ${productAdded.productWeight}kg',
                                                                            style:
                                                                                TextStyle(fontSize: subTitleTextSize, fontWeight: FontWeight.w500),
                                                                          ),
                                                                          Text(
                                                                            '${productAdded.productCode}',
                                                                            style:
                                                                                TextStyle(fontWeight: FontWeight.bold, fontSize: titleTextSize),
                                                                          ),
                                                                        ],
                                                                      )
                                                                    ],
                                                                  ),
                                                                )),
                                                            Expanded(
                                                                flex: 6,
                                                                child:
                                                                    Container(
                                                                  color:
                                                                      AppColors
                                                                          .white,
                                                                  padding:
                                                                      EdgeInsets
                                                                          .all(
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
                                                                            fontSize:
                                                                                12,
                                                                            fontWeight:
                                                                                FontWeight.w500),
                                                                      ),
                                                                      Container(
                                                                        width:
                                                                            180,
                                                                        height:
                                                                            45,
                                                                        padding:
                                                                            EdgeInsets.all(3),
                                                                        decoration: BoxDecoration(
                                                                            color:
                                                                                AppColors.mediumGray,
                                                                            borderRadius: BorderRadius.circular(40)),
                                                                        child:
                                                                            Row(
                                                                          mainAxisAlignment:
                                                                              MainAxisAlignment.spaceBetween,
                                                                          children: [
                                                                            GestureDetector(
                                                                                onTap: () {
                                                                                  setState(() {
                                                                                    if (productAddeds.length > 0) {
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
                                                                              productAddeds.length.toString(),
                                                                              style: TextStyle(fontSize: 24, fontWeight: FontWeight.w700),
                                                                            ),
                                                                            GestureDetector(
                                                                                onTap: () {
                                                                                  setState(() {
                                                                                    productAddeds.add(productAdded);
                                                                                    print(productAddeds.length);
                                                                                  });
                                                                                },
                                                                                child: AppIcons.add_circle.widget(height: 40)),
                                                                          ],
                                                                        ),
                                                                      ),
                                                                      GestureDetector(
                                                                        onTap:
                                                                            () {
                                                                          setState(
                                                                              () {
                                                                            isFinish =
                                                                                true;
                                                                          });
                                                                          Navigator.pop(
                                                                              context);
                                                                        },
                                                                        child:
                                                                            Container(
                                                                          height:
                                                                              50,
                                                                          padding:
                                                                              EdgeInsets.symmetric(horizontal: paddingCont),
                                                                          margin:
                                                                              EdgeInsets.symmetric(horizontal: paddingCont),
                                                                          decoration: BoxDecoration(
                                                                              color: AppColors.mainBlue,
                                                                              borderRadius: BorderRadius.circular(38)),
                                                                          child:
                                                                              Row(
                                                                            mainAxisAlignment:
                                                                                MainAxisAlignment.spaceBetween,
                                                                            children: [
                                                                              AppIcons.arrow_forward.widget(color: AppColors.mainBlue),
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
                                                        BorderRadius.circular(
                                                            38)),
                                                child: Text(
                                                  productAddeds.length
                                                      .toString(),
                                                  style: btnTextStyle,
                                                ),
                                              ),
                                            ),
                                            SizedBox(
                                              width: 10,
                                            ),
                                            Text(
                                              'x ${productAdded.productPrice.toString()}',
                                              style: TextStyle(
                                                  fontWeight: FontWeight.w500),
                                            ),
                                          ],
                                        ),
                                      ),
                                      Text(
                                        ' ${(productAdded.productPrice * productAddeds.length).toString()}',
                                        style: TextStyle(
                                            fontWeight: FontWeight.bold),
                                      ),
                                      SizedBox(
                                        width: paddingCont,
                                      ),
                                      GestureDetector(
                                        onTap: () {
                                          showDialog<String>(
                                            context: context,
                                            builder: (BuildContext context) =>
                                                AlertDialog(
                                              content: Container(
                                                height: 200,
                                                child: Column(
                                                  mainAxisAlignment:
                                                      MainAxisAlignment
                                                          .spaceAround,
                                                  children: [
                                                    Expanded(
                                                      flex: 3,
                                                      child: Column(
                                                        mainAxisAlignment:
                                                            MainAxisAlignment
                                                                .spaceAround,
                                                        children: [
                                                          Text(
                                                            LocaleTexts
                                                                .removeItem
                                                                .tr(),
                                                            style: TextStyle(
                                                                fontSize: 16,
                                                                fontWeight:
                                                                    FontWeight
                                                                        .w500,
                                                                color: AppColors
                                                                    .black),
                                                          ),
                                                          AppIcons.delete_icon
                                                              .widget(
                                                                  height: 70),
                                                          Text(
                                                            '${productAdded.productName} - ${productAdded.productWeight}${LocaleTexts.kg.tr()}',
                                                            style: TextStyle(
                                                                fontSize: 16,
                                                                fontWeight:
                                                                    FontWeight
                                                                        .w500,
                                                                color: AppColors
                                                                    .black),
                                                          ),
                                                          Text(
                                                            LocaleTexts
                                                                .deleteOfThisItem
                                                                .tr(),
                                                            style: TextStyle(
                                                                fontSize: 10,
                                                                fontWeight:
                                                                    FontWeight
                                                                        .w300,
                                                                color: AppColors
                                                                    .black),
                                                          ),
                                                        ],
                                                      ),
                                                    ),
                                                    SizedBox(
                                                      height: 10,
                                                    ),
                                                    Expanded(
                                                      flex: 1,
                                                      child: Container(
                                                        child: Row(
                                                          mainAxisAlignment:
                                                              MainAxisAlignment
                                                                  .spaceBetween,
                                                          children: [
                                                            Expanded(
                                                              child:
                                                                  GestureDetector(
                                                                onTap: () {
                                                                  Navigator.pop(
                                                                      context);
                                                                },
                                                                child:
                                                                    Container(
                                                                  alignment:
                                                                      Alignment
                                                                          .center,
                                                                  decoration: BoxDecoration(
                                                                      borderRadius:
                                                                          BorderRadius.circular(
                                                                              38),
                                                                      border: Border.all(
                                                                          color:
                                                                              AppColors.mainBlue)),
                                                                  child: Text(
                                                                    LocaleTexts
                                                                        .canleBtn
                                                                        .tr(),
                                                                    style: btnTextStyle
                                                                        .copyWith(
                                                                            color:
                                                                                AppColors.mainBlue),
                                                                  ),
                                                                ),
                                                              ),
                                                            ),
                                                            SizedBox(
                                                              width: 10,
                                                            ),
                                                            Expanded(
                                                              child:
                                                                  GestureDetector(
                                                                onTap: () {},
                                                                child:
                                                                    Container(
                                                                  alignment:
                                                                      Alignment
                                                                          .center,
                                                                  decoration: BoxDecoration(
                                                                      color: AppColors
                                                                          .mainBlue,
                                                                      borderRadius:
                                                                          BorderRadius.circular(
                                                                              38),
                                                                      border: Border.all(
                                                                          color:
                                                                              AppColors.mainBlue)),
                                                                  child: Text(
                                                                    LocaleTexts
                                                                        .confirmBtn
                                                                        .tr(),
                                                                    style: TextStyle(
                                                                        color: AppColors
                                                                            .white,
                                                                        fontSize:
                                                                            12,
                                                                        fontWeight:
                                                                            FontWeight.w500),
                                                                  ),
                                                                ),
                                                              ),
                                                            ),
                                                          ],
                                                        ),
                                                      ),
                                                    ),
                                                  ],
                                                ),
                                              ),
                                            ),
                                          );
                                        },
                                        child: AppIcons.delete_circle.widget(
                                          height: 25,
                                        ),
                                      )
                                    ],
                                  ),
                                );
                              }),
                        ),
                        Padding(
                          padding: EdgeInsets.only(left: paddingCont),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.start,
                            children: [
                              Text(
                                LocaleTexts.billDetail.tr(),
                                style: TextStyle(fontSize: 10),
                              ),
                            ],
                          ),
                        ),
                        SizedBox(
                          height: paddingCont / 2,
                        ),
                        Padding(
                          padding: EdgeInsets.only(left: paddingCont),
                          child: Row(
                            children: [
                              Text(
                                '${LocaleTexts.subTotal.tr()}(${productAddeds.length} ${LocaleTexts.item})',
                                style: TextStyle(
                                    fontSize: 14, fontWeight: FontWeight.bold),
                              ),
                              SizedBox(
                                width: paddingCont * 2,
                              ),
                              Text(
                                LocaleTexts.productCode.tr(),
                                style: TextStyle(
                                    fontSize: 14, fontWeight: FontWeight.bold),
                              )
                            ],
                          ),
                        ),
                        SizedBox(
                          height: paddingCont / 2,
                        ),
                        isDiscount
                            ? Column(
                                children: [
                                  Padding(
                                    padding: EdgeInsets.symmetric(
                                        horizontal: paddingCont),
                                    child: Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceBetween,
                                      children: [
                                        Text(
                                          LocaleTexts.flyerDiscount.tr(),
                                          style: TextStyle(fontSize: 10),
                                        ),
                                        Text(
                                          LocaleTexts.minus10.tr(),
                                          style: TextStyle(
                                              fontSize: 12,
                                              color: AppColors.otherGreen),
                                        ),
                                      ],
                                    ),
                                  ),
                                  SizedBox(
                                    height: paddingCont / 2,
                                  ),
                                  Padding(
                                    padding: EdgeInsets.symmetric(
                                        horizontal: paddingCont),
                                    child: Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceBetween,
                                      children: [
                                        Text(
                                          LocaleTexts.repeatPurchase.tr(),
                                          style: TextStyle(fontSize: 10),
                                        ),
                                        Text(
                                          LocaleTexts.minus64.tr(),
                                          style: TextStyle(
                                              fontSize: 12,
                                              color: AppColors.otherGreen),
                                        ),
                                      ],
                                    ),
                                  ),
                                ],
                              )
                            : Container(),
                      ],
                    ),
                  ),
                  Align(
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
                              Row(
                                children: [
                                  Text(
                                    LocaleTexts.total.tr(),
                                    style: TextStyle(
                                        fontWeight: FontWeight.bold,
                                        fontSize: 14),
                                  ),
                                  SizedBox(
                                    width: 5,
                                  ),
                                  isDiscount
                                      ? Text(
                                          LocaleTexts.productPrice.tr(),
                                          style: TextStyle(
                                              color: AppColors.darkGray,
                                              fontSize: 12,
                                              decoration:
                                                  TextDecoration.lineThrough),
                                        )
                                      : Container(),
                                  SizedBox(
                                    width: 5,
                                  ),
                                  Text(
                                    productAddeds[0].productCode.tr(),
                                    style: TextStyle(
                                        fontWeight: FontWeight.bold,
                                        fontSize: 14),
                                  ),
                                ],
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
                              isDiscount
                                  ? NavigationService.push(Routes.payment)
                                  : NavigationService.push(Routes.discount);
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
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
