import 'package:ageiscme_data/services/peca/peca_service.dart';
import 'package:ageiscme_models/main.dart';
import 'package:dependencias_comuns/bloc_export.dart';

class PecaPageFrmCubit extends Cubit<PecaPageFrmState> {
  final PecaService service;
  final PecaModel pecaModel;
  PecaPageFrmCubit({
    required this.service,
    required this.pecaModel,
  }) : super(
          PecaPageFrmState(peca: pecaModel),
        );

  void save(
    PecaModel peca,
    void Function(String) onSaved,
  ) async {
    try {
      (String message, PecaModel peca)? result = await service.save(peca);
      if (result == null) return;
      onSaved(result.$1);
      emit(
        PecaPageFrmState(
          message: result.$1,
          saved: true,
          peca: result.$2,
        ),
      );
    } on Exception catch (ex) {
      emit(
        PecaPageFrmState(
          error: ex.toString(),
          peca: peca,
        ),
      );
    }
  }

  void clear() {
    emit(PecaPageFrmState(peca: PecaModel.empty()));
  }
}

class PecaPageFrmState {
  final String error;
  final bool saved;
  final String message;
  final PecaModel peca;

  PecaPageFrmState({
    required this.peca,
    this.error = '',
    this.saved = false,
    this.message = '',
  });
}
