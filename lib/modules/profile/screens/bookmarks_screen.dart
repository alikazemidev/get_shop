import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get_shop/constants/color.dart';

class BookMarksScreen extends StatefulWidget {
  const BookMarksScreen({super.key});

  @override
  State<BookMarksScreen> createState() => _BookMarksScreenState();
}

class _BookMarksScreenState extends State<BookMarksScreen>
    with AutomaticKeepAliveClientMixin {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(20.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            'علاقه مندی ها',
            style: TextStyle(
              fontSize: 18,
              fontWeight: FontWeight.bold,
            ),
          ),
          SizedBox(height: 20),
          Expanded(
            child: ListView.builder(
              itemCount: 4,
              itemBuilder: (BuildContext context, int index) {
                return Column(
                  children: [
                    Row(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Container(
                          padding: EdgeInsets.all(10),
                          width: 90,
                          height: 90,
                          decoration: BoxDecoration(
                            color: Colors.white,
                            borderRadius: BorderRadius.circular(20),
                            boxShadow: [
                              BoxShadow(
                                color: Color(0xff14489e).withOpacity(0.15),
                                blurRadius: 3,
                                offset: Offset(0, 1),
                              ),
                            ],
                          ),
                          child: Image.network(
                            'https://dl.hitaldev.com/ecommerce/product_images/433217.jpg',
                          ),
                        ),
                        SizedBox(width: 10),
                        Expanded(
                          child: Container(
                            height: 95,
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.start,
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  'شیر بطری کم چرب یک لیتری',
                                  style: TextStyle(
                                    fontWeight: FontWeight.bold,
                                    fontSize: 14,
                                  ),
                                  // overflow: TextOverflow.ellipsis,
                                ),
                                Spacer(),
                                Text(
                                  '11,000',
                                  style: TextStyle(
                                    decoration: TextDecoration.lineThrough,
                                    color: MyColors.darkGreyColor,
                                  ),
                                ),
                                Row(
                                  children: [
                                    Text(
                                      '8,000',
                                      style: TextStyle(
                                        fontSize: 18,
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
                                  ],
                                ),
                              ],
                            ),
                          ),
                        ),
                        Container(
                          margin: EdgeInsets.only(right: 5),
                          padding: EdgeInsets.all(3),
                          decoration: BoxDecoration(
                              boxShadow: [
                                BoxShadow(
                                  color: Color(0xffea5e24).withOpacity(0.19),
                                  blurRadius: 4,
                                  offset: Offset(0, 1),
                                ),
                              ],
                              borderRadius: BorderRadius.circular(8),
                              color: Colors.white,
                              border: Border.all(
                                color: MyColors.dividreColor,
                              )),
                          child: Center(
                            child: Icon(
                              CupertinoIcons.heart_fill,
                              color: MyColors.darkRedColor,
                            ),
                          ),
                        )
                      ],
                    ),
                    SizedBox(height: 10),
                    Divider(),
                    SizedBox(height: 10),
                  ],
                );
              },
            ),
          ),
        ],
      ),
    );
  }

  @override
  bool get wantKeepAlive => true;
}
