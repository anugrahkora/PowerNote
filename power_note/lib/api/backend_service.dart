import 'dart:convert';

import 'package:dio/dio.dart';
import 'package:power_note/models/user_model.dart';

class DBService {
  var dbUri = 'http://10.0.2.2:8080/auth';

  var _dio = Dio();

  Future addUserToDB(User user) async {
    try {
      Response response = await _dio.post(dbUri,
          data: json.encode(
            {
              'uid': user.uid,
              'name': user.name,
              'email': user.email,
              'password': user.password
            },
          ),
          options: Options(
            contentType: 'application/json; charset=utf-8',
          ));
      print(response.data);
    } on DioError catch (e) {
      print(e.message);
    }
  }
}
