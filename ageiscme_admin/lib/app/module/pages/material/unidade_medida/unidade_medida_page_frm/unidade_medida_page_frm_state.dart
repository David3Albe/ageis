import 'package:ageiscme_data/services/unidade_medida/unidade_medida_service.dart';
import 'package:ageiscme_models/main.dart';
import 'package:dependencias_comuns/bloc_export.dart';

class UnidadeMedidaPageFrmCubit extends Cubit<UnidadeMedidaPageFrmState> {
  final UnidadeMedidaService service;
  final UnidadeMedidaModel unidadeMedidaModel;
  UnidadeMedidaPageFrmCubit({
    required this.service,
    required this.unidadeMedidaModel,
  }) : super(
          UnidadeMedidaPageFrmState(unidadeMedida: unidadeMedidaModel),
        );

  void save(
    UnidadeMedidaModel unidadeMedida,
    void Function(String) onSaved,
  ) async {
    try {
      (String message, UnidadeMedidaModel unidadeMedida)? result =
          await service.save(unidadeMedida);
      if (result == null) return;
      onSaved(result.$1);
      emit(
        UnidadeMedidaPageFrmState(
          message: result.$1,
          saved: true,
          unidadeMedida: result.$2,
        ),
      );
    } on Exception catch (ex) {
      emit(
        UnidadeMedidaPageFrmState(
          error: ex.toString(),
          unidadeMedida: unidadeMedida,
        ),
      );
    }
  }

  void clear() {
    emit(UnidadeMedidaPageFrmState(unidadeMedida: UnidadeMedidaModel.empty()));
  }
}

class UnidadeMedidaPageFrmState {
  final String error;
  final bool saved;
  final String message;
  final UnidadeMedidaModel unidadeMedida;

  UnidadeMedidaPageFrmState({
    required this.unidadeMedida,
    this.error = '',
    this.saved = false,
    this.message = '',
  });
}
