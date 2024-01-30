// To parse this JSON data, do
//
//     final homePageModel = homePageModelFromJson(jsonString);

import 'dart:convert';

HomePageModel homePageModelFromJson(String str) => HomePageModel.fromJson(json.decode(str));

String homePageModelToJson(HomePageModel data) => json.encode(data.toJson());

class HomePageModel {
  final String? mobile;
  final String? email;
  final String? password;
  final String? firstName;
  final String? lastName;

  final DeviceInfo? deviceInfo;

  HomePageModel({
    this.mobile,
    this.email,
    this.password,
    this.firstName,
    this.lastName,

    this.deviceInfo,
  });

  factory HomePageModel.fromJson(Map<String, dynamic> json) => HomePageModel(
    mobile: json["mobile"],
    email: json["email"],
    password: json["password"],
    firstName: json["firstName"],
    lastName: json["lastName"],

    deviceInfo: json["deviceInfo"] == null ? null : DeviceInfo.fromJson(json["deviceInfo"]),
  );

  Map<String, dynamic> toJson() => {
    "mobile": mobile,
    "email": email,
    "password": password,
    "firstName": firstName,
    "lastName": lastName,

    "deviceInfo": deviceInfo?.toJson(),
  };
}

class DeviceInfo {
  DeviceInfo();

  factory DeviceInfo.fromJson(Map<String, dynamic> json) => DeviceInfo(
  );

  Map<String, dynamic> toJson() => {
  };
}
