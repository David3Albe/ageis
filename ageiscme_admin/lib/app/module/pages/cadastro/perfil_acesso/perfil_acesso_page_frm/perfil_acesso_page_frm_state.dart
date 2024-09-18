import 'package:ageiscme_data/services/perfil_acesso/perfil_acesso_service.dart';
import 'package:ageiscme_models/main.dart';
import 'package:compartilhados/componentes/toasts/toast_utils.dart';
import 'package:dependencias_comuns/bloc_export.dart';
import 'package:flutter/material.dart';

class PerfilAcessoPageFrmCubit extends Cubit<PerfilAcessoPageFrmState> {
  final PerfilAcessoService service;
  final PerfilAcessoModel perfilAcessoModel;
  PerfilAcessoPageFrmCubit({
    required this.service,
    required this.perfilAcessoModel,
  }) : super(
          PerfilAcessoPageFrmState(perfilAcesso: perfilAcessoModel),
        );

  Future<PerfilAcessoModel?> save(
    PerfilAcessoModel perfilAcesso,
    void Function() onSaved,
    BuildContext context,
  ) async {
    (String message, PerfilAcessoModel perfilAcesso)? result =
        await service.save(perfilAcesso);
    if (result == null) return null;
    onSaved();
    ToastUtils.showCustomToastSucess(context, result.$1);
    return result.$2;
  }

  void clear() {
    emit(PerfilAcessoPageFrmState(perfilAcesso: PerfilAcessoModel.empty()));
  }
}

class PerfilAcessoPageFrmState {
  final String error;
  final String message;
  final PerfilAcessoModel perfilAcesso;

  PerfilAcessoPageFrmState({
    required this.perfilAcesso,
    this.error = '',
    this.message = '',
  });
}
