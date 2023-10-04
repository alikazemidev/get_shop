import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:get/get.dart';
import 'package:get_shop/constants/color.dart';
import 'package:get_shop/helpers/widgets/appbar_custom_widget.dart';
import 'package:get_shop/modules/products/controllers/comment_controller.dart';
import 'package:get_shop/modules/products/widgets/comment_bottom_sheet.dart';
import 'package:iconsax/iconsax.dart';

class CommentsScreen extends StatelessWidget {
  final int id;
  const CommentsScreen({super.key, required this.id});
  @override
  Widget build(BuildContext context) {
    return GetBuilder<CommentController>(
        init: CommentController(id: id),
        builder: (controller) {
          return Scaffold(
            floatingActionButton: FloatingActionButton(
              backgroundColor: MyColors.primaryColor,
              onPressed: () {
                showModalBottomSheet(
                  isScrollControlled: true,
                  shape: RoundedRectangleBorder(
                      borderRadius:
                          BorderRadius.vertical(top: Radius.circular(15))),
                  context: context,
                  builder: (context) => CommentBottomSheet(productId: id),
                );
              },
              child: Icon(
                Icons.add,
                size: 28,
              ),
            ),
            floatingActionButtonLocation:
                FloatingActionButtonLocation.startFloat,
            appBar: getAppbar(title: 'نظرات'),
            body: controller.reviewResponse == null
                ? Center(child: CircularProgressIndicator())
                : SizedBox(
                    height: MediaQuery.of(context).size.height,
                    child: controller.reviewResponse!.reviewData!.length == 0
                        ? Center(
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Icon(
                                  Iconsax.message_question,
                                  size: 100,
                                ),
                                SizedBox(
                                  height: 20,
                                ),
                                Text(
                                  'نظری برای این محصول ثبت نشده است',
                                  style: TextStyle(
                                    fontSize: 16,
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                              ],
                            ),
                          )
                        : ListView.builder(
                            padding: EdgeInsets.all(20),
                            itemCount:
                                controller.reviewResponse!.reviewData!.length,
                            itemBuilder: (BuildContext context, int index) {
                              var review =
                                  controller.reviewResponse!.reviewData![index];
                              return Container(
                                padding: EdgeInsets.all(20),
                                decoration: BoxDecoration(
                                  color: Colors.white,
                                  border: Border.all(
                                    color: MyColors.dividreColor,
                                  ),
                                  borderRadius: BorderRadius.circular(15),
                                ),
                                margin: EdgeInsets.only(bottom: 14),
                                width: double.infinity,
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    //  user name and rating
                                    Row(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.center,
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceBetween,
                                      children: [
                                        Text(
                                          review.user ?? '',
                                          style: TextStyle(
                                            fontSize: 14,
                                            color: MyColors.darkGreyColor,
                                          ),
                                        ),
                                        Directionality(
                                          textDirection: TextDirection.ltr,
                                          child: RatingBarIndicator(
                                            rating: review.rate!.toDouble(),
                                            unratedColor: Color(0xffededed),
                                            itemBuilder: (context, index) =>
                                                Icon(
                                              Iconsax.star1,
                                              color: Color(0xfff4d42d),
                                            ),
                                            itemCount: 5,
                                            itemSize: 24.0,
                                            direction: Axis.horizontal,
                                          ),
                                        ),
                                      ],
                                    ),
                                    SizedBox(height: 5),
                                    //  comment time
                                    Text(
                                      review.date ?? '',
                                      style: TextStyle(
                                        fontSize: 12,
                                        color: MyColors.darkGreyColor,
                                      ),
                                    ),
                                    SizedBox(height: 10),
                                    // comment text
                                    Text(
                                      review.comment ?? '',
                                      style: TextStyle(
                                        fontSize: 16,
                                      ),
                                    ),

                                    //  replay to comment
                                    Visibility(
                                      visible: review.reply != null,
                                      child: Column(
                                        children: [
                                          SizedBox(height: 20),
                                          Divider(),
                                          Row(
                                            children: [
                                              Text(
                                                'پاسخ : ',
                                                style: TextStyle(
                                                  color: MyColors.darkGreyColor,
                                                ),
                                              ),
                                              Text(
                                                review.reply ?? '',
                                              ),
                                            ],
                                          ),
                                        ],
                                      ),
                                    )
                                  ],
                                ),
                              );
                            },
                          ),
                  ),
          );
        });
  }
}
