import 'package:ageiscme_data/services/arsenal/arsenal_estoque_service.dart';
import 'package:ageiscme_models/main.dart';
import 'package:dependencias_comuns/bloc_export.dart';

class ArsenalEstoquePageCubit extends Cubit<ArsenalEstoquePageState> {
  final ArsenalEstoqueService service;
  ArsenalEstoquePageCubit({required this.service})
      : super(
          ArsenalEstoquePageState(
            arsenaisEstoques: [],
            loading: false,
          ),
        );

  void loadArsenalEstoque() async {
    emit(ArsenalEstoquePageState(loading: true, arsenaisEstoques: []));
    try {
      List<ArsenalEstoqueModel> arsenaisEstoques = await service.GetAll();
      emit(
        ArsenalEstoquePageState(
          loading: false,
          arsenaisEstoques: arsenaisEstoques,
        ),
      );
    } on Exception catch (ex) {
      emit(
        ArsenalEstoquePageState(
          loading: false,
          arsenaisEstoques: [],
          error: ex.toString(),
        ),
      );
    }
  }

  void delete(ArsenalEstoqueModel arsenalEstoque) async {
    try {
      (String, ArsenalEstoqueModel)? result =
          await service.delete(arsenalEstoque);
      if (result == null) return;

      emit(
        ArsenalEstoquePageState(
          loading: false,
          arsenaisEstoques: state.arsenaisEstoques,
          deleted: true,
          message: result.$1,
        ),
      );
    } on Exception catch (ex) {
      emit(
        ArsenalEstoquePageState(
          loading: false,
          arsenaisEstoques: state.arsenaisEstoques,
          error: ex.toString(),
        ),
      );
    }
  }
}

class ArsenalEstoquePageState {
  final bool loading;
  final bool deleted;
  final List<ArsenalEstoqueModel> arsenaisEstoques;
  final String error;
  final String message;

  ArsenalEstoquePageState({
    required this.loading,
    required this.arsenaisEstoques,
    this.error = '',
    this.deleted = false,
    this.message = '',
  });
}
