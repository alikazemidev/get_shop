import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:get_shop/constants/color.dart';
import 'package:get_shop/helpers/widgets/button_primary.dart';
import 'package:iconsax/iconsax.dart';

class CommentBottomSheet extends StatelessWidget {
  const CommentBottomSheet({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
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
                initialRating: 3,
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
                onRatingUpdate: (rating) {},
              ),
            ),
          ),
          SizedBox(height: 25),
          TextFormField(
            
            maxLines: 5,
            decoration: InputDecoration(
              contentPadding: EdgeInsets.symmetric(horizontal: 20,vertical: 20),
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
            text: 'ارسال نظر',
            onPressed: () {},
          )
        ],
      ),
    );
  }
}
