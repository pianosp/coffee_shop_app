import 'dart:async';

import 'package:coffee_shop_app/src/models/login_response.dart';
import 'package:dio/dio.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';

import '../models/drinks_model.dart';
import '../models/sign_up_response.dart';

class ApiProvider {
  final Dio _dio = Dio();
  String baseUrl = 'http://10.0.2.2:5001';
  final storage = const FlutterSecureStorage();

  Future<List<DrinksModel>> getAllDrinks() async {
    try {
      Response response = await _dio.get('$baseUrl/drinks');
      List<dynamic> value = response.data;
      return value.map((e) => DrinksModel.fromJson(e)).toList();
    } catch (error) {
      throw Exception("Failed to fetch drinks");
    }
  }

  Future<SignUpResponse> signUp(
      String name, String email, String password) async {
    try {
      Response response = await _dio.post('$baseUrl/signup', data: {
        "name": name,
        "email": email,
        "password": password,
      });
      final signUpResponse = SignUpResponse.fromJson(response.data);
      switch (signUpResponse.status) {
        case "201":
          return signUpResponse;
        case "400":
          throw Exception('Missing required fields');
        case "401": //For Email already exists
          return signUpResponse;
        default:
          throw Exception("Error occurred while creating user");
      }
    } catch (error) {
      throw Exception("Error occurred while creating user (frontend)");
    }
  }

  Future<LoginResponse> login(String email, String password) async {
    try {
      Response response = await _dio.post('$baseUrl/login', data: {
        "email": email,
        "password": password,
      });
      final loginResponse = LoginResponse.fromJson(response.data);
      switch (loginResponse.status) {
        case "200":
          await storage.write(key: 'access_token', value: loginResponse.token);
          return loginResponse;
        case "400":
          throw Exception('Missing required fields');
        case "401": //For Email already exists
          return loginResponse;
        default:
          throw Exception("Error occurred while login");
      }
    } catch (e) {
      print(e.toString());
      throw Exception("Error occurred while logging in frontend");
    }
  }
}
