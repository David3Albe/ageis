import 'package:ageiscme_data/services/tamanho/tamanho_service.dart';
import 'package:ageiscme_models/main.dart';
import 'package:dependencias_comuns/bloc_export.dart';

class TamanhoPageCubit extends Cubit<TamanhoPageState> {
  final TamanhoService service;
  TamanhoPageCubit({required this.service})
      : super(
          TamanhoPageState(
            tamanhos: [],
            loading: false,
          ),
        );

  void loadTamanho() async {
    emit(TamanhoPageState(loading: true, tamanhos: []));
    try {
      List<TamanhoModel> tamanhos = await service.GetAll();
      emit(TamanhoPageState(loading: false, tamanhos: tamanhos));
    } on Exception catch (ex) {
      emit(
        TamanhoPageState(
          loading: false,
          tamanhos: [],
          error: ex.toString(),
        ),
      );
    }
  }

  void delete(TamanhoModel tamanho) async {
    try {
      (String, TamanhoModel)? result = await service.delete(tamanho);
      if (result == null) return;

      emit(
        TamanhoPageState(
          loading: false,
          tamanhos: state.tamanhos,
          deleted: true,
          message: result.$1,
        ),
      );
    } on Exception catch (ex) {
      emit(
        TamanhoPageState(
          loading: false,
          tamanhos: state.tamanhos,
          error: ex.toString(),
        ),
      );
    }
  }
}

class TamanhoPageState {
  final bool loading;
  final bool deleted;
  final List<TamanhoModel> tamanhos;
  final String error;
  final String message;

  TamanhoPageState({
    required this.loading,
    required this.tamanhos,
    this.error = '',
    this.deleted = false,
    this.message = '',
  });
}
