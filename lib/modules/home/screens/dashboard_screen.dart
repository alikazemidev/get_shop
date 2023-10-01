import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:get_shop/modules/home/controllers/dashboard_controller.dart';
import 'package:get_shop/modules/home/widgets/category_list_widget.dart';
import 'package:get_shop/modules/home/widgets/products_list_widget.dart';
import 'package:get_shop/modules/home/widgets/slider_image.dart';
import 'package:get_shop/modules/products/controllers/products_list_controller.dart';

class DashboardScreen extends StatefulWidget {
  const DashboardScreen({super.key});

  @override
  State<DashboardScreen> createState() => _DashboardScreenState();
}

class _DashboardScreenState extends State<DashboardScreen>
    with AutomaticKeepAliveClientMixin {
  @override
  Widget build(BuildContext context) {
    super.build(context);
    return GetBuilder(
      init: DashboardController(),
      builder: (controller) {
        return controller.dashboardResponse == null
            ? Center(
                child: CircularProgressIndicator(),
              )
            : SingleChildScrollView(
                child: Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 18),
                  child: Column(
                    children: [
                      SliderImage(
                        imageUrls: controller.dashboardResponse!.sliders ?? [],
                      ),
                      SizedBox(height: 15),
                      CategoryListWidget(
                        categories:
                            controller.dashboardResponse!.categories ?? [],
                      ),
                      SizedBox(height: 15),
                      ProductsListWidget(
                        title: 'تخفیف های شگفت انگیز',
                        products:
                            controller.dashboardResponse!.discountedProducts ??
                                [],
                        sort: Sort(
                          orderColumn: 'discount',
                          orderType: 'DESC',
                        ),
                      ),
                      SizedBox(height: 15),
                      ProductsListWidget(
                        title: 'آخرین محصولات',
                        products:
                            controller.dashboardResponse!.latestProducts ?? [],
                      ),
                    ],
                  ),
                ),
              );
      },
    );
  }

  @override
  bool get wantKeepAlive => true;
}
