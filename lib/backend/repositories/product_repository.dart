import 'package:get_shop/backend/repositories/base_repository.dart';
import 'package:get_shop/backend/response/categories_response.dart';
import 'package:get_shop/backend/response/dashboard_response.dart';

class ProductRepository extends BaseRepository {
  Future<DashboardResponse> getDashboard() async {
    var res = await dio.get('/dashboard');
    return DashboardResponse.fromJson(res.data);
  }

  Future<CategoriesResponse> getCategories() async {
    var res = await dio.get('/categories');
    print(res.data);
    return CategoriesResponse.fromJson(res.data);
  }
}
