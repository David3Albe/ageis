import 'package:ageiscme_data/services/imagem/imagem_service.dart';
import 'package:ageiscme_models/filters/imagem/imagem_filter.dart';
import 'package:ageiscme_models/models/imagem/imagem_model.dart';
import 'package:dependencias_comuns/bloc_export.dart';

class ImagemCubit extends Cubit<ImagemState> {
  ImagemCubit() : super(ImagemState(imagens: []));

  void loadFilter(ImagemFilter filter) async {
    emit(
      ImagemState(
        imagens: [],
        loading: true,
      ),
    );
    List<ImagemModel> imagens = await ImagemService().Filter(filter) ?? [];
    emit(
      ImagemState(
        imagens: imagens,
        loaded: true,
      ),
    );
  }

  void clear() => emit(ImagemState(imagens: []));
}

class ImagemState {
  List<ImagemModel> imagens;
  bool loading;
  bool loaded;

  ImagemState({
    required this.imagens,
    this.loading = false,
    this.loaded = false,
  });
}
