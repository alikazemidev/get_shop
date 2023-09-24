import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:get/get.dart';
import 'package:get_shop/modules/home/controllers/dashboard_controller.dart';
import 'package:get_shop/modules/home/widgets/category_list_widget.dart';
import 'package:get_shop/modules/home/widgets/products_list_widget.dart';
import 'package:get_shop/modules/home/widgets/slider_image.dart';

class DashboardScreen extends StatelessWidget {
  const DashboardScreen({super.key});

  @override
  Widget build(BuildContext context) {
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
                          imageUrls:
                              controller.dashboardResponse!.sliders ?? [],
                        ),
                        SizedBox(height: 15),
                        CategoryListWidget(
                          categories:
                              controller.dashboardResponse!.categories ?? [],
                        ),
                        SizedBox(height: 15),
                        ProductsListWidget(title: 'تخفیف های شگفت انگیز'),
                        SizedBox(height: 15),
                        ProductsListWidget(title: 'آخرین محصولات'),
                      ],
                    ),
                  ),
                );
        });
  }
}
