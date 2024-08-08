import 'dart:convert';

import 'package:ageiscme_data/shared/app_config.dart';
import 'package:ageiscme_data/shared/exception_helper.dart';
import 'package:ageiscme_data/stores/authentication/authentication_store.dart';
import 'package:ageiscme_models/dto/authentication_result/authentication_result_dto.dart';
import 'package:ageiscme_models/models/erro_padrao/erro_padrao_model.dart';
import 'package:ageiscme_models/models/result/command_result_model.dart';
import 'package:compartilhados/componentes/loading/loading_controller.dart';
import 'package:compartilhados/componentes/toasts/error_dialog.dart';
import 'package:compartilhados/componentes/toasts/toast_utils.dart';
import 'package:compartilhados/exceptions/custom_base_exception.dart';
import 'package:compartilhados/functions/cryptography/cryptography_helper.dart';
import 'package:dependencias_comuns/main.dart';
import 'package:dependencias_comuns/modular_export.dart';
import 'package:dependencias_comuns/package_info_export.dart';
import 'package:flutter/foundation.dart';

class CustomRoute {
  String url;
  bool failover;

  CustomRoute({required this.url, required this.failover});
}

class CustomDio {
  CustomDio({this.loading});

  Dio _dio = Dio(
    BaseOptions(
      connectTimeout: const Duration(seconds: 60),
      receiveTimeout: const Duration(seconds: 60),
      validateStatus: (status) => true,
    ),
  );

  final options = Options(
    sendTimeout: const Duration(seconds: 60),
    receiveTimeout: const Duration(seconds: 60),
    validateStatus: (status) => true,
  );

  bool _throwException = true;
  bool _includeAuthorization = true;
  bool _encryptPayload = false;

  LoadingController? loading;

  void DisableExceptionService() => _throwException = false;
  void EnableExceptionService() => _throwException = true;

  void DisableAuthorization() => _includeAuthorization = false;
  void EnableAuthorization() => _includeAuthorization = true;

  void DisableEncryptPayload() => _encryptPayload = false;
  void EnableEncryptPayload() => _encryptPayload = true;

  static const int retrys = 10;

  Future<List<CustomRoute>> get _routes async {
    AppConfig app = await AppConfig.forEnvironment(false);
    List<CustomRoute> urls = [];
    if (app.useFailoverFirst) {
      urls.add(
        CustomRoute(
          url: app.apiUrlFailover,
          failover: true,
        ),
      );
    }
    urls.add(CustomRoute(url: app.apiUrl, failover: false));
    if (app.apiUrlFailover.isNotEmpty && app.useFailoverFirst != true) {
      urls.add(
        CustomRoute(
          url: app.apiUrlFailover,
          failover: true,
        ),
      );
    }
    if(urls.where((element) => element.url.isNotEmpty).isEmpty){
      throw CustomBaseException('É necessário configurar o Registry do sistema');
    }
    return urls;
  }

  Future setHeaders() async {
    AuthenticationResultDTO? auth =
        await Modular.get<AuthenticationStore>().GetAuthenticated();
    options.headers = {};
    PackageInfo info = await PackageInfo.fromPlatform();
    options.headers!.addAll({'version': info.version});
    if (auth?.token != null && _includeAuthorization) {
      options.headers!.addAll({'authorization': 'bearer ${auth!.token}'});
    }
  }

  Future<dynamic> getObject({required dynamic obj}) async {
    if (!_encryptPayload) return obj.toJson();
    options.headers!.addAll({'encrypt-payload': true});
    (String content, String nonce) encryptedPayload =
        await CryptographyHelper.encryptJson(jsonEncode(obj.toJson()));
    options.headers!.addAll({'nonce-iv': encryptedPayload.$2});
    return encryptedPayload.$1;
  }

  Future<bool> test() async {
    await setHeaders();
    Response? resp;
    for (CustomRoute rota in await _routes) {
      String finalRoute = '${rota.url}/test';
      try {
        resp = await _dio.get(
          finalRoute,
          options: options,
        );
        await AppConfig.setUseFailover(rota.failover);
        break;
      } catch (ex) {
        debugPrint(rota.url + ' não acessível');
      }
    }
    if (resp == null) {
      throw CustomBaseException('Nenhum servidor está acessível');
    }

    if (!resp.statusCode.toString().startsWith('2')) {
      bool throwed = await throwResponseError(resp);
      if (!throwed) throw CustomBaseException(resp.data.toString());
    }
    return true;
  }

