import 'package:ageiscme_data/services/etiqueta/etiqueta_service.dart';
import 'package:ageiscme_models/main.dart';
import 'package:dependencias_comuns/bloc_export.dart';

class EtiquetaCubit extends Cubit<EtiquetaState> {
  EtiquetaCubit() : super(EtiquetaState(etiquetas: []));

  void loadAll() async {
    emit(EtiquetaState(etiquetas: state.etiquetas, loading: true));
    emit(EtiquetaState(etiquetas: await EtiquetaService().GetAll()));
  }

  void clear() => emit(EtiquetaState(etiquetas: []));
}

class EtiquetaState {
  bool loading;
  List<EtiquetaModel> etiquetas;

  EtiquetaState({required this.etiquetas, this.loading = false});
}
