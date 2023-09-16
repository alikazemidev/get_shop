import 'package:flutter/material.dart';
import 'package:get_shop/constants/color.dart';
import 'package:iconsax/iconsax.dart';

class TextFieldWidget extends StatefulWidget {
  const TextFieldWidget({
    super.key,
    required this.hintText,
    this.icon,
    this.type,
    this.inputController,
    this.validator,
  });


  final String hintText;
  final IconData? icon;
  final TextInputType? type;
  final TextEditingController? inputController;
  final String? Function(String?)? validator;



  @override
  State<TextFieldWidget> createState() => _TextFieldWidgetState();
}

class _TextFieldWidgetState extends State<TextFieldWidget> {
  bool _obsText = true;

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      validator:widget.validator,
      controller: widget.inputController,
      obscureText:
          widget.type == TextInputType.visiblePassword ? _obsText : false,
      keyboardType: widget.type == null ? TextInputType.text : widget.type,
      decoration: InputDecoration(
        suffixIcon:
            widget.icon != null || widget.type == TextInputType.visiblePassword
                ? GestureDetector(
                    onTap: () {
                      _obsText = !_obsText;
                      setState(() {});
                    },
                    child: Icon(
                      widget.type != TextInputType.visiblePassword
                          ? widget.icon
                          : (_obsText ? Iconsax.eye : Iconsax.eye_slash),
                      color: MyColors.hintColor,
                      size: 20,
                    ),
                  )
                : null,
        contentPadding: EdgeInsets.symmetric(vertical: 14, horizontal: 20),
        hintText: widget.hintText,
        fillColor: Colors.white,
        filled: true,
        enabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(12),
          borderSide: BorderSide(
            color: Theme.of(context).dividerColor,
          ),
        ),
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(12),
          borderSide: BorderSide(
            color: Theme.of(context).primaryColor,
            width: 2,
          ),
        ),
      ),
    );
  }
}
