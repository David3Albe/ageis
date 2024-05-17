import 'package:ageiscme_data/services/processo_leitura_andamento/processo_leitura_andamento_service.dart';
import 'package:ageiscme_models/filters/processo_leitura_andamento/processo_leitura_andamento_filter.dart';
import 'package:ageiscme_models/models/processo_leitura_andamento/processo_leitura_andamento_model.dart';
import 'package:dependencias_comuns/bloc_export.dart';

class LiberacaoLeiturasPageCubit extends Cubit<LiberacaoLeiturasPageState> {
  final ProcessoLeituraAndamentoService service;
  LiberacaoLeiturasPageCubit({required this.service})
      : super(
          LiberacaoLeiturasPageState(
            leiturasEmAndamento: [],
            loading: false,
          ),
        );

  void loadLeiturasEmAndamento() async {
    emit(LiberacaoLeiturasPageState(loading: true, leiturasEmAndamento: []));
    try {
      List<ProcessoLeituraAndamentoModel> leiturasEmAndamento =
          await service.FilterNoLock(
        ProcessoLeituraAndamentoFilter(
          carregarUsuario: true,
        ),
      );
      emit(
        LiberacaoLeiturasPageState(
          loading: false,
          leiturasEmAndamento: leiturasEmAndamento,
        ),
      );
    } on Exception catch (ex) {
      emit(
        LiberacaoLeiturasPageState(
          loading: false,
          leiturasEmAndamento: [],
          error: ex.toString(),
        ),
      );
    }
  }

  void delete(ProcessoLeituraAndamentoModel leituraAndamentoModel) async {
    try {
      (String, ProcessoLeituraAndamentoModel)? result =
          await service.delete(leituraAndamentoModel);
      if (result == null) return;

      emit(
        LiberacaoLeiturasPageState(
          loading: false,
          leiturasEmAndamento: state.leiturasEmAndamento,
          deleted: true,
          message: result.$1,
        ),
      );
    } on Exception catch (ex) {
      emit(
        LiberacaoLeiturasPageState(
          loading: false,
          leiturasEmAndamento: state.leiturasEmAndamento,
          error: ex.toString(),
        ),
      );
    }
  }
}

class LiberacaoLeiturasPageState {
  final bool loading;
  final bool deleted;
  final List<ProcessoLeituraAndamentoModel> leiturasEmAndamento;
  final String error;
  final String message;

  LiberacaoLeiturasPageState({
    required this.loading,
    required this.leiturasEmAndamento,
    this.error = '',
    this.deleted = false,
    this.message = '',
  });
}
