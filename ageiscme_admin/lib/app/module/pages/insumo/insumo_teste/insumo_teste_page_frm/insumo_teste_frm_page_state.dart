import 'package:ageiscme_data/services/insumo_teste/insumo_teste_service.dart';
import 'package:ageiscme_models/models/insumo_teste/insumo_teste_model.dart';
import 'package:dependencias_comuns/bloc_export.dart';

class InsumoTestePageFrmCubit extends Cubit<InsumoTestePageFrmState> {
  final InsumoTesteService service;
  final InsumoTesteModel insumoTesteModel;
  InsumoTestePageFrmCubit({
    required this.service,
    required this.insumoTesteModel,
  }) : super(
          InsumoTestePageFrmState(insumoTeste: insumoTesteModel),
        );

  void save(InsumoTesteModel insumoTeste, void Function(String) onSaved) async {
    try {
      (String message, InsumoTesteModel insumoTeste)? result =
          await service.save(insumoTeste);
      if (result == null) return;
      onSaved(result.$1);
      emit(
        InsumoTestePageFrmState(
          message: result.$1,
          saved: true,
          insumoTeste: result.$2,
        ),
      );
    } on Exception catch (ex) {
      emit(
        InsumoTestePageFrmState(
          error: ex.toString(),
          insumoTeste: insumoTeste,
        ),
      );
    }
  }

  void clear() {
    emit(
      InsumoTestePageFrmState(
        insumoTeste: InsumoTesteModel.empty(),
      ),
    );
  }
}

class InsumoTestePageFrmState {
  final String error;
  final bool saved;
  final String message;
  final InsumoTesteModel insumoTeste;

  InsumoTestePageFrmState({
    required this.insumoTeste,
    this.error = '',
    this.saved = false,
    this.message = '',
  });
}
