import 'package:flutter/material.dart';
import 'package:get_shop/constants/color.dart';
import 'package:iconsax/iconsax.dart';

class IconButtonWidget extends StatelessWidget {
  final String title;
  final IconData icon;
  const IconButtonWidget({super.key, required this.title, required this.icon});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 56,
      padding: EdgeInsets.all(16),
      width: double.infinity,
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(15),
        boxShadow: [
          BoxShadow(
            color: Color(0xff14489e).withOpacity(.15),
            blurRadius: 3,
            offset: Offset(0, 1),
          ),
        ],
      ),
      child: Row(
        children: [
          Icon(
            icon,
            color: MyColors.primaryColor,
          ),
          SizedBox(width: 15),
          Text(title),
          Spacer(),
          Icon(
            Iconsax.arrow_left,
            color: MyColors.primaryColor,
          )
        ],
      ),
    );
  }
}
