import 'package:dio/dio.dart';
import 'package:flutter_login/blocs/register/register_event.dart';
import 'package:flutter_login/utils/contants.dart';

class RegisterService {
  Dio dio = Dio();

  Future<Map<String, dynamic>> register(RegisterButtonPressed event) async {
    try {
      Response response = await dio.post(
        baseUrl + "/signup",
        data: FormData.fromMap(
            {'nama': event.nama, 'nis': event.nis, 'password': event.password}),
      );
      return {
        'errorCode': 1,
        'errorMessage': 'berhasil',
        'data': response.data
      };
    } catch (e) {
      return {'errorCode': 0, 'errorMessage': e};
    }
  }
}
