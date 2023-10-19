import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:get/get.dart';
import 'package:get_shop/constants/color.dart';
import 'package:get_shop/helpers/widgets/button_primary.dart';
import 'package:get_shop/modules/products/controllers/add_comment_controller.dart';
import 'package:iconsax/iconsax.dart';

class CommentBottomSheet extends StatelessWidget {
  final int productId;
  const CommentBottomSheet({super.key, required this.productId});

  @override
  Widget build(BuildContext context) {
    return GetBuilder<AddCommentController>(
        init: AddCommentController(id: productId),
        builder: (controller) {
          return Padding(
            padding: EdgeInsets.only(bottom: MediaQuery.of(context).viewInsets.bottom),
            child: Container(
              padding: EdgeInsets.all(30),
              child: Column(
                mainAxisSize: MainAxisSize.min,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'ارسال نظر',
                    style: TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  SizedBox(height: 15),
                  Center(
                    child: Directionality(
                      textDirection: TextDirection.ltr,
                      child: RatingBar.builder(
                        initialRating: controller.rate.toDouble(),
                        minRating: 1,
                        direction: Axis.horizontal,
                        allowHalfRating: false,
                        itemCount: 5,
                        itemPadding: EdgeInsets.symmetric(horizontal: 2.0),
                        itemSize: 50,
                        unratedColor: Color(0xffededed),
                        itemBuilder: (context, index) => Icon(
                          Iconsax.star1,
                          color: Color(0xfff4d42d),
                        ),
                        onRatingUpdate: (rating) => controller.onRating(rating),
                      ),
                    ),
                  ),
                  SizedBox(height: 25),
                  TextFormField(
                    controller: controller.commentInput,
                    maxLines: 5,
                    decoration: InputDecoration(
                      contentPadding:
                          EdgeInsets.symmetric(horizontal: 20, vertical: 20),
                      hintText: 'لطفا نظر خود را بنویسید.',
                      border: OutlineInputBorder(
                        borderSide: BorderSide(
                          width: 2,
                          color: MyColors.dividreColor,
                        ),
                        borderRadius: BorderRadius.circular(25),
                      ),
                    ),
                  ),
                  SizedBox(height: 25),
                  ButtonPrimary(
                    isLoading: controller.isLodaing,
                    text: 'ارسال نظر',
                    onPressed:() => controller.addComment(id: productId),
                  )
                ],
              ),
            ),
          );
        });
  }
}
