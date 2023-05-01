import 'package:boilerplate/constants/colors.dart';
import 'package:flutter/material.dart';

class Styles {
  Styles._(); // this basically makes it so you can't instantiate this class

  static TextStyle body1TextStyle() => TextStyle(
        fontWeight: FontWeight.w700,
        fontSize: 16,
        color: AppColors.themeColor,
      );

  static TextStyle body2TextStyle() => TextStyle(
        fontWeight: FontWeight.w700,
        fontSize: 16,
        color: AppColors.themeColor,
      );
}
