// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'equipamento_insumo_delete_response_dto.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

EquipamentoInsumoDeleteResponseDTO _$EquipamentoInsumoDeleteResponseDTOFromJson(
    Map<String, dynamic> json) {
  return _EquipamentoInsumoDeleteResponseDTO.fromJson(json);
}

/// @nodoc
mixin _$EquipamentoInsumoDeleteResponseDTO {
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $EquipamentoInsumoDeleteResponseDTOCopyWith<$Res> {
  factory $EquipamentoInsumoDeleteResponseDTOCopyWith(
          EquipamentoInsumoDeleteResponseDTO value,
          $Res Function(EquipamentoInsumoDeleteResponseDTO) then) =
      _$EquipamentoInsumoDeleteResponseDTOCopyWithImpl<$Res,
          EquipamentoInsumoDeleteResponseDTO>;
}

/// @nodoc
class _$EquipamentoInsumoDeleteResponseDTOCopyWithImpl<$Res,
        $Val extends EquipamentoInsumoDeleteResponseDTO>
    implements $EquipamentoInsumoDeleteResponseDTOCopyWith<$Res> {
  _$EquipamentoInsumoDeleteResponseDTOCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;
}

/// @nodoc
abstract class _$$EquipamentoInsumoDeleteResponseDTOImplCopyWith<$Res> {
  factory _$$EquipamentoInsumoDeleteResponseDTOImplCopyWith(
          _$EquipamentoInsumoDeleteResponseDTOImpl value,
          $Res Function(_$EquipamentoInsumoDeleteResponseDTOImpl) then) =
      __$$EquipamentoInsumoDeleteResponseDTOImplCopyWithImpl<$Res>;
}

/// @nodoc
class __$$EquipamentoInsumoDeleteResponseDTOImplCopyWithImpl<$Res>
    extends _$EquipamentoInsumoDeleteResponseDTOCopyWithImpl<$Res,
        _$EquipamentoInsumoDeleteResponseDTOImpl>
    implements _$$EquipamentoInsumoDeleteResponseDTOImplCopyWith<$Res> {
  __$$EquipamentoInsumoDeleteResponseDTOImplCopyWithImpl(
      _$EquipamentoInsumoDeleteResponseDTOImpl _value,
      $Res Function(_$EquipamentoInsumoDeleteResponseDTOImpl) _then)
      : super(_value, _then);
}

/// @nodoc
@JsonSerializable()
class _$EquipamentoInsumoDeleteResponseDTOImpl
    extends _EquipamentoInsumoDeleteResponseDTO with DiagnosticableTreeMixin {
  _$EquipamentoInsumoDeleteResponseDTOImpl() : super._();

  factory _$EquipamentoInsumoDeleteResponseDTOImpl.fromJson(
          Map<String, dynamic> json) =>
      _$$EquipamentoInsumoDeleteResponseDTOImplFromJson(json);

  @override
  String toString({DiagnosticLevel minLevel = DiagnosticLevel.info}) {
    return 'EquipamentoInsumoDeleteResponseDTO()';
  }

  @override
  void debugFillProperties(DiagnosticPropertiesBuilder properties) {
    super.debugFillProperties(properties);
    properties
        .add(DiagnosticsProperty('type', 'EquipamentoInsumoDeleteResponseDTO'));
  }

  @override
  Map<String, dynamic> toJson() {
    return _$$EquipamentoInsumoDeleteResponseDTOImplToJson(
      this,
    );
  }
}

abstract class _EquipamentoInsumoDeleteResponseDTO
    extends EquipamentoInsumoDeleteResponseDTO {
  factory _EquipamentoInsumoDeleteResponseDTO() =
      _$EquipamentoInsumoDeleteResponseDTOImpl;
  _EquipamentoInsumoDeleteResponseDTO._() : super._();

  factory _EquipamentoInsumoDeleteResponseDTO.fromJson(
          Map<String, dynamic> json) =
      _$EquipamentoInsumoDeleteResponseDTOImpl.fromJson;
}
