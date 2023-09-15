import 'package:flutter/material.dart';

class ButtonPrimary extends StatelessWidget {
  const ButtonPrimary({super.key, required this.text, this.onPressed});
  final String text;
  final Function()? onPressed;
  @override
  Widget build(BuildContext context) {
    return MaterialButton(
      height: 45,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(12),
      ),
      color: Theme.of(context).primaryColor,
      minWidth: double.infinity,
      child: Text(
        text,
        style: TextStyle(
          color: Colors.white,
          fontSize: 17,
        ),
      ),
      onPressed: onPressed,
    );
  }
}
