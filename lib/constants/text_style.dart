import 'package:boilerplate/constants/colors.dart';
import 'package:boilerplate/constants/font_family.dart';
import 'package:flutter/material.dart';

class Styles {
  Styles._(); // this basically makes it so you can't instantiate this class

  static TextStyle body1TextStyle() => TextStyle(
        fontFamily: FontFamily.pretenDard,
        fontWeight: FontWeight.w700,
        fontSize: 16,
      );

  static TextStyle body2TextStyle() => TextStyle(
        fontFamily: FontFamily.pretenDard,
        fontWeight: FontWeight.w700,
        fontSize: 14,
      );

  static TextStyle heading2TextStyle() => TextStyle(
        fontFamily: FontFamily.pretenDard,
        fontWeight: FontWeight.w700,
        fontSize: 20,
      );

  static TextStyle body2MediumTextStyle() => TextStyle(
        fontFamily: FontFamily.pretenDard,
        fontWeight: FontWeight.w500,
        color: AppColors.textHintColor,
        fontSize: 14,
      );

  static TextStyle body2SemiBoldTextStyle() => TextStyle(
        fontFamily: FontFamily.pretenDard,
        fontWeight: FontWeight.w600,
        color: AppColors.lightGrayColor,
        fontSize: 15,
      );

  static TextStyle subHeadSemiBoldTextStyle() => TextStyle(
        fontFamily: FontFamily.pretenDard,
        fontWeight: FontWeight.w600,
        color: AppColors.darkGrayColor,
        fontSize: 18,
      );

  static TextStyle cap2MediumTextStyle() => TextStyle(
        fontFamily: FontFamily.pretenDard,
        fontWeight: FontWeight.w500,
        color: AppColors.darkGrayColor,
        fontSize: 14,
      );

  static TextStyle cap2SemiBoldTextStyle() => TextStyle(
        fontFamily: FontFamily.pretenDard,
        fontWeight: FontWeight.w600,
        fontSize: 12,
      );
}
