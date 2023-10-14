import 'package:get/get.dart';
import 'package:get_shop/helpers/controllers/token_controller.dart';
import 'package:get_shop/modules/auth/screens/start_screen.dart';
import 'package:get_shop/modules/home/screens/home_screen.dart';
import 'package:shared_preferences/shared_preferences.dart';

class SplashController extends GetxController {
  SharedPreferences? prefs;

  Future<void> initShared() async {
    prefs = await SharedPreferences.getInstance();
    Future.delayed(const Duration(seconds: 2)).then((value) {
      if (prefs!.getString('token') != null) {
        Get.put(TokenController(token: prefs!.getString('token')));
        print(prefs!.getString('token'));
        Get.to(HomeScreen());
      } else {
        Get.to(StartScreen());
      }
    });
  }

  @override
  void onInit() {
    initShared();
    super.onInit();
  }
}
