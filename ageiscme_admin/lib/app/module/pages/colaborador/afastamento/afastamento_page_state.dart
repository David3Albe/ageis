import 'package:ageiscme_data/services/afastamento/afastamento_service.dart';
import 'package:ageiscme_models/filters/afastamento/afastamento_filter.dart';
import 'package:ageiscme_models/models/afastamento/afastamento_model.dart';
import 'package:dependencias_comuns/bloc_export.dart';

class AfastamentoPageCubit
    extends Cubit<AfastamentoPageState> {
  final AfastamentoService service;
  AfastamentoPageCubit({required this.service})
      : super(
          AfastamentoPageState(
            afastamentos: [],
            loading: false,
          ),
        );

  Future getScreenData(AfastamentoFilter filter) async {
    emit(
      AfastamentoPageState(
        loading: true,
        afastamentos: [],
      ),
    );
    try {
      List<AfastamentoModel> afastamentos =
          await service.GetScreenData(filter);
      emit(
        AfastamentoPageState(
          loading: false,
          afastamentos: afastamentos,
        ),
      );
    } on Exception catch (ex) {
      emit(
        AfastamentoPageState(
          loading: false,
          afastamentos: [],
          error: ex.toString(),
        ),
      );
    }
  }

  void delete(AfastamentoModel afastamento) async {
    try {
      (String, AfastamentoModel)? result =
          await service.delete(afastamento);
      if (result == null) return;
      emit(
        AfastamentoPageState(
          loading: false,
          afastamentos: state.afastamentos,
          deleted: true,
          message: result.$1,
        ),
      );
    } on Exception catch (ex) {
      emit(
        AfastamentoPageState(
          loading: false,
          afastamentos: state.afastamentos,
          error: ex.toString(),
        ),
      );
    }
  }
}

class AfastamentoPageState {
  final bool loading;
  final bool deleted;
  final List<AfastamentoModel> afastamentos;
  final String error;
  final String message;

  AfastamentoPageState({
    required this.loading,
    required this.afastamentos,
    this.error = '',
    this.deleted = false,
    this.message = '',
  });
}
