import 'package:either_dart/either.dart';

import '../../core/client/api_call.dart';
import '../../core/errors/failure.dart';
import '../../data/datasources/profile_datasource.dart';
import '../../data/params/profile/profile_params.dart';

class ProfileRepository {
  static Future<Either<Failure, void>> updateProfile(
      ProfileParams params) async {
    return await apiCall(ProfileDatasource.updateProfile(params));
  }
}
