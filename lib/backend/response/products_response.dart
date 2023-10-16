import 'package:get_shop/backend/models/product.dart';

class ProductsResponse {
  List<Proudct>? productsData;

  ProductsResponse({this.productsData});

  ProductsResponse.fromJson(Map<String, dynamic> json) {
    if (json['data'] != null) {
      productsData = <Proudct>[];
      json['data'].forEach((v) {
        productsData!.add(Proudct.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    if (this.productsData != null) {
      data['data'] = this.productsData!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}
