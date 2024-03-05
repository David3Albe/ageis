import 'package:ageiscme_admin/app/module/pages/login/login_page_state.dart';
import 'package:ageiscme_admin/app/module/services/admin_navigator_service.dart';
import 'package:ageiscme_data/services/authentication/authentication_service.dart';
import 'package:ageiscme_models/dto/authentication/authentication_dto.dart';
import 'package:compartilhados/componentes/botoes/back_button_small.dart';
import 'package:compartilhados/componentes/botoes/login_button_widget.dart';
import 'package:compartilhados/componentes/campos/text_field_string_with_border_widget.dart';
import 'package:compartilhados/componentes/toasts/toast_utils.dart';
import 'package:compartilhados/cores/cores.dart';
import 'package:compartilhados/images/default_images.dart';
import 'package:dependencias_comuns/bloc_export.dart';
import 'package:flutter/material.dart';

class LoginPage extends StatefulWidget {
  LoginPage({Key? key});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  late TextFieldStringWithBorderWidget txtUser;
  late TextFieldStringWithBorderWidget txtPassword;
  late LoginPageCubit cubit;

  @override
  void initState() {
    super.initState();
    txtUser = TextFieldStringWithBorderWidget(
      textInputAction: TextInputAction.next,
      placeholder: 'Usuário',
      validator: (str) =>
          str == null || str.isEmpty ? 'Usuário é obrigatório' : '',
    );

    txtPassword = TextFieldStringWithBorderWidget(
      textInputAction: TextInputAction.done,
      placeholder: 'Senha',
      password: true,
      onFieldSubmitted: (String? str) => Login(),
      validator: (str) =>
          str == null || str.isEmpty ? 'Senha é obrigatória' : '',
    );
    AuthenticationService service = AuthenticationService();
    service.DisableThrower();
    cubit = LoginPageCubit(service: service);
  }

  @override
  Widget build(BuildContext context) {
    ToastUtils.routerOutletContext = context;
    return Scaffold(
      backgroundColor: Cores.corFundoAgeis,
      body: BlocListener<LoginPageCubit, LoginPageState>(
        listener: (context, state) {
          if (state.usuario != null) AdminNavigatorService.navigateToHome();
        },
        bloc: cubit,
        child: BlocBuilder<LoginPageCubit, LoginPageState>(
          bloc: cubit,
          builder: (context, state) => Center(
            child: Column(
              children: [
                const Spacer(),
                Padding(
                  padding: EdgeInsets.only(
                    bottom: MediaQuery.of(context).size.height * 0.2,
                  ),
                  child: Center(
                    child: ConstrainedBox(
                      constraints:
                          const BoxConstraints(maxWidth: 420, maxHeight: 420),
                      child: Container(
                        decoration: BoxDecoration(
                          color: Cores.corFundoBranco,
                          borderRadius: BorderRadius.circular(5),
                        ),
                        width: MediaQuery.of(context).size.width * 0.95,
                        height: MediaQuery.of(context).size.height * 0.60,
                        child: Padding(
                          padding: const EdgeInsets.only(left: 30, right: 30),
                          child: Column(
                            children: [
                              Row(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  Padding(
                                    padding: EdgeInsets.only(
                                      top: MediaQuery.of(context).size.height *
                                          0.02,
                                    ),
                                    child: Image(
                                      image: DefaultImages.logoAgeisCme.image,
                                      height: 50,
                                    ),
                                  ),
                                ],
                              ),
                              Padding(
                                padding: EdgeInsets.only(
                                  top:
                                      MediaQuery.of(context).size.height * 0.05,
                                ),
                                child: txtUser,
                              ),
                              Padding(
                                padding: EdgeInsets.only(
                                  top:
                                      MediaQuery.of(context).size.height * 0.05,
                                ),
                                child: txtPassword,
                              ),
                              Padding(
                                padding: EdgeInsets.only(
                                  top:
                                      MediaQuery.of(context).size.height * 0.05,
                                ),
                                child: Wrap(
                                  children: [
                                    Padding(
                                      padding: const EdgeInsets.only(
                                        top: 6.0,
                                        left: 6.0,
                                      ),
                                      child: Container(
                                        constraints: const BoxConstraints(
                                          maxHeight: 30,
                                          maxWidth: 165,
                                        ),
                                        child: const BackButtonSmallWidget(
                                          onPressed: AdminNavigatorService
                                              .navigateToModuleSelection,
                                        ),
                                      ),
                                    ),
                                    Padding(
                                      padding: const EdgeInsets.only(
                                        left: 6,
                                        top: 6,
                                      ),
                                      child: Container(
                                        constraints: const BoxConstraints(
                                          maxHeight: 30,
                                          maxWidth: 165,
                                        ),
                                        child: LoginButtonWidget(
                                          onPressed: Login,
                                        ),
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                              const Spacer(),
                              Visibility(
                                visible: state.error.isNotEmpty,
                                child: Wrap(
                                  children: [
                                    Text(
                                      state.error,
                                      style: const TextStyle(
                                        color: Cores.corFonteErro,
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                              const Spacer(),
                            ],
                          ),
                        ),
                      ),
                    ),
                  ),
                ),
                Padding(
                  padding: EdgeInsets.only(
                    bottom: MediaQuery.of(context).size.height * 0.05,
                  ),
                  child: Image(
                    image: DefaultImages.logo3Albe.image,
                    height: 60,
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  void Login() async {
    txtUser.validate();
    txtPassword.validate();
    if (!txtUser.valid() || !txtUser.valid()) return;
    AuthenticationDTO dto =
        AuthenticationDTO(usuario: txtUser.text, senha: txtPassword.text);
    cubit.auth(dto, context);
  }
}
