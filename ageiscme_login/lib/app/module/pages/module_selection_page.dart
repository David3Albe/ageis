import 'package:ageiscme_login/app/module/pages/image_widget.dart';
import 'package:ageiscme_login/app/module/services/login_navigator_service.dart';
import 'package:ageiscme_login/app/module/widgets/module_selection_card/module_selection_card_widget.dart';
import 'package:compartilhados/componentes/toasts/toast_utils.dart';
import 'package:compartilhados/cores/cores.dart';
import 'package:compartilhados/icones/icones.dart';
import 'package:dependencias_comuns/main.dart';
import 'package:flutter/material.dart';

class ModuleSelectionPage extends StatelessWidget {
  const ModuleSelectionPage({super.key});

  double getSizeBottomPadding(Size size) {
    if (size.height > 900) {
      return 0.2;
    } else if (size.height > 800) {
      return 0.16;
    } else if (size.height > 700) {
      return 0.10;
    } else if (size.height > 600) {
      return 0.07;
    } else if (size.height > 500) {
      return 0.06;
    }
    return 0.05;
  }

  double _getSizeBottomPaddingSmall(Size size) {
    if (size.height > 900) {
      return 0.05;
    } else if (size.height > 800) {
      return 0.04;
    } else if (size.height > 700) {
      return 0.03;
    } else if (size.height > 600) {
      return 0.02;
    } else if (size.height > 500) {
      return 0.01;
    }
    return 0.01;
  }

  @override
  Widget build(BuildContext context) {
    ToastUtils.routerOutletContext = context;
    Size size = MediaQuery.of(context).size;
    double scale = size.width / 420;
    double paddingScale = getSizeBottomPadding(size);
    double smallPaddingScale = _getSizeBottomPaddingSmall(size);
    if (scale > 1) scale = 1;
    return Scaffold(
      backgroundColor: Cores.corFundoAgeis,
      body: Center(
        child: Column(
          children: [
            const Spacer(),
            Padding(
              padding: EdgeInsets.only(
                bottom: MediaQuery.of(context).size.height * paddingScale,
              ),
              child: Center(
                child: ConstrainedBox(
                  constraints:
                      const BoxConstraints(maxWidth: 420, maxHeight: 440),
                  child: Container(
                    decoration: BoxDecoration(
                      color: Cores.corFundoBranco,
                      borderRadius: BorderRadius.circular(5),
                    ),
                    width: MediaQuery.of(context).size.width * 0.95,
                    height: MediaQuery.of(context).size.height * 0.80,
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
                                      smallPaddingScale,
                                ),
                                child: const ImageWidget(
                                  identificador: 'logo_menu_cima',
                                  height: 50,
                                ),
                              ),
                            ],
                          ),
                          Expanded(
                            child: Padding(
                              padding: const EdgeInsets.only(
                                top: 20.0,
                                bottom: 30,
                              ),
                              child: Column(
                                children: [
                                  Expanded(
                                    child: Row(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceAround,
                                      children: [
                                        Expanded(
                                          child: SizedBox.expand(
                                            child: FractionallySizedBox(
                                              widthFactor: 1,
                                              heightFactor: 1,
                                              child: ModuleSelectionCardWidget(
                                                onTap: LoginNavigatorService
                                                    .ToModuleProcess,
                                                text: 'Processo',
                                                icon: Icon(
                                                  Icones.iconeProcesso.icon,
                                                  size: 75,
                                                ),
                                              ),
                                            ),
                                          ),
                                        ),
                                        Expanded(
                                          child: SizedBox.expand(
                                            child: FractionallySizedBox(
                                              widthFactor: 1,
                                              heightFactor: 1,
                                              child: ModuleSelectionCardWidget(
                                                onTap: LoginNavigatorService
                                                    .ToModuleAdmin,
                                                text: 'Administração',
                                                icon: Icon(
                                                  Icones.iconeAdmin.icon,
                                                  size: 75,
                                                ),
                                              ),
                                            ),
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),
                                  const Expanded(
                                    child: const Row(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.center,
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceAround,
                                      children: [
                                        Expanded(
                                          child: SizedBox.expand(
                                            child: FractionallySizedBox(
                                              widthFactor: 1,
                                              heightFactor: 1,
                                              child: ModuleSelectionCardWidget(
                                                onTap: LoginNavigatorService
                                                    .ToStats,
                                                text: 'Relatórios',
                                                icon: Icon(
                                                  Symbols.dashboard,
                                                  size: 75,
                                                ),
                                              ),
                                            ),
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
              ),
            ),
            Padding(
              padding: EdgeInsets.only(
                bottom: MediaQuery.of(context).size.height * smallPaddingScale,
              ),
              child: const ImageWidget(
                identificador: 'logo_menu_baixo',
                height: 60,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
