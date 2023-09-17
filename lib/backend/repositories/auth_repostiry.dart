import 'package:get_shop/backend/repositories/base_repository.dart';
import 'package:get_shop/backend/response/register_response.dart';

class AuthRepository extends BaseRepository {
  Future<RegisterResponse> register({
    required String name,
    required String mobile,
    required String password,
    required String repeatPassword,
  }) async {
    var res = await dio.post("/register",data: {
      "name":name,
      "mobile":mobile,
      "password":password,
      "password_confirmation":repeatPassword,

    });
    print(res.statusCode);
    return RegisterResponse.fromJson(res.data);
  }
}
