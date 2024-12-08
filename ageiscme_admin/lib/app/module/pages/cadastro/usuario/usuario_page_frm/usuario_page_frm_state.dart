import 'package:ageiscme_data/services/usuario/usuario_service.dart';
import 'package:ageiscme_models/main.dart';
import 'package:compartilhados/componentes/toasts/toast_utils.dart';
import 'package:dependencias_comuns/bloc_export.dart';
import 'package:flutter/material.dart';

class UsuarioPageFrmCubit extends Cubit<UsuarioPageFrmState> {
  final UsuarioService service;
  final UsuarioModel usuarioModel;
  UsuarioPageFrmCubit({
    required this.service,
    required this.usuarioModel,
  }) : super(
          UsuarioPageFrmState(usuario: usuarioModel),
        );

  void save(
    UsuarioModel usuario,
    void Function() onSaved,
    BuildContext context,
  ) async {
    try {
      (String message, UsuarioModel usuario)? result =
          await service.save(usuario);
      if (result == null) return;
      ToastUtils.showCustomToastSucess(context, result.$1);
      onSaved();
      emit(
        UsuarioPageFrmState(
          message: result.$1,
          saved: true,
          usuario: result.$2,
        ),
      );
    } on Exception catch (ex) {
      emit(
        UsuarioPageFrmState(
          error: ex.toString(),
          usuario: usuario,
        ),
      );
    }
  }

  void clear() {
    emit(UsuarioPageFrmState(usuario: UsuarioModel.empty()));
  }
}

class UsuarioPageFrmState {
  final String error;
  final bool saved;
  final String message;
  final UsuarioModel usuario;

  UsuarioPageFrmState({
    required this.usuario,
    this.error = '',
    this.saved = false,
    this.message = '',
  });
}
