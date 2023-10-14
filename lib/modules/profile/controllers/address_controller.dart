import 'package:get/get.dart';
import 'package:get_shop/backend/repositories/profile_repository.dart';
import 'package:get_shop/backend/response/address_response.dart';


class AddressController extends GetxController {
  ProfileRepository profileRepository = ProfileRepository();
  AddressResponse? addressResponse;

  Future<void> getAddress() async {
    addressResponse = await profileRepository.getAddress();
    update();
  }

  @override
  void onInit() {
  
    getAddress();
     super.onInit();
  }
}
