import 'package:ageiscme_admin/app/module/services/admin_navigator_service.dart';
import 'package:ageiscme_data/stores/authentication/authentication_store.dart';
import 'package:ageiscme_models/dto/authentication_result/authentication_result_dto.dart';
import 'package:compartilhados/main.dart';
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
        if (snapshot.hasData && authentication != null) {
          userName = authentication.usuario!.nome!;
        }
        return InkWell(
          onTap: AdminNavigatorService.navigateToHome,
          child: Padding(
            padding: const EdgeInsets.fromLTRB(8.0, 8.0, 8.0, 8.0),
            child: Tooltip(
              message: userName,
              waitDuration: const Duration(milliseconds: 500),
              child: Row(
                children: [
                  CircleAvatar(
                    backgroundColor: Cores.corAvatarFundo,
                    foregroundColor: Cores.corAvatarTexto,
                    child: AutoSizeText(
                      HelperFunctions.GetTwoFirstLetersOfNameAndSecondName(
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
                                  fontSize: HelperFunctions.calculaFontSize(context, 18),
                                  cor: Cores.corNomeUsuario,
                                ),
                              ),
                            ),
                          ),
                        )
                      : Container(),
                ],
              ),
            ),
          ),
        );
      },
    );
  }
}
