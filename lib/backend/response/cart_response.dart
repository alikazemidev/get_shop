import '../models/product.dart';

class CartResponse {
  int? totalItems;
  String? price;
  String? discountPrice;
  String? totalPrice;
  List<ProductInCart>? productInCart;

  CartResponse(
      {this.totalItems,
      this.price,
      this.discountPrice,
      this.totalPrice,
      this.productInCart});

  CartResponse.fromJson(Map<String, dynamic> json) {
    totalItems = json['total_items'];
    price = json['price'];
    discountPrice = json['discount_price'];
    totalPrice = json['total_price'];
    if (json['items'] != null) {
      productInCart = <ProductInCart>[];
      json['items'].forEach((v) {
        productInCart!.add(new ProductInCart.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['total_items'] = this.totalItems;
    data['price'] = this.price;
    data['discount_price'] = this.discountPrice;
    data['total_price'] = this.totalPrice;
    if (this.productInCart != null) {
      data['items'] = this.productInCart!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class ProductInCart {
  int? count;
  Proudct? product;

  ProductInCart({this.count, this.product});

  ProductInCart.fromJson(Map<String, dynamic> json) {
    count = json['count'];
    product =
        json['product'] != null ? new Proudct.fromJson(json['product']) : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['count'] = this.count;
    if (this.product != null) {
      data['product'] = this.product!.toJson();
    }
    return data;
  }
}
