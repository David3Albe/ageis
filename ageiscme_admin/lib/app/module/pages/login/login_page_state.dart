
import 'package:ageiscme_data/stores/authentication/authentication_store.dart';
import 'package:ageiscme_data/services/authentication/authentication_service.dart';
import 'package:ageiscme_models/dto/authentication/authentication_dto.dart';
import 'package:ageiscme_models/dto/authentication_result/authentication_result_dto.dart';
import 'package:ageiscme_models/enums/direito_enum.dart';
import 'package:ageiscme_models/main.dart';
import 'package:ageiscme_models/models/perfil_direito/perfil_direito_model.dart';
import 'package:compartilhados/componentes/loading/loading_controller.dart';
import 'package:compartilhados/functions/window_manager/window_manager_helper.dart';
import 'package:dependencias_comuns/bloc_export.dart';
import 'package:dependencias_comuns/modular_export.dart';
import 'package:flutter/material.dart';

class LoginPageCubit extends Cubit<LoginPageState> {
  final AuthenticationService service;
  LoginPageCubit({required this.service})
      : super(
          LoginPageState(
            loading: false,
          ),
        );

  void auth(AuthenticationDTO authentication, BuildContext context) async {
    emit(LoginPageState(loading: true, usuario: null));
    LoadingController loading = LoadingController(context: context);
    try {
      (String, AuthenticationResultDTO usuario)? result =
          await service.auth(authentication);
      if (result == null) {
        loading.closeDefault();
        return;
      }

      AuthenticationStore store = Modular.get<AuthenticationStore>();
      if (authentication.senha == '123456') {
        result.$2.usuario!.usuariosPerfis?.add(
          UsuarioPerfilModel.empty().copyWith(
            direitos: [
              PerfilDireitoModel.empty()
                  .copyWith(codDireito: DireitoEnum.UsuariosAlterarSenha),
            ],
          ),
        );
      }
      await store.SaveAuthentication(result.$2);
      String? instituicao = result.$2.instituicao?.nome;
      await WindowManagerHelper.setTitle(instituicao);
      loading.closeDefault();
      emit(LoginPageState(loading: false, usuario: result.$2.usuario));
    } on Exception catch (ex) {
      loading.closeDefault();
      emit(
        LoginPageState(
          loading: false,
          error: ex.toString(),
        ),
      );
    }
  }
}

class LoginPageState {
  final bool loading;
  final bool deleted;
  final UsuarioModel? usuario;
  final String error;
  final String message;

  LoginPageState({
    required this.loading,
    this.usuario,
    this.error = '',
    this.deleted = false,
    this.message = '',
  });
}
