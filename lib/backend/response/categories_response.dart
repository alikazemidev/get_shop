import 'package:get_shop/backend/models/category.dart';

class CategoriesResponse {
  List<Category>? categoriesData;

  CategoriesResponse({this.categoriesData});

  CategoriesResponse.fromJson(Map<String, dynamic> json) {
    if (json['data'] != null) {
      categoriesData = [];
      json['data'].forEach((v) {
        categoriesData!.add(Category.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    if (this.categoriesData != null) {
      data['data'] = this.categoriesData!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}


