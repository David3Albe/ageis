import 'package:dependencias_comuns/main.dart';

class ExceptionHelper {
  (bool, String) getExceptionMessage(Exception exception) {
    (bool, String)? message = _getDioExceptionMessage(exception);
    if (message != null) return message;

    return (false, exception.toString());
  }

  (bool, String)? _getDioExceptionMessage(Exception exception) {
    if (exception.runtimeType != DioException) return null;
    DioException dioException = exception as DioException;
    if (dioException.type == DioExceptionType.connectionError) {
      return (
        true,
        'Não foi possível realizar a requisição, possivelmente o IP de chamada a API está incorreto, entre em contato com o suporte'
      );
    }
    if (dioException.type == DioExceptionType.badResponse) {
      return (false,dioException.response?.data?['Message']);
    }
    return null;
  }
}
