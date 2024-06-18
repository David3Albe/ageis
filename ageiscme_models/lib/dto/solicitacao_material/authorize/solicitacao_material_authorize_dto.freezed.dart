// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'solicitacao_material_authorize_dto.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

SolicitacaoMaterialAuthorizeDTO _$SolicitacaoMaterialAuthorizeDTOFromJson(
    Map<String, dynamic> json) {
  return _SolicitacaoMaterialAuthorizeDTO.fromJson(json);
}

/// @nodoc
mixin _$SolicitacaoMaterialAuthorizeDTO {
  int get cod => throw _privateConstructorUsedError;
  set cod(int value) => throw _privateConstructorUsedError;
  String get codBarraUsuario => throw _privateConstructorUsedError;
  set codBarraUsuario(String value) => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $SolicitacaoMaterialAuthorizeDTOCopyWith<SolicitacaoMaterialAuthorizeDTO>
      get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $SolicitacaoMaterialAuthorizeDTOCopyWith<$Res> {
  factory $SolicitacaoMaterialAuthorizeDTOCopyWith(
          SolicitacaoMaterialAuthorizeDTO value,
          $Res Function(SolicitacaoMaterialAuthorizeDTO) then) =
      _$SolicitacaoMaterialAuthorizeDTOCopyWithImpl<$Res,
          SolicitacaoMaterialAuthorizeDTO>;
  @useResult
  $Res call({int cod, String codBarraUsuario});
}

/// @nodoc
class _$SolicitacaoMaterialAuthorizeDTOCopyWithImpl<$Res,
        $Val extends SolicitacaoMaterialAuthorizeDTO>
    implements $SolicitacaoMaterialAuthorizeDTOCopyWith<$Res> {
  _$SolicitacaoMaterialAuthorizeDTOCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? cod = null,
    Object? codBarraUsuario = null,
  }) {
    return _then(_value.copyWith(
      cod: null == cod
          ? _value.cod
          : cod // ignore: cast_nullable_to_non_nullable
              as int,
      codBarraUsuario: null == codBarraUsuario
          ? _value.codBarraUsuario
          : codBarraUsuario // ignore: cast_nullable_to_non_nullable
              as String,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$SolicitacaoMaterialAuthorizeDTOImplCopyWith<$Res>
    implements $SolicitacaoMaterialAuthorizeDTOCopyWith<$Res> {
  factory _$$SolicitacaoMaterialAuthorizeDTOImplCopyWith(
          _$SolicitacaoMaterialAuthorizeDTOImpl value,
          $Res Function(_$SolicitacaoMaterialAuthorizeDTOImpl) then) =
      __$$SolicitacaoMaterialAuthorizeDTOImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({int cod, String codBarraUsuario});
}

/// @nodoc
class __$$SolicitacaoMaterialAuthorizeDTOImplCopyWithImpl<$Res>
    extends _$SolicitacaoMaterialAuthorizeDTOCopyWithImpl<$Res,
        _$SolicitacaoMaterialAuthorizeDTOImpl>
    implements _$$SolicitacaoMaterialAuthorizeDTOImplCopyWith<$Res> {
  __$$SolicitacaoMaterialAuthorizeDTOImplCopyWithImpl(
      _$SolicitacaoMaterialAuthorizeDTOImpl _value,
      $Res Function(_$SolicitacaoMaterialAuthorizeDTOImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? cod = null,
    Object? codBarraUsuario = null,
  }) {
    return _then(_$SolicitacaoMaterialAuthorizeDTOImpl(
      cod: null == cod
          ? _value.cod
          : cod // ignore: cast_nullable_to_non_nullable
              as int,
      codBarraUsuario: null == codBarraUsuario
          ? _value.codBarraUsuario
          : codBarraUsuario // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$SolicitacaoMaterialAuthorizeDTOImpl
    with DiagnosticableTreeMixin
    implements _SolicitacaoMaterialAuthorizeDTO {
  _$SolicitacaoMaterialAuthorizeDTOImpl(
      {required this.cod, required this.codBarraUsuario});

  factory _$SolicitacaoMaterialAuthorizeDTOImpl.fromJson(
          Map<String, dynamic> json) =>
      _$$SolicitacaoMaterialAuthorizeDTOImplFromJson(json);

  @override
  int cod;
  @override
  String codBarraUsuario;

  @override
  String toString({DiagnosticLevel minLevel = DiagnosticLevel.info}) {
    return 'SolicitacaoMaterialAuthorizeDTO(cod: $cod, codBarraUsuario: $codBarraUsuario)';
  }

  @override
  void debugFillProperties(DiagnosticPropertiesBuilder properties) {
    super.debugFillProperties(properties);
    properties
      ..add(DiagnosticsProperty('type', 'SolicitacaoMaterialAuthorizeDTO'))
      ..add(DiagnosticsProperty('cod', cod))
      ..add(DiagnosticsProperty('codBarraUsuario', codBarraUsuario));
  }

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$SolicitacaoMaterialAuthorizeDTOImplCopyWith<
          _$SolicitacaoMaterialAuthorizeDTOImpl>
      get copyWith => __$$SolicitacaoMaterialAuthorizeDTOImplCopyWithImpl<
          _$SolicitacaoMaterialAuthorizeDTOImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$SolicitacaoMaterialAuthorizeDTOImplToJson(
      this,
    );
  }
}

abstract class _SolicitacaoMaterialAuthorizeDTO
    implements SolicitacaoMaterialAuthorizeDTO {
  factory _SolicitacaoMaterialAuthorizeDTO(
      {required int cod,
      required String codBarraUsuario}) = _$SolicitacaoMaterialAuthorizeDTOImpl;

  factory _SolicitacaoMaterialAuthorizeDTO.fromJson(Map<String, dynamic> json) =
      _$SolicitacaoMaterialAuthorizeDTOImpl.fromJson;

  @override
  int get cod;
  set cod(int value);
  @override
  String get codBarraUsuario;
  set codBarraUsuario(String value);
  @override
  @JsonKey(ignore: true)
  _$$SolicitacaoMaterialAuthorizeDTOImplCopyWith<
          _$SolicitacaoMaterialAuthorizeDTOImpl>
      get copyWith => throw _privateConstructorUsedError;
}
