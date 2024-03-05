import 'package:ageiscme_data/services/perfil_acesso/perfil_acesso_service.dart';
import 'package:ageiscme_models/main.dart';
import 'package:dependencias_comuns/bloc_export.dart';

class PerfilAcessoPageFrmCubit extends Cubit<PerfilAcessoPageFrmState> {
  final PerfilAcessoService service;
  final PerfilAcessoModel perfilAcessoModel;
  PerfilAcessoPageFrmCubit({
    required this.service,
    required this.perfilAcessoModel,
  }) : super(
          PerfilAcessoPageFrmState(perfilAcesso: perfilAcessoModel),
        );

  void save(PerfilAcessoModel perfilAcesso) async {
    try {
      (String message, PerfilAcessoModel perfilAcesso)? result =
          await service.save(perfilAcesso);
      if (result == null) return;

      emit(
        PerfilAcessoPageFrmState(
          message: result.$1,
          saved: true,
          perfilAcesso: result.$2,
        ),
      );
    } on Exception catch (ex) {
      emit(
        PerfilAcessoPageFrmState(
          error: ex.toString(),
          perfilAcesso: perfilAcesso,
        ),
      );
    }
  }

  void clear() {
    emit(PerfilAcessoPageFrmState(perfilAcesso: PerfilAcessoModel.empty()));
  }
}

class PerfilAcessoPageFrmState {
  final String error;
  final bool saved;
  final String message;
  final PerfilAcessoModel perfilAcesso;

  PerfilAcessoPageFrmState({
    required this.perfilAcesso,
    this.error = '',
    this.saved = false,
    this.message = '',
  });
}
