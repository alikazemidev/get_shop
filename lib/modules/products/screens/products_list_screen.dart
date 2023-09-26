import 'package:flutter/material.dart';
import 'package:get_shop/constants/color.dart';
import 'package:get_shop/helpers/widgets/appbar_custom_widget.dart';
import 'package:iconsax/iconsax.dart';

class ProductsListScreen extends StatelessWidget {
   ProductsListScreen({super.key});
  final List<String> popTitle = ['جدیدترین ها','پرفروش ترین ها','بیشترین تخفیف','ارزان ترین ها'];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: getAppbar('محصولات'),
      body: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Column(
          children: [
            // search and fillter
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
                            contentPadding: EdgeInsets.symmetric(
                                horizontal: 15, vertical: 5),
                            hintStyle: TextStyle(fontSize: 14)),
                      ),
                    ),
                  ),
                ),
                SizedBox(width: 10),
                PopupMenuButton(
                  position: PopupMenuPosition.under,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(12),
                  ),
                  child: Container(
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
                  itemBuilder: (context) {
                    return List.generate(popTitle.length, (index) {
                      return PopupMenuItem(
                        child: Container(
                          padding: EdgeInsets.symmetric(
                              horizontal: 20, vertical: 10),
                          decoration:index != popTitle.length -1 ? BoxDecoration(
                            border: Border(
                              bottom: BorderSide(
                                color: MyColors.dividreColor,
                                width: 2,
                              ),
                            ),
                          ) : null,
                          child: Center(
                            child: Text(
                              popTitle[index],
                              style: TextStyle(
                                fontSize: 14,
                              ),
                            ),
                          ),
                        ),
                      );
                    });
                  },
                )
              ],
            ),
            SizedBox(height: 20),
            // title tag list
            SizedBox(
              height: 35,
              child: ListView.builder(
                scrollDirection: Axis.horizontal,
                itemCount: 10,
                itemBuilder: (BuildContext context, int index) {
                  return Container(
                    padding: EdgeInsets.symmetric(vertical: 4, horizontal: 12),
                    decoration: BoxDecoration(
                      border: Border.all(
                        color: MyColors.primaryColor,
                        width: 1,
                      ),
                      borderRadius: BorderRadius.circular(100),
                    ),
                    margin: EdgeInsets.only(left: 10),
                    child: Text(
                      'گوشت و پروتئین',
                      style: TextStyle(
                        color: MyColors.primaryColor,
                      ),
                    ),
                  );
                },
              ),
            ),
            SizedBox(height: 20),
            // products list
            Expanded(
              child: GridView.builder(
                gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 3,
                  mainAxisExtent: 200,
                  // mainAxisSpacing: 10,
                  crossAxisSpacing: 20,
                ),
                itemCount: 12,
                itemBuilder: (BuildContext context, int index) {
                  return SizedBox(
                    width: 118,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Stack(
                          alignment: Alignment.topLeft,
                          children: [
                            Container(
                              padding: EdgeInsets.all(18),
                              width: 118,
                              height: 130,
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
                              child: Image.network(
                                "https://dl.hitaldev.com/ecommerce/category_images/400967.png",
                              ),
                            ),
                            Container(
                              // padding: EdgeInsets.symmetric(vertical: 2),
                              margin: EdgeInsets.symmetric(
                                horizontal: 8,
                                vertical: 5,
                              ),
                              height: 18,
                              width: 30,
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(4),
                                color: Colors.red,
                              ),
                              child: Center(
                                child: Text(
                                  '10%',
                                  style: TextStyle(
                                    fontSize: 10,
                                    color: Colors.white,
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                              ),
                            )
                          ],
                        ),
                        SizedBox(height: 5),
                        Row(
                          children: [
                            Text(
                              '20,000',
                              style: TextStyle(
                                fontSize: 16,
                              ),
                            ),
                            SizedBox(width: 2),
                            Text(
                              'تومان',
                              style: TextStyle(
                                fontSize: 10,
                                color: MyColors.darkGreyColor,
                              ),
                            ),
                            Spacer(),
                            Visibility(
                              visible: true,
                              child: Text(
                                '10,000',
                                style: TextStyle(
                                  decoration: TextDecoration.lineThrough,
                                  fontSize: 12,
                                  fontWeight: FontWeight.bold,
                                  color: MyColors.darkGreyColor,
                                ),
                              ),
                            ),
                          ],
                        ),
                        Text(
                          'گوشت و پروتئین',
                          overflow: TextOverflow.ellipsis,
                          style: TextStyle(
                            fontSize: 14,
                          ),
                        )
                      ],
                    ),
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
