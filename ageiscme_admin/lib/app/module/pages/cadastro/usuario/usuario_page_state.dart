import 'package:ageiscme_admin/app/module/pages/cadastro/usuario/cubits/usuario_cubit_filter.dart';
import 'package:ageiscme_data/services/usuario/usuario_service.dart';
import 'package:ageiscme_models/filters/usuario_filter/usuario_filter.dart';
import 'package:ageiscme_models/main.dart';
import 'package:compartilhados/componentes/toasts/toast_utils.dart';
import 'package:dependencias_comuns/bloc_export.dart';
import 'package:flutter/material.dart';

class UsuarioPageCubit extends Cubit<UsuarioPageState> {
  final UsuarioService service;
  UsuarioPageCubit({required this.service})
      : super(
          UsuarioPageState(
            usuarios: [],
            loading: false,
          ),
        );

  Future loadFilter(UsuarioFilter filter) async {
    emit(UsuarioPageState(loading: true, usuarios: []));
    List<UsuarioModel> usuarios = await service.Filter(filter);
    emit(UsuarioPageState(loading: false, usuarios: usuarios));
  }

  Future delete(BuildContext context, UsuarioModel usuario) async {
    (String, UsuarioModel)? result = await service.delete(usuario);
    if (result == null) return;
    ToastUtils.showCustomToastSucess(
      context,
      state.message,
    );
    UsuarioCubitFilter filterCubit = context.read<UsuarioCubitFilter>();
    UsuarioPageCubit userCubit = context.read<UsuarioPageCubit>();
    filterCubit = context.read<UsuarioCubitFilter>();
    UsuarioFilter dto = filterCubit.state;
    await userCubit.loadFilter(dto);
  }
}

class UsuarioPageState {
  final bool loading;
  final List<UsuarioModel> usuarios;
  final String message;

  UsuarioPageState({
    required this.loading,
    required this.usuarios,
    this.message = '',
  });
}
