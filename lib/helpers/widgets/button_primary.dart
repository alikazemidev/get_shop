import 'package:flutter/material.dart';

class ButtonPrimary extends StatelessWidget {
  const ButtonPrimary({
    super.key,
    required this.text,
    this.onPressed,
    this.isLoading = false,
  });
  final String text;
  final Function()? onPressed;
  final bool isLoading;

  @override
  Widget build(BuildContext context) {
    return MaterialButton(
      height: 45,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(12),
      ),
      color: Theme.of(context).primaryColor,
      minWidth: double.infinity,
      child: isLoading
          ? SizedBox(
              height: 25,
              width: 25,
              child: CircularProgressIndicator(
                color: Colors.white,
              ),
            )
          : Text(
              text,
              style: TextStyle(
                color: Colors.white,
                fontSize: 17,
              ),
            ),
      onPressed: isLoading ? () {} : onPressed,
    );
  }
}
