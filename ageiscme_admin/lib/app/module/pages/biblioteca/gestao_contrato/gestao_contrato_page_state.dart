import 'package:ageiscme_data/services/gestao_contrato/gestao_contrato_service.dart';
import 'package:ageiscme_models/main.dart';
import 'package:dependencias_comuns/bloc_export.dart';

class GestaoContratoPageCubit extends Cubit<GestaoContratoPageState> {
  final GestaoContratoService service;
  GestaoContratoPageCubit({required this.service})
      : super(
          GestaoContratoPageState(
            gestoesContrato: [],
            loading: false,
          ),
        );

  void loadGestaoContrato() async {
    emit(GestaoContratoPageState(loading: true, gestoesContrato: []));
    try {
      List<GestaoContratoModel> gestoesContrato = await service.GetAll();
      emit(
        GestaoContratoPageState(
          loading: false,
          gestoesContrato: gestoesContrato,
        ),
      );
    } on Exception catch (ex) {
      emit(
        GestaoContratoPageState(
          loading: false,
          gestoesContrato: [],
          error: ex.toString(),
        ),
      );
    }
  }

  void delete(GestaoContratoModel gestaoContrato) async {
    try {
      (String, GestaoContratoModel)? result =
          await service.delete(gestaoContrato);
      if (result == null) return;

      emit(
        GestaoContratoPageState(
          loading: false,
          gestoesContrato: state.gestoesContrato,
          deleted: true,
          message: result.$1,
        ),
      );
    } on Exception catch (ex) {
      emit(
        GestaoContratoPageState(
          loading: false,
          gestoesContrato: state.gestoesContrato,
          error: ex.toString(),
        ),
      );
    }
  }
}

class GestaoContratoPageState {
  final bool loading;
  final bool deleted;
  final List<GestaoContratoModel> gestoesContrato;
  final String error;
  final String message;

  GestaoContratoPageState({
    required this.loading,
    required this.gestoesContrato,
    this.error = '',
    this.deleted = false,
    this.message = '',
  });
}
