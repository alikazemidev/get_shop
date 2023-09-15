import 'package:get/get.dart';
import 'package:get_shop/modules/auth/screens/start_screen.dart';

class SplashController extends GetxController {
  @override
  void onInit() {
    Future.delayed(const Duration(seconds: 2)).then(
      (value) => Get.off(
        const StartScreen(),
      ),
    );
    super.onInit();
  }
}
