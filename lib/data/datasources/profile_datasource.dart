import 'package:e_menu_app/core/services/http.dart';
import 'package:e_menu_app/core/services/storage.dart';
import 'package:e_menu_app/data/params/profile/profile_params.dart';

import '../../core/environments/endpoints.dart';

class ProfileDatasource {
  static Future<void> updateProfile(ProfileParams params) async {
    const url = Endpoints.account;
    final email = Storage.getString('email');
    final response = await Http.patch(url + email!, body: params.toJson());
    if (response.statusCode != 200) {
      throw (response.data['error']);
    }
    if (params.username != null) {
      Storage.saveString('username', params.username!);
    }
    Storage.saveToken(response.data['New user token']);
    return;
  }
}
