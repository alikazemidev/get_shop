import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:get_shop/constants/color.dart';
import 'package:get_shop/helpers/widgets/appbar_custom_widget.dart';
import 'package:get_shop/modules/products/widgets/comment_bottom_sheet.dart';
import 'package:iconsax/iconsax.dart';

class CommentsScreen extends StatelessWidget {
  const CommentsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton: FloatingActionButton(
        backgroundColor: MyColors.primaryColor,
        onPressed: () {
          showModalBottomSheet(
            isScrollControlled: true,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.vertical(top: Radius.circular(15))
            ),
            context: context,
            builder: (context) => CommentBottomSheet(),
          );
        },
        child: Icon(
          Icons.add,
          size: 28,
        ),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.startFloat,
      appBar: getAppbar(title: 'نظرات'),
      body: SizedBox(
        height: MediaQuery.of(context).size.height,
        child: ListView.builder(
          padding: EdgeInsets.all(20),
          itemCount: 10,
          itemBuilder: (BuildContext context, int index) {
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
                    crossAxisAlignment: CrossAxisAlignment.center,
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        'کاربر شماره ۱',
                        style: TextStyle(
                          fontSize: 14,
                          color: MyColors.darkGreyColor,
                        ),
                      ),
                      Directionality(
                        textDirection: TextDirection.ltr,
                        child: RatingBarIndicator(
                          rating: 2,
                          unratedColor: Color(0xffededed),
                          itemBuilder: (context, index) => Icon(
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
                    '2 ماه پیش',
                    style: TextStyle(
                      fontSize: 12,
                      color: MyColors.darkGreyColor,
                    ),
                  ),
                  SizedBox(height: 10),
                  // comment text
                  Text(
                    'خیلی عالی بود',
                    style: TextStyle(
                      fontSize: 16,
                    ),
                  ),
                  SizedBox(height: 20),
                  //  replay to comment
                  Visibility(
                    visible: true,
                    child: Column(
                      children: [
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
                              'ممنون بابت نظرت',
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
  }
}
