import 'package:flutter/material.dart';
import 'package:flutter_mvvm/resources/assets/image_assets.dart';
import 'package:flutter_mvvm/resources/components/general_exception.dart';
import 'package:flutter_mvvm/resources/components/internet_exceptions.dart';
import 'package:flutter_mvvm/resources/components/roun_button.dart';
import 'package:flutter_mvvm/view_models/services/splash_services.dart';
// import 'package:get/get_utils/src/extensions/internacionalization.dart';
import 'package:get/get_utils/get_utils.dart';
import 'package:get/get.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  SplashServices splashServices = Get.put(SplashServices());

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    splashServices.islogin();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.tealAccent,
      // appBar: AppBar(
      //   title: Text('hello'.tr),
      //   centerTitle: true,
      // ),
      // body: const Image(image: AssetImage(ImageAssets.splashScreen)),

      body: Center(
        child: Text(
          'welcome_back'.tr,
          textAlign: TextAlign.center,
          style: TextStyle(fontSize: 25),
        ),
      ),
    );
  }
}
