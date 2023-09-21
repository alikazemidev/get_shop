import 'package:flutter/widgets.dart';
import 'package:get_shop/helpers/widgets/slider_image.dart';

class DashboardScreen extends StatelessWidget {
  const DashboardScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        SliderImage(
          imageUrls: [
            'https://dl.hitaldev.com/ecommerce/sliders/429306.jpg',
            'https://dl.hitaldev.com/ecommerce/sliders/429219.jpg',
            'https://dl.hitaldev.com/ecommerce/sliders/470497.jpg',
          ],
        )
      ],
    );
  }
}
