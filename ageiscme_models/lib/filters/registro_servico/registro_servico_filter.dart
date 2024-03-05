import 'package:freezed_annotation/freezed_annotation.dart';

part 'registro_servico_filter.g.dart';
part 'registro_servico_filter.freezed.dart';

@unfreezed
sealed class RegistroServicoFilter with _$RegistroServicoFilter {
  factory RegistroServicoFilter({
    int? cod,
    DateTime? startDate,
    DateTime? finalDate,
    int? codEquipamento,
    bool? carregarImagens,
    bool? carregarUsuario,
    @JsonKey(name: 'tStamp') String? tStamp,
  }) = _RegistroServicoFilter;

  factory RegistroServicoFilter.fromJson(Map<String, Object?> json) =>
      _$RegistroServicoFilterFromJson(json);

  static RegistroServicoFilter copy(RegistroServicoFilter obj) {
    return RegistroServicoFilter.fromJson(obj.toJson());
  }

  factory RegistroServicoFilter.empty() => RegistroServicoFilter(
        startDate: null,
        finalDate: null,
        codEquipamento: null,
        carregarImagens: false,
        cod: null,
        tStamp: null,
        carregarUsuario: null
      );
}
