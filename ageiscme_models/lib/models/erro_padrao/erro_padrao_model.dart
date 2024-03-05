import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:flutter/foundation.dart';

part 'erro_padrao_model.g.dart';
part 'erro_padrao_model.freezed.dart';

@unfreezed
sealed class ErroPadraoModel with _$ErroPadraoModel {
  const ErroPadraoModel._();

  factory ErroPadraoModel({
    required String? message,
    required dynamic data,
  }) = _ErroPadraoModel;
 
  factory ErroPadraoModel.fromJson(Map<String, Object?> json) =>
      _$ErroPadraoModelFromJson(json);
}
