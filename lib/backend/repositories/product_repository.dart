import 'package:get_shop/backend/repositories/base_repository.dart';
import 'package:get_shop/backend/response/dashboard_response.dart';

class ProductRepository extends BaseRepository {
  Future<DashboardResponse> getDashboard() async {
    var res = await dio.get('/dashboard');
    print(res.data);
    return DashboardResponse.fromJson(res.data);
  }
}
