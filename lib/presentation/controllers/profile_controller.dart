import 'package:e_menu_app/core/bases/widgets/atoms/snackbar.dart';
import 'package:e_menu_app/data/params/profile/profile_params.dart';
import 'package:e_menu_app/domain/repositories/profile_repository.dart';
import 'package:get/get.dart';

// Controller for handling profile (edit profile)
class ProfileController extends GetxController {
  final _isLoading = false.obs;

  bool get isLoading => _isLoading.value;

  void setIsLoading(bool value) => _isLoading.value = value;

  void updateProfile(String? username, String? password) {
    setIsLoading(true);

    final ProfileParams params = ProfileParams(
      username: username,
      password: password,
    );

    ProfileRepository.updateProfile(params)
        .then((value) => value.fold((left) => Snackbar.error(left.message),
            (right) => Snackbar.success('Profile updated successfully')))
        .then((value) => setIsLoading(false));
  }
}
