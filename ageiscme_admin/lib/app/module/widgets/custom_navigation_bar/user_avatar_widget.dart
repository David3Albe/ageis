import 'package:ageiscme_admin/app/module/services/admin_navigator_service.dart';
import 'package:ageiscme_admin/app/module/widgets/custom_navigation_bar/cubit/custom_navigation_bar_cubit.dart';
import 'package:ageiscme_data/stores/authentication/authentication_store.dart';
import 'package:ageiscme_models/dto/authentication_result/authentication_result_dto.dart';
import 'package:compartilhados/main.dart';
import 'package:compartilhados/navigator/navigator_service.dart';
import 'package:compartilhados/windows/windows_helper.dart';
import 'package:dependencias_comuns/bloc_export.dart';
import 'package:dependencias_comuns/modular_export.dart';
import 'package:flutter/material.dart';

class UserAvatarWidget extends StatelessWidget {
  const UserAvatarWidget(this.expanded);
  final bool expanded;
  @override
  Widget build(final BuildContext context) {
    return FutureBuilder(
      future: Modular.get<AuthenticationStore>().GetAuthenticated(),
      builder: (context, snapshot) {
        AuthenticationResultDTO? authentication = snapshot.data;
        String userName = 'User Name';
        String company = '';
        if (snapshot.hasData && authentication != null) {
          userName = authentication.usuario!.nome!;
          company = authentication.instituicao!.nome!;
        }
        return Material(
          elevation: 1,
          color: const Color.fromRGBO(216, 218, 230, 1),
          child: InkWell(
            onTap: () =>
                AdminNavigatorService.navigateToHomeValidaTrocaSenha(context),
            child: Padding(
              padding: const EdgeInsets.fromLTRB(8.0, 8.0, 8.0, 8.0),
              child: Column(
                children: [
                  Row(
                    children: [
                      CircleAvatar(
                        backgroundColor: Cores.corAvatarFundo,
                        foregroundColor: Cores.corAvatarTexto,
                        child: AutoSizeText(
                          HelperFunctions
                              .GetTwoFirstLetersOfNameAndSecondName(
                            userName,
                          ),
                          minFontSize: 8,
                          maxFontSize: 12,
                        ),
                      ),
                      expanded
                          ? Expanded(
                              child: Padding(
                                padding: const EdgeInsets.only(left: 8.0),
                                child: Container(
                                  width: 180,
                                  child: Text(
                                    userName,
                                    overflow: TextOverflow.ellipsis,
                                    style: Fontes.getRoboto(
                                      fontSize:
                                          HelperFunctions.calculaFontSize(
                                        context,
                                        18,
                                      ),
                                      cor: Cores.corNomeUsuario,
                                    ),
                                  ),
                                ),
                              ),
                            )
                          : Container(),
                      Center(
                        child: IconButton(
                          tooltip: 'Sair',
                          onPressed: () {
                            onLogout(context);
                            NavigatorService.navigateToModuleSelection();
                          },
                          icon: const Icon(Icons.logout, size: 26),
                        ),
                      ),
                    ],
                  ),
                  expanded
                      ? Padding(
                          padding: const EdgeInsets.only(top: 4.0),
                          child: Row(
                            children: [
                              Expanded(
                                child: Text(
                                  'Instituição: ' + company,
                                  overflow: TextOverflow.ellipsis,
                                  style: Fontes.getRoboto(
                                    fontSize: HelperFunctions.calculaFontSize(
                                      context,
                                      12,
                                    ),
                                    cor: Cores.corNomeUsuario,
                                  ),
                                ),
                              ),
                            ],
                          ),
                        )
                      : const SizedBox(),
                ],
              ),
            ),
          ),
        );
      },
    );
  }

  void onLogout(BuildContext context) async {
    WindowsHelper.CloseAll();
    CustomNavigationBarCubit cubit =
        BlocProvider.of<CustomNavigationBarCubit>(context);
    cubit.expand();
    AuthenticationStore store = Modular.get<AuthenticationStore>();
    await store.ClearAuthentication();
  }
}
