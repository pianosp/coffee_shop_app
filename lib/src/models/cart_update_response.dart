// To parse this JSON data, do
//
//     final cartUpdateResponse = cartUpdateResponseFromJson(jsonString);

import 'dart:convert';

CartUpdateResponse cartUpdateResponseFromJson(String str) =>
    CartUpdateResponse.fromJson(json.decode(str));

String cartUpdateResponseToJson(CartUpdateResponse data) =>
    json.encode(data.toJson());

class CartUpdateResponse {
  final String? status;
  final String? message;

  CartUpdateResponse({
    this.status,
    this.message,
  });

  factory CartUpdateResponse.fromJson(Map<String, dynamic> json) =>
      CartUpdateResponse(
        status: json["status"],
        message: json["message"],
      );

  Map<String, dynamic> toJson() => {
        "status": status,
        "message": message,
      };
}
