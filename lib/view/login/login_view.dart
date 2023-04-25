import 'package:flutter/material.dart';
import 'package:flutter_mvvm/resources/components/roun_button.dart';
import 'package:flutter_mvvm/utils/utils.dart';
import 'package:flutter_mvvm/view_models/controller/login_view_model.dart';
import 'package:get/get.dart';
// import 'package:get/get_utils/src/extensions/internacionalization.dart';
import 'package:get/get_utils/get_utils.dart';

class LoginView extends StatelessWidget {
  LoginView({super.key});

  LoginViewModel loginViewModel = Get.put(LoginViewModel());
  final _formkey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        title: const Text('Login'),
        centerTitle: true,
      ),
      backgroundColor: Colors.deepOrangeAccent,
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Form(
            key: _formkey,
            child: Column(
              children: [
                Padding(
                  padding: const EdgeInsets.only(left: 25, right: 25),
                  child: TextFormField(
                    validator: (value) {
                      if (value!.isEmpty) {
                        Utils.SnackBar('email'.tr, "Email can't be empty");
                      }
                    },
                    onFieldSubmitted: (value) {
                      Utils.fieldFocusChange(
                          context,
                          loginViewModel.emailFocusNode.value,
                          loginViewModel.passwordFocusNode.value);
                    },
                    controller: loginViewModel.emailController.value,
                    focusNode: loginViewModel.emailFocusNode.value,
                    decoration: InputDecoration(
                        hintText: 'login'.tr,
                        label: const Text('Email Id'),
                        border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(20))),
                  ),
                ),
                const SizedBox(
                  height: 20,
                ),
                Padding(
                  padding: const EdgeInsets.only(left: 25, right: 25),
                  child: TextFormField(
                    obscureText: true,
                    controller: loginViewModel.passwordController.value,
                    focusNode: loginViewModel.passwordFocusNode.value,
                    validator: (value) {
                      if (value!.isEmpty) {
                        Utils.SnackBar('Password', 'Enter valid password');
                      }
                    },
                    decoration: InputDecoration(
                        hintText: 'password'.tr,
                        label: const Text('Password'),
                        border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(20))),
                  ),
                ),
              ],
            ),
          ),
          const SizedBox(
            height: 20,
          ),
          Obx(() => RoundButton(
                loading: loginViewModel.loading.value,
                title: 'Login',
                onPress: () {
                  if (_formkey.currentState!.validate()) {
                    loginViewModel.loginApi();
                  }
                },
                height: 50,
                width: 100,
              )),
          const SizedBox(
            height: 20,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text('sign_up'.tr),
              TextButton(onPressed: () {}, child: Text('Signup Here'))
            ],
          ),
        ],
      ),
    );
  }
}
