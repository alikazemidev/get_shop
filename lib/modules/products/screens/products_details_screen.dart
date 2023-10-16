import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get_shop/constants/color.dart';
import 'package:get_shop/helpers/widgets/appbar_custom_widget.dart';
import 'package:get_shop/helpers/widgets/button_primary.dart';
import 'package:get_shop/modules/products/controllers/product_details_controller.dart';
import 'package:get_shop/modules/products/screens/comments_screen.dart';
import 'package:get_shop/modules/products/widgets/product_slider_image.dart';
import 'package:iconsax/iconsax.dart';

class ProductsDetailsScreen extends StatelessWidget {
  final int id;
  const ProductsDetailsScreen({super.key, required this.id});

  @override
  Widget build(BuildContext context) {
    return GetBuilder<ProductDetailsController>(
        init: ProductDetailsController(id: id),
        builder: (controller) {
          return Scaffold(
            body: controller.product == null
                ? Center(child: CircularProgressIndicator())
                : Column(
                    children: [
                      getAppbar(
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
                          margin:
                              EdgeInsets.symmetric(horizontal: 15, vertical: 8),
                          child: IconButton(
                            onPressed: () {
                              controller.bookmark();
                            },
                            icon: controller.product!.bookmarked!
                                ? Icon(
                                    CupertinoIcons.heart_fill,
                                    color: MyColors.darkRedColor,
                                  )
                                : Icon(
                                    CupertinoIcons.heart,
                                    color: Colors.black,
                                  ),
                          ),
                        ),
                      ),
                      Expanded(
                        child: controller.product == null
                            ? Center(child: CircularProgressIndicator())
                            : SingleChildScrollView(
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    SizedBox(height: 5),
                                    //  slider image
                                    ProdutctSliderImage(
                                      imageUrls:
                                          controller.product!.gallery ?? [],
                                    ),
                                    // product category and off price \
                                    Padding(
                                      padding: const EdgeInsets.symmetric(
                                          horizontal: 20.0, vertical: 10),
                                      child: Row(
                                        children: [
                                          Text(
                                            'دسته بندی : ${controller.product!.category ?? ''}',
                                            style: TextStyle(
                                              color: MyColors.primaryColor,
                                            ),
                                          ),
                                          Spacer(),
                                          Visibility(
                                            visible: controller
                                                    .product!.discountPercent !=
                                                0,
                                            child: Row(
                                              children: [
                                                Text(
                                                  controller
                                                          .product!.realPrice ??
                                                      '',
                                                  style: TextStyle(
                                                    color:
                                                        MyColors.darkGreyColor,
                                                    decoration: TextDecoration
                                                        .lineThrough,
                                                  ),
                                                ),
                                                SizedBox(
                                                  width: 5,
                                                ),
                                                Container(
                                                  padding: EdgeInsets.symmetric(
                                                      horizontal: 4),
                                                  decoration: BoxDecoration(
                                                    borderRadius:
                                                        BorderRadius.circular(
                                                            4),
                                                    color:
                                                        MyColors.darkRedColor,
                                                  ),
                                                  child: Text(
                                                    controller.product!
                                                            .discountPercent
                                                            .toString() +
                                                        "%",
                                                    style: TextStyle(
                                                      color: Colors.white,
                                                      fontSize: 12,
                                                    ),
                                                  ),
                                                ),
                                              ],
                                            ),
                                          )
                                        ],
                                      ),
                                    ),
                                    // product title and price
                                    Padding(
                                      padding: const EdgeInsets.symmetric(
                                          horizontal: 20.0),
                                      child: Row(
                                        children: [
                                          Text(
                                            controller.product!.title ?? '',
                                            overflow: TextOverflow.ellipsis,
                                            style: TextStyle(
                                              fontSize: 14,
                                              fontWeight: FontWeight.bold,
                                            ),
                                          ),
                                          Spacer(),
                                          Text(
                                            controller.product!.price ?? '',
                                            style: TextStyle(
                                              fontSize: 14,
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
                                        controller.product!.desc ?? '',
                                        textAlign: TextAlign.start,
                                        style: TextStyle(
                                          color: MyColors.darkGreyColor,
                                        ),
                                      ),
                                    ),
                                    // commetn button
                                    Padding(
                                      padding: const EdgeInsets.symmetric(
                                          horizontal: 20),
                                      child: MaterialButton(
                                        elevation: 0,
                                        height: 55,
                                        color: Colors.white,
                                        minWidth: double.infinity,
                                        shape: RoundedRectangleBorder(
                                            borderRadius:
                                                BorderRadius.circular(12),
                                            side: BorderSide(
                                              color: MyColors.dividreColor,
                                              width: 1,
                                            )),
                                        onPressed: () {
                                          Get.to(CommentsScreen(
                                            id: controller.product!.id!,
                                          ));
                                        },
                                        child: Row(
                                          crossAxisAlignment:
                                              CrossAxisAlignment.center,
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
                                              controller.product!.reviewsCount
                                                      .toString() +
                                                  " نظر",
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
                                    SizedBox(height: 40),
                                  ],
                                ),
                              ),
                      ),
                      Container(
                        decoration: BoxDecoration(
                            color: Colors.white,
                            borderRadius:
                                BorderRadius.vertical(top: Radius.circular(25)),
                            boxShadow: [
                              BoxShadow(
                                color: Colors.black.withOpacity(.09),
                                blurRadius: 6,
                                offset: Offset(0, -3),
                              ),
                            ]),
                        padding:
                            EdgeInsets.symmetric(horizontal: 20, vertical: 15),
                        child: ButtonPrimary(
                          text: 'افزودن به سبد خرید',
                          onPressed: () {},
                        ),
                      )
                    ],
                  ),
          );
        });
  }
}
