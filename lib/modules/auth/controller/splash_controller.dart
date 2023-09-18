import 'package:get/get.dart';
import 'package:get_shop/modules/auth/screens/start_screen.dart';
import 'package:get_shop/modules/home/screens/home_screen.dart';
import 'package:shared_preferences/shared_preferences.dart';

class SplashController extends GetxController {
  SharedPreferences? prefs;

// !remove token temprory in windows devlopment
  Future<void> removeToken() async {
    await prefs!.remove('token');
  }

  Future<void> initShared() async {
    prefs = await SharedPreferences.getInstance();
    Future.delayed(const Duration(seconds: 2)).then((value) {
      if (prefs!.getString('token') != null) {
        Get.to(HomeScreen());
      } else {
        Get.to(StartScreen());
      }
    });
  }

  @override
  void onInit() {
    removeToken();
    initShared();
    super.onInit();
  }
}
