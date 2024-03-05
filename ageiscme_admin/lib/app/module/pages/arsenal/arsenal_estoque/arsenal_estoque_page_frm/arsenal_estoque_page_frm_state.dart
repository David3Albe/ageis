import 'package:ageiscme_data/services/arsenal/arsenal_estoque_service.dart';
import 'package:ageiscme_models/main.dart';
import 'package:dependencias_comuns/bloc_export.dart';

class ArsenalEstoquePageFrmCubit extends Cubit<ArsenalEstoquePageFrmState> {
  final ArsenalEstoqueService service;
  final ArsenalEstoqueModel arsenalEstoqueModel;
  ArsenalEstoquePageFrmCubit({
    required this.service,
    required this.arsenalEstoqueModel,
  }) : super(
          ArsenalEstoquePageFrmState(arsenalEstoque: arsenalEstoqueModel),
        );

  void save(ArsenalEstoqueModel arsenalEstoque) async {
    try {
      (String message, ArsenalEstoqueModel arsenalEstoque)? result =
          await service.save(arsenalEstoque);
      if (result == null) return;
      emit(
        ArsenalEstoquePageFrmState(
          message: result.$1,
          saved: true,
          arsenalEstoque: result.$2,
        ),
      );
    } on Exception catch (_) {}
  }

  void clear() {
    emit(
      ArsenalEstoquePageFrmState(
        arsenalEstoque: ArsenalEstoqueModel.empty(),
      ),
    );
  }
}

class ArsenalEstoquePageFrmState {
  final String error;
  final bool saved;
  final String message;
  final ArsenalEstoqueModel arsenalEstoque;

  ArsenalEstoquePageFrmState({
    required this.arsenalEstoque,
    this.error = '',
    this.saved = false,
    this.message = '',
  });
}
