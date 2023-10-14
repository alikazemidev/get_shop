import 'package:get/get.dart';
import 'package:get_shop/backend/models/user.dart';
import 'package:get_shop/backend/repositories/base_repository.dart';
import 'package:get_shop/backend/response/address_response.dart';
import 'package:get_shop/backend/response/province_response.dart';
import 'package:get_shop/helpers/widgets/snack_widget.dart';
import 'package:get_shop/modules/profile/controllers/profile_controller.dart';

class ProfileRepository extends BaseRepository {
  Future<User> getUser() async {
    var res = await dio.get('/profile');

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
      successMessage('موفق', 'ویرایش با موفقیت انجام شد');
    } else if (res.statusCode != 200) {
      errorMessage('ناموفق', res.data['message']);
    }
  }

  Future<ProvinceResponse> getProvinces() async {
    var res = await dio.get('/provinces');

    return ProvinceResponse.fromJson(res.data);
  }

  Future<bool> addAddress({
    required String title,
    required String address,
    required int cityId,
    String? postalCode,
    String? latlong,
  }) async {
    var res = await dio.post('/address', data: {
      'title': title,
      'city_id': cityId.toString(),
      'address': address,
      'latlong': latlong,
      'postal_code': postalCode,
    });
    print(res.data);
    return res.statusCode == 200;
  }

  Future<AddressResponse> getAddress() async {
    var res = await dio.get('/address');
    print(res.data);
    return AddressResponse.fromJson(res.data);
  }
}
