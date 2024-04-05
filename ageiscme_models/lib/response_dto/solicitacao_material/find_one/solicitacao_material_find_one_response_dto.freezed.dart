// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'solicitacao_material_find_one_response_dto.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

SolicitacaoMaterialFindOneResponseDTO
    _$SolicitacaoMaterialFindOneResponseDTOFromJson(Map<String, dynamic> json) {
  return _SolicitacaoMaterialFindOneResponseDTO.fromJson(json);
}

/// @nodoc
mixin _$SolicitacaoMaterialFindOneResponseDTO {
  SolicitacaoMaterialModel? get solicitacao =>
      throw _privateConstructorUsedError;
  set solicitacao(SolicitacaoMaterialModel? value) =>
      throw _privateConstructorUsedError;
  Map<int, SolicitacaoMaterialFindOneUsuarioResponseDTO> get usuarios =>
      throw _privateConstructorUsedError;
  set usuarios(Map<int, SolicitacaoMaterialFindOneUsuarioResponseDTO> value) =>
      throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $SolicitacaoMaterialFindOneResponseDTOCopyWith<
          SolicitacaoMaterialFindOneResponseDTO>
      get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $SolicitacaoMaterialFindOneResponseDTOCopyWith<$Res> {
  factory $SolicitacaoMaterialFindOneResponseDTOCopyWith(
          SolicitacaoMaterialFindOneResponseDTO value,
          $Res Function(SolicitacaoMaterialFindOneResponseDTO) then) =
      _$SolicitacaoMaterialFindOneResponseDTOCopyWithImpl<$Res,
          SolicitacaoMaterialFindOneResponseDTO>;
  @useResult
  $Res call(
      {SolicitacaoMaterialModel? solicitacao,
      Map<int, SolicitacaoMaterialFindOneUsuarioResponseDTO> usuarios});

  $SolicitacaoMaterialModelCopyWith<$Res>? get solicitacao;
}

/// @nodoc
class _$SolicitacaoMaterialFindOneResponseDTOCopyWithImpl<$Res,
        $Val extends SolicitacaoMaterialFindOneResponseDTO>
    implements $SolicitacaoMaterialFindOneResponseDTOCopyWith<$Res> {
  _$SolicitacaoMaterialFindOneResponseDTOCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? solicitacao = freezed,
    Object? usuarios = null,
  }) {
    return _then(_value.copyWith(
      solicitacao: freezed == solicitacao
          ? _value.solicitacao
          : solicitacao // ignore: cast_nullable_to_non_nullable
              as SolicitacaoMaterialModel?,
      usuarios: null == usuarios
          ? _value.usuarios
          : usuarios // ignore: cast_nullable_to_non_nullable
              as Map<int, SolicitacaoMaterialFindOneUsuarioResponseDTO>,
    ) as $Val);
  }

  @override
  @pragma('vm:prefer-inline')
  $SolicitacaoMaterialModelCopyWith<$Res>? get solicitacao {
    if (_value.solicitacao == null) {
      return null;
    }

    return $SolicitacaoMaterialModelCopyWith<$Res>(_value.solicitacao!,
        (value) {
      return _then(_value.copyWith(solicitacao: value) as $Val);
    });
  }
}

/// @nodoc
abstract class _$$SolicitacaoMaterialFindOneResponseDTOImplCopyWith<$Res>
    implements $SolicitacaoMaterialFindOneResponseDTOCopyWith<$Res> {
  factory _$$SolicitacaoMaterialFindOneResponseDTOImplCopyWith(
          _$SolicitacaoMaterialFindOneResponseDTOImpl value,
          $Res Function(_$SolicitacaoMaterialFindOneResponseDTOImpl) then) =
      __$$SolicitacaoMaterialFindOneResponseDTOImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {SolicitacaoMaterialModel? solicitacao,
      Map<int, SolicitacaoMaterialFindOneUsuarioResponseDTO> usuarios});

  @override
  $SolicitacaoMaterialModelCopyWith<$Res>? get solicitacao;
}

