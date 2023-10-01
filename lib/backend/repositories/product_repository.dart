import 'package:get_shop/backend/repositories/base_repository.dart';
import 'package:get_shop/backend/response/categories_response.dart';
import 'package:get_shop/backend/response/dashboard_response.dart';
import 'package:get_shop/backend/response/products_response.dart';

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
}
