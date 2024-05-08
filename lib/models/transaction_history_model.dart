// To parse this JSON data, do
//
//     final transactionHistoryModel = transactionHistoryModelFromJson(jsonString);

import 'dart:convert';

List<TransactionHistoryModel> transactionHistoryModelFromJson(String str) => List<TransactionHistoryModel>.from(json.decode(str).map((x) => TransactionHistoryModel.fromJson(x)));

String transactionHistoryModelToJson(List<TransactionHistoryModel> data) => json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class TransactionHistoryModel {
  int? id;
  String? type;
  int? senderId;
  int? receiverId;
  String? amount;
  String? trxId;
  DateTime? createdAt;
  DateTime? updatedAt;
  Receiver? sender;
  Receiver? receiver;

  TransactionHistoryModel({
    this.id,
    this.type,
    this.senderId,
    this.receiverId,
    this.amount,
    this.trxId,
    this.createdAt,
    this.updatedAt,
    this.sender,
    this.receiver,
  });

  factory TransactionHistoryModel.fromJson(Map<String, dynamic> json) => TransactionHistoryModel(
    id: json["id"],
    type: json["type"],
    senderId: json["sender_id"],
    receiverId: json["receiver_id"],
    amount: json["amount"],
    trxId: json["trx_id"],
    createdAt: json["created_at"] == null ? null : DateTime.parse(json["created_at"]),
    updatedAt: json["updated_at"] == null ? null : DateTime.parse(json["updated_at"]),
    sender: json["sender"] == null ? null : Receiver.fromJson(json["sender"]),
    receiver: json["receiver"] == null ? null : Receiver.fromJson(json["receiver"]),
  );

  Map<String, dynamic> toJson() => {
    "id": id,
    "type": type,
    "sender_id": senderId,
    "receiver_id": receiverId,
    "amount": amount,
    "trx_id": trxId,
    "created_at": createdAt?.toIso8601String(),
    "updated_at": updatedAt?.toIso8601String(),
    "sender": sender?.toJson(),
    "receiver": receiver?.toJson(),
  };
}

class Receiver {
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

  Receiver({
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

  factory Receiver.fromJson(Map<String, dynamic> json) => Receiver(
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
