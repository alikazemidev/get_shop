import 'package:flutter/widgets.dart';
import 'package:get_shop/constants/color.dart';

class RadioBoxWidget extends StatefulWidget {
  const RadioBoxWidget({super.key});

  @override
  State<RadioBoxWidget> createState() => _RadioBoxWidgetState();
}

class _RadioBoxWidgetState extends State<RadioBoxWidget> {
  List<ShippingMethod> methods = [
    ShippingMethod(
      title: 'پست پیشتاز(ارسال سریع)',
      price: '20,000',
      value: 1,
      isSelected: true,
    ),
    ShippingMethod(
      title: 'تیپاکس',
      price: '10,000',
      value: 2,
    ),
  ];

  @override
  Widget build(BuildContext context) {
    return Column(
        children: List.generate(methods.length, (index) {
      return Container(
        margin: EdgeInsets.only(bottom: 15),
        width: double.infinity,
        padding: EdgeInsets.symmetric(horizontal: 15, vertical: 10),
        decoration: BoxDecoration(
          border: Border.all(
            color: MyColors.dividreColor,
          ),
          borderRadius: BorderRadius.circular(12),
        ),
        child: Row(
          children: [
            Text(
              methods[index].title,
              style: TextStyle(
                fontSize: 16,
                color: MyColors.darkGreyColor,
              ),
            ),
            Spacer(),
            Text(
              methods[index].price,
              style: TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.bold,
              ),
            ),
            SizedBox(width: 5),
            Text(
              'تومان',
              style: TextStyle(
                fontSize: 12,
                color: MyColors.darkGreyColor,
              ),
            ),
            SizedBox(width: 8),
            Container(
              width: 25,
              height: 25,
              decoration: BoxDecoration(
                border: Border.all(
                  color: MyColors.dividreColor,
                ),
                borderRadius: BorderRadius.circular(100),
              ),
              child: Visibility(
                visible: methods[index].isSelected,
                child: Center(
                  child: Container(
                    width: 17,
                    height: 17,
                    decoration: BoxDecoration(
                      color: MyColors.primaryColor,
                      borderRadius: BorderRadius.circular(100),
                    ),
                  ),
                ),
              ),
            ),
          ],
        ),
      );
    }));
  }
}

class ShippingMethod {
  final String title;
  final String price;
  final bool isSelected;
  final int value;

  ShippingMethod({
    required this.title,
    required this.price,
    this.isSelected = false,
    required this.value,
  });
}
