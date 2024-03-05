import 'package:ageiscme_data/services/tipo_afastamento/tipo_afastamento_service.dart';
import 'package:ageiscme_models/main.dart';
import 'package:dependencias_comuns/bloc_export.dart';

class TipoAfastamentoPageCubit extends Cubit<TipoAfastamentoPageState> {
  final TipoAfastamentoService service;
  TipoAfastamentoPageCubit({required this.service})
      : super(
          TipoAfastamentoPageState(
            tiposAfastamento: [],
            loading: false,
          ),
        );

  void loadTipoAfastamento() async {
    emit(TipoAfastamentoPageState(loading: true, tiposAfastamento: []));
    try {
      List<TipoAfastamentoModel> tiposAfastamento = await service.GetAll();
      emit(
        TipoAfastamentoPageState(
          loading: false,
          tiposAfastamento: tiposAfastamento,
        ),
      );
    } on Exception catch (ex) {
      emit(
        TipoAfastamentoPageState(
          loading: false,
          tiposAfastamento: [],
          error: ex.toString(),
        ),
      );
    }
  }

  void delete(TipoAfastamentoModel tipoAfastamento) async {
    try {
      (String, TipoAfastamentoModel)? result =
          await service.delete(tipoAfastamento);
      if (result == null) return;
      emit(
        TipoAfastamentoPageState(
          loading: false,
          tiposAfastamento: state.tiposAfastamento,
          deleted: true,
          message: result.$1,
        ),
      );
    } on Exception catch (ex) {
      emit(
        TipoAfastamentoPageState(
          loading: false,
          tiposAfastamento: state.tiposAfastamento,
          error: ex.toString(),
        ),
      );
    }
  }
}

class TipoAfastamentoPageState {
  final bool loading;
  final bool deleted;
  final List<TipoAfastamentoModel> tiposAfastamento;
  final String error;
  final String message;

  TipoAfastamentoPageState({
    required this.loading,
    required this.tiposAfastamento,
    this.error = '',
    this.deleted = false,
    this.message = '',
  });
}
