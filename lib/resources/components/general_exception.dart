// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:async';

import 'package:flutter/material.dart';
import 'package:get/get_utils/get_utils.dart';

import '../colors/app_colors.dart';

class GeneralExceptionWidget extends StatefulWidget {
  final VoidCallback onPress;

  const GeneralExceptionWidget({
    Key? key,
    required this.onPress,
  }) : super(key: key);

  @override
  State<GeneralExceptionWidget> createState() =>
      _InternetExceptionWidgetState();
}

class _InternetExceptionWidgetState extends State<GeneralExceptionWidget> {
  // bool isloading = false;
  @override
  Widget build(BuildContext context) {
    final height = MediaQuery.of(context).size.height;

    var onPress;
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 20),
      child: Column(
        children: [
          SizedBox(
            height: height * 0.15,
          ),
          const Icon(
            Icons.cloud_off,
            size: 50,
            color: AppColor.redColor,
          ),
          Padding(
            padding: const EdgeInsets.only(top: 30.0),
            child: Text(
              'general_exception'.tr,
              textAlign: TextAlign.center,
              style: const TextStyle(color: AppColor.black, fontSize: 30),
            ),
          ),
          SizedBox(
            height: height * 0.15,
          ),
          InkWell(
            onTap: () {
              widget.onPress;
            },
            child: Container(
              height: 50,
              width: 100,
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(30),
                  color: AppColor.primaryColor),
              child: const Center(
                child: Text(
                  "Retry",
                  style: TextStyle(fontSize: 20, color: AppColor.whiteColor),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
