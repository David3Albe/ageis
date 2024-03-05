import 'package:ageiscme_data/services/localizacao_arsenal/localizacao_arsenal_service.dart';
import 'package:ageiscme_models/main.dart';
import 'package:dependencias_comuns/bloc_export.dart';

class LocalizacaoArsenalPageCubit extends Cubit<LocalizacaoArsenalPageState> {
  final LocalizacaoArsenalService service;
  LocalizacaoArsenalPageCubit({required this.service})
      : super(
          LocalizacaoArsenalPageState(
            localizacoesArsenais: [],
            loading: false,
          ),
        );

  void loadLocalizacaoArsenal() async {
    emit(LocalizacaoArsenalPageState(loading: true, localizacoesArsenais: []));
    try {
      List<LocalizacaoArsenalModel> localizacoesArsenais =
          await service.GetAll();
      emit(
        LocalizacaoArsenalPageState(
          loading: false,
          localizacoesArsenais: localizacoesArsenais,
        ),
      );
    } on Exception catch (ex) {
      emit(
        LocalizacaoArsenalPageState(
          loading: false,
          localizacoesArsenais: [],
          error: ex.toString(),
        ),
      );
    }
  }

  void delete(LocalizacaoArsenalModel localizacaoArsenal) async {
    try {
      (String, LocalizacaoArsenalModel)? result =
          await service.delete(localizacaoArsenal);
      if (result == null) return;

      emit(
        LocalizacaoArsenalPageState(
          loading: false,
          localizacoesArsenais: state.localizacoesArsenais,
          deleted: true,
          message: result.$1,
        ),
      );
    } on Exception catch (ex) {
      emit(
        LocalizacaoArsenalPageState(
          loading: false,
          localizacoesArsenais: state.localizacoesArsenais,
          error: ex.toString(),
        ),
      );
    }
  }
}

class LocalizacaoArsenalPageState {
  final bool loading;
  final bool deleted;
  final List<LocalizacaoArsenalModel> localizacoesArsenais;
  final String error;
  final String message;

  LocalizacaoArsenalPageState({
    required this.loading,
    required this.localizacoesArsenais,
    this.error = '',
    this.deleted = false,
    this.message = '',
  });
}
