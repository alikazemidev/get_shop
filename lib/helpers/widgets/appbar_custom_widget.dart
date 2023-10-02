import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get_shop/constants/color.dart';
import 'package:iconsax/iconsax.dart';

PreferredSizeWidget getAppbar({String? title, Widget? widget}) {
  return AppBar(
    backgroundColor: Colors.white,
    elevation: 1,
    automaticallyImplyLeading: false,
    centerTitle: true,
    actions: [
      widget ?? Container(),
      Spacer(),
      Container(
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(8),
          border: Border.all(
            color: MyColors.dividreColor,
          ),
          boxShadow: [
            BoxShadow(
              color: Color(0xff14489e).withOpacity(.15),
              blurRadius: 3,
              offset: Offset(0, 1),
            ),
          ],
        ),
        margin: EdgeInsets.symmetric(horizontal: 15, vertical: 8),
        child: IconButton(
            onPressed: () {
              Get.back();
            },
            icon: Icon(
              Iconsax.arrow_left,
              color: Colors.black,
            )),
      ),
    ],
    title: Text(
      title ?? '',
      style: TextStyle(
        fontSize: 18,
        color: Colors.black,
        fontWeight: FontWeight.bold,
      ),
    ),
  );
}
