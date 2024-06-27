import 'package:ageiscme_data/services/embalagem/embalagem_service.dart';
import 'package:ageiscme_models/main.dart';
import 'package:dependencias_comuns/bloc_export.dart';

class EmbalagemPageFrmCubit extends Cubit<EmbalagemPageFrmState> {
  final EmbalagemService service;
  final EmbalagemModel embalagemModel;
  EmbalagemPageFrmCubit({
    required this.service,
    required this.embalagemModel,
  }) : super(
          EmbalagemPageFrmState(embalagem: embalagemModel),
        );

  void save(
    EmbalagemModel embalagem,
    void Function(String) onSaved,
  ) async {
    try {
      (String message, EmbalagemModel embalagem)? result =
          await service.save(embalagem);
      if (result == null) return;
      onSaved(result.$1);
      emit(
        EmbalagemPageFrmState(
          message: result.$1,
          saved: true,
          embalagem: result.$2,
        ),
      );
    } on Exception catch (ex) {
      emit(
        EmbalagemPageFrmState(
          error: ex.toString(),
          embalagem: embalagem,
        ),
      );
    }
  }

  void clear() {
    emit(EmbalagemPageFrmState(embalagem: EmbalagemModel.empty()));
  }
}

class EmbalagemPageFrmState {
  final String error;
  final bool saved;
  final String message;
  final EmbalagemModel embalagem;

  EmbalagemPageFrmState({
    required this.embalagem,
    this.error = '',
    this.saved = false,
    this.message = '',
  });
}
