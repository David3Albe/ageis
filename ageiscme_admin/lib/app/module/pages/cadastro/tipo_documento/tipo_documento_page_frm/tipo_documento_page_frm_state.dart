import 'package:ageiscme_data/services/tipo_documento/tipo_documento_service.dart';
import 'package:ageiscme_models/main.dart';
import 'package:compartilhados/componentes/toasts/toast_utils.dart';
import 'package:dependencias_comuns/bloc_export.dart';
import 'package:flutter/material.dart';

class TipoDocumentoPageFrmCubit extends Cubit<TipoDocumentoPageFrmState> {
  final TipoDocumentoService service;
  final TipoDocumentoModel tipoDocumentoModel;
  TipoDocumentoPageFrmCubit({
    required this.service,
    required this.tipoDocumentoModel,
  }) : super(
          TipoDocumentoPageFrmState(tipoDocumento: tipoDocumentoModel),
        );

  void save(
    TipoDocumentoModel tipoDocumento,
    void Function() onSaved,
    BuildContext context,
  ) async {
    try {
      (String message, TipoDocumentoModel tipoDocumento)? result =
          await service.save(tipoDocumento);
      if (result == null) return;
      onSaved();
      ToastUtils.showCustomToastSucess(context, result.$1);
      emit(
        TipoDocumentoPageFrmState(
          message: result.$1,
          saved: true,
          tipoDocumento: result.$2,
        ),
      );
    } on Exception catch (ex) {
      emit(
        TipoDocumentoPageFrmState(
          error: ex.toString(),
          tipoDocumento: tipoDocumento,
        ),
      );
    }
  }

  void clear() {
    emit(TipoDocumentoPageFrmState(tipoDocumento: TipoDocumentoModel.empty()));
  }
}

class TipoDocumentoPageFrmState {
  final String error;
  final bool saved;
  final String message;
  final TipoDocumentoModel tipoDocumento;

  TipoDocumentoPageFrmState({
    required this.tipoDocumento,
    this.error = '',
    this.saved = false,
    this.message = '',
  });
}
