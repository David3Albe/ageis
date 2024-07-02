import 'package:ageiscme_data/services/afastamento/afastamento_service.dart';
import 'package:ageiscme_models/models/afastamento/afastamento_model.dart';
import 'package:dependencias_comuns/bloc_export.dart';

class AfastamentoPageFrmCubit
    extends Cubit<AfastamentoPageFrmState> {
  final AfastamentoService service;
  final AfastamentoModel afastamento;
  AfastamentoPageFrmCubit({
    required this.service,
    required this.afastamento,
  }) : super(
          AfastamentoPageFrmState(
            afastamento: afastamento,
          ),
        );

  void save(
    AfastamentoModel afastamento,
    final void Function(String) onSaved,
  ) async {
    try {
      (
        String message,
        AfastamentoModel afastamento
      )? result = await service.save(afastamento);
      if (result == null) return;
      onSaved(result.$1);
      emit(
        AfastamentoPageFrmState(
          message: result.$1,
          saved: true,
          afastamento: result.$2,
        ),
      );
    } on Exception catch (ex) {
      emit(
        AfastamentoPageFrmState(
          error: ex.toString(),
          afastamento: afastamento,
        ),
      );
    }
  }

  void clear() {
    emit(
      AfastamentoPageFrmState(
        afastamento: AfastamentoModel.empty(),
      ),
    );
  }
}

class AfastamentoPageFrmState {
  final String error;
  final bool saved;
  final String message;
  final AfastamentoModel afastamento;

  AfastamentoPageFrmState({
    required this.afastamento,
    this.error = '',
    this.saved = false,
    this.message = '',
  });
}
