import 'package:ageiscme_data/services/local_instituicao/local_instituicao_service.dart';
import 'package:ageiscme_models/main.dart';
import 'package:dependencias_comuns/bloc_export.dart';

class LocalInstituicaoPageFrmCubit extends Cubit<LocalInstituicaoPageFrmState> {
  final LocalInstituicaoService service;
  final LocalInstituicaoModel localInstituicaoModel;
  LocalInstituicaoPageFrmCubit({
    required this.service,
    required this.localInstituicaoModel,
  }) : super(
          LocalInstituicaoPageFrmState(localInstituicao: localInstituicaoModel),
        );

  void save(
    LocalInstituicaoModel localInstituicao,
    final void Function(String) onSaved,
  ) async {
    try {
      (String message, LocalInstituicaoModel localInstituicao)? result =
          await service.save(localInstituicao);
      if (result == null) return;
      onSaved(result.$1);
      emit(
        LocalInstituicaoPageFrmState(
          message: result.$1,
          saved: true,
          localInstituicao: result.$2,
        ),
      );
    } on Exception catch (ex) {
      emit(
        LocalInstituicaoPageFrmState(
          error: ex.toString(),
          localInstituicao: localInstituicao,
        ),
      );
    }
  }

  void clear() {
    emit(
      LocalInstituicaoPageFrmState(
        localInstituicao: LocalInstituicaoModel.empty(),
      ),
    );
  }
}

class LocalInstituicaoPageFrmState {
  final String error;
  final bool saved;
  final String message;
  final LocalInstituicaoModel localInstituicao;

  LocalInstituicaoPageFrmState({
    required this.localInstituicao,
    this.error = '',
    this.saved = false,
    this.message = '',
  });
}
