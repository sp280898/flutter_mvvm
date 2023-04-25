//
import 'dart:async';

import 'package:flutter_mvvm/routes/routes_name.dart';
import 'package:flutter_mvvm/view_models/controller/login/user_prefernce/user_preferences_view_model.dart';
import 'package:get/get.dart';

import '../../view/login/login_view.dart';

class SplashServices {
  UserPreference userPreference = UserPreference();

  void islogin() {
    //
    userPreference.getUser().then((value) {
      //
      print(value.token);
      print(value.isLogin);
      //
      // if (value.token!.isEmpty || value.token.toString() == 'null') {
      if (value.isLogin == false || value.isLogin.toString() == 'null') {
        //
        Timer(const Duration(seconds: 3),
            () => Get.toNamed(RoutesName.loginView));
      } else {
        Timer(
            const Duration(seconds: 3), () => Get.toNamed(RoutesName.homeView));
      }
    });
  }
}
