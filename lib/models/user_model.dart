// To parse this JSON data, do
//
//     final userModel = userModelFromJson(jsonString);

import 'dart:convert';

UserModel userModelFromJson(String str) => UserModel.fromJson(json.decode(str));

String userModelToJson(UserModel data) => json.encode(data.toJson());

class UserModel {
  int? id;
  String? phoneNumber;
  String? otp;
  String? firstName;
  String? lastName;
  String? profilePicture;
  String? pin;
  String? balance;
  DateTime? createdAt;
  DateTime? updatedAt;

  UserModel({
    this.id,
    this.phoneNumber,
    this.otp,
    this.firstName,
    this.lastName,
    this.profilePicture,
    this.pin,
    this.balance,
    this.createdAt,
    this.updatedAt,
  });

  factory UserModel.fromJson(Map<String, dynamic> json) => UserModel(
    id: json["id"],
    phoneNumber: json["phone_number"],
    otp: json["otp"],
    firstName: json["first_name"],
    lastName: json["last_name"],
    profilePicture: json["profile_picture"],
    pin: json["pin"],
    balance: json["balance"],
    createdAt: json["created_at"] == null ? null : DateTime.parse(json["created_at"]),
    updatedAt: json["updated_at"] == null ? null : DateTime.parse(json["updated_at"]),
  );

  Map<String, dynamic> toJson() => {
    "id": id,
    "phone_number": phoneNumber,
    "otp": otp,
    "first_name": firstName,
    "last_name": lastName,
    "profile_picture": profilePicture,
    "pin": pin,
    "balance": balance,
    "created_at": createdAt?.toIso8601String(),
    "updated_at": updatedAt?.toIso8601String(),
  };
}
