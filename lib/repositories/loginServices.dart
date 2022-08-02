import 'package:dio/dio.dart';
import 'package:flutter_login/utils/contants.dart';

class LoginServices {
  Dio dio = Dio();

  Future<Map<String, dynamic>> login(String nis, String password) async {
    try {
      Response response = await dio
          .post(baseUrl + "/signin", data: {'nis': nis, 'password': password});
      print(response.data['value']);
      if (response.data['value'] == 0) {
        return {'errorCode': 0, 'errorMessage': 'Username/Password Salah'};
      } else {
        return {
          'errorCode': 1,
          'errorMessage': '',
          'nama': response.data['nama'],
          'id': response.data['id']
        };
      }
    } catch (e) {
      return {'errorCode': 0, 'errorMessage': 'Username/Password Salah'};
    }
  }
}
