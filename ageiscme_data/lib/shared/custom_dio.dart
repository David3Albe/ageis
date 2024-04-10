import 'package:ageiscme_data/shared/app_config.dart';
import 'package:ageiscme_data/shared/exception_helper.dart';
import 'package:ageiscme_models/models/erro_padrao/erro_padrao_model.dart';
import 'package:ageiscme_models/models/result/command_result_model.dart';
import 'package:compartilhados/componentes/loading/loading_controller.dart';
import 'package:compartilhados/componentes/toasts/error_dialog.dart';
import 'package:compartilhados/componentes/toasts/toast_utils.dart';
import 'package:compartilhados/exceptions/custom_base_exception.dart';
import 'package:dependencias_comuns/main.dart';

class CustomDio {
  CustomDio({this.loading});

  Dio _dio = Dio(
    BaseOptions(
      connectTimeout: const Duration(seconds: 60),
      receiveTimeout: const Duration(seconds: 60),
    ),
  );

  bool _throwException = true;

  LoadingController? loading;

  void DisableExceptionService() => _throwException = false;

  void EnableExceptionService() => _throwException = true;

  static const int retrys = 10;

  Future<String> get _route async =>
      (await AppConfig.forEnvironment(false)).apiUrl;

  Future<List<dynamic>> getList(String route) async {
    String baseRoute = await _route;
    Response resp = await _dio.get('$baseRoute$route');
    if (!resp.statusCode.toString().startsWith('2')) {
      bool throwed = await throwResponseError(resp);
      if (!throwed) throw CustomBaseException(resp.data);
    }
    return resp.data;
  }

  Future<dynamic> getOne(String route) async {
    String baseRoute = await _route;
    Response resp = await _dio.get('$baseRoute$route');
    if (!resp.statusCode.toString().startsWith('2')) {
      bool throwed = await throwResponseError(resp);
      if (!throwed) throw CustomBaseException(resp.data);
    }
    return resp.data;
  }

  Future<dynamic> postOne(String route, dynamic objeto) async {
    String baseRoute = await _route;
    Response resp = await _dio.post('$baseRoute$route', data: objeto.toJson());
    if (!resp.statusCode.toString().startsWith('2')) {
      bool throwed = await throwResponseError(resp);
      if (!throwed) throw CustomBaseException(resp.data);
    }
    return resp.data;
  }

  Future<List<dynamic>> postList(String route, dynamic objeto) async {
    String baseRoute = await _route;
    Response resp = await _dio.post('$baseRoute$route', data: objeto.toJson());
    if (!resp.statusCode.toString().startsWith('2')) {
      bool throwed = await throwResponseError(resp);
      if (!throwed) throw CustomBaseException(resp.data);
    }
    return resp.data;
  }

  Future<dynamic> countFilter(String route, dynamic objeto) async {
    String baseRoute = await _route;
    Response resp = await _dio.post('$baseRoute$route', data: objeto.toJson());
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
    String baseRoute = await _route;
    try {
      Response resp =
          await _dio.post('$baseRoute$route', data: objeto.toJson());
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
    String baseRoute = await _route;
    try {
      Response resp =
          await _dio.post('$baseRoute$route', data: objeto.toJson());

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
    String baseRoute = await _route;
    try {
      Response resp =
          await _dio.post('$baseRoute$route', data: objeto.toJson());

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
    String baseRoute = await _route;
    try {
      Response resp =
          await _dio.delete('$baseRoute$route', data: objeto.toJson());
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
      return (result.message, deserializerFunction(resp.data));
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
      await ErrorUtils.showErrorDialog(
        ToastUtils.routerOutletContext!,
        [exceptionMessage.$2],
      ).then((value) {
        loading?.closeDefault();
      });
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

    try {
      await ErrorUtils.showErrorDialog(
        ToastUtils.routerOutletContext!,
        [resp.data],
      ).then((value) {
        loading?.closeDefault();
      });
      return true;
    } on Exception catch (_) {
      return false;
    }
  }

  Future<bool> throwCommandResultError(CommandResultModel cmd)  async {
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
      await ErrorUtils.showErrorDialog(
        ToastUtils.routerOutletContext!,
        erros,
      ).then((value) {
        loading?.closeDefault();
      });
      return true;
    } on Exception catch (_) {
      return false;
    }
  }
}
