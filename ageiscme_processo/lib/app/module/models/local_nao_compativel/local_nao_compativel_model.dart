import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:flutter/foundation.dart';

part 'local_nao_compativel_model.freezed.dart';
part 'local_nao_compativel_model.g.dart';

@unfreezed
abstract class LocalNaoCompativelModel with _$LocalNaoCompativelModel {
  const LocalNaoCompativelModel._();
  factory LocalNaoCompativelModel({
    int? codUsuarioResponsavel,
    bool? confirmou,
  }) = _LocalNaoCompativelModel;

  factory LocalNaoCompativelModel.fromJson(Map<String, Object?> json) =>
      _$LocalNaoCompativelModelFromJson(json);
}
