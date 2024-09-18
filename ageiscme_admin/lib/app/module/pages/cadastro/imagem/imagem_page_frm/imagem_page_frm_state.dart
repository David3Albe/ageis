import 'package:ageiscme_data/services/imagem/imagem_service.dart';
import 'package:ageiscme_models/models/imagem/imagem_model.dart';
import 'package:compartilhados/componentes/loading/loading_controller.dart';
import 'package:compartilhados/componentes/toasts/toast_utils.dart';
import 'package:dependencias_comuns/bloc_export.dart';
import 'package:flutter/material.dart';

class ImagemPageFrmCubit extends Cubit<ImagemPageFrmState> {
  final ImagemService service;
  final ImagemModel imagemModel;
  ImagemPageFrmCubit({
    required this.service,
    required this.imagemModel,
  }) : super(
          ImagemPageFrmState(
            imagem: imagemModel,
          ),
        );

  void save(
    ImagemModel imagem,
    void Function() onSaved,
    BuildContext context,
  ) async {
    try {
      LoadingController loading =
          LoadingController(context: ToastUtils.routerOutletContext!);
      (String message, ImagemModel imagem)? result = await service.save(imagem);
      loading.closeDefault();
      if (result == null) return;
      ToastUtils.showCustomToastSucess(context, result.$1);
      onSaved();
      emit(
        ImagemPageFrmState(
          message: result.$1,
          saved: true,
          imagem: result.$2,
        ),
      );
    } on Exception catch (ex) {
      emit(
        ImagemPageFrmState(
          error: ex.toString(),
          imagem: imagem,
        ),
      );
    }
  }

  void clear() {
    emit(
      ImagemPageFrmState(
        imagem: ImagemModel.empty(),
      ),
    );
  }
}

class ImagemPageFrmState {
  final String error;
  final bool saved;
  final String message;
  final ImagemModel imagem;

  ImagemPageFrmState({
    required this.imagem,
    this.error = '',
    this.saved = false,
    this.message = '',
  });
}