  Future<List<dynamic>> getList(String route) async {
    await setHeaders();
    Response? resp;
    for (CustomRoute rota in await _routes) {
      String finalRoute = '${rota.url}$route';
      try {
        resp = await _dio.get(
          finalRoute,
          options: options,
        );
        await AppConfig.setUseFailover(rota.failover);
        break;
      } catch (ex) {
        debugPrint(rota.url + ' não acessível');
      }
    }
    if (resp == null) {
      throw CustomBaseException('Nenhum servidor está acessível');
    }

    if (!resp.statusCode.toString().startsWith('2')) {
      bool throwed = await throwResponseError(resp);
      if (!throwed) throw CustomBaseException(resp.data.toString());
    }
    return resp.data;
  }

  Future<dynamic> getOne(String route) async {
    await setHeaders();
    Response? resp;
    for (CustomRoute rota in await _routes) {
      String finalRoute = '${rota.url}$route';
      try {
        resp = await _dio.get(
          finalRoute,
          options: options,
        );
        await AppConfig.setUseFailover(rota.failover);
        break;
      } catch (ex) {
        debugPrint(rota.url + ' não acessível');
      }
    }
    if (resp == null) {
      throw CustomBaseException('Nenhum servidor está acessível');
    }

    if (!resp.statusCode.toString().startsWith('2')) {
      bool throwed = await throwResponseError(resp);
      if (!throwed) throw CustomBaseException(resp.data.toString());
    }
    return resp.data;
  }

  Future<dynamic> postOne(String route, dynamic objeto) async {
    await setHeaders();
    dynamic obj = await getObject(obj: objeto);
    Response? resp;
    for (CustomRoute rota in await _routes) {
      String finalRoute = '${rota.url}$route';
      try {
        resp = await _dio.post(
          finalRoute,
          data: obj,
          options: options,
        );
        await AppConfig.setUseFailover(rota.failover);
        break;
      } catch (ex) {
        debugPrint(rota.url + ' não acessível');
      }
    }
    if (resp == null) {
      throw CustomBaseException('Nenhum servidor está acessível');
    }

    if (!resp.statusCode.toString().startsWith('2')) {
      bool throwed = await throwResponseError(resp);
      if (!throwed) throw CustomBaseException(resp.data.toString());
    }
    return resp.data;
  }

  Future<List<dynamic>> postList(String route, dynamic objeto) async {
    await setHeaders();
    dynamic obj = await getObject(obj: objeto);
    Response? resp;
    for (CustomRoute rota in await _routes) {
      String finalRoute = '${rota.url}$route';
      try {
        resp = await _dio.post(
          finalRoute,
          data: obj,
          options: options,
        );
        await AppConfig.setUseFailover(rota.failover);
        break;
      } catch (ex) {
        debugPrint(rota.url + ' não acessível');
      }
    }
    if (resp == null) {
      throw CustomBaseException('Nenhum servidor está acessível');
    }

    if (!resp.statusCode.toString().startsWith('2')) {
      bool throwed = await throwResponseError(resp);
      if (!throwed) throw CustomBaseException(resp.data);
    }
    return resp.data;
  }

  Future<dynamic> countFilter(String route, dynamic objeto) async {
    await setHeaders();
    Response? resp;
    for (CustomRoute rota in await _routes) {
      String finalRoute = '${rota.url}$route';
      try {
        dynamic obj = await getObject(obj: objeto);
        resp = await _dio.post(
          finalRoute,
          data: obj,
          options: options,
        );
        await AppConfig.setUseFailover(rota.failover);
        break;
      } catch (ex) {
        debugPrint(rota.url + ' não acessível');
      }
    }
    if (resp == null) {
      throw CustomBaseException('Nenhum servidor está acessível');
    }
    if (!resp.statusCode.toString().startsWith('2')) {
      bool throwed = await throwResponseError(resp);
      if (!throwed) throw CustomBaseException(resp.data);
    }
    return resp.data;
  }

