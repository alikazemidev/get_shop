import '../models/product.dart';

class OrderResponse {
  List<OrderData>? orderData;

  OrderResponse({this.orderData});

  OrderResponse.fromJson(Map<String, dynamic> json) {
    if (json['data'] != null) {
      orderData = <OrderData>[];
      json['data'].forEach((v) {
        orderData!.add(new OrderData.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    if (this.orderData != null) {
      data['data'] = this.orderData!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class OrderData {
  String? trackingCode;
  String? totalPrice;
  String? status;
  String? address;
  List<Product>? products;

  OrderData(
      {this.trackingCode,
      this.totalPrice,
      this.status,
      this.address,
      this.products});

  OrderData.fromJson(Map<String, dynamic> json) {
    trackingCode = json['tracking_code'];
    totalPrice = json['total_price'];
    status = json['status'];
    address = json['address'];
    if (json['products'] != null) {
      products = <Product>[];
      json['products'].forEach((v) {
        products!.add(new Product.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['tracking_code'] = this.trackingCode;
    data['total_price'] = this.totalPrice;
    data['status'] = this.status;
    data['address'] = this.address;
    if (this.products != null) {
      data['products'] = this.products!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}
