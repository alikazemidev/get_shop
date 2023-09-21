import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class SliderImage extends StatefulWidget {
  final List<String> imageUrls;

  const SliderImage({super.key, required this.imageUrls});

  @override
  State<SliderImage> createState() => _SliderImageState();
}

class _SliderImageState extends State<SliderImage> {
  @override
  Widget build(BuildContext context) {
    return CarouselSlider.builder(
      itemCount: widget.imageUrls.length,
      options: CarouselOptions(
        height: 150.0,
        viewportFraction: 1,
        // autoPlay: true,
        autoPlayInterval: Duration(
          seconds: 3,
        ),
      ),
      itemBuilder: (context, index, realIndex) {
        return Container(
          margin: EdgeInsets.symmetric(horizontal: 15),
          width: double.infinity,
          child: ClipRRect(
            borderRadius: BorderRadius.circular(15),
            child: Image.network(
              widget.imageUrls[index],
              fit: BoxFit.cover,
            ),
          ),
        );
      },
    );
  }
}
