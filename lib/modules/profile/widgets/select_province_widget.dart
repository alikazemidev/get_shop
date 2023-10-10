import 'package:flutter/material.dart';
import 'package:get_shop/constants/color.dart';

class SelectProvinceWidget extends StatelessWidget {
  const SelectProvinceWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      padding: EdgeInsets.all(20),
      itemCount: 10,
      itemBuilder: (BuildContext context, int index) {
        return Container(
          padding: EdgeInsets.all(20),
          margin: EdgeInsets.only(bottom: 15),
          decoration: BoxDecoration(
            border: Border.all(
              color: MyColors.primaryColor,
            ),
            borderRadius: BorderRadius.circular(25),
          ),
          child: Center(child: Text('$index item')),
        );
      },
    );
  }
}
