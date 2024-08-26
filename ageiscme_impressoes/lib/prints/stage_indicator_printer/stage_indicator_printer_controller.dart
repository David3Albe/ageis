import 'package:ageiscme_data/services/parametro_sistema/parametro_sistema_service.dart';
import 'package:ageiscme_impressoes/dto/stage_indicator_print/stage_indicator_print_dto.dart';
import 'package:ageiscme_models/dto/parametro_sistema/update_indicadores/parametro_sistema_update_indicadores_dto.dart';
import 'package:ageiscme_models/enums/modulos_enum.dart';
import 'package:ageiscme_models/main.dart';
import 'package:compartilhados/componentes/toasts/toast_utils.dart';
import 'package:compartilhados/functions/printer/printer_helper.dart';
import 'package:dependencias_comuns/printing_exports.dart';
import 'package:flutter/material.dart' as mat;
import 'package:pdf/widgets.dart' as pw;

class StageIndicatorPrinterController {
  StageIndicatorPrintDTO stageIndicatorPrint;
  mat.BuildContext context;

  StageIndicatorPrinterController({
    required this.stageIndicatorPrint,
    required this.context,
  });

  Future print() async {
    final Font font =
        await fontFromAssetBundle('assets/fonts/open-sans-regular.ttf');
    pw.ThemeData themeOpenSans = pw.ThemeData.withFont(
      base: font,
    );
    final pdf = pw.Document(
      theme: themeOpenSans,
    );
    pw.TextStyle style = const pw.TextStyle(fontSize: 8);
    ParametroSistemaService service = ParametroSistemaService();
    ParametroSistemaModel? sistema = await service.findFirst();
    if (sistema?.cod == null) {
      ToastUtils.showCustomToastWarning(
        context,
        'Não foi possível carregar os parâmtros do sistema, tente novamente ou entre em contato com o suporte',
      );
      return;
    }

    int qtdeImpressao = 0;
    ParametroSistemaUpdateIndicadoresDTO dto =
        ParametroSistemaUpdateIndicadoresDTO(
      cod: sistema!.cod!,
      qtdeIndicadores: sistema.indicador ?? 0,
    );
    while (qtdeImpressao < stageIndicatorPrint.quantity) {
      dto.qtdeIndicadores =
          dto.qtdeIndicadores + 1;
      pdf.addPage(
        _addPage(style, sistema),
      );
      qtdeImpressao++;
    }
    var result = await service.updateIndicadores(dto);
    if (result == null) return;
    await PrinterHelper.PrintDocumentDefaultPrinter(
      context,
      await pdf.save(),
    );
  }

  pw.Page _addPage(
    pw.TextStyle style,
    ParametroSistemaModel sistema,
  ) {
    String tagIndicator = _getTagIndicator(sistema.indicador!);
    return pw.Page(
      margin: const pw.EdgeInsets.only(top: 20, left: 40),
      build: (pw.Context context) {
        return pw.Column(
          children: [
            _getDescription(style),
            pw.SizedBox(height: 5),
            _getRowIndicatorDataMatrix(tagIndicator),
            pw.SizedBox(height: 5),
            _getRowUser(style, tagIndicator),
          ],
        );
      },
    );
  }

  pw.Row _getDescription(
    pw.TextStyle style,
  ) =>
      pw.Row(
        children: [
          pw.Text('IDENTIFICAÇÃO DO INDICADOR', style: style),
        ],
      );

  pw.Row _getRowIndicatorDataMatrix(String tagIndicator) => pw.Row(
        children: [
          pw.BarcodeWidget(
            barcode: Barcode.dataMatrix(),
            data: tagIndicator,
            height: 20,
            width: 20,
          ),
        ],
      );

  String _getTagIndicator(int indicador) {
    String module = ModulosEnum.Indicador.toString();
    String instituition =
        stageIndicatorPrint.instituitionCod.toString().padLeft(3, '0');
    String indicatorTag = indicador.toString().padLeft(11, '0');
    return '$module$instituition$indicatorTag';
  }

  pw.Row _getRowUser(
    pw.TextStyle style,
    String tagIndicator,
  ) =>
      pw.Row(
        children: [
          pw.Padding(
            padding: const EdgeInsets.only(left: 10),
            child: pw.Text(tagIndicator, style: style),
          ),
        ],
      );
}