/// @nodoc
class __$$SolicitacaoMaterialFindOneResponseDTOImplCopyWithImpl<$Res>
    extends _$SolicitacaoMaterialFindOneResponseDTOCopyWithImpl<$Res,
        _$SolicitacaoMaterialFindOneResponseDTOImpl>
    implements _$$SolicitacaoMaterialFindOneResponseDTOImplCopyWith<$Res> {
  __$$SolicitacaoMaterialFindOneResponseDTOImplCopyWithImpl(
      _$SolicitacaoMaterialFindOneResponseDTOImpl _value,
      $Res Function(_$SolicitacaoMaterialFindOneResponseDTOImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? solicitacao = freezed,
    Object? usuarios = null,
  }) {
    return _then(_$SolicitacaoMaterialFindOneResponseDTOImpl(
      solicitacao: freezed == solicitacao
          ? _value.solicitacao
          : solicitacao // ignore: cast_nullable_to_non_nullable
              as SolicitacaoMaterialModel?,
      usuarios: null == usuarios
          ? _value.usuarios
          : usuarios // ignore: cast_nullable_to_non_nullable
              as Map<int, SolicitacaoMaterialFindOneUsuarioResponseDTO>,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$SolicitacaoMaterialFindOneResponseDTOImpl
    with DiagnosticableTreeMixin
    implements _SolicitacaoMaterialFindOneResponseDTO {
  _$SolicitacaoMaterialFindOneResponseDTOImpl(
      {this.solicitacao, required this.usuarios});

  factory _$SolicitacaoMaterialFindOneResponseDTOImpl.fromJson(
          Map<String, dynamic> json) =>
      _$$SolicitacaoMaterialFindOneResponseDTOImplFromJson(json);

  @override
  SolicitacaoMaterialModel? solicitacao;
  @override
  Map<int, SolicitacaoMaterialFindOneUsuarioResponseDTO> usuarios;

  @override
  String toString({DiagnosticLevel minLevel = DiagnosticLevel.info}) {
    return 'SolicitacaoMaterialFindOneResponseDTO(solicitacao: $solicitacao, usuarios: $usuarios)';
  }

  @override
  void debugFillProperties(DiagnosticPropertiesBuilder properties) {
    super.debugFillProperties(properties);
    properties
      ..add(
          DiagnosticsProperty('type', 'SolicitacaoMaterialFindOneResponseDTO'))
      ..add(DiagnosticsProperty('solicitacao', solicitacao))
      ..add(DiagnosticsProperty('usuarios', usuarios));
  }

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$SolicitacaoMaterialFindOneResponseDTOImplCopyWith<
          _$SolicitacaoMaterialFindOneResponseDTOImpl>
      get copyWith => __$$SolicitacaoMaterialFindOneResponseDTOImplCopyWithImpl<
          _$SolicitacaoMaterialFindOneResponseDTOImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$SolicitacaoMaterialFindOneResponseDTOImplToJson(
      this,
    );
  }
}

abstract class _SolicitacaoMaterialFindOneResponseDTO
    implements SolicitacaoMaterialFindOneResponseDTO {
  factory _SolicitacaoMaterialFindOneResponseDTO(
      {SolicitacaoMaterialModel? solicitacao,
      required Map<int, SolicitacaoMaterialFindOneUsuarioResponseDTO>
          usuarios}) = _$SolicitacaoMaterialFindOneResponseDTOImpl;

  factory _SolicitacaoMaterialFindOneResponseDTO.fromJson(
          Map<String, dynamic> json) =
      _$SolicitacaoMaterialFindOneResponseDTOImpl.fromJson;

  @override
  SolicitacaoMaterialModel? get solicitacao;
  set solicitacao(SolicitacaoMaterialModel? value);
  @override
  Map<int, SolicitacaoMaterialFindOneUsuarioResponseDTO> get usuarios;
  set usuarios(Map<int, SolicitacaoMaterialFindOneUsuarioResponseDTO> value);
  @override
  @JsonKey(ignore: true)
  _$$SolicitacaoMaterialFindOneResponseDTOImplCopyWith<
          _$SolicitacaoMaterialFindOneResponseDTOImpl>
      get copyWith => throw _privateConstructorUsedError;
}
