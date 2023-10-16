import 'package:get/get.dart';

import 'package:get_shop/backend/models/user.dart';
import 'package:get_shop/backend/repositories/profile_repository.dart';

class ProfileController extends GetxController {
  ProfileRepository profileRepository = ProfileRepository();

  User? user;

  Future<void> getUserProfile() async {
    user = await profileRepository.getUser();
    update();
  }

 

  @override
  void onInit() {
    getUserProfile();
    super.onInit();
  }
}
