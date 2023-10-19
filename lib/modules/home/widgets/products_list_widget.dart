import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get_shop/backend/models/product.dart';
import 'package:get_shop/constants/color.dart';
import 'package:get_shop/modules/products/controllers/products_list_controller.dart';
import 'package:get_shop/modules/products/screens/products_details_screen.dart';
import 'package:get_shop/modules/products/screens/products_list_screen.dart';
import 'package:iconsax/iconsax.dart';

class ProductsListWidget extends StatelessWidget {
  final String title;
  final List<Product> products;
  final Sort? sort;
  const ProductsListWidget({
    super.key,
    required this.title,
    required this.products,
    this.sort,
  });

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
                onPressed: () {
                  Get.to(
                    ProductsListScreen(sort: sort),
                  );
                },
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
          height: 210,
          // width: 118,
          child: ListView.builder(
            scrollDirection: Axis.horizontal,
            itemCount: products.length,
            itemBuilder: (BuildContext context, int index) {
              return GestureDetector(
                onTap: () => Get.to(ProductsDetailsScreen(
                  id: products[index].id!,
                )),
                child: Padding(
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
                              width: 118,
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
                                products[index].image ?? '',
                              ),
                            ),
                            products[index].discountPercent != 0
                                ? Container(
                                    // padding: EdgeInsets.symmetric(vertical: 2),
                                    margin: EdgeInsets.symmetric(
                                      horizontal: 8,
                                      vertical: 5,
                                    ),
                                    height: 18,
                                    width: 30,
                                    decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(4),
                                      color: Colors.red,
                                    ),
                                    child: Center(
                                      child: Text(
                                        '${products[index].discountPercent.toString()}%',
                                        style: TextStyle(
                                          fontSize: 10,
                                          color: Colors.white,
                                          fontWeight: FontWeight.bold,
                                        ),
                                      ),
                                    ),
                                  )
                                : SizedBox(),
                          ],
                        ),
                        SizedBox(height: 5),
                        Row(
                          children: [
                            Text(
                              products[index].price.toString(),
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
                            Visibility(
                              visible: products[index].discountPercent != 0,
                              child: Text(
                                products[index].realPrice.toString(),
                                style: TextStyle(
                                  decoration: TextDecoration.lineThrough,
                                  fontSize: 12,
                                  fontWeight: FontWeight.bold,
                                  color: MyColors.darkGreyColor,
                                ),
                              ),
                            ),
                          ],
                        ),
                        Text(
                          products[index].title ?? '',
                          overflow: TextOverflow.ellipsis,
                        )
                      ],
                    ),
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
