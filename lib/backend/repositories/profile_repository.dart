import 'package:get/get.dart';
import 'package:get_shop/backend/models/user.dart';
import 'package:get_shop/backend/repositories/base_repository.dart';
import 'package:get_shop/helpers/widgets/snack_widget.dart';
import 'package:get_shop/modules/profile/controllers/profile_controller.dart';

class ProfileRepository extends BaseRepository {
  Future<User> getUser() async {
    var res = await dio.get('/profile');
    print(res.data);
    return User.fromJson(res.data['data']);
  }

  Future<void> editProfile({
    required String name,
    String? oldPass,
    String? newPass,
  }) async {
    var res = await dio.post('/profile', data: {
      'name': name,
      if (oldPass != null && oldPass.isNotEmpty) 'old_password': oldPass,
      if (newPass != null && newPass.isNotEmpty) 'new_password': newPass,
    });
    if (res.statusCode == 200) {
      Get.find<ProfileController>().getUserProfile();
      Get.back();
      successMessage('موفق', 'ثبت نام با موفقیت انجام شد');
    } else if (res.statusCode != 200) {
      errorMessage('ناموفق', res.data['message']);
    }
  }
}
