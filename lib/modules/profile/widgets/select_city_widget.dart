import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get_shop/backend/response/province_response.dart';
import 'package:get_shop/constants/color.dart';

class SelectCityWidget extends StatelessWidget {
  final List<City> cities;
  final Function(City city) onSelected;
  const SelectCityWidget(
      {super.key, required this.cities, required this.onSelected});

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      padding: EdgeInsets.all(20),
      itemCount: cities.length,
      itemBuilder: (BuildContext context, int index) {
        return GestureDetector(
          onTap: () {
            onSelected(cities[index]);
            Get.back();
          },
          child: Container(
            padding: EdgeInsets.all(20),
            margin: EdgeInsets.only(bottom: 15),
            decoration: BoxDecoration(
              border: Border.all(
                color: MyColors.primaryColor,
              ),
              borderRadius: BorderRadius.circular(25),
            ),
            child: Center(child: Text(cities[index].name ?? '')),
          ),
        );
      },
    );
  }
}
