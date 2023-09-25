import 'package:flutter/material.dart';
import 'package:get_shop/constants/color.dart';
import 'package:get_shop/helpers/widgets/appbar_custom_widget.dart';
import 'package:iconsax/iconsax.dart';

class ProductsListScreen extends StatelessWidget {
  const ProductsListScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: getAppbar('محصولات'),
      body: Padding(
        padding: const EdgeInsets.all(15.0),
        child: Column(
          children: [
            Row(
              children: [
                Expanded(
                  child: Container(
                    height: 50,
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(15),
                      border: Border.all(
                        color: MyColors.dividreColor,
                      ),
                      boxShadow: [
                        BoxShadow(
                          color: Color(0xff14489e).withOpacity(.15),
                          blurRadius: 3,
                          offset: Offset(0, 1),
                        ),
                      ],
                    ),
                    child: Center(
                      child: TextFormField(
                        decoration: InputDecoration(
                          suffixIcon: Icon(Iconsax.search_normal),
                            hintText: 'نام محصول مورد نظر را وارد کنید',
                            border: InputBorder.none,
                            contentPadding: EdgeInsets.symmetric(horizontal: 15,vertical: 5),
                            hintStyle: TextStyle(fontSize: 14)),
                      ),
                    ),
                  ),
                ),
                SizedBox(width: 10),
                Container(
                  width: 50,
                  height: 50,
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(15),
                    border: Border.all(
                      color: MyColors.dividreColor,
                    ),
                    boxShadow: [
                      BoxShadow(
                        color: Color(0xff14489e).withOpacity(.15),
                        blurRadius: 3,
                        offset: Offset(0, 1),
                      ),
                    ],
                  ),
                  child: Icon(
                    Iconsax.sort,
                    size: 30,
                  ),
                ),
              ],
            )
          ],
        ),
      ),
    );
  }
}
