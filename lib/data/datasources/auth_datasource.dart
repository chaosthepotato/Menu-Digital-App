import 'package:e_menu_app/core/services/http.dart';

import '../../core/environments/endpoints.dart';
import '../../core/services/storage.dart';
import '../params/auth/auth_params.dart';

class AuthDatasource {
  static Future<bool> login(AuthParams params) async {
    const url = Endpoints.login;
    final response = await Http.put(
      url,
      body: params.toJson(),
    );

    if (response.statusCode != 200) {
      if (response.data.toString().contains('error:')) {
        throw (response.data['error']);
      }
      throw (response.data);
    }
    await Storage.saveString('email', response.data['email']);
    await Storage.saveString('username', response.data['username']);
    await Storage.saveToken(response.data['token']);

    await Storage.saveBool('is_restaurant',
        value: response.data['is_restaurant']);

    return response.data['is_restaurant'];
  }

  static Future<void> signUp(AuthParams params) async {
    const url = Endpoints.signup;
    final response = await Http.post(
      url,
      body: params.toJson(),
    );
    if (response.statusCode != 200) {
      if (response.data.toString().contains('pq:')) {
        if (response.data.toString().contains('email')) {
          throw ('Email already exists');
        } else if (response.data.toString().contains('username')) {
          throw ('Username already exists');
        }
      }
      throw (response.data['error']);
    }
    return;
  }

  static Future<void> signOut() async {
    const url = Endpoints.signout;

    final AuthParams params = AuthParams(
      email: Storage.getString('email') ?? '',
      password: Storage.getString('password') ?? '',
      login_status: false,
    );

    final response = await Http.patch(
      url,
      body: params.toJson(),
    );
    if (response.statusCode != 200) {
      throw (response.data);
    }

    await Storage.removeToken();
    return;
  }
}
