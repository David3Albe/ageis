import 'package:ageiscme_data/services/tamanho/tamanho_service.dart';
import 'package:ageiscme_models/main.dart';
import 'package:dependencias_comuns/bloc_export.dart';

class TamanhoPageFrmCubit extends Cubit<TamanhoPageFrmState> {
  final TamanhoService service;
  final TamanhoModel tamanhoModel;
  TamanhoPageFrmCubit({
    required this.service,
    required this.tamanhoModel,
  }) : super(TamanhoPageFrmState(tamanho: tamanhoModel));

  void save(TamanhoModel tamanho, void Function(String) onSaved) async {
    try {
      (String message, TamanhoModel tamanho)? result =
          await service.save(tamanho);
      if (result == null) return;
      onSaved(result.$1);
      emit(
        TamanhoPageFrmState(
          message: result.$1,
          saved: true,
          tamanho: result.$2,
        ),
      );
    } on Exception catch (ex) {
      emit(
        TamanhoPageFrmState(
          error: ex.toString(),
          tamanho: tamanho,
        ),
      );
    }
  }

  void clear() {
    emit(TamanhoPageFrmState(tamanho: TamanhoModel.empty()));
  }
}

class TamanhoPageFrmState {
  final String error;
  final bool saved;
  final String message;
  final TamanhoModel tamanho;

  TamanhoPageFrmState({
    required this.tamanho,
    this.error = '',
    this.saved = false,
    this.message = '',
  });
}
