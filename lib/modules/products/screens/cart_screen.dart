// ignore_for_file: must_call_super

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'package:get_shop/constants/color.dart';
import 'package:get_shop/helpers/widgets/button_primary.dart';
import 'package:iconsax/iconsax.dart';

class CartScreen extends StatefulWidget {
  const CartScreen({super.key});

  @override
  State<CartScreen> createState() => _CartScreenState();
}

class _CartScreenState extends State<CartScreen>
    with AutomaticKeepAliveClientMixin {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(20.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // title
          Text(
            'سبد خرید',
            style: TextStyle(
              fontSize: 18,
              fontWeight: FontWeight.bold,
            ),
          ),
          SizedBox(height: 20),
          // list of product in cart
          Expanded(
            child: ListView.builder(
              itemCount: 1,
              // controller.productsResponse!.productsData!.length,
              itemBuilder: (BuildContext context, int index) {
                // var bookmarkProduct =
                //     controller.productsResponse!.productsData![index];
                return Column(
                  children: [
                    Row(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Container(
                          padding: EdgeInsets.all(10),
                          width: 90,
                          height: 90,
                          decoration: BoxDecoration(
                            color: Colors.white,
                            borderRadius: BorderRadius.circular(20),
                            boxShadow: [
                              BoxShadow(
                                color: Color(0xff14489e).withOpacity(0.15),
                                blurRadius: 3,
                                offset: Offset(0, 1),
                              ),
                            ],
                          ),
                          child: Image.network(''),
                        ),
                        SizedBox(width: 10),
                        Expanded(
                          child: Container(
                            height: 95,
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.start,
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  'شیر',
                                  style: TextStyle(
                                    fontWeight: FontWeight.bold,
                                    fontSize: 14,
                                  ),
                                  // overflow: TextOverflow.ellipsis,
                                ),
                                Spacer(),
                                Visibility(
                                  visible: true,
                                  child: Text(
                                    '10,000',
                                    style: TextStyle(
                                      decoration: TextDecoration.lineThrough,
                                      color: MyColors.darkGreyColor,
                                    ),
                                  ),
                                ),
                                Row(
                                  children: [
                                    Text(
                                      '8,000',
                                      style: TextStyle(
                                        fontSize: 18,
                                      ),
                                    ),
                                    SizedBox(width: 5),
                                    Text(
                                      'تومان',
                                      style: TextStyle(
                                        fontSize: 12,
                                        color: MyColors.darkGreyColor,
                                      ),
                                    ),
                                  ],
                                ),
                              ],
                            ),
                          ),
                        ),
                        Container(
                          height: 90,
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.end,
                            children: [
                              GestureDetector(
                                // onTap: () => controller.deleteBookmark(
                                //   bookmarkProduct.id!,
                                // ),
                                child: Container(
                                  margin: EdgeInsets.only(right: 5),
                                  padding: EdgeInsets.all(3),
                                  decoration: BoxDecoration(
                                    boxShadow: [
                                      BoxShadow(
                                        color:
                                            Color(0xffea5e24).withOpacity(0.19),
                                        blurRadius: 4,
                                        offset: Offset(0, 1),
                                      ),
                                    ],
                                    borderRadius: BorderRadius.circular(8),
                                    color: Colors.white,
                                    border: Border.all(
                                      color: MyColors.dividreColor,
                                    ),
                                  ),
                                  child: Center(
                                    child: Icon(
                                      Iconsax.trash,
                                      color: MyColors.primaryColor,
                                    ),
                                  ),
                                ),
                              ),
                              Spacer(),
                              Container(
                                padding: EdgeInsets.symmetric(
                                    horizontal: 10, vertical: 2),
                                decoration: BoxDecoration(
                                  border: Border.all(
                                    color: MyColors.dividreColor,
                                  ),
                                  color: Colors.white,
                                  borderRadius: BorderRadius.circular(8),
                                  boxShadow: [
                                    BoxShadow(
                                      color:
                                          Color(0xffea5e24).withOpacity(0.19),
                                      blurRadius: 4,
                                      offset: Offset(0, 1),
                                    ),
                                  ],
                                ),
                                child: Row(
                                  children: [
                                    GestureDetector(
                                      onTap: () {},
                                      child: Icon(
                                        Iconsax.add,
                                        color: MyColors.primaryColor,
                                      ),
                                    ),
                                    SizedBox(width: 8),
                                    Text(
                                      '2',
                                      style: TextStyle(
                                        fontSize: 18,
                                        color: MyColors.primaryColor,
                                      ),
                                    ),
                                    SizedBox(width: 8),
                                    GestureDetector(
                                      onTap: () {},
                                      child: Icon(
                                        Iconsax.minus,
                                        color: MyColors.primaryColor,
                                      ),
                                    ),
                                  ],
                                ),
                              )
                            ],
                          ),
                        )
                      ],
                    ),
                    SizedBox(height: 10),
                    Divider(),
                    SizedBox(height: 10),
                  ],
                );
              },
            ),
          ),
          // price box 
          Column(
            children: [
              // price and discount perecent box
              Container(
                padding: EdgeInsets.all(20),
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.vertical(top: Radius.circular(20)),
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
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          'مبلغ :',
                          style: TextStyle(
                            fontSize: 16,
                          ),
                        ),
                        Row(
                          children: [
                            Text(
                              '110,000',
                              style: TextStyle(
                                fontSize: 18,
                              ),
                            ),
                            SizedBox(width: 5),
                            Text(
                              'تومان',
                              style: TextStyle(
                                fontSize: 12,
                                color: MyColors.darkGreyColor,
                              ),
                            ),
                          ],
                        ),
                      ],
                    ),
                    SizedBox(
                      height: 15,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          'مبلغ تخفیف :',
                          style: TextStyle(
                            fontSize: 16,
                            color: MyColors.darkGreyColor,
                          ),
                        ),
                        Row(
                          children: [
                            Text(
                              '10,000',
                              style: TextStyle(
                                fontSize: 16,
                                color: MyColors.darkGreyColor,
                              ),
                            ),
                            SizedBox(width: 5),
                            Text('تومان',
                                style: TextStyle(
                                    fontSize: 12,
                                    color: MyColors.darkGreyColor))
                          ],
                        ),
                      ],
                    ),
                  ],
                ),
              ),
              // total price box
              Container(
                padding: EdgeInsets.symmetric(horizontal: 20, vertical: 10),
                decoration: BoxDecoration(
                  color: MyColors.primaryColor,
                  borderRadius: BorderRadius.vertical(
                    bottom: Radius.circular(20),
                  ),
                  boxShadow: [
                    BoxShadow(
                      color: Color(0xff14489e).withOpacity(.15),
                      blurRadius: 3,
                      offset: Offset(0, 1),
                    ),
                  ],
                ),
                child: Row(
                  children: [
                    Text(
                      'مبلغ کل :',
                      style: TextStyle(fontSize: 16, color: Colors.white),
                    ),
                    Spacer(),
                    Text(
                      '100,000',
                      style: TextStyle(
                        fontSize: 16,
                        color: Colors.white,
                      ),
                    ),
                    SizedBox(width: 5),
                    Text(
                      'تومان',
                      style: TextStyle(
                        fontSize: 12,
                        color: Color(0xffd4d4d4),
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
          SizedBox(height: 10),
        //  order button
          ButtonPrimary(
            text: 'ثبت سفارش',
            onPressed: () {},
          ),
           SizedBox(height: 5),
        ],
      ),
    );
  }

  @override
  bool get wantKeepAlive => true;
}
