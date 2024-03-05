import 'package:ageiscme_data/services/embalagem/embalagem_service.dart';
import 'package:ageiscme_models/main.dart';
import 'package:dependencias_comuns/bloc_export.dart';

class EmbalagemPageCubit extends Cubit<EmbalagemPageState> {
  final EmbalagemService service;
  EmbalagemPageCubit({required this.service})
      : super(
          EmbalagemPageState(
            embalagens: [],
            loading: false,
          ),
        );

  void loadEmbalagem() async {
    emit(EmbalagemPageState(loading: true, embalagens: []));
    try {
      List<EmbalagemModel> embalagens = await service.GetAll();
      emit(EmbalagemPageState(loading: false, embalagens: embalagens));
    } on Exception catch (ex) {
      emit(
        EmbalagemPageState(
          loading: false,
          embalagens: [],
          error: ex.toString(),
        ),
      );
    }
  }

  void delete(EmbalagemModel embalagem) async {
    try {
      (String, EmbalagemModel)? result = await service.delete(embalagem);
      if (result == null) return;
      emit(
        EmbalagemPageState(
          loading: false,
          embalagens: state.embalagens,
          deleted: true,
          message: result.$1,
        ),
      );
    } on Exception catch (ex) {
      emit(
        EmbalagemPageState(
          loading: false,
          embalagens: state.embalagens,
          error: ex.toString(),
        ),
      );
    }
  }
}

class EmbalagemPageState {
  final bool loading;
  final bool deleted;
  final List<EmbalagemModel> embalagens;
  final String error;
  final String message;

  EmbalagemPageState({
    required this.loading,
    required this.embalagens,
    this.error = '',
    this.deleted = false,
    this.message = '',
  });
}
