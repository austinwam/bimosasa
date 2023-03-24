import 'dart:convert';

import 'package:bimosasa/const.dart';
import 'package:dio/dio.dart';

class Authapi {
  final dio = Dio();
  Future<dynamic> login(phone, password) async {
    final response = await dio.post(
      '${Constants.server}/login',
      data: {'phone': phone, 'password': password},
    );
    resp(response);
  }

  Future<void> register(phone, password) async {
    final response = await dio.post(
      '/register',
      data: {'phone': phone, 'password': password},
    );
    resp(response);
  }

  Future<void> resetpass(phone) async {
    final response = await dio.post(
      '${Constants.server}/password',
      data: {'phone': phone},
    );
    resp(response);
  }

  Future<void> resp(response) async {
    if (response.statusCode == 200) {
      return json.decode(response.body);
    } else if (response.statusCode == 404) {
    } else {
      throw Exception('Failed to load data');
    }
  }
}
