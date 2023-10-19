import 'package:flutter/material.dart';
import 'package:get_shop/constants/color.dart';
import 'package:get_shop/helpers/widgets/appbar_custom_widget.dart';

class OrdersScreen extends StatelessWidget {
  const OrdersScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: getAppbar(title: 'سفارشات'),
      body: ListView.builder(
        padding: EdgeInsets.all(10),
        itemCount: 4,
        itemBuilder: (BuildContext context, int index) {
          return Container(
            width: double.infinity,
            margin: EdgeInsets.only(bottom: 12),
            padding: EdgeInsets.all(15),
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(15),
              border: Border.all(color: Color(0xffebebeb)),
              boxShadow: [
                BoxShadow(
                  color: Color(0xff787878).withOpacity(.09),
                  blurRadius: 14,
                  offset: Offset(0, 1),
                ),
              ],
            ),
            child: Column(
              children: [
                Row(
                  children: [
                    Text(
                      'ارسال سفارش به :‌',
                      style: TextStyle(
                        fontSize: 14,
                        color: MyColors.darkGreyColor,
                      ),
                    ),
                    Text(
                      '‌ خانه',
                      style: TextStyle(
                        fontSize: 14,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    Spacer(),
                    Text(
                      'شماره سفارش: ',
                      style: TextStyle(
                        fontSize: 13,
                      ),
                    ),
                    Text(
                      '12345678',
                      style: TextStyle(
                        fontSize: 13,
                      ),
                    ),
                  ],
                ),
                SizedBox(height: 15),
                SizedBox(
                  height: 50,
                  child: ListView.builder(
                    scrollDirection: Axis.horizontal,
                    itemCount: 8,
                    itemBuilder: (BuildContext context, int index) {
                      return Stack(
                        // alignment: Alignment.topLeft,
                        children: [
                          Container(
                            margin: EdgeInsets.symmetric(vertical: 5),
                            padding: EdgeInsets.symmetric(horizontal: 15),
                            decoration: BoxDecoration(
                              border: Border(
                                left: BorderSide(
                                  color: MyColors.dividreColor,
                                  width: 2,
                                ),
                              ),
                            ),
                            child: Center(
                              child: Image.network(
                                'https://dl.hitaldev.com/ecommerce/product_images/178504.jpg',
                                // height: 40,
                              ),
                            ),
                          ),
                          Visibility(
                            visible: index == 2,
                            child: Positioned(
                              left: 10,
                              top: 0,
                              child: Container(
                                width: 15,
                                height: 15,
                                decoration: BoxDecoration(
                                  color: MyColors.primaryColor.withOpacity(.2),
                                  borderRadius: BorderRadius.circular(100),
                                ),
                                child: Center(
                                  child: Text(
                                    '2',
                                    style: TextStyle(
                                      fontSize: 10,
                                      color: MyColors.primaryColor,
                                    ),
                                  ),
                                ),
                              ),
                            ),
                          ),
                        ],
                      );
                    },
                  ),
                ),
                SizedBox(height: 15),
                Row(
                  children: [
                    Text(
                      '‌30',
                      style: TextStyle(
                        fontSize: 14,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    SizedBox(width: 15),
                    Text(
                      '‌قلم کالا',
                      style: TextStyle(
                        fontSize: 14,
                        color: MyColors.darkGreyColor,
                      ),
                    ),
                    SizedBox(width: 10),
                    Text(
                      'قیمت سفارش: ',
                      style: TextStyle(
                        fontSize: 14,
                        color: MyColors.darkGreyColor,
                      ),
                    ),
                    Row(
                      children: [
                        Text(
                          '11,000 ',
                          style: TextStyle(
                            fontSize: 14,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        Text(
                          'تومان',
                          style: TextStyle(
                            fontSize: 12,
                            color: MyColors.darkGreyColor,
                          ),
                        ),
                      ],
                    ),
                    Spacer(),
                    Container(
                      padding: EdgeInsets.symmetric(horizontal: 10, vertical: 2),
                      decoration: BoxDecoration(
                        color: Colors.red,
                        borderRadius: BorderRadius.circular(8),
                      ),
                      child: Text(
                        'لغو شده',
                        style: TextStyle(
                          fontSize: 12,
                          color: Colors.white,
                        ),
                      ),
                    ),
                  ],
                )
              ],
            ),
          );
        },
      ),
    );
  }
}
