import 'package:ageiscme_data/components/custom_app_bar_widget.dart';
import 'package:ageiscme_processo/app/module/blocs/processo_leitura_cubit.dart';
import 'package:ageiscme_processo/app/module/pages/processo/processo_page.dart';
import 'package:ageiscme_processo/app/module/pages/processo/processo_page_widgets/processo_page_manual_reading/processo_page_manual_reading_widget_state.dart';
import 'package:compartilhados/componentes/loading/loading_controller.dart';
import 'package:compartilhados/componentes/toasts/toast_utils.dart';
import 'package:dependencias_comuns/bloc_export.dart';
import 'package:flutter/material.dart';

class RouterOutletPage extends StatelessWidget {
  const RouterOutletPage({this.userCode, super.key});

  final String? userCode;

  @override
  Widget build(BuildContext context) {
    ToastUtils.routerOutletContext = context;
    return CustomAppBarWidget(
      onLogout: onLogout,
      body: Row(
        children: [
          Expanded(
            child: Column(
              children: [
                Expanded(
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: MultiBlocProvider(
                      providers: [
                        BlocProvider<ProcessoPageManualReadingWidgetCubit>(
                          create: (BuildContext context) =>
                              ProcessoPageManualReadingWidgetCubit(),
                        ),
                        BlocProvider<ProcessoLeituraCubit>(
                          create: (BuildContext context) =>
                              ProcessoLeituraCubit(
                            loadingController: LoadingController(
                              context: context,
                              cancelShow: true,
                              barrierColor:
                                  const Color.fromARGB(61, 245, 245, 245),
                            ),
                          ),
                        ),
                      ],
                      child: ProcessoPage(userCode: userCode),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  void onLogout() async {}
}
