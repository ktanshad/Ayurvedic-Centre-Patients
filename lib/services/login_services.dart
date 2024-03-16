import 'dart:developer';

import 'package:dio/dio.dart';
import 'package:shared_preferences/shared_preferences.dart';

class LoginServices {
  final Dio dio=Dio();
  Future<void> getToken(String userName,String password ) async {
    try {
      String apiUrl = 'https://flutter-amr.noviindus.in/api/Login';
        FormData formData = FormData.fromMap({
      'username': userName,
      'password': password,
    });
      Response response = await dio.post(apiUrl, data:formData);
      if (response.statusCode == 200) {
        String token = response.data['token'];
        log(token);
        saveToSharedPreferences(token);
        print('Response: ${response.data}');
      }else {
        print('response: ${response.statusCode}, ${response.statusMessage}');
      }
    } catch (e) {
      print('response: $e');
    }
  }
     Future<void> saveToSharedPreferences(String token) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    await prefs.setString('accessToken', token);
  }
}

