// To parse this JSON data, do
//
//     final requestPostSaleMember = requestPostSaleMemberFromJson(jsonString);

import 'dart:convert';

RequestPostSaleMember requestPostSaleMemberFromJson(String str) => RequestPostSaleMember.fromJson(json.decode(str));

String requestPostSaleMemberToJson(RequestPostSaleMember data) => json.encode(data.toJson());

class RequestPostSaleMember {
  RequestPostSaleMember({
    this.mobile,
    this.memberId,
    this.memberType,
  });

  String? mobile;
  String? memberId;
  String? memberType;

  RequestPostSaleMember copyWith({
    String? mobile,
    String? memberId,
    String? memberType,
  }) =>
      RequestPostSaleMember(
        mobile: mobile ?? this.mobile,
        memberId: memberId ?? this.memberId,
        memberType: memberType ?? this.memberType,
      );

  factory RequestPostSaleMember.fromJson(Map<String, dynamic> json) => RequestPostSaleMember(
    mobile: json["mobile"] == null ? null : json["mobile"],
    memberId: json["memberId"] == null ? null : json["memberId"],
    memberType: json["memberType"] == null ? null : json["memberType"],
  );

  Map<String, dynamic> toJson() => {
    "mobile": mobile == null ? null : mobile,
    "memberId": memberId == null ? null : memberId,
    "memberType": memberType == null ? null : memberType,
  };
}
