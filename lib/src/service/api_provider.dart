import 'dart:convert';
import 'dart:io';
import 'package:dio/dio.dart';

import '../models/drinks_model.dart';

class ApiProvider {
  final Dio _dio = Dio();
  String baseUrl = 'http://10.0.2.2:5001';

  // Fetch All Drinks Data
  Future<List<DrinksModel>> getAllDrinks() async {
    try {
      Response response = await _dio.get('$baseUrl/drinks');
      List<dynamic> value = response.data;
      return value.map((e) => DrinksModel.fromJson(e)).toList();
    } catch (error) {
      print(error.toString());
      throw Exception("Failed to fetch drinks");
    }
  }
}
