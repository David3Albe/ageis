// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'solicitacao_material_receive_response_dto.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

SolicitacaoMaterialReceiveResponseDTO
    _$SolicitacaoMaterialReceiveResponseDTOFromJson(Map<String, dynamic> json) {
  return _SolicitacaoMaterialReceiveResponseDTO.fromJson(json);
}

/// @nodoc
mixin _$SolicitacaoMaterialReceiveResponseDTO {
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $SolicitacaoMaterialReceiveResponseDTOCopyWith<$Res> {
  factory $SolicitacaoMaterialReceiveResponseDTOCopyWith(
          SolicitacaoMaterialReceiveResponseDTO value,
          $Res Function(SolicitacaoMaterialReceiveResponseDTO) then) =
      _$SolicitacaoMaterialReceiveResponseDTOCopyWithImpl<$Res,
          SolicitacaoMaterialReceiveResponseDTO>;
}

/// @nodoc
class _$SolicitacaoMaterialReceiveResponseDTOCopyWithImpl<$Res,
        $Val extends SolicitacaoMaterialReceiveResponseDTO>
    implements $SolicitacaoMaterialReceiveResponseDTOCopyWith<$Res> {
  _$SolicitacaoMaterialReceiveResponseDTOCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;
}

/// @nodoc
abstract class _$$SolicitacaoMaterialReceiveResponseDTOImplCopyWith<$Res> {
  factory _$$SolicitacaoMaterialReceiveResponseDTOImplCopyWith(
          _$SolicitacaoMaterialReceiveResponseDTOImpl value,
          $Res Function(_$SolicitacaoMaterialReceiveResponseDTOImpl) then) =
      __$$SolicitacaoMaterialReceiveResponseDTOImplCopyWithImpl<$Res>;
}

/// @nodoc
class __$$SolicitacaoMaterialReceiveResponseDTOImplCopyWithImpl<$Res>
    extends _$SolicitacaoMaterialReceiveResponseDTOCopyWithImpl<$Res,
        _$SolicitacaoMaterialReceiveResponseDTOImpl>
    implements _$$SolicitacaoMaterialReceiveResponseDTOImplCopyWith<$Res> {
  __$$SolicitacaoMaterialReceiveResponseDTOImplCopyWithImpl(
      _$SolicitacaoMaterialReceiveResponseDTOImpl _value,
      $Res Function(_$SolicitacaoMaterialReceiveResponseDTOImpl) _then)
      : super(_value, _then);
}

/// @nodoc
@JsonSerializable()
class _$SolicitacaoMaterialReceiveResponseDTOImpl
    with DiagnosticableTreeMixin
    implements _SolicitacaoMaterialReceiveResponseDTO {
  _$SolicitacaoMaterialReceiveResponseDTOImpl();

  factory _$SolicitacaoMaterialReceiveResponseDTOImpl.fromJson(
          Map<String, dynamic> json) =>
      _$$SolicitacaoMaterialReceiveResponseDTOImplFromJson(json);

  @override
  String toString({DiagnosticLevel minLevel = DiagnosticLevel.info}) {
    return 'SolicitacaoMaterialReceiveResponseDTO()';
  }

  @override
  void debugFillProperties(DiagnosticPropertiesBuilder properties) {
    super.debugFillProperties(properties);
    properties.add(
        DiagnosticsProperty('type', 'SolicitacaoMaterialReceiveResponseDTO'));
  }

  @override
  Map<String, dynamic> toJson() {
    return _$$SolicitacaoMaterialReceiveResponseDTOImplToJson(
      this,
    );
  }
}

abstract class _SolicitacaoMaterialReceiveResponseDTO
    implements SolicitacaoMaterialReceiveResponseDTO {
  factory _SolicitacaoMaterialReceiveResponseDTO() =
      _$SolicitacaoMaterialReceiveResponseDTOImpl;

  factory _SolicitacaoMaterialReceiveResponseDTO.fromJson(
          Map<String, dynamic> json) =
      _$SolicitacaoMaterialReceiveResponseDTOImpl.fromJson;
}
