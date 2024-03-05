import 'package:ageiscme_data/services/peca/peca_service.dart';
import 'package:ageiscme_models/main.dart';
import 'package:dependencias_comuns/bloc_export.dart';

class PecaPageCubit extends Cubit<PecaPageState> {
  final PecaService service;
  PecaPageCubit({required this.service})
      : super(
          PecaPageState(
            pecas: [],
            loading: false,
          ),
        );

  void loadPeca() async {
    emit(PecaPageState(loading: true, pecas: []));
    try {
      List<PecaModel> pecas = await service.GetAll();
      emit(PecaPageState(loading: false, pecas: pecas));
    } on Exception catch (ex) {
      emit(
        PecaPageState(
          loading: false,
          pecas: [],
          error: ex.toString(),
        ),
      );
    }
  }

  void delete(PecaModel peca) async {
    try {
      (String, PecaModel)? result = await service.delete(peca);
      if (result == null) return;

      emit(
        PecaPageState(
          loading: false,
          pecas: state.pecas,
          deleted: true,
          message: result.$1,
        ),
      );
    } on Exception catch (ex) {
      emit(
        PecaPageState(
          loading: false,
          pecas: state.pecas,
          error: ex.toString(),
        ),
      );
    }
  }
}

class PecaPageState {
  final bool loading;
  final bool deleted;
  final List<PecaModel> pecas;
  final String error;
  final String message;

  PecaPageState({
    required this.loading,
    required this.pecas,
    this.error = '',
    this.deleted = false,
    this.message = '',
  });
}
