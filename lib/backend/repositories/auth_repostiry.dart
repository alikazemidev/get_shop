import 'package:get_shop/backend/repositories/base_repository.dart';
import 'package:get_shop/backend/response/register_response.dart';
import 'package:get_shop/helpers/widgets/snack_widget.dart';

class AuthRepository extends BaseRepository {
  Future<RegisterResponse> register({
    required String name,
    required String mobile,
    required String password,
    required String repeatPassword,
  }) async {
    var res = await dio.post("/register", data: {
      "name": name,
      "mobile": mobile,
      "password": password,
      "password_confirmation": repeatPassword,
    });

    if (res.statusCode == 200) {
      successMessage('موفق', 'ثبت نام با موفقیت انجام شد');
    } else if (res.statusCode! >= 300) {
      errorMessage('ناموفق', res.data['message']);
    }

    return RegisterResponse.fromJson(res.data);
  }
}
