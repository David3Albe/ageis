import 'package:ageiscme_models/filters/usuario_filter/usuario_filter.dart';
import 'package:dependencias_comuns/bloc_export.dart';

class UsuarioCubitFilter extends Cubit<UsuarioFilter?> {
  UsuarioCubitFilter() : super(null);

  void setFilter(UsuarioFilter filter) {
    emit(filter);
  }
}
