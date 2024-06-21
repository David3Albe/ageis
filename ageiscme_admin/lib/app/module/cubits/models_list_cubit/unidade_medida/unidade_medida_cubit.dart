import 'package:ageiscme_data/services/unidade_medida/unidade_medida_service.dart';
import 'package:ageiscme_models/main.dart';
import 'package:dependencias_comuns/bloc_export.dart';

class UnidadeMedidaCubit extends Cubit<UnidadeMedidaState> {
  UnidadeMedidaCubit() : super(UnidadeMedidaState(unidadeMedidas: []));

  void loadAll() async {
    emit(
      UnidadeMedidaState(
        unidadeMedidas: state.unidadeMedidas,
        loading: true,
      ),
    );
    emit(
      UnidadeMedidaState(
        unidadeMedidas: await UnidadeMedidaService().GetAll(),
      ),
    );
  }

  void clear() => emit(UnidadeMedidaState(unidadeMedidas: []));
}

class UnidadeMedidaState {
  bool loading;
  List<UnidadeMedidaModel> unidadeMedidas;

  UnidadeMedidaState({required this.unidadeMedidas, this.loading = false});
}
