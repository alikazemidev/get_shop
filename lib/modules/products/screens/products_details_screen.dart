import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get_shop/constants/color.dart';
import 'package:get_shop/helpers/widgets/appbar_custom_widget.dart';
import 'package:get_shop/helpers/widgets/button_primary.dart';
import 'package:get_shop/modules/products/widgets/product_slider_image.dart';
import 'package:iconsax/iconsax.dart';

class ProductsDetailsScreen extends StatelessWidget {
  const ProductsDetailsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: getAppbar(
        widget: Container(
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
            onPressed: () {},
            icon: Icon(
              Iconsax.heart,
              color: Colors.black,
            ),
          ),
        ),
      ),
      body: Column(
        children: [
          Expanded(
            child: SingleChildScrollView(
              child: Column(
                children: [
                  SizedBox(height: 5),
                  //  slider image
                  ProdutctSliderImage(
                    imageUrls: [
                      "https://dl.hitaldev.com/ecommerce/product_images/412286.jpg",
                      "https://dl.hitaldev.com/ecommerce/product_images/321174.jpg"
                    ],
                  ),
                  // product category and off price \
                  Padding(
                    padding: const EdgeInsets.symmetric(
                        horizontal: 20.0, vertical: 10),
                    child: Row(
                      children: [
                        Text(
                          'دسته بندی : لبنیات',
                          style: TextStyle(
                            color: MyColors.primaryColor,
                          ),
                        ),
                        Spacer(),
                        Text(
                          '۱۲,000',
                          style: TextStyle(
                            color: MyColors.darkGreyColor,
                            decoration: TextDecoration.lineThrough,
                          ),
                        ),
                        SizedBox(
                          width: 5,
                        ),
                        Container(
                          padding: EdgeInsets.symmetric(horizontal: 4),
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(4),
                            color: MyColors.darkRedColor,
                          ),
                          child: Text(
                            '30%',
                            style: TextStyle(
                              color: Colors.white,
                              fontSize: 12,
                            ),
                          ),
                        )
                      ],
                    ),
                  ),
                  // product title and price
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 20.0),
                    child: Row(
                      children: [
                        Text(
                          'بیسکوئیت کیت کت',
                          style: TextStyle(
                            fontSize: 18,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        Spacer(),
                        Text(
                          '۱۲,000',
                          style: TextStyle(
                            fontSize: 16,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        SizedBox(
                          width: 5,
                        ),
                        Text(
                          'تومان',
                          style: TextStyle(
                            fontSize: 14,
                          ),
                        ),
                      ],
                    ),
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  // product description
                  Padding(
                    padding: const EdgeInsets.symmetric(
                        horizontal: 20.0, vertical: 20),
                    child: Text(
                      'لورم ایپسوم متن ساختگی با تولید سادگی نامفهوم از صنعت چاپ',
                      textAlign: TextAlign.start,
                      style: TextStyle(
                        color: MyColors.darkGreyColor,
                      ),
                    ),
                  ),
                  // commetn button
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 20),
                    child: MaterialButton(
                      elevation: 0,
                      height: 55,
                      color: Colors.white,
                      minWidth: double.infinity,
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(12),
                          side: BorderSide(
                            color: MyColors.dividreColor,
                            width: 1,
                          )),
                      onPressed: () {},
                      child: Row(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          Icon(
                            Iconsax.message_text_1,
                            size: 24,
                            color: MyColors.darkGreyColor,
                          ),
                          SizedBox(width: 10),
                          Text('نظرات'),
                          Spacer(),
                          Text(
                            '76 نظر',
                            style: TextStyle(
                              color: MyColors.darkGreyColor,
                            ),
                          ),
                          SizedBox(width: 10),
                          Icon(
                            CupertinoIcons.chevron_back,
                            size: 20,
                            color: MyColors.darkGreyColor,
                          ),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
          Container(
            decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.vertical(top: Radius.circular(25)),
                boxShadow: [
                  BoxShadow(
                    color: Colors.black.withOpacity(.09),
                    blurRadius: 6,
                    offset: Offset(0, -3),
                  ),
                ]),
            padding: EdgeInsets.symmetric(horizontal: 20, vertical: 15),
            child: ButtonPrimary(
              text: 'افزودن به سبد خرید',
              onPressed: () {},
            ),
          )
        ],
      ),
    );
  }
}