  Future<T?> postFilter<T>(
    String route,
    dynamic objeto,
    T? Function(dynamic json) deserializerFunction, {
    int retrys = retrys,
  }) async {
    try {
      dynamic obj = await getObject(obj: objeto);
      await setHeaders();
      Response? resp;
      for (CustomRoute rota in await _routes) {
        String finalRoute = '${rota.url}$route';
        try {
          resp = await _dio.post(
            finalRoute,
            data: obj,
            options: options,
          );
          await AppConfig.setUseFailover(rota.failover);
          break;
        } catch (ex) {
          debugPrint(rota.url + ' não acessível');
        }
      }
      if (resp == null) {
        throw CustomBaseException('Nenhum servidor está acessível');
      }

      if (!resp.statusCode.toString().startsWith('2')) {
        bool throwed = await throwResponseError(resp);
        if (throwed) return null;
        if (!throwed) throw CustomBaseException(resp.data);
      }
      if (resp.statusCode == 204) return null;
      return deserializerFunction(resp.data);
    } on Exception catch (ex) {
      (int, bool) throwed = await throwDefaultException(ex, retrys);
      if (throwed.$1 > 0) {
        await Future.delayed(const Duration(seconds: 1));
        return await postFilter(
          route,
          objeto,
          deserializerFunction,
          retrys: retrys - 1,
        );
      }
      if (throwed.$2) return null;
      if (!throwed.$2) throw ex;
    }
    return null;
  }

  Future postWithoutReturn<T>(
    String route,
    dynamic objeto, {
    int retrys = retrys,
  }) async {
    try {
      await setHeaders();

      dynamic obj = await getObject(obj: objeto);
      Response? resp;
      for (CustomRoute rota in await _routes) {
        String finalRoute = '${rota.url}$route';
        try {
          resp = await _dio.post(
            finalRoute,
            data: obj,
            options: options,
          );
          await AppConfig.setUseFailover(rota.failover);
          break;
        } catch (ex) {
          debugPrint(rota.url + ' não acessível');
        }
      }
      if (resp == null) {
        throw CustomBaseException('Nenhum servidor está acessível');
      }

      if (!resp.statusCode.toString().startsWith('2')) {
        bool throwed = await throwResponseError(resp);
        if (throwed) return null;
        if (!throwed) throw CustomBaseException(resp.data);
      }
      CommandResultModel result = CommandResultModel.fromJson(resp.data);
      if (!result.success) {
        bool throwed = await throwCommandResultError(result);
        if (throwed) return null;
        if (!throwed) throw CustomBaseException(result.message);
      }
      return;
    } on Exception catch (ex) {
      (int, bool) throwed = await throwDefaultException(ex, retrys);
      await Future.delayed(const Duration(seconds: 1));
      if (throwed.$1 > 0) {
        return await postWithoutReturn(
          route,
          objeto,
          retrys: retrys - 1,
        );
      }
      if (throwed.$2) return null;
      if (!throwed.$2) throw ex;
    }
    return null;
  }

  Future<(String message, T object)?> post<T>(
    String route,
    dynamic objeto,
    T Function(dynamic json) deserializerFunction, {
    int retrys = retrys,
  }) async {
    try {
      await setHeaders();
      dynamic obj = await getObject(obj: objeto);
      Response? resp;
      for (CustomRoute rota in await _routes) {
        String finalRoute = '${rota.url}$route';
        try {
          resp = await _dio.post(
            finalRoute,
            data: obj,
            options: options,
          );
          await AppConfig.setUseFailover(rota.failover);
          break;
        } catch (ex) {
          debugPrint(rota.url + ' não acessível');
        }
      }
      if (resp == null) {
        throw CustomBaseException('Nenhum servidor está acessível');
      }

      if (!resp.statusCode.toString().startsWith('2')) {
        bool throwed = await throwResponseError(resp);
        if (throwed) return null;
        if (!throwed) throw CustomBaseException(resp.data);
      }
      CommandResultModel result = CommandResultModel.fromJson(resp.data);
      if (!result.success) {
        bool throwed = await throwCommandResultError(result);
        if (throwed) return null;
        if (!throwed) throw CustomBaseException(result.message);
      }
      return (result.message, deserializerFunction(result.data));
    } on Exception catch (ex) {
      (int, bool) throwed = await throwDefaultException(ex, retrys);
      await Future.delayed(const Duration(seconds: 1));
      if (throwed.$1 > 0) {
        return await post(
          route,
          objeto,
          deserializerFunction,
          retrys: retrys - 1,
        );
      }
      if (throwed.$2) return null;
      if (!throwed.$2) throw ex;
    }
    return null;
  }

