// To parse this JSON data, do
//
//     final requestPostSaleGenerateOtp = requestPostSaleGenerateOtpFromJson(jsonString);

import 'dart:convert';

RequestPostSaleGenerateOtp requestPostSaleGenerateOtpFromJson(String str) => RequestPostSaleGenerateOtp.fromJson(json.decode(str));

String requestPostSaleGenerateOtpToJson(RequestPostSaleGenerateOtp data) => json.encode(data.toJson());

class RequestPostSaleGenerateOtp {
  RequestPostSaleGenerateOtp({
    this.mobile,
  });

  String? mobile;

  RequestPostSaleGenerateOtp copyWith({
    String? mobile,
  }) =>
      RequestPostSaleGenerateOtp(
        mobile: mobile ?? this.mobile,
      );

  factory RequestPostSaleGenerateOtp.fromJson(Map<String, dynamic> json) => RequestPostSaleGenerateOtp(
    mobile: json["mobile"] == null ? null : json["mobile"],
  );

  Map<String, dynamic> toJson() => {
    "mobile": mobile == null ? null : mobile,
  };
}
