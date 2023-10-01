import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get_shop/constants/color.dart';
import 'package:get_shop/modules/home/controllers/home_controller.dart';
import 'package:get_shop/modules/products/screens/products_list_screen.dart';
import 'package:iconsax/iconsax.dart';

import '../../../backend/models/category.dart';

class CategoryListWidget extends StatelessWidget {
  const CategoryListWidget({super.key, required this.categories});
  final List<Category> categories;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Row(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Text(
              'دسته بندی ها',
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
                  Get.find<HomeController>().changePage(indexPage: 1);
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
          height: 150,
          child: ListView.builder(
            scrollDirection: Axis.horizontal,
            itemCount: categories.length,
            itemBuilder: (BuildContext context, int index) {
              return Padding(
                padding: const EdgeInsets.only(left: 15.0, top: 12),
                child: GestureDetector(
                  onTap: () => Get.to(
                    ProductsListScreen(
                      categoryId: categories[index].id,
                    ),
                  ),
                  child: Column(
                    children: [
                      Container(
                        padding: EdgeInsets.all(16),
                        width: 100,
                        height: 100,
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
                          categories[index].image ?? '',
                        ),
                      ),
                      SizedBox(height: 5),
                      Text(
                        categories[index].title ?? '',
                        style: TextStyle(),
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
