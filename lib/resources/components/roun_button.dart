// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';

import '../colors/app_colors.dart';

class RoundButton extends StatelessWidget {
  const RoundButton({
    Key? key,
    this.loading = false,
    required this.title,
    this.width = 60,
    required this.onPress,
    this.buttonColor = AppColor.primaryButtonColor,
    this.height = 50,
    this.textColor = AppColor.primaryTextColor,
  }) : super(key: key);

  final bool loading;
  final String title;
  final double height, width;
  final VoidCallback onPress;
  final Color textColor, buttonColor;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onPress,
      child: Container(
          height: height,
          width: width,
          decoration: BoxDecoration(
            color: AppColor.commonColor,
            borderRadius: BorderRadius.circular(50),
          ),
          child: loading
              ? Center(child: CircularProgressIndicator())
              : Center(
                  child: Text(title),
                )),
    );
  }
}
