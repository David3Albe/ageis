import 'package:ageiscme_models/models/processo_resposta_epcepi/processo_resposta_epcepi_model.dart';
import 'package:ageiscme_processo/app/module/blocs/processo_leitura_cubit.dart';
import 'package:ageiscme_processo/app/module/models/usuario_processo/usuario_processo_model.dart';
import 'package:ageiscme_processo/app/module/pages/processo/processo_page_widgets/processo_page_device_information/processo_page_device_information_widget.dart';
import 'package:ageiscme_processo/app/module/shared/cores.dart';
import 'package:compartilhados/fontes/fontes.dart';
import 'package:dependencias_comuns/bloc_export.dart';
import 'package:flutter/material.dart';

class ProcessoPageUserWidget extends StatelessWidget {
  const ProcessoPageUserWidget({Key? key});

  @override
  Widget build(BuildContext context) {
    var scale = MediaQuery.of(context).size.width / 1920;
    return Material(
      elevation: 10,
      child: Container(
        decoration: const BoxDecoration(
          color: Cores.CorCards,
        ),
        child: BlocBuilder<ProcessoLeituraCubit, ProcessoLeituraState>(
          buildWhen: (previous, current) =>
              current.rebuildType == ProcessoLeituraRebuildType.All,
          builder: (context, state) {
            UsuarioProcessoModel? usuario = state.processo.leituraAtual.usuario;
            ProcessoRespostaEPCEPIModel? epcEpi =
                state.processo.leituraAtual.respostaEPCEPI;
            double? escalaFonte = state.processo.getEscala();
            double lineHeight = state.processo.getLineHeightPadrao();
            return Padding(
              padding: EdgeInsets.only(
                top: (8 * scale) / escalaFonte,
                bottom: (8 * scale) / escalaFonte,
                right: (14 * scale) / escalaFonte,
                left: (14 * scale) / escalaFonte,
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Padding(
                    padding: EdgeInsets.zero,
                    child: Row(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        Text(
                          'USUÁRIO',
                          style: Fontes.getSegoe(
                            fontSize: (14 * scale) * escalaFonte,
                            cor: Cores.CorTitleCards,
                          ),
                        ),
                        const Padding(
                          padding: const EdgeInsets.only(left: 8.0),
                          child: const ProcessoPageDeviceInformationWidget(),
                        ),
                        const Spacer(),
                        Visibility(
                          visible: epcEpi != null && epcEpi.resposta == 1,
                          child: Text(
                            'EPI OK',
                            style: Fontes.getSegoe(
                              fontSize: (14 * scale) * escalaFonte,
                              cor: Cores.CorGreenText,
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                  Padding(
                    padding: EdgeInsets.zero,
                    child: Text(
                      textAlign: TextAlign.start,
                      usuario != null && usuario.nome != null
                          ? usuario.nome!
                          : ' ',
                      style: Fontes.getSegoe(
                        fontSize: (20 * scale) * escalaFonte,
                        cor: Cores.CorTextCards,
                        lineHeight: lineHeight,
                      ),
                    ),
                  ),
                ],
              ),
            );
          },
        ),
      ),
    );
  }
}
