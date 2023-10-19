// ignore_for_file: must_call_super

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get_shop/constants/color.dart';
import 'package:get_shop/modules/products/screens/products_details_screen.dart';
import 'package:get_shop/modules/profile/controllers/bookmarks_controller.dart';

class BookMarksScreen extends StatefulWidget {
  const BookMarksScreen({super.key});

  @override
  State<BookMarksScreen> createState() => _BookMarksScreenState();
}

class _BookMarksScreenState extends State<BookMarksScreen>
    with AutomaticKeepAliveClientMixin {
  @override
  Widget build(BuildContext context) {
    return GetBuilder<BookmarksController>(
        init: BookmarksController(),
        builder: (controller) {
          return Padding(
            padding: const EdgeInsets.all(20.0),
            child: controller.productsResponse == null
                ? Center(child: CircularProgressIndicator())
                : Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        'علاقه مندی ها',
                        style: TextStyle(
                          fontSize: 18,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      SizedBox(height: 20),
                      Expanded(
                        child: ListView.builder(
                          itemCount:
                              controller.productsResponse!.productsData!.length,
                          itemBuilder: (BuildContext context, int index) {
                            var bookmarkProduct = controller
                                .productsResponse!.productsData![index];
                            return GestureDetector(
                              onTap: () => Get.to(
                                ProductsDetailsScreen(
                                  id: bookmarkProduct.id!,
                                ),
                              ),
                              child: Column(
                                children: [
                                  Row(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      Container(
                                        padding: EdgeInsets.all(10),
                                        width: 90,
                                        height: 90,
                                        decoration: BoxDecoration(
                                          color: Colors.white,
                                          borderRadius:
                                              BorderRadius.circular(20),
                                          boxShadow: [
                                            BoxShadow(
                                              color: Color(0xff14489e)
                                                  .withOpacity(0.15),
                                              blurRadius: 3,
                                              offset: Offset(0, 1),
                                            ),
                                          ],
                                        ),
                                        child: Image.network(
                                            bookmarkProduct.image ?? ''),
                                      ),
                                      SizedBox(width: 10),
                                      Expanded(
                                        child: Container(
                                          height: 95,
                                          child: Column(
                                            mainAxisAlignment:
                                                MainAxisAlignment.start,
                                            crossAxisAlignment:
                                                CrossAxisAlignment.start,
                                            children: [
                                              Text(
                                                bookmarkProduct.title ?? '',
                                                style: TextStyle(
                                                  fontWeight: FontWeight.bold,
                                                  fontSize: 14,
                                                ),
                                                // overflow: TextOverflow.ellipsis,
                                              ),
                                              Spacer(),
                                              Visibility(
                                                visible: bookmarkProduct
                                                        .discountPercent !=
                                                    0,
                                                child: Text(
                                                  bookmarkProduct.realPrice
                                                      .toString(),
                                                  style: TextStyle(
                                                    decoration: TextDecoration
                                                        .lineThrough,
                                                    color:
                                                        MyColors.darkGreyColor,
                                                  ),
                                                ),
                                              ),
                                              Row(
                                                children: [
                                                  Text(
                                                    bookmarkProduct.price
                                                        .toString(),
                                                    style: TextStyle(
                                                      fontSize: 18,
                                                    ),
                                                  ),
                                                  SizedBox(width: 5),
                                                  Text(
                                                    'تومان',
                                                    style: TextStyle(
                                                      fontSize: 12,
                                                      color: MyColors
                                                          .darkGreyColor,
                                                    ),
                                                  ),
                                                ],
                                              ),
                                            ],
                                          ),
                                        ),
                                      ),
                                      GestureDetector(
                                        onTap: () => controller.deleteBookmark(
                                          bookmarkProduct.id!,
                                        ),
                                        child: Container(
                                          margin: EdgeInsets.only(right: 5),
                                          padding: EdgeInsets.all(3),
                                          decoration: BoxDecoration(
                                              boxShadow: [
                                                BoxShadow(
                                                  color: Color(0xffea5e24)
                                                      .withOpacity(0.19),
                                                  blurRadius: 4,
                                                  offset: Offset(0, 1),
                                                ),
                                              ],
                                              borderRadius:
                                                  BorderRadius.circular(8),
                                              color: Colors.white,
                                              border: Border.all(
                                                color: MyColors.dividreColor,
                                              )),
                                          child: Center(
                                            child: Icon(
                                              CupertinoIcons.heart_fill,
                                              color: MyColors.darkRedColor,
                                            ),
                                          ),
                                        ),
                                      )
                                    ],
                                  ),
                                  SizedBox(height: 10),
                                  Divider(),
                                  SizedBox(height: 10),
                                ],
                              ),
                            );
                          },
                        ),
                      ),
                    ],
                  ),
          );
        });
  }

  @override
  bool get wantKeepAlive => true;
}
