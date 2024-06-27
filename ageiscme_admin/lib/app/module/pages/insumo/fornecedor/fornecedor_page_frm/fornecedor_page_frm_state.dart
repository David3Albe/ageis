import 'package:ageiscme_data/services/fornecedor/fornecedor_service.dart';
import 'package:ageiscme_models/main.dart';
import 'package:dependencias_comuns/bloc_export.dart';

class FornecedorPageFrmCubit extends Cubit<FornecedorPageFrmState> {
  final FornecedorService service;
  final FornecedorModel fornecedorModel;
  FornecedorPageFrmCubit({
    required this.service,
    required this.fornecedorModel,
  }) : super(
          FornecedorPageFrmState(fornecedor: fornecedorModel),
        );

  void save(
    FornecedorModel fornecedor,
    void Function(String) onSaved,
  ) async {
    try {
      (String message, FornecedorModel fornecedor)? result =
          await service.save(fornecedor);
      if (result == null) return;
      onSaved(result.$1);
      emit(
        FornecedorPageFrmState(
          message: result.$1,
          saved: true,
          fornecedor: result.$2,
        ),
      );
    } on Exception catch (ex) {
      emit(
        FornecedorPageFrmState(
          error: ex.toString(),
          fornecedor: fornecedor,
        ),
      );
    }
  }

  void clear() {
    emit(FornecedorPageFrmState(fornecedor: FornecedorModel.empty()));
  }
}

class FornecedorPageFrmState {
  final String error;
  final bool saved;
  final String message;
  final FornecedorModel fornecedor;

  FornecedorPageFrmState({
    required this.fornecedor,
    this.error = '',
    this.saved = false,
    this.message = '',
  });
}
