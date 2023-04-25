import 'package:flutter/material.dart';
import 'package:flutter_mvvm/model/login/user_model.dart';
import 'package:flutter_mvvm/repository/login_repository/login_repository.dart';
import 'package:flutter_mvvm/routes/routes_name.dart';
import 'package:flutter_mvvm/view_models/controller/login/user_prefernce/user_preferences_view_model.dart';
import 'package:get/get.dart';

import '../../utils/utils.dart';

class LoginViewModel extends GetxController {
  //
  final _api = LoginRepository();

  //
  final emailController = TextEditingController().obs;
  final passwordController = TextEditingController().obs;

//
  final emailFocusNode = FocusNode().obs;
  final passwordFocusNode = FocusNode().obs;

  //
  UserPreference userPreference = UserPreference();
  //
  RxBool loading = false.obs;
  void loginApi() {
    loading.value = true;
    Map data = {
      'email': emailController.value.text,
      'password': passwordController.value.text
    };
    _api.loginApi(data).then((value) {
      loading.value = false;
      if (value['error'] == 'user not found') {
        Utils.SnackBar('Login', value['error']);
      } else {
        UserModel userModel = UserModel(token: value['token'], isLogin: true);
        // userPreference.saveUser(UserModel.fromJson(value)).then((value) {
        userPreference.saveUser(userModel).then((value) {
          Get.toNamed(RoutesName.homeView);
        }).onError((error, stackTrace) {});
        Utils.SnackBar('Login', 'Login Successfully');
      }
    }).onError((error, stackTrace) {
      print(error.toString());
      loading.value = false;
      Utils.SnackBar('Error', error.toString());
    });
  }
}
