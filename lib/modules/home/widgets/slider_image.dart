import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:get_shop/constants/color.dart';

class SliderImage extends StatefulWidget {
  final List<String> imageUrls;

  const SliderImage({super.key, required this.imageUrls});

  @override
  State<SliderImage> createState() => _SliderImageState();
}

class _SliderImageState extends State<SliderImage> {
  int currentIndex = 0;
  @override
  Widget build(BuildContext context) {
    return Stack(
      alignment: Alignment.bottomCenter,
      children: [
        CarouselSlider.builder(
          itemCount: widget.imageUrls.length,
          options: CarouselOptions(
            initialPage: currentIndex,
            onPageChanged: (index, reason) {
              setState(() {
                currentIndex = index;
              });
            },
            height: 140.0,
            viewportFraction: 1,
            // autoPlay: true,
            autoPlayInterval: Duration(
              seconds: 3,
            ),
          ),
          itemBuilder: (context, index, realIndex) {
            return Container(
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
        ),
        Padding(
          padding: const EdgeInsets.all(8.0),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: List.generate(widget.imageUrls.length, (index) {
              return AnimatedContainer(
                duration: Duration(milliseconds: 400),
                margin: EdgeInsets.only(right: 5),
                width: currentIndex == index ? 30 : 10,
                height: 10,
                decoration: BoxDecoration(
                  color: currentIndex == index
                      ? Theme.of(context).primaryColor
                      : MyColors.dividreColor,
                  borderRadius: BorderRadius.circular(100),
                ),
              );
            }),
          ),
        ),
      ],
    );
  }
}
