import 'package:ageiscme_data/services/tipo_afastamento/tipo_afastamento_service.dart';
import 'package:ageiscme_models/main.dart';
import 'package:dependencias_comuns/bloc_export.dart';

class TipoAfastamentoPageFrmCubit extends Cubit<TipoAfastamentoPageFrmState> {
  final TipoAfastamentoService service;
  final TipoAfastamentoModel tipoAfastamentoModel;
  TipoAfastamentoPageFrmCubit({
    required this.service,
    required this.tipoAfastamentoModel,
  }) : super(
          TipoAfastamentoPageFrmState(tipoAfastamento: tipoAfastamentoModel),
        );

  void save(
    TipoAfastamentoModel tipoAfastamento,
    void Function(String) onSaved,
  ) async {
    try {
      (String message, TipoAfastamentoModel tipoAfastamento)? result =
          await service.save(tipoAfastamento);
      if (result == null) return;
      onSaved(result.$1);
      emit(
        TipoAfastamentoPageFrmState(
          message: result.$1,
          saved: true,
          tipoAfastamento: result.$2,
        ),
      );
    } on Exception catch (ex) {
      emit(
        TipoAfastamentoPageFrmState(
          error: ex.toString(),
          tipoAfastamento: tipoAfastamento,
        ),
      );
    }
  }

  void clear() {
    emit(
      TipoAfastamentoPageFrmState(
        tipoAfastamento: TipoAfastamentoModel.empty(),
      ),
    );
  }
}

class TipoAfastamentoPageFrmState {
  final String error;
  final bool saved;
  final String message;
  final TipoAfastamentoModel tipoAfastamento;

  TipoAfastamentoPageFrmState({
    required this.tipoAfastamento,
    this.error = '',
    this.saved = false,
    this.message = '',
  });
}
