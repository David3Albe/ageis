import 'package:ageiscme_data/services/servico_tipo/servico_tipo_service.dart';
import 'package:ageiscme_models/main.dart';
import 'package:dependencias_comuns/bloc_export.dart';

class ServicoTipoPageFrmCubit extends Cubit<ServicoTipoPageFrmState> {
  final ServicoTipoService service;
  final ServicoTipoModel servicoTipoModel;
  ServicoTipoPageFrmCubit({
    required this.service,
    required this.servicoTipoModel,
  }) : super(
          ServicoTipoPageFrmState(servicoTipo: servicoTipoModel),
        );

  void save(
    ServicoTipoModel servicoTipo,
    void Function(String) onSaved,
  ) async {
    try {
      (String message, ServicoTipoModel servicoTipo)? result =
          await service.save(servicoTipo);
      if (result == null) return;
      onSaved(result.$1);
      emit(
        ServicoTipoPageFrmState(
          message: result.$1,
          saved: true,
          servicoTipo: result.$2,
        ),
      );
    } on Exception catch (ex) {
      emit(
        ServicoTipoPageFrmState(
          error: ex.toString(),
          servicoTipo: servicoTipo,
        ),
      );
    }
  }

  void clear() {
    emit(ServicoTipoPageFrmState(servicoTipo: ServicoTipoModel.empty()));
  }
}

class ServicoTipoPageFrmState {
  final String error;
  final bool saved;
  final String message;
  final ServicoTipoModel servicoTipo;

  ServicoTipoPageFrmState({
    required this.servicoTipo,
    this.error = '',
    this.saved = false,
    this.message = '',
  });
}
