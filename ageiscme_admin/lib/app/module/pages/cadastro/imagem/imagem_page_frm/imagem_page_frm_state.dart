import 'package:ageiscme_data/services/imagem/imagem_service.dart';
import 'package:ageiscme_models/models/imagem/imagem_model.dart';
import 'package:dependencias_comuns/bloc_export.dart';

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

  void save(ImagemModel imagem) async {
    try {
      (String message, ImagemModel imagem)? result = await service.save(imagem);
      if (result == null) return;
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
