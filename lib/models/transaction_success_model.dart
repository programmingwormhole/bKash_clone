// To parse this JSON data, do
//
//     final transactionSuccessModel = transactionSuccessModelFromJson(jsonString);

import 'dart:convert';

TransactionSuccessModel transactionSuccessModelFromJson(String str) => TransactionSuccessModel.fromJson(json.decode(str));

String transactionSuccessModelToJson(TransactionSuccessModel data) => json.encode(data.toJson());

class TransactionSuccessModel {
  String? message;
  Receiver? sender;
  Receiver? receiver;
  Transaction? transaction;

  TransactionSuccessModel({
    this.message,
    this.sender,
    this.receiver,
    this.transaction,
  });

  factory TransactionSuccessModel.fromJson(Map<String, dynamic> json) => TransactionSuccessModel(
    message: json["message"],
    sender: json["sender"] == null ? null : Receiver.fromJson(json["sender"]),
    receiver: json["receiver"] == null ? null : Receiver.fromJson(json["receiver"]),
    transaction: json["transaction"] == null ? null : Transaction.fromJson(json["transaction"]),
  );

  Map<String, dynamic> toJson() => {
    "message": message,
    "sender": sender?.toJson(),
    "receiver": receiver?.toJson(),
    "transaction": transaction?.toJson(),
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
  int? balance;
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

class Transaction {
  String? amount;
  int? senderId;
  int? receiverId;
  String? type;
  String? trxId;
  DateTime? updatedAt;
  DateTime? createdAt;
  int? id;

  Transaction({
    this.amount,
    this.senderId,
    this.receiverId,
    this.type,
    this.trxId,
    this.updatedAt,
    this.createdAt,
    this.id,
  });

  factory Transaction.fromJson(Map<String, dynamic> json) => Transaction(
    amount: json["amount"],
    senderId: json["sender_id"],
    receiverId: json["receiver_id"],
    type: json["type"],
    trxId: json["trx_id"],
    updatedAt: json["updated_at"] == null ? null : DateTime.parse(json["updated_at"]),
    createdAt: json["created_at"] == null ? null : DateTime.parse(json["created_at"]),
    id: json["id"],
  );

  Map<String, dynamic> toJson() => {
    "amount": amount,
    "sender_id": senderId,
    "receiver_id": receiverId,
    "type": type,
    "trx_id": trxId,
    "updated_at": updatedAt?.toIso8601String(),
    "created_at": createdAt?.toIso8601String(),
    "id": id,
  };
}
