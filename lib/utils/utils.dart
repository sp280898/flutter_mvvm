import 'package:flutter/material.dart';
import 'package:flutter_mvvm/resources/colors/app_colors.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:get/get.dart';

class Utils {
  static void fieldFocusChange(
      BuildContext context, FocusNode current, FocusNode nextFocus) {
    current.unfocus();
    FocusScope.of(context).nextFocus();
  }

  static taostMessage(String message) {
    Fluttertoast.showToast(
        msg: message,
        backgroundColor: AppColor.black,
        toastLength: Toast.LENGTH_LONG,
        textColor: AppColor.whiteColor,
        gravity: ToastGravity.CENTER);
  }

  static taostMessageCenter(String message) {
    Fluttertoast.showToast(
      msg: message,
      backgroundColor: AppColor.black,
      gravity: ToastGravity.BOTTOM,
      toastLength: Toast.LENGTH_LONG,
      textColor: AppColor.whiteColor,
    );
  }

  // email valid hai ki nhi bnao

  static SnackBar(String title, String message) {
    Get.snackbar(title, message, backgroundColor: AppColor.whiteColor);
  }
}
