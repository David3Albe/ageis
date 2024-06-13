import 'package:ageiscme_mixins/mixins/image/image_mixin.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'imagem_model.freezed.dart';
part 'imagem_model.g.dart';

@unfreezed
abstract class ImagemModel with _$ImagemModel, ImagemMixin {
  ImagemModel._();

  factory ImagemModel({
    required int? cod,
    required String? identificadorImagem,
    required String? nomeFoto,
    required String? foto,
    required int? codInstituicao,
    required bool? ativo,
    required DateTime? ultimaAlteracao,
    @JsonKey(name: 'tStamp') required String? tstamp,
  }) = _ImagemModel;

  factory ImagemModel.fromJson(Map<String, Object?> json) =>
      _$ImagemModelFromJson(json);

  static ImagemModel copy(ImagemModel imagem) {
    return ImagemModel.fromJson(imagem.toJson());
  }

  factory ImagemModel.empty() => ImagemModel(
        cod: 0,
        nomeFoto: '',
        foto: null,
        identificadorImagem: '',
        codInstituicao: 0,
        ativo: true,
        ultimaAlteracao: null,
        tstamp: '',
      );
}
