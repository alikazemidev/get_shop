import 'package:flutter/material.dart';
import 'package:get_shop/constants/color.dart';
import 'package:iconsax/iconsax.dart';

class ProductsListWidget extends StatelessWidget {
  final String title;
  const ProductsListWidget({super.key, required this.title});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Row(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Text(
              title,
              style: TextStyle(
                fontSize: 16,
                fontWeight: FontWeight.bold,
              ),
            ),
            Spacer(),
            Directionality(
              textDirection: TextDirection.ltr,
              child: TextButton.icon(
                style: TextButton.styleFrom(
                  iconColor: MyColors.primaryColor,
                  textStyle: TextStyle(
                    color: MyColors.primaryColor,
                    fontWeight: FontWeight.bold,
                    fontSize: 14,
                  ),
                ),
                onPressed: () {},
                icon: Icon(
                  Iconsax.arrow_left,
                  size: 24,
                ),
                label: Text('مشاهده همه'),
              ),
            ),
          ],
        ),
        SizedBox(
          height: 200,
          // width: 118,
          child: ListView.builder(
            scrollDirection: Axis.horizontal,
            itemCount: 10,
            itemBuilder: (BuildContext context, int index) {
              return Padding(
                padding: const EdgeInsets.only(left: 15.0, top: 12),
                child: SizedBox(
                  width: 118,
                  child: Column(
                    children: [
                      Stack(
                        alignment: Alignment.topLeft,
                        children: [
                          Container(
                            padding: EdgeInsets.all(18),
                            // width: 118,
                            height: 130,
                            decoration: BoxDecoration(
                              color: Colors.white,
                              borderRadius: BorderRadius.circular(15),
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
                            child: Image.network(
                              'https://dl.hitaldev.com/ecommerce/category_images/400967.png',
                            ),
                          ),
                          Container(
                            margin: EdgeInsets.symmetric(
                                horizontal: 8, vertical: 5),
                            height: 15,
                            width: 25,
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(4),
                              color: Colors.red,
                            ),
                            child: Center(
                              child: Text(
                                '10%',
                                style: TextStyle(
                                  fontSize: 11,
                                  color: Colors.white,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                            ),
                          ),
                        ],
                      ),
                      SizedBox(height: 5),
                      Row(
                        children: [
                          Text(
                            '11,000',
                            style: TextStyle(
                              fontSize: 16,
                            ),
                          ),
                          SizedBox(width: 2),
                          Text(
                            'تومان',
                            style: TextStyle(
                              fontSize: 10,
                              color: MyColors.darkGreyColor,
                            ),
                          ),
                          Spacer(),
                          Text(
                            '12,000',
                            style: TextStyle(
                              decoration: TextDecoration.lineThrough,
                              fontSize: 12,
                              fontWeight: FontWeight.bold,
                              color: MyColors.darkGreyColor,
                            ),
                          ),
                        ],
                      ),
                      Text(
                        'شیر بطری کم چرب  ۱ لیتری',
                        overflow: TextOverflow.ellipsis,
                      )
                    ],
                  ),
                ),
              );
            },
          ),
        ),
      ],
    );
  }
}
