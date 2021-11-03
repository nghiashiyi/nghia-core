// To parse this JSON data, do
//
//     final requestPostSaleCustomer = requestPostSaleCustomerFromJson(jsonString);

import 'dart:convert';

RequestPostSaleCustomer requestPostSaleCustomerFromJson(String str) => RequestPostSaleCustomer.fromJson(json.decode(str));

String requestPostSaleCustomerToJson(RequestPostSaleCustomer data) => json.encode(data.toJson());

class RequestPostSaleCustomer {
  RequestPostSaleCustomer({
    this.customer,
  });

  Customer? customer;

  RequestPostSaleCustomer copyWith({
    Customer? customer,
  }) =>
      RequestPostSaleCustomer(
        customer: customer ?? this.customer,
      );

  factory RequestPostSaleCustomer.fromJson(Map<String, dynamic> json) => RequestPostSaleCustomer(
    customer: json["customer"] == null ? null : Customer.fromJson(json["customer"]),
  );

  Map<String, dynamic> toJson() => {
    "customer": customer == null ? null : customer!.toJson(),
  };
}

class Customer {
  Customer({
    this.name,
    this.mobile,
    this.balance,
    this.fuelPurchased,
    this.isEnrolled,
    this.canisterId,
  });

  String? name;
  String? mobile;
  int? balance;
  int? fuelPurchased;
  bool? isEnrolled;
  String? canisterId;

  Customer copyWith({
    String? name,
    String? mobile,
    int? balance,
    int? fuelPurchased,
    bool? isEnrolled,
    String? canisterId,
  }) =>
      Customer(
        name: name ?? this.name,
        mobile: mobile ?? this.mobile,
        balance: balance ?? this.balance,
        fuelPurchased: fuelPurchased ?? this.fuelPurchased,
        isEnrolled: isEnrolled ?? this.isEnrolled,
        canisterId: canisterId ?? this.canisterId,
      );

  factory Customer.fromJson(Map<String, dynamic> json) => Customer(
    name: json["name"] == null ? null : json["name"],
    mobile: json["mobile"] == null ? null : json["mobile"],
    balance: json["balance"] == null ? null : json["balance"],
    fuelPurchased: json["fuelPurchased"] == null ? null : json["fuelPurchased"],
    isEnrolled: json["isEnrolled"] == null ? null : json["isEnrolled"],
    canisterId: json["canisterId"] == null ? null : json["canisterId"],
  );

  Map<String, dynamic> toJson() => {
    "name": name == null ? null : name,
    "mobile": mobile == null ? null : mobile,
    "balance": balance == null ? null : balance,
    "fuelPurchased": fuelPurchased == null ? null : fuelPurchased,
    "isEnrolled": isEnrolled == null ? null : isEnrolled,
    "canisterId": canisterId == null ? null : canisterId,
  };
}
