import 'package:dio/dio.dart';
import 'package:get/get.dart';
import 'package:get_shop/helpers/controllers/token_controller.dart';

class BaseRepository {
  Dio dio = Dio(
    BaseOptions(
      baseUrl: 'https://shop.hitaldev.ir/api',
      headers: {
        "Accept": "application/json",
        if (Get.isRegistered<TokenController>())
          "Authorization": "Bearer ${Get.find<TokenController>().token}"
      },
      validateStatus: (status) => status! < 500,
    ),
  );
}
