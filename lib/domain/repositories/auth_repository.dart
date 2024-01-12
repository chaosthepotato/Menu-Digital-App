import 'package:e_menu_app/data/datasources/auth_datasource.dart';
import 'package:either_dart/either.dart';

import '../../core/client/api_call.dart';
import '../../core/errors/failure.dart';
import '../../data/params/auth/auth_params.dart';

class AuthRepository {
  static Future<Either<Failure, bool>> login(AuthParams params) async {
    return await apiCall(AuthDatasource.login(params));
  }

  static Future<Either<Failure, void>> signUp(AuthParams params) async {
    return await apiCall(AuthDatasource.signUp(params));
  }

  static Future<Either<Failure, void>> signOut() async {
    return await apiCall(AuthDatasource.signOut());
  }
}
