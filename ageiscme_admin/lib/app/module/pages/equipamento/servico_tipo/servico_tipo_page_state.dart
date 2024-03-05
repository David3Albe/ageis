import 'package:ageiscme_data/services/servico_tipo/servico_tipo_service.dart';
import 'package:ageiscme_models/main.dart';
import 'package:dependencias_comuns/bloc_export.dart';

class ServicoTipoPageCubit extends Cubit<ServicoTipoPageState> {
  final ServicoTipoService service;
  ServicoTipoPageCubit({required this.service})
      : super(
          ServicoTipoPageState(
            servicosTipo: [],
            loading: false,
          ),
        );

  void loadServicoTipo() async {
    emit(ServicoTipoPageState(loading: true, servicosTipo: []));
    try {
      List<ServicoTipoModel> servicosTipo = await service.GetAll();
      emit(ServicoTipoPageState(loading: false, servicosTipo: servicosTipo));
    } on Exception catch (ex) {
      emit(
        ServicoTipoPageState(
          loading: false,
          servicosTipo: [],
          error: ex.toString(),
        ),
      );
    }
  }

  void delete(ServicoTipoModel servicoTipo) async {
    try {
      (String, ServicoTipoModel)? result = await service.delete(servicoTipo);
      if (result == null) return;
      emit(
        ServicoTipoPageState(
          loading: false,
          servicosTipo: state.servicosTipo,
          deleted: true,
          message: result.$1,
        ),
      );
    } on Exception catch (ex) {
      emit(
        ServicoTipoPageState(
          loading: false,
          servicosTipo: state.servicosTipo,
          error: ex.toString(),
        ),
      );
    }
  }
}

class ServicoTipoPageState {
  final bool loading;
  final bool deleted;
  final List<ServicoTipoModel> servicosTipo;
  final String error;
  final String message;

  ServicoTipoPageState({
    required this.loading,
    required this.servicosTipo,
    this.error = '',
    this.deleted = false,
    this.message = '',
  });
}
