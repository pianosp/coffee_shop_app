import 'dart:convert';

CartAddedResponse cartAddedResponseFromJson(String str) =>
    CartAddedResponse.fromJson(json.decode(str));

String cartAddedResponseToJson(CartAddedResponse data) =>
    json.encode(data.toJson());

class CartAddedResponse {
  final String? status;
  final String? message;

  CartAddedResponse({
    this.status,
    this.message,
  });

  factory CartAddedResponse.fromJson(Map<String, dynamic> json) =>
      CartAddedResponse(
        status: json["status"],
        message: json["message"],
      );

  Map<String, dynamic> toJson() => {
        "status": status,
        "message": message,
      };
}
