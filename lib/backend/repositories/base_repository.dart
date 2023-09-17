import 'package:dio/dio.dart';

class BaseRepository {
  Dio dio = Dio(
    BaseOptions(
      baseUrl: 'https://shop.hitaldev.ir/api',
      contentType: "application/json",
    ),
  );
}
