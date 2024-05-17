import 'package:ageiscme_admin/app/module/pages/processo/cancelamento_preparo/states/filter_state.dart';
import 'package:dependencias_comuns/bloc_export.dart';

class FilterCubit extends Cubit<FilterState> {
  FilterCubit()
      : super(
          FilterState(),
        );

  void setItem(String? idEtiqueta) {
    emit(
      FilterState(
        codBarraKit: state.codBarraKit,
        idEtiqueta: idEtiqueta,
      ),
    );
  }

  void setKit(String? codBarraKit) {
    emit(
      FilterState(
        codBarraKit: codBarraKit,
        idEtiqueta: state.idEtiqueta,
      ),
    );
  }
}