  Future<(String message, T object)?> delete<T>(
    String route,
    dynamic objeto,
    T Function(dynamic json) deserializerFunction, {
    int retrys = retrys,
  }) async {
    try {
      await setHeaders();
      dynamic obj = await getObject(obj: objeto);
      Response? resp;
      for (CustomRoute rota in await _routes) {
        String finalRoute = '${rota.url}$route';
        try {
          resp = await _dio.delete(
            finalRoute,
            data: obj,
            options: options,
          );
          await AppConfig.setUseFailover(rota.failover);
          break;
        } catch (ex) {
          debugPrint(rota.url + ' não acessível');
        }
      }
      if (resp == null) {
        throw CustomBaseException('Nenhum servidor está acessível');
      }
      if (!resp.statusCode.toString().startsWith('2')) {
        bool throwed = await throwResponseError(resp);
        if (throwed) return null;
        if (!throwed) throw CustomBaseException(resp.data.toString());
      }
      CommandResultModel result = CommandResultModel.fromJson(resp.data);
      if (!result.success) {
        bool throwed = await throwCommandResultError(result);
        if (throwed) return null;
        if (!throwed) throw CustomBaseException(result.message);
      }
      return (result.message, deserializerFunction(result.data));
    } on Exception catch (ex) {
      (int, bool) throwed = await throwDefaultException(
        ex,
        retrys,
      );
      if (throwed.$1 > 0) {
        await Future.delayed(const Duration(seconds: 1));
        return await delete(
          route,
          objeto,
          deserializerFunction,
          retrys: retrys - 1,
        );
      }
      if (throwed.$2) return null;
      if (!throwed.$2) throw ex;
    }
    return null;
  }

  Future<(int, bool)> throwDefaultException(Exception ex, int retrys) async {
    if (_throwException == false) return (0, false);
    if (ex is CustomBaseException) return (0, true);
    if (ToastUtils.routerOutletContext == null) {
      throw CustomBaseException('Defina o context do ToastUtils');
    }
    (bool, String) exceptionMessage = ExceptionHelper().getExceptionMessage(ex);
    if (retrys > 0 && exceptionMessage.$1 == true) return (retrys, true);
    try {
      ErrorUtils.showErrorDialog(
        ToastUtils.routerOutletContext!,
        [exceptionMessage.$2],
      );
      loading?.closeDefault();
      return (0, true);
    } on Exception catch (_) {
      return (0, false);
    }
  }

  Future<bool> throwResponseError(Response resp) async {
    if (_throwException == false) return false;
    if (ToastUtils.routerOutletContext == null) {
      throw CustomBaseException('Defina o context do ToastUtils');
    }
    List<String> erros = [];
    try {
      ErroPadraoModel erroPadrao = ErroPadraoModel.fromJson(resp.data);
      print(erroPadrao);
      if (erroPadrao.data is List<String>) {
        erros = erroPadrao.data;
      } else if (erroPadrao.data is List<dynamic>) {
        erros = (erroPadrao.data as List<dynamic>)
            .map((e) => e.toString())
            .toList();
      } else if (erroPadrao.data is String) {
        erros.add(erroPadrao.data);
      } else if (erroPadrao.message is String) {
        erros.add(erroPadrao.message ?? '');
      } else if (erroPadrao.Data is String) {
        erros.add(erroPadrao.Data);
      } else if (erroPadrao.Message is String) {
        erros.add(erroPadrao.Message ?? '');
      }
    } catch (ex) {
      erros.add(resp.data.toString());
    }

    try {
      ErrorUtils.showErrorDialog(
        ToastUtils.routerOutletContext!,
        erros,
      );
      loading?.closeDefault();
      return true;
    } on Exception catch (_) {
      return false;
    }
  }

  Future<bool> throwCommandResultError(CommandResultModel cmd) async {
    if (_throwException == false) return false;
    if (ToastUtils.routerOutletContext == null) {
      throw CustomBaseException('Defina o context do ToastUtils');
    }
    try {
      ErroPadraoModel erroPadrao = ErroPadraoModel.fromJson(cmd.toJson());
      List<String> erros = [];
      if (erroPadrao.data is List<String>) {
        erros = erroPadrao.data;
      } else if (erroPadrao.data is List<dynamic>) {
        erros = (erroPadrao.data as List<dynamic>)
            .map((e) => e.toString())
            .toList();
      } else if (erroPadrao.data is String) {
        erros.add(erroPadrao.data);
      } else if (erroPadrao.message is String) {
        erros.add(erroPadrao.message ?? '');
      }
      ErrorUtils.showErrorDialog(
        ToastUtils.routerOutletContext!,
        erros,
      );
      loading?.closeDefault();
      return true;
    } on Exception catch (_) {
      return false;
    }
  }
}
