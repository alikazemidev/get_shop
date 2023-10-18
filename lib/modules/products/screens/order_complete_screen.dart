import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get_shop/constants/color.dart';
import 'package:get_shop/helpers/widgets/button_primary.dart';
import 'package:get_shop/modules/home/screens/home_screen.dart';
import 'package:get_shop/modules/products/controllers/cart_controller.dart';
import 'package:iconsax/iconsax.dart';

class OrderCompleteScreen extends StatelessWidget {
  final String type;
  final String id;
  const OrderCompleteScreen({
    super.key,
    required this.type,
    required this.id,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Container(
          width: double.infinity,
          margin: EdgeInsets.symmetric(horizontal: 20),
          padding: EdgeInsets.all(20),
          height: MediaQuery.of(context).size.height / 2,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(25),
            border: Border.all(
              color: MyColors.dividreColor,
            ),
            color: Colors.white,
            boxShadow: [
              BoxShadow(
                color: MyColors.primaryColor.withOpacity(.15),
                blurRadius: 4,
                offset: Offset(0, 2),
              ),
            ],
          ),
          child: Column(
            children: [
              Container(
                width: 60,
                height: 60,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(15),
                  border: Border.all(
                    color: Colors.green,
                  ),
                ),
                child: Icon(
                  type == 'success' ? Icons.check : Icons.error,
                  size: 35,
                  color: type == 'success' ? Colors.green : Colors.red,
                ),
              ),
              SizedBox(height: 20),
              Text(
                type == 'success'
                    ? 'پرداخت با موفقیت انجام شد'
                    : 'پرداخت موفق نبود',
                style: TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.bold,
                  color: type == 'success' ? Colors.green : Colors.red,
                ),
              ),
              SizedBox(height: 60),
              Text(
                'کد رهگیری',
                style: TextStyle(
                  fontSize: 16,
                  color: MyColors.darkGreyColor,
                ),
              ),
              SizedBox(height: 10),
              Text(
                id,
                style: TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.bold,
                ),
              ),
              Spacer(),
              ButtonPrimary(
                text: 'رفتن به سفارشات',
                onPressed: () {
                  // if (Get.isRegistered<CartController>())
                  //   Get.find<CartController>().getCart();
                  // Get.offAll(HomeScreen());
                  Get.to(HomeScreen());
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}
