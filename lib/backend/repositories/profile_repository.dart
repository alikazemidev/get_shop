import 'package:flutter/material.dart';
import 'package:get_shop/backend/models/user.dart';
import 'package:get_shop/backend/repositories/base_repository.dart';


class ProfileRepository extends BaseRepository {
  Future<User> getUser() async {
    var res = await dio.get('/profile');
    print(res.data);
    return User.fromJson(res.data['data']);
  }

  Future<bool> editProfile({
    required String name,
    String? oldPass,
    String? newPass,
  }) async {
    var res = await dio.post('/profile', data: {
      'name': name,
      if (oldPass != null && oldPass.isNotEmpty) 'old_password': oldPass,
      if (newPass != null && newPass.isNotEmpty) 'new_password': newPass,
    });
    return res.statusCode == 200;
  }
}
