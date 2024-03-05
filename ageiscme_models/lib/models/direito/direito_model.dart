import 'package:freezed_annotation/freezed_annotation.dart';

part 'direito_model.g.dart';
part 'direito_model.freezed.dart';

@unfreezed
sealed class DireitoModel with _$DireitoModel {
  const DireitoModel._();

  factory DireitoModel({
    required int? cod,
    required String? descricao,
    required String? tipo,
    required int? codEtapaProcesso,
    @JsonKey(name: 'tStamp') required String? tstamp,
  }) = _DireitoModel;

  factory DireitoModel.fromJson(Map<String, Object?> json) =>
      _$DireitoModelFromJson(json);

  static DireitoModel copy(DireitoModel direito) {
    return DireitoModel.fromJson(direito.toJson());
  }

  factory DireitoModel.empty() => DireitoModel(
        cod: 0,
        descricao: '',
        tstamp: '',
        codEtapaProcesso: 0,
        tipo: '',
      );
}
