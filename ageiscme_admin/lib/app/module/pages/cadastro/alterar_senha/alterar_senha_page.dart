import 'package:ageiscme_admin/app/module/pages/cadastro/alterar_senha/alterar_senha_page_state.dart';
import 'package:ageiscme_admin/app/module/services/admin_navigator_service.dart';
import 'package:ageiscme_data/services/alterar_senha/alterar_senha_service.dart';
import 'package:ageiscme_data/stores/authentication/authentication_store.dart';
import 'package:ageiscme_models/dto/alterar_senha/alterar_senha_dto.dart';
import 'package:compartilhados/componentes/botoes/save_button_widget.dart';
import 'package:compartilhados/componentes/campos/text_field_string_widget.dart';
import 'package:compartilhados/componentes/toasts/toast_utils.dart';
import 'package:dependencias_comuns/bloc_export.dart';
import 'package:dependencias_comuns/modular_export.dart';
import 'package:flutter/material.dart';

class AlterarSenhaPage extends StatefulWidget {
  const AlterarSenhaPage({
    super.key,
    this.actualPassword,
  });
  final String? actualPassword;

  @override
  State<AlterarSenhaPage> createState() => _AlterarSenhaPageState();
}

class _AlterarSenhaPageState extends State<AlterarSenhaPage> {
  late final AlterarSenhaCubit bloc;
  late final AlterarSenhaDTO alterarSenhaDTO;

  late final TextFieldStringWidget txtSenhaAntiga;
  late final TextFieldStringWidget txtSenhaNova;
  late final TextFieldStringWidget txtConfirmaSenha;

  @override
  void initState() {
    alterarSenhaDTO = AlterarSenhaDTO.empty();
    final AuthenticationStore store = Modular.get<AuthenticationStore>();
    store.GetAuthenticated().then((value) {
      alterarSenhaDTO.codUsuario = value?.usuario?.cod ?? 0;
    });
    bloc = AlterarSenhaCubit(service: AlterarSenhaService());

    txtSenhaAntiga = TextFieldStringWidget(
      placeholder: 'Senha atual *',
      password: true,
      onChanged: (String? str) {
        alterarSenhaDTO.senhaAntiga = str ?? '';
      },
    );
    if (widget.actualPassword != null) {
      alterarSenhaDTO.senhaAntiga = widget.actualPassword!;
      txtSenhaAntiga.text = widget.actualPassword!;
    }
    txtSenhaAntiga.addValidator((str) {
      if (str.isEmpty) return 'Obrigatória';
      return '';
    });

    txtSenhaNova = TextFieldStringWidget(
      placeholder: 'Nova senha *',
      password: true,
      onChanged: (String? str) {
        alterarSenhaDTO.senhaNova = str ?? '';
      },
    );
    txtSenhaNova.addValidator((str) {
      if (str.isEmpty) return 'Obrigatória';
      if (str == '123456') return 'A senha não pode ser alterada para "123456"';
      if (str.length <= 7) return 'deve ter ao menos 8 caracteres';
      if (str != txtConfirmaSenha.text) {
        return 'Deve ser igual a confirmação de senha';
      }
      return '';
    });

    txtConfirmaSenha = TextFieldStringWidget(
      placeholder: 'Confirmação nova senha *',
      password: true,
      onChanged: (String? str) {
        alterarSenhaDTO.confirmacaoSenhaNova = str ?? '';
      },
    );
    txtConfirmaSenha.addValidator((str) {
      txtSenhaNova.valid;
      if (str.isEmpty) return 'Obrigatório';
      if (str != txtSenhaNova.text) {
        return 'Deve ser igual a senha nova';
      }
      return '';
    });

    super.initState();
  }

  @override
  void dispose() {
    bloc.close();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return BlocListener<AlterarSenhaCubit, AlterarSenhaState>(
      bloc: bloc,
      listener: (context, state) {
        if (state.saved) saved(state);
      },
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          SizedBox(
            width: 350,
            child: txtSenhaAntiga,
          ),
          const Padding(padding: EdgeInsets.only(top: 4)),
          SizedBox(
            width: 350,
            child: txtSenhaNova,
          ),
          const Padding(padding: EdgeInsets.only(top: 4)),
          SizedBox(
            width: 350,
            child: txtConfirmaSenha,
          ),
          const Padding(padding: EdgeInsets.only(top: 16)),
          SaveButtonWidget(onPressed: save),
        ],
      ),
    );
  }

  Future save() async {
    bool senhaAntigaValid = txtSenhaAntiga.valid;
    bool senhaNovaValid = txtSenhaNova.valid;
    bool senhaConfirmacaoValid = txtConfirmaSenha.valid;
    if (!senhaAntigaValid || !senhaNovaValid || !senhaConfirmacaoValid) {
      return;
    }
    await bloc.changePassword(alterarSenhaDTO);
  }

  void saved(AlterarSenhaState state) {
    ToastUtils.showCustomToastSucess(
      context,
      state.message,
    );
    AdminNavigatorService.navigateToHome();
  }
}
