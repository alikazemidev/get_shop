import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get_shop/constants/color.dart';
import 'package:get_shop/helpers/widgets/appbar_custom_widget.dart';
import 'package:get_shop/helpers/widgets/button_primary.dart';
import 'package:get_shop/modules/profile/screens/add_address_screen.dart';
import 'package:iconsax/iconsax.dart';

class AddressScreen extends StatelessWidget {
  const AddressScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: getAppbar(title: 'آدرس ها'),
      body: Column(
        children: [
          Expanded(
            child: ListView.builder(
              padding: EdgeInsets.all(20),
              itemCount: 5,
              itemBuilder: (context, index) {
                return Container(
                  margin: EdgeInsets.only(bottom: 15),
                  padding: EdgeInsets.all(15),
                  width: double.infinity,
                  decoration: BoxDecoration(
                    color: Colors.white,
                    border: Border.all(
                      color: MyColors.dividreColor,
                    ),
                    borderRadius: BorderRadius.circular(12),
                    boxShadow: [
                      BoxShadow(
                        color: Color(0xff14489e).withOpacity(.15),
                        blurRadius: 3,
                        offset: Offset(0, 1),
                      ),
                    ],
                  ),
                  child: Column(
                    children: [
                      Row(
                        children: [
                          Text(
                            'خانه',
                            style: TextStyle(
                              fontSize: 18,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          Spacer(),
                          GestureDetector(
                            onTap: () {},
                            child: Container(
                              padding: EdgeInsets.all(6),
                              decoration: BoxDecoration(
                                border: Border.all(
                                  color: MyColors.dividreColor,
                                ),
                                borderRadius: BorderRadius.circular(8),
                              ),
                              child: Icon(
                                Iconsax.edit,
                                color: MyColors.primaryColor,
                                size: 20,
                              ),
                            ),
                          ),
                          SizedBox(width: 10),
                          GestureDetector(
                            onTap: () {},
                            child: Container(
                              padding: EdgeInsets.all(6),
                              decoration: BoxDecoration(
                                border: Border.all(
                                  color: MyColors.dividreColor,
                                ),
                                borderRadius: BorderRadius.circular(8),
                              ),
                              child: Icon(
                                Iconsax.trash,
                                color: MyColors.primaryColor,
                                size: 20,
                              ),
                            ),
                          ),
                        ],
                      ),
                      SizedBox(height: 15),
                      Text(
                        'تهران نوبنیاد خیابان لنگری ساختمان امید پلاک ۲۰ طبقه اول واحد ۱',
                        style: TextStyle(
                          color: MyColors.darkGreyColor,
                        ),
                      ),
                      SizedBox(height: 10),
                      Row(
                        children: [
                          Text(
                            'کد پستی: ',
                            style: TextStyle(
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          Text('۱۲۳۴۵۶۷۸۹'),
                        ],
                      ),
                    ],
                  ),
                );
              },
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(20.0),
            child: ButtonPrimary(
              hasBorder: true,
              text: 'آفزودن آدرس',
              onPressed: () => Get.to(AddAddressScreen()),
            ),
          ),
        ],
      ),
    );
  }
}