import 'package:flutter/widgets.dart';
import 'package:get_shop/modules/home/widgets/category_list_widget.dart';
import 'package:get_shop/modules/home/widgets/products_list_widget.dart';
import 'package:get_shop/modules/home/widgets/slider_image.dart';

class DashboardScreen extends StatelessWidget {
  const DashboardScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 18),
        child: Column(
          children: [
            SliderImage(
              imageUrls: [
                'https://dl.hitaldev.com/ecommerce/sliders/429306.jpg',
                'https://dl.hitaldev.com/ecommerce/sliders/429219.jpg',
                'https://dl.hitaldev.com/ecommerce/sliders/470497.jpg',
              ],
            ),
            SizedBox(height: 15),
            CategoryListWidget(),
            SizedBox(height: 15),
            ProductsListWidget(title: 'تخفیف های شگفت انگیز'),
            SizedBox(height: 15),
            ProductsListWidget(title: 'آخرین محصولات'),
          ],
        ),
      ),
    );
  }
}
