import 'package:ageiscme_data/services/instituicao/instituicao_service.dart';
import 'package:ageiscme_models/main.dart';
import 'package:dependencias_comuns/bloc_export.dart';

class InstituicaoPageCubit extends Cubit<InstituicaoPageState> {
  final InstituicaoService service;
  InstituicaoPageCubit({required this.service})
      : super(
          InstituicaoPageState(
            instituicoes: [],
            loading: false,
          ),
        );

  void loadInstituicao() async {
    emit(InstituicaoPageState(loading: true, instituicoes: []));
    try {
      List<InstituicaoModel> instituicoes = await service.GetAll();
      emit(
        InstituicaoPageState(
          loading: false,
          instituicoes: instituicoes,
        ),
      );
    } on Exception catch (ex) {
      emit(
        InstituicaoPageState(
          loading: false,
          instituicoes: [],
          error: ex.toString(),
        ),
      );
    }
  }

  void delete(InstituicaoModel instituicao) async {
    try {
      (String, InstituicaoModel)? result = await service.delete(instituicao);
      if (result == null) return;

      emit(
        InstituicaoPageState(
          loading: false,
          instituicoes: state.instituicoes,
          deleted: true,
          message: result.$1,
        ),
      );
    } on Exception catch (ex) {
      emit(
        InstituicaoPageState(
          loading: false,
          instituicoes: state.instituicoes,
          error: ex.toString(),
        ),
      );
    }
  }
}

class InstituicaoPageState {
  final bool loading;
  final bool deleted;
  final List<InstituicaoModel> instituicoes;
  final String error;
  final String message;

  InstituicaoPageState({
    required this.loading,
    required this.instituicoes,
    this.error = '',
    this.deleted = false,
    this.message = '',
  });
}
