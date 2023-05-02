import 'package:boilerplate/constants/colors.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';

class AppUtils {
  static void showToast({required String msg}) {
    Fluttertoast.showToast(
      msg: "확인메일을 보냈습니다. 메일 함을 확인해주세요!",
      toastLength: Toast.LENGTH_LONG,
      gravity: ToastGravity.BOTTOM,
      timeInSecForIosWeb: 1,
      backgroundColor: AppColors.toastBackgroundColor,
      textColor: AppColors.toastTextColor,
      fontSize: 14.0,
    );
  }
}
