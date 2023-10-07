import 'package:get_shop/backend/models/user.dart';
import 'package:get_shop/backend/repositories/base_repository.dart';

class ProfileRepository extends BaseRepository {
  Future<User> getUser() async {
    var res = await dio.get('/profile');
    print(res.data);
    return User.fromJson(res.data['data']);
  }
}
