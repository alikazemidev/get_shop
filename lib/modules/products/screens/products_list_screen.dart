import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get_shop/constants/color.dart';
import 'package:get_shop/helpers/widgets/appbar_custom_widget.dart';
import 'package:get_shop/modules/products/controllers/products_list_controller.dart';
import 'package:get_shop/modules/products/screens/products_details_screen.dart';
import 'package:iconsax/iconsax.dart';

class ProductsListScreen extends StatelessWidget {
  final int? categoryId;
  final Sort? sort;
  ProductsListScreen({super.key, this.categoryId, this.sort});

  final List<String> popTitle = [
    'جدیدترین ها',
    'بیشترین تخفیف',
    'ارزان ترین ها',
    'گران ترین ها',
  ];

  @override
  Widget build(BuildContext context) {
    return GetBuilder<ProductsListController>(
      init: ProductsListController(categoryId: categoryId, defaultSort: sort),
      builder: (controller) {
        return Scaffold(
          appBar: getAppbar(title: 'محصولات'),
          body: controller.categories == null || controller.products == null
              ? Center(child: CircularProgressIndicator())
              : Padding(
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
                                  controller: controller.inputController,
                                  onChanged: (value) => controller.getProducts(
                                    searchText: value,
                                  ),
                                  decoration: InputDecoration(
                                    suffixIcon: Icon(Iconsax.search_normal),
                                    hintText: 'نام محصول مورد نظر را وارد کنید',
                                    border: InputBorder.none,
                                    contentPadding: EdgeInsets.symmetric(
                                      horizontal: 15,
                                      vertical: 5,
                                    ),
                                    hintStyle: TextStyle(
                                      fontSize: 14,
                                    ),
                                  ),
                                ),
                              ),
                            ),
                          ),
                          SizedBox(width: 10),
                          PopupMenuButton<Sort>(
                            onSelected: (value) {
                              controller.sort(value);
                            },
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
                              return [
                                PopupMenuItem(
                                  value: Sort(
                                    orderType: 'DESC',
                                    orderColumn: 'id',
                                  ),
                                  child: Container(
                                    padding: EdgeInsets.symmetric(
                                      horizontal: 20,
                                      vertical: 10,
                                    ),
                                    decoration: BoxDecoration(
                                      border: Border(
                                        bottom: BorderSide(
                                          color: MyColors.dividreColor,
                                          width: 2,
                                        ),
                                      ),
                                    ),
                                    child: Center(
                                      child: Text(
                                        popTitle[0],
                                        style: TextStyle(
                                          fontSize: 14,
                                        ),
                                      ),
                                    ),
                                  ),
                                ),
                                PopupMenuItem(
                                  value: Sort(
                                    orderColumn: 'discount',
                                    orderType: 'DESC',
                                  ),
                                  child: Container(
                                    padding: EdgeInsets.symmetric(
                                      horizontal: 20,
                                      vertical: 10,
                                    ),
                                    decoration: BoxDecoration(
                                      border: Border(
                                        bottom: BorderSide(
                                          color: MyColors.dividreColor,
                                          width: 2,
                                        ),
                                      ),
                                    ),
                                    child: Center(
                                      child: Text(
                                        popTitle[1],
                                        style: TextStyle(
                                          fontSize: 14,
                                        ),
                                      ),
                                    ),
                                  ),
                                ),
                                PopupMenuItem(
                                  value: Sort(
                                    orderColumn: 'price',
                                    orderType: 'ASC',
                                  ),
                                  child: Container(
                                    padding: EdgeInsets.symmetric(
                                      horizontal: 20,
                                      vertical: 10,
                                    ),
                                    decoration: BoxDecoration(
                                      border: Border(
                                        bottom: BorderSide(
                                          color: MyColors.dividreColor,
                                          width: 2,
                                        ),
                                      ),
                                    ),
                                    child: Center(
                                      child: Text(
                                        popTitle[2],
                                        style: TextStyle(
                                          fontSize: 14,
                                        ),
                                      ),
                                    ),
                                  ),
                                ),
                                PopupMenuItem(
                                  value: Sort(
                                    orderColumn: 'price',
                                    orderType: 'DESC',
                                  ),
                                  child: Container(
                                    padding: EdgeInsets.symmetric(
                                      horizontal: 20,
                                      vertical: 10,
                                    ),
                                    child: Center(
                                      child: Text(
                                        popTitle[3],
                                        style: TextStyle(
                                          fontSize: 14,
                                        ),
                                      ),
                                    ),
                                  ),
                                ),
                              ];
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
                          itemCount: controller.categories!.length,
                          itemBuilder: (BuildContext context, int index) {
                            return GestureDetector(
                              onTap: () {
                                controller.selectCategory(
                                  controller.categories![index].id!,
                                );
                              },
                              child: Container(
                                padding: EdgeInsets.symmetric(
                                  vertical: 4,
                                  horizontal: 12,
                                ),
                                decoration: BoxDecoration(
                                  color: controller.selectedCategoryId ==
                                          controller.categories![index].id!
                                      ? MyColors.primaryColor
                                      : Colors.transparent,
                                  border: Border.all(
                                    color: MyColors.primaryColor,
                                    width: 1,
                                  ),
                                  borderRadius: BorderRadius.circular(100),
                                ),
                                margin: EdgeInsets.only(left: 10),
                                child: Text(
                                  controller.categories![index].title ?? '',
                                  style: TextStyle(
                                    color: controller.selectedCategoryId ==
                                            controller.categories![index].id!
                                        ? Colors.white
                                        : MyColors.primaryColor,
                                  ),
                                ),
                              ),
                            );
                          },
                        ),
                      ),
                      SizedBox(height: 20),
                      // products list
                      Expanded(
                        child: controller.products!.length == 0
                            ? Center(
                                child: Column(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    Icon(
                                      Iconsax.message_question,
                                      size: 100,
                                    ),
                                    SizedBox(
                                      height: 20,
                                    ),
                                    Text(
                                      'محصولی  در این دسته بندی موجود نیست',
                                      style: TextStyle(
                                        fontSize: 16,
                                        fontWeight: FontWeight.bold,
                                      ),
                                    ),
                                  ],
                                ),
                              )
                            : GridView.builder(
                                gridDelegate:
                                    const SliverGridDelegateWithFixedCrossAxisCount(
                                  crossAxisCount: 3,
                                  mainAxisExtent: 200,
                                  // mainAxisSpacing: 10,
                                  crossAxisSpacing: 20,
                                ),
                                itemCount: controller.products!.length,
                                itemBuilder: (BuildContext context, int index) {
                                  return GestureDetector(
                                    onTap: () => Get.to(
                                      ProductsDetailsScreen(
                                          id: controller.products![index].id!),
                                    ),
                                    child: SizedBox(
                                      width: 118,
                                      child: Column(
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
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
                                                  borderRadius:
                                                      BorderRadius.circular(15),
                                                  border: Border.all(
                                                    color:
                                                        MyColors.dividreColor,
                                                  ),
                                                  boxShadow: [
                                                    BoxShadow(
                                                      color: Color(0xff14489e)
                                                          .withOpacity(.15),
                                                      blurRadius: 3,
                                                      offset: Offset(0, 1),
                                                    ),
                                                  ],
                                                ),
                                                child: Image.network(controller
                                                        .products![index]
                                                        .image ??
                                                    ''),
                                              ),
                                              Visibility(
                                                visible: controller
                                                        .products![index]
                                                        .discountPercent !=
                                                    0,
                                                child: Container(
                                                  // padding: EdgeInsets.symmetric(vertical: 2),
                                                  margin: EdgeInsets.symmetric(
                                                    horizontal: 8,
                                                    vertical: 5,
                                                  ),
                                                  height: 18,
                                                  width: 30,
                                                  decoration: BoxDecoration(
                                                    borderRadius:
                                                        BorderRadius.circular(
                                                            4),
                                                    color: Colors.red,
                                                  ),
                                                  child: Center(
                                                    child: Text(
                                                      '${controller.products![index].discountPercent}%',
                                                      style: TextStyle(
                                                        fontSize: 10,
                                                        color: Colors.white,
                                                        fontWeight:
                                                            FontWeight.bold,
                                                      ),
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
                                                controller.products![index]
                                                        .price ??
                                                    '',
                                                style: TextStyle(
                                                  fontSize: 14,
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
                                                visible: controller
                                                        .products![index]
                                                        .discountPercent !=
                                                    0,
                                                child: Text(
                                                  controller.products![index]
                                                          .realPrice ??
                                                      '',
                                                  style: TextStyle(
                                                    decoration: TextDecoration
                                                        .lineThrough,
                                                    fontSize: 12,
                                                    fontWeight: FontWeight.bold,
                                                    color:
                                                        MyColors.darkGreyColor,
                                                  ),
                                                ),
                                              ),
                                            ],
                                          ),
                                          Text(
                                            controller.products![index].title ??
                                                '',
                                            overflow: TextOverflow.ellipsis,
                                            style: TextStyle(
                                              fontSize: 14,
                                            ),
                                          )
                                        ],
                                      ),
                                    ),
                                  );
                                },
                              ),
                      ),
                    ],
                  ),
                ),
        );
      },
    );
  }
}
