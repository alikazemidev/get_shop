import 'package:get/get.dart';
import 'package:get_shop/backend/repositories/profile_repository.dart';
import 'package:get_shop/backend/response/province_response.dart';

class AddAddressController extends GetxController {
  ProfileRepository profileRepository = ProfileRepository();
  ProvinceResponse? provinceResponse;
  Province? selectedProvince;
  City? selectedCity;

  Future<void> getProvinces() async {
    provinceResponse = await profileRepository.getProvinces();
    update();
  }

  void selectProvince(Province value) {
    selectedProvince = value;
    update();
  }

  void selectCity(City value) {
    selectedCity = value;
    update();
  }

  @override
  void onInit() {
    getProvinces();
    super.onInit();
  }
}
