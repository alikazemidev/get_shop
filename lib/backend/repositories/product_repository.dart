import 'package:get_shop/backend/models/product.dart';
import 'package:get_shop/backend/repositories/base_repository.dart';
import 'package:get_shop/backend/response/cart_response.dart';
import 'package:get_shop/backend/response/categories_response.dart';
import 'package:get_shop/backend/response/dashboard_response.dart';
import 'package:get_shop/backend/response/order_response.dart';
import 'package:get_shop/backend/response/products_response.dart';
import 'package:get_shop/backend/response/review_response.dart';

class ProductRepository extends BaseRepository {
  Future<DashboardResponse> getDashboard() async {
    var res = await dio.get('/dashboard');
    return DashboardResponse.fromJson(res.data);
  }

  Future<CategoriesResponse> getCategories() async {
    var res = await dio.get('/categories');
    return CategoriesResponse.fromJson(res.data);
  }

  Future<ProductsResponse> fillterProducts({
    int? categoryId,
    String? searchText,
    String? orderType,
    String? orderColumn,
  }) async {
    Map<String, dynamic> params = {};
    if (categoryId != null) {
      params["category_id"] = categoryId.toString();
    }
    if (searchText != null) {
      params['keyword'] = searchText;
    }
    if (orderType != null) {
      params["order_type"] = orderType;
    }
    if (orderColumn != null) {
      params["order_column"] = orderColumn;
    }

    var res = await dio.get('/products', queryParameters: params);
    return ProductsResponse.fromJson(res.data);
  }

  Future<Product> getProductDetails(int id) async {
    var res = await dio.get('/products/$id');

    return Product.fromJson(res.data['data']);
  }

  Future<ReviewResponse> getReviews(int id) async {
    var res = await dio.get('/product/$id/reviews');
    return ReviewResponse.fromJson(res.data);
  }

  Future<bool> addReview({
    required int productId,
    required int rate,
    required String comment,
  }) async {
    var res = await dio.post('/review', data: {
      "product_id": productId.toString(),
      "rate": rate.toString(),
      "comment": comment,
    });
    return res.statusCode == 200;
  }

  Future<int> addToCart(
      {required int productId,
      required bool increment,
      bool delete = false}) async {
    var res = await dio.post('/add-to-cart', data: {
      'product_id': productId.toString(),
      'increment': increment,
      'delete': delete,
    });

    return res.data['count'] ?? 0;
  }

  Future<CartResponse> getCart() async {
    var res = await dio.get('/cart');

    return CartResponse.fromJson(res.data);
  }

  Future<String> order({
    required int addressId,
    required int shippingMethod,
  }) async {
    var res = await dio.post('/order', data: {
      'address_id': addressId.toString(),
      'shipping_method': shippingMethod.toString(),
    });

    return res.data['payment_link'];
  }

  Future<OrderResponse> getOrder() async {
    var res = await dio.get('/order');
    print(res.data);
    return OrderResponse.fromJson(res.data);
  }
}
