import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:flutter/foundation.dart';

part 'libera_kit_incompleto_processo_model.freezed.dart';
part 'libera_kit_incompleto_processo_model.g.dart';

@unfreezed
abstract class LiberaKitIncompletoProcessoModel with _$LiberaKitIncompletoProcessoModel {
  const LiberaKitIncompletoProcessoModel._();
  factory LiberaKitIncompletoProcessoModel({
    int? codKit,
  }) = _LiberaKitIncompletoProcessoModel;

  factory LiberaKitIncompletoProcessoModel.fromJson(Map<String, Object?> json) =>
      _$LiberaKitIncompletoProcessoModelFromJson(json);
}
