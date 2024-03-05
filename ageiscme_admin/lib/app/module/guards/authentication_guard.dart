import 'dart:async';

import 'package:ageiscme_data/stores/authentication/authentication_store.dart';
import 'package:ageiscme_models/dto/authentication_result/authentication_result_dto.dart';
import 'package:dependencias_comuns/modular_export.dart';

class AuthenticationGuard extends RouteGuard {
  AuthenticationGuard() : super(redirectTo: '/admin/login');

  @override
  FutureOr<bool> canActivate(
    final String path,
    final ParallelRoute route,
  ) async {
    final AuthenticationStore store = Modular.get<AuthenticationStore>();
    final AuthenticationResultDTO? authentication =
        await store.GetAuthenticated();
    return Future.value(authentication != null);
  }
}
