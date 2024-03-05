import 'package:ageiscme_data/services/treinamento_registro/treinamento_registro_service.dart';
import 'package:ageiscme_models/main.dart';
import 'package:dependencias_comuns/bloc_export.dart';

class TreinamentoRegistroPageFrmCubit
    extends Cubit<TreinamentoRegistroPageFrmState> {
  final TreinamentoRegistroService service;
  final TreinamentoRegistroModel treinamentoRegistroModel;
  TreinamentoRegistroPageFrmCubit({
    required this.service,
    required this.treinamentoRegistroModel,
  }) : super(
          TreinamentoRegistroPageFrmState(
            treinamentoRegistro: treinamentoRegistroModel,
          ),
        );

  void save(TreinamentoRegistroModel treinamentoRegistro) async {
    try {
      (String message, TreinamentoRegistroModel treinamentoRegistro)? result =
          await service.save(treinamentoRegistro);
      if (result == null) return;
      emit(
        TreinamentoRegistroPageFrmState(
          message: result.$1,
          saved: true,
          treinamentoRegistro: result.$2,
        ),
      );
    } on Exception catch (ex) {
      emit(
        TreinamentoRegistroPageFrmState(
          error: ex.toString(),
          treinamentoRegistro: treinamentoRegistro,
        ),
      );
    }
  }

  void clear() {
    emit(
      TreinamentoRegistroPageFrmState(
        treinamentoRegistro: TreinamentoRegistroModel.empty(),
      ),
    );
  }
}

class TreinamentoRegistroPageFrmState {
  final String error;
  final bool saved;
  final String message;
  final TreinamentoRegistroModel treinamentoRegistro;

  TreinamentoRegistroPageFrmState({
    required this.treinamentoRegistro,
    this.error = '',
    this.saved = false,
    this.message = '',
  });
}
