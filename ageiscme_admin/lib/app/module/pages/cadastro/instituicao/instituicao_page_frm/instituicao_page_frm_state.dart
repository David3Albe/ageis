import 'package:ageiscme_data/services/instituicao/instituicao_service.dart';
import 'package:ageiscme_models/main.dart';
import 'package:dependencias_comuns/bloc_export.dart';

class InstituicaoPageFrmCubit extends Cubit<InstituicaoPageFrmState> {
  final InstituicaoService service;
  final InstituicaoModel instituicaoModel;
  InstituicaoPageFrmCubit({
    required this.service,
    required this.instituicaoModel,
  }) : super(
          InstituicaoPageFrmState(instituicao: instituicaoModel),
        );

  void save(InstituicaoModel instituicao) async {
    try {
      (String message, InstituicaoModel instituicao)? result =
          await service.save(instituicao);
      if (result == null) return;

      emit(
        InstituicaoPageFrmState(
          message: result.$1,
          saved: true,
          instituicao: result.$2,
        ),
      );
    } on Exception catch (ex) {
      emit(
        InstituicaoPageFrmState(
          error: ex.toString(),
          instituicao: instituicao,
        ),
      );
    }
  }
}

class InstituicaoPageFrmState {
  final String error;
  final bool saved;
  final String message;
  final InstituicaoModel instituicao;

  InstituicaoPageFrmState({
    required this.instituicao,
    this.error = '',
    this.saved = false,
    this.message = '',
  });
}
