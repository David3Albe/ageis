// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'solicitacao_material_authorize_response_dto.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

SolicitacaoMaterialAuthorizeResponseDTO
    _$SolicitacaoMaterialAuthorizeResponseDTOFromJson(
        Map<String, dynamic> json) {
  return _SolicitacaoMaterialAuthorizeResponseDTO.fromJson(json);
}

/// @nodoc
mixin _$SolicitacaoMaterialAuthorizeResponseDTO {
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $SolicitacaoMaterialAuthorizeResponseDTOCopyWith<$Res> {
  factory $SolicitacaoMaterialAuthorizeResponseDTOCopyWith(
          SolicitacaoMaterialAuthorizeResponseDTO value,
          $Res Function(SolicitacaoMaterialAuthorizeResponseDTO) then) =
      _$SolicitacaoMaterialAuthorizeResponseDTOCopyWithImpl<$Res,
          SolicitacaoMaterialAuthorizeResponseDTO>;
}

/// @nodoc
class _$SolicitacaoMaterialAuthorizeResponseDTOCopyWithImpl<$Res,
        $Val extends SolicitacaoMaterialAuthorizeResponseDTO>
    implements $SolicitacaoMaterialAuthorizeResponseDTOCopyWith<$Res> {
  _$SolicitacaoMaterialAuthorizeResponseDTOCopyWithImpl(
      this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;
}

/// @nodoc
abstract class _$$SolicitacaoMaterialAuthorizeResponseDTOImplCopyWith<$Res> {
  factory _$$SolicitacaoMaterialAuthorizeResponseDTOImplCopyWith(
          _$SolicitacaoMaterialAuthorizeResponseDTOImpl value,
          $Res Function(_$SolicitacaoMaterialAuthorizeResponseDTOImpl) then) =
      __$$SolicitacaoMaterialAuthorizeResponseDTOImplCopyWithImpl<$Res>;
}

/// @nodoc
class __$$SolicitacaoMaterialAuthorizeResponseDTOImplCopyWithImpl<$Res>
    extends _$SolicitacaoMaterialAuthorizeResponseDTOCopyWithImpl<$Res,
        _$SolicitacaoMaterialAuthorizeResponseDTOImpl>
    implements _$$SolicitacaoMaterialAuthorizeResponseDTOImplCopyWith<$Res> {
  __$$SolicitacaoMaterialAuthorizeResponseDTOImplCopyWithImpl(
      _$SolicitacaoMaterialAuthorizeResponseDTOImpl _value,
      $Res Function(_$SolicitacaoMaterialAuthorizeResponseDTOImpl) _then)
      : super(_value, _then);
}

/// @nodoc
@JsonSerializable()
class _$SolicitacaoMaterialAuthorizeResponseDTOImpl
    with DiagnosticableTreeMixin
    implements _SolicitacaoMaterialAuthorizeResponseDTO {
  _$SolicitacaoMaterialAuthorizeResponseDTOImpl();

  factory _$SolicitacaoMaterialAuthorizeResponseDTOImpl.fromJson(
          Map<String, dynamic> json) =>
      _$$SolicitacaoMaterialAuthorizeResponseDTOImplFromJson(json);

  @override
  String toString({DiagnosticLevel minLevel = DiagnosticLevel.info}) {
    return 'SolicitacaoMaterialAuthorizeResponseDTO()';
  }

  @override
  void debugFillProperties(DiagnosticPropertiesBuilder properties) {
    super.debugFillProperties(properties);
    properties.add(
        DiagnosticsProperty('type', 'SolicitacaoMaterialAuthorizeResponseDTO'));
  }

  @override
  Map<String, dynamic> toJson() {
    return _$$SolicitacaoMaterialAuthorizeResponseDTOImplToJson(
      this,
    );
  }
}

abstract class _SolicitacaoMaterialAuthorizeResponseDTO
    implements SolicitacaoMaterialAuthorizeResponseDTO {
  factory _SolicitacaoMaterialAuthorizeResponseDTO() =
      _$SolicitacaoMaterialAuthorizeResponseDTOImpl;

  factory _SolicitacaoMaterialAuthorizeResponseDTO.fromJson(
          Map<String, dynamic> json) =
      _$SolicitacaoMaterialAuthorizeResponseDTOImpl.fromJson;
}
