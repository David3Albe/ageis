// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'equipamento_insumo_dto.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

EquipamentoInsumoDTO _$EquipamentoInsumoDTOFromJson(Map<String, dynamic> json) {
  return _EquipamentoInsumoDTO.fromJson(json);
}

/// @nodoc
mixin _$EquipamentoInsumoDTO {
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $EquipamentoInsumoDTOCopyWith<$Res> {
  factory $EquipamentoInsumoDTOCopyWith(EquipamentoInsumoDTO value,
          $Res Function(EquipamentoInsumoDTO) then) =
      _$EquipamentoInsumoDTOCopyWithImpl<$Res, EquipamentoInsumoDTO>;
}

/// @nodoc
class _$EquipamentoInsumoDTOCopyWithImpl<$Res,
        $Val extends EquipamentoInsumoDTO>
    implements $EquipamentoInsumoDTOCopyWith<$Res> {
  _$EquipamentoInsumoDTOCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;
}

/// @nodoc
abstract class _$$EquipamentoInsumoDTOImplCopyWith<$Res> {
  factory _$$EquipamentoInsumoDTOImplCopyWith(_$EquipamentoInsumoDTOImpl value,
          $Res Function(_$EquipamentoInsumoDTOImpl) then) =
      __$$EquipamentoInsumoDTOImplCopyWithImpl<$Res>;
}

/// @nodoc
class __$$EquipamentoInsumoDTOImplCopyWithImpl<$Res>
    extends _$EquipamentoInsumoDTOCopyWithImpl<$Res, _$EquipamentoInsumoDTOImpl>
    implements _$$EquipamentoInsumoDTOImplCopyWith<$Res> {
  __$$EquipamentoInsumoDTOImplCopyWithImpl(_$EquipamentoInsumoDTOImpl _value,
      $Res Function(_$EquipamentoInsumoDTOImpl) _then)
      : super(_value, _then);
}

/// @nodoc
@JsonSerializable()
class _$EquipamentoInsumoDTOImpl extends _EquipamentoInsumoDTO
    with DiagnosticableTreeMixin {
  _$EquipamentoInsumoDTOImpl() : super._();

  factory _$EquipamentoInsumoDTOImpl.fromJson(Map<String, dynamic> json) =>
      _$$EquipamentoInsumoDTOImplFromJson(json);

  @override
  String toString({DiagnosticLevel minLevel = DiagnosticLevel.info}) {
    return 'EquipamentoInsumoDTO()';
  }

  @override
  void debugFillProperties(DiagnosticPropertiesBuilder properties) {
    super.debugFillProperties(properties);
    properties.add(DiagnosticsProperty('type', 'EquipamentoInsumoDTO'));
  }

  @override
  Map<String, dynamic> toJson() {
    return _$$EquipamentoInsumoDTOImplToJson(
      this,
    );
  }
}

abstract class _EquipamentoInsumoDTO extends EquipamentoInsumoDTO {
  factory _EquipamentoInsumoDTO() = _$EquipamentoInsumoDTOImpl;
  _EquipamentoInsumoDTO._() : super._();

  factory _EquipamentoInsumoDTO.fromJson(Map<String, dynamic> json) =
      _$EquipamentoInsumoDTOImpl.fromJson;
}
