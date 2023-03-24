import 'package:dio/dio.dart';

class Userapi {
  final dio = Dio();

  Future<dynamic> adduser(firstname, middlename, lastname) async {
    final response = await dio.post(
      '/user',
      data: {
        'firstname': firstname,
        'middlename': middlename,
        "lastname": lastname
      },
    );
    // resp(response);
  }

  Future<dynamic> getuser(phone) async {
    final response = await dio.post(
      '/login',
      data: {
        'phone': phone,
      },
    );
    // resp(response);
  }

  Future<dynamic> getusers(phone) async {
    final response = await dio.post(
      '/login',
      data: {
        'phone': phone,
      },
    );
    // resp(response);
  }
}
