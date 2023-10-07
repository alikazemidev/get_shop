import 'package:flutter/material.dart';
import 'package:get_shop/constants/color.dart';

class ButtonPrimary extends StatelessWidget {
  const ButtonPrimary({
    super.key,
    required this.text,
    this.onPressed,
    this.isLoading = false,
    this.hasBorder = false,
  });
  final String text;
  final Function()? onPressed;
  final bool isLoading;
  final bool hasBorder;

  @override
  Widget build(BuildContext context) {
    return MaterialButton(
      elevation: 0,
      height: 45,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(12),
        side: BorderSide(
          color: hasBorder ? MyColors.primaryColor : Colors.transparent,
        ),
      ),
      color: hasBorder ? Colors.transparent : Theme.of(context).primaryColor,
      minWidth: double.infinity,
      child: isLoading
          ? SizedBox(
              height: 25,
              width: 25,
              child: CircularProgressIndicator(
                color: Colors.white,
              ),
            )
          : Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                if (hasBorder)
                  Icon(
                    Icons.add,
                    color: MyColors.primaryColor,
                  ),
                SizedBox(width: 10),
                Text(
                  text,
                  style: TextStyle(
                    color: hasBorder ? MyColors.primaryColor : Colors.white,
                    fontSize: 17,
                  ),
                ),
              ],
            ),
      onPressed: isLoading ? () {} : onPressed,
    );
  }
}
