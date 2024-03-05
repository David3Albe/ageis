import 'package:ageiscme_data/services/imagem/imagem_service.dart';
import 'package:ageiscme_models/models/imagem/imagem_model.dart';
import 'package:dependencias_comuns/bloc_export.dart';

class ImagemPageCubit extends Cubit<ImagemPageState> {
  final ImagemService service;
  ImagemPageCubit({required this.service})
      : super(
          ImagemPageState(
            imagens: [],
            loading: false,
          ),
        );

  void loadImagem() async {
    emit(
      ImagemPageState(
        loading: true,
        imagens: [],
      ),
    );
    try {
      List<ImagemModel> imagens = await service.GetAll();
      emit(
        ImagemPageState(
          loading: false,
          imagens: imagens,
        ),
      );
    } on Exception catch (ex) {
      emit(
        ImagemPageState(
          loading: false,
          imagens: [],
          error: ex.toString(),
        ),
      );
    }
  }

  void delete(ImagemModel imagem) async {
    try {
      (String, ImagemModel)? result = await service.delete(imagem);
      if (result == null) return;
      emit(
        ImagemPageState(
          loading: false,
          imagens: state.imagens,
          deleted: true,
          message: result.$1,
        ),
      );
    } on Exception catch (ex) {
      emit(
        ImagemPageState(
          loading: false,
          imagens: state.imagens,
          error: ex.toString(),
        ),
      );
    }
  }
}

class ImagemPageState {
  final bool loading;
  final bool deleted;
  final List<ImagemModel> imagens;
  final String error;
  final String message;

  ImagemPageState({
    required this.loading,
    required this.imagens,
    this.error = '',
    this.deleted = false,
    this.message = '',
  });
}
