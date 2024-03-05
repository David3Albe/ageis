import 'package:ageiscme_data/services/local_instituicao/local_instituicao_service.dart';
import 'package:ageiscme_models/main.dart';
import 'package:dependencias_comuns/bloc_export.dart';

class LocalInstituicaoPageCubit extends Cubit<LocalInstituicaoPageState> {
  final LocalInstituicaoService service;
  LocalInstituicaoPageCubit({required this.service})
      : super(
          LocalInstituicaoPageState(
            locaisInstituicao: [],
            loading: false,
          ),
        );

  void loadLocalInstituicao() async {
    emit(
      LocalInstituicaoPageState(
        loading: true,
        locaisInstituicao: [],
      ),
    );
    try {
      List<LocalInstituicaoModel> locaisInstituicao = await service.GetAll();
      emit(
        LocalInstituicaoPageState(
          loading: false,
          locaisInstituicao: locaisInstituicao,
        ),
      );
    } on Exception catch (ex) {
      emit(
        LocalInstituicaoPageState(
          loading: false,
          locaisInstituicao: [],
          error: ex.toString(),
        ),
      );
    }
  }

  void delete(LocalInstituicaoModel localInstituicao) async {
    try {
      (String, LocalInstituicaoModel)? result =
          await service.delete(localInstituicao);
      if (result == null) return;
      emit(
        LocalInstituicaoPageState(
          loading: false,
          locaisInstituicao: state.locaisInstituicao,
          deleted: true,
          message: result.$1,
        ),
      );
    } on Exception catch (ex) {
      emit(
        LocalInstituicaoPageState(
          loading: false,
          locaisInstituicao: state.locaisInstituicao,
          error: ex.toString(),
        ),
      );
    }
  }
}

class LocalInstituicaoPageState {
  final bool loading;
  final bool deleted;
  final List<LocalInstituicaoModel> locaisInstituicao;
  final String error;
  final String message;

  LocalInstituicaoPageState({
    required this.loading,
    required this.locaisInstituicao,
    this.error = '',
    this.deleted = false,
    this.message = '',
  });
}
