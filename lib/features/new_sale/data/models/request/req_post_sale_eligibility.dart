// To parse this JSON data, do
//
//     final requestPostSaleEligibility = requestPostSaleEligibilityFromJson(jsonString);

import 'dart:convert';

RequestPostSaleEligibility requestPostSaleEligibilityFromJson(String str) => RequestPostSaleEligibility.fromJson(json.decode(str));

String requestPostSaleEligibilityToJson(RequestPostSaleEligibility data) => json.encode(data.toJson());

class RequestPostSaleEligibility {
  RequestPostSaleEligibility({
    this.mobile,
    this.userCart,
    this.storeId,
  });

  String? mobile;
  UserCart? userCart;
  int? storeId;

  RequestPostSaleEligibility copyWith({
    String? mobile,
    UserCart? userCart,
    int? storeId,
  }) =>
      RequestPostSaleEligibility(
        mobile: mobile ?? this.mobile,
        userCart: userCart ?? this.userCart,
        storeId: storeId ?? this.storeId,
      );

  factory RequestPostSaleEligibility.fromJson(Map<String, dynamic> json) => RequestPostSaleEligibility(
    mobile: json["mobile"] == null ? null : json["mobile"],
    userCart: json["userCart"] == null ? null : UserCart.fromJson(json["userCart"]),
    storeId: json["storeId"] == null ? null : json["storeId"],
  );

  Map<String, dynamic> toJson() => {
    "mobile": mobile == null ? null : mobile,
    "userCart": userCart == null ? null : userCart!.toJson(),
    "storeId": storeId == null ? null : storeId,
  };
}

class UserCart {
  UserCart({
    this.items,
  });

  List<Item>? items;

  UserCart copyWith({
    List<Item>? items,
  }) =>
      UserCart(
        items: items ?? this.items,
      );

  factory UserCart.fromJson(Map<String, dynamic> json) => UserCart(
    items: json["items"] == null ? null : List<Item>.from(json["items"].map((x) => Item.fromJson(x))),
  );

  Map<String, dynamic> toJson() => {
    "items": items == null ? null : List<dynamic>.from(items!.map((x) => x.toJson())),
  };
}

class Item {
  Item({
    this.sku,
    this.quantity,
    this.series,
  });

  String? sku;
  int? quantity;
  List<String>? series;

  Item copyWith({
    String? sku,
    int? quantity,
    List<String>? series,
  }) =>
      Item(
        sku: sku ?? this.sku,
        quantity: quantity ?? this.quantity,
        series: series ?? this.series,
      );

  factory Item.fromJson(Map<String, dynamic> json) => Item(
    sku: json["sku"] == null ? null : json["sku"],
    quantity: json["quantity"] == null ? null : json["quantity"],
    series: json["series"] == null ? null : List<String>.from(json["series"].map((x) => x)),
  );

  Map<String, dynamic> toJson() => {
    "sku": sku == null ? null : sku,
    "quantity": quantity == null ? null : quantity,
    "series": series == null ? null : List<dynamic>.from(series!.map((x) => x)),
  };
}
