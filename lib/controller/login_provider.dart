import 'dart:math';

import 'package:ayurvedic_centre_patients/services/login_services.dart';
import 'package:flutter/material.dart';

class LoginProvider extends ChangeNotifier{
TextEditingController usernameController=TextEditingController();
TextEditingController passwordController=TextEditingController();

  //-------------post Login------------------
  
  LoginServices loginServices =
   LoginServices();
 Future<void>loginAndGetToken() async {
      await loginServices.getToken(usernameController.text,passwordController.text);
      notifyListeners();
  }
}