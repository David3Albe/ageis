import 'package:ageiscme_data/services/unidade_medida/unidade_medida_service.dart';
import 'package:ageiscme_models/models/unidade_medida/unidade_medida_model.dart';
import 'package:dependencias_comuns/bloc_export.dart';

class UnidadeMedidaPageCubit extends Cubit<UnidadeMedidaPageState> {
  final UnidadeMedidaService service;
  UnidadeMedidaPageCubit({required this.service})
      : super(
          UnidadeMedidaPageState(
            unidadesMedida: [],
            loading: false,
          ),
        );

  void loadUnidadeMedida() async {
    emit(UnidadeMedidaPageState(loading: true, unidadesMedida: []));
    try {
      List<UnidadeMedidaModel> unidadesMedida = await service.GetAll();
      emit(
        UnidadeMedidaPageState(
          loading: false,
          unidadesMedida: unidadesMedida,
        ),
      );
    } on Exception catch (ex) {
      emit(
        UnidadeMedidaPageState(
          loading: false,
          unidadesMedida: [],
          error: ex.toString(),
        ),
      );
    }
  }

  void delete(UnidadeMedidaModel unidadeMedida) async {
    try {
      (String, UnidadeMedidaModel)? result = await service.delete(unidadeMedida);
      if (result == null) return;

      emit(
        UnidadeMedidaPageState(
          loading: false,
          unidadesMedida: state.unidadesMedida,
          deleted: true,
          message: result.$1,
        ),
      );
    } on Exception catch (ex) {
      emit(
        UnidadeMedidaPageState(
          loading: false,
          unidadesMedida: state.unidadesMedida,
          error: ex.toString(),
        ),
      );
    }
  }
}

class UnidadeMedidaPageState {
  final bool loading;
  final bool deleted;
  final List<UnidadeMedidaModel> unidadesMedida;
  final String error;
  final String message;

  UnidadeMedidaPageState({
    required this.loading,
    required this.unidadesMedida,
    this.error = '',
    this.deleted = false,
    this.message = '',
  });
}
