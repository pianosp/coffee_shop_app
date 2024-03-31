// To parse this JSON data, do
//
//     final drinksModel = drinksModelFromJson(jsonString);

import 'dart:convert';

List<DrinksModel> drinksModelFromJson(String str) => List<DrinksModel>.from(
    json.decode(str).map((x) => DrinksModel.fromJson(x)));

String drinksModelToJson(List<DrinksModel> data) =>
    json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class DrinksModel {
  final int id;
  final String name;
  final String img;
  final int price;
  final String type;

  DrinksModel({
    required this.id,
    required this.name,
    required this.img,
    required this.price,
    required this.type,
  });

  factory DrinksModel.fromJson(Map<String, dynamic> json) => DrinksModel(
        id: json["id"],
        name: json["name"],
        img: json["img"],
        price: json["price"],
        type: json["type"],
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "name": name,
        "img": img,
        "price": price,
        "type": type,
      };
}
