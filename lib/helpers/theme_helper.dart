import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get_shop/constants/color.dart';

class ThemeHelper extends GetxController {
  ThemeData defultTheme = ThemeData(
    fontFamily: "samim",
    scaffoldBackgroundColor: MyColors.scaffoldBgColor,
    primaryColor: MyColors.primaryColor,
    primaryColorLight: MyColors.primarylightColor,
    dividerColor: MyColors.dividreColor,
    hintColor: MyColors.hintColor,
    textTheme:const TextTheme(
      bodyMedium: TextStyle(
        color: MyColors.textColor,
      ),
    ),
  );
}
