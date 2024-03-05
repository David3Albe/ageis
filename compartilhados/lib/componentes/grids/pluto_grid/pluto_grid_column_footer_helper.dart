import 'package:dependencias_comuns/main.dart';
import 'package:flutter/material.dart';

class PlutoGridColumnFooterHelper {
  static PlutoAggregateColumnFooter CreateCurrencyFooter(
    PlutoColumnFooterRendererContext rendererContext,
  ) {
    return PlutoAggregateColumnFooter(
      rendererContext: rendererContext,
      formatAsCurrency: true,
      locale: 'pt-BR',
      type: PlutoAggregateColumnType.sum,
      format: '#,##',
      alignment: Alignment.centerRight,
      titleSpanBuilder: (text) {
        return [
          const TextSpan(
            text: '',
          ),
          TextSpan(text: text),
        ];
      },
    );
  }

  static PlutoAggregateColumnFooter CreateNumberFooter(
    PlutoColumnFooterRendererContext rendererContext,
  ) {
    return PlutoAggregateColumnFooter(
      rendererContext: rendererContext,
      type: PlutoAggregateColumnType.sum,
      locale: 'pt-BR',
      alignment: Alignment.centerRight,
      titleSpanBuilder: (text) {
        return [
          const TextSpan(
            text: '',
          ),
          TextSpan(text: text),
        ];
      },
    );
  }
}
