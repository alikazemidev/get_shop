import 'package:get_shop/backend/models/category.dart';
import 'package:get_shop/backend/models/product.dart';

class DashboardResponse {
  List<String>? sliders;
  List<Category>? categories;
  List<Proudct>? discountedProducts;
  List<Proudct>? latestProducts;

  DashboardResponse({
    this.sliders,
    this.categories,
    this.discountedProducts,
    this.latestProducts,
  });

  DashboardResponse.fromJson(Map<String, dynamic> json) {
    sliders = json['sliders'].cast<String>();
    if (json['categories'] != null) {
      categories = <Category>[];
      json['categories'].forEach((v) {
        categories!.add(new Category.fromJson(v));
      });
    }
    if (json['discounted_products'] != null) {
      discountedProducts = <Proudct>[];
      json['discounted_products'].forEach((v) {
        discountedProducts!.add(new Proudct.fromJson(v));
      });
    }
    if (json['latest_products'] != null) {
      latestProducts = <Proudct>[];
      json['latest_products'].forEach((v) {
        latestProducts!.add(new Proudct.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['sliders'] = this.sliders;
    if (this.categories != null) {
      data['categories'] = this.categories!.map((v) => v.toJson()).toList();
    }
    if (this.discountedProducts != null) {
      data['discounted_products'] =
          this.discountedProducts!.map((v) => v.toJson()).toList();
    }
    if (this.latestProducts != null) {
      data['latest_products'] =
          this.latestProducts!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}
