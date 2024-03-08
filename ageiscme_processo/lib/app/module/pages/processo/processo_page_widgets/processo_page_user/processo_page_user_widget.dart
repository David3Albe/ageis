import 'package:ageiscme_models/models/processo_resposta_epcepi/processo_resposta_epcepi_model.dart';
import 'package:ageiscme_processo/app/module/blocs/processo_leitura_cubit.dart';
import 'package:ageiscme_processo/app/module/models/usuario_processo/usuario_processo_model.dart';
import 'package:ageiscme_processo/app/module/pages/processo/processo_page_widgets/processo_page_device_information/processo_page_device_information_widget.dart';
import 'package:ageiscme_processo/app/module/pages/processo/processo_page_widgets/processo_page_manual_reading/processo_page_manual_reading_widget_state.dart';
import 'package:ageiscme_processo/app/module/shared/cores.dart';
import 'package:compartilhados/fontes/fontes.dart';
import 'package:dependencias_comuns/bloc_export.dart';
import 'package:flutter/material.dart';

class ProcessoPageUserWidget extends StatelessWidget {
  const ProcessoPageUserWidget({Key? key});

  @override
  Widget build(BuildContext context) {
    final ProcessoPageManualReadingWidgetCubit _manualReadingsCubit =
        BlocProvider.of<ProcessoPageManualReadingWidgetCubit>(context);
    var scale = MediaQuery.of(context).size.width / 1920;
    return Material(
      elevation: 10,
      child: Container(
        decoration: const BoxDecoration(
          color: Cores.CorCards,
        ),
        child: Padding(
          padding: EdgeInsets.only(
            top: 8 * scale,
            bottom: 8 * scale,
            right: 14 * scale,
            left: 14 * scale,
          ),
          child: BlocBuilder<ProcessoLeituraCubit, ProcessoLeituraState>(
            buildWhen: (previous, current) =>
                current.rebuildType == ProcessoLeituraRebuildType.All,
            builder: (context, state) {
              UsuarioProcessoModel? usuario =
                  state.processo.leituraAtual.usuario;
              ProcessoRespostaEPCEPIModel? epcEpi =
                  state.processo.leituraAtual.respostaEPCEPI;
              return Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisSize: MainAxisSize.min,
                children: [
                  Row(
                    children: [
                      InkWell(
                        mouseCursor: SystemMouseCursors.basic,
                        onTap: _manualReadingsCubit.toogleVisibility,
                        child: SizedBox(
                          child: FittedBox(
                            child: Text(
                              'USUÁRIO',
                              style: Fontes.getSegoe(
                                fontSize: 14 * scale,
                                cor: Cores.CorTitleCards,
                              ),
                            ),
                          ),
                        ),
                      ),
                      const Padding(
                        padding: const EdgeInsets.only(left: 4.0),
                        child: const ProcessoPageDeviceInformationWidget(),
                      ),
                      const Spacer(),
                      Visibility(
                        visible: epcEpi != null && epcEpi.resposta == 1,
                        child: Text(
                          'EPI OK',
                          style: Fontes.getSegoe(
                            fontSize: 14 * scale,
                            cor: Cores.CorGreenText,
                          ),
                        ),
                      ),
                    ],
                  ),
                  FittedBox(
                    fit: BoxFit.scaleDown,
                    child: Text(
                      usuario != null && usuario.nome != null
                          ? usuario.nome!
                          : ' ',
                      style: Fontes.getSegoe(
                        fontSize: 20 * scale,
                        cor: Cores.CorTextCards,
                      ),
                    ),
                  ),
                ],
              );
            },
          ),
        ),
      ),
    );
  }
}
