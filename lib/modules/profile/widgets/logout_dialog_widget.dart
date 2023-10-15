import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get_shop/constants/color.dart';

import 'package:get_shop/modules/auth/screens/start_screen.dart';
import 'package:shared_preferences/shared_preferences.dart';

class LogoutDialogWidget extends StatelessWidget {
  const LogoutDialogWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Dialog(
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(25),
      ),
      child: Padding(
        padding: EdgeInsets.all(25),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'خروج از حساب',
              style: TextStyle(
                color: MyColors.primaryColor,
                fontWeight: FontWeight.bold,
                fontSize: 20,
              ),
            ),
            SizedBox(height: 10),
            Text(
              'آیا از خروج از حساب مطمئن هستید؟',
              style: TextStyle(
                fontSize: 16,
              ),
            ),
            SizedBox(height: 30),
            Row(
              children: [
                Expanded(
                  flex: 2,
                  child: GestureDetector(
                    onTap: () => Get.back(),
                    child: Container(
                      height: 50,
                      decoration: BoxDecoration(
                        border: Border.all(
                          color: MyColors.primaryColor,
                          width: 2,
                        ),
                        borderRadius: BorderRadius.circular(15),
                      ),
                      child: Center(
                        child: Text(
                          'خیر',
                          style: TextStyle(
                            fontSize: 18,
                            color: MyColors.primaryColor,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ),
                    ),
                  ),
                ),
                SizedBox(width: 10),
                Expanded(
                  flex: 1,
                  child: GestureDetector(
                    onTap: () {
                      SharedPreferences.getInstance().then((value) {
                        value.remove('token');
                        Get.offAll(StartScreen());
                      });
                    },
                    child: Container(
                      height: 50,
                      decoration: BoxDecoration(
                        color: MyColors.primaryColor,
                        borderRadius: BorderRadius.circular(15),
                      ),
                      child: Center(
                        child: Text(
                          'بله',
                          style: TextStyle(
                            fontSize: 18,
                            color: Colors.white,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ),
                    ),
                  ),
                ),
              ],
            )
          ],
        ),
      ),
    );
  }
}
