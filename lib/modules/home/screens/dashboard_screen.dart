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
            'https://via.placeholder.com/600/1ee8a4',
            'https://via.placeholder.com/600/f9cee5',
            "https://via.placeholder.com/600/45601a",
            "https://via.placeholder.com/600/e2223e",
          ],
          
        )
      ],
    );
  }
}
