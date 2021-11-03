// To parse this JSON data, do
//
//     final requestPostSaleVerifyOtp = requestPostSaleVerifyOtpFromJson(jsonString);

import 'dart:convert';

RequestPostSaleVerifyOtp requestPostSaleVerifyOtpFromJson(String str) => RequestPostSaleVerifyOtp.fromJson(json.decode(str));

String requestPostSaleVerifyOtpToJson(RequestPostSaleVerifyOtp data) => json.encode(data.toJson());

class RequestPostSaleVerifyOtp {
  RequestPostSaleVerifyOtp({
    this.mobile,
    this.code,
  });

  String? mobile;
  String? code;

  RequestPostSaleVerifyOtp copyWith({
    String? mobile,
    String? code,
  }) =>
      RequestPostSaleVerifyOtp(
        mobile: mobile ?? this.mobile,
        code: code ?? this.code,
      );

  factory RequestPostSaleVerifyOtp.fromJson(Map<String, dynamic> json) => RequestPostSaleVerifyOtp(
    mobile: json["mobile"] == null ? null : json["mobile"],
    code: json["code"] == null ? null : json["code"],
  );

  Map<String, dynamic> toJson() => {
    "mobile": mobile == null ? null : mobile,
    "code": code == null ? null : code,
  };
}
