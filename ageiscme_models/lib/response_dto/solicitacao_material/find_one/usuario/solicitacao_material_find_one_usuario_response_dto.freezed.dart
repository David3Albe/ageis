// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'solicitacao_material_find_one_usuario_response_dto.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

SolicitacaoMaterialFindOneUsuarioResponseDTO
    _$SolicitacaoMaterialFindOneUsuarioResponseDTOFromJson(
        Map<String, dynamic> json) {
  return _SolicitacaoMaterialFindOneUsuarioResponseDTO.fromJson(json);
}

/// @nodoc
mixin _$SolicitacaoMaterialFindOneUsuarioResponseDTO {
  int get cod => throw _privateConstructorUsedError;
  set cod(int value) => throw _privateConstructorUsedError;
  String get nome => throw _privateConstructorUsedError;
  set nome(String value) => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $SolicitacaoMaterialFindOneUsuarioResponseDTOCopyWith<
          SolicitacaoMaterialFindOneUsuarioResponseDTO>
      get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $SolicitacaoMaterialFindOneUsuarioResponseDTOCopyWith<$Res> {
  factory $SolicitacaoMaterialFindOneUsuarioResponseDTOCopyWith(
          SolicitacaoMaterialFindOneUsuarioResponseDTO value,
          $Res Function(SolicitacaoMaterialFindOneUsuarioResponseDTO) then) =
      _$SolicitacaoMaterialFindOneUsuarioResponseDTOCopyWithImpl<$Res,
          SolicitacaoMaterialFindOneUsuarioResponseDTO>;
  @useResult
  $Res call({int cod, String nome});
}

/// @nodoc
class _$SolicitacaoMaterialFindOneUsuarioResponseDTOCopyWithImpl<$Res,
        $Val extends SolicitacaoMaterialFindOneUsuarioResponseDTO>
    implements $SolicitacaoMaterialFindOneUsuarioResponseDTOCopyWith<$Res> {
  _$SolicitacaoMaterialFindOneUsuarioResponseDTOCopyWithImpl(
      this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? cod = null,
    Object? nome = null,
  }) {
    return _then(_value.copyWith(
      cod: null == cod
          ? _value.cod
          : cod // ignore: cast_nullable_to_non_nullable
              as int,
      nome: null == nome
          ? _value.nome
          : nome // ignore: cast_nullable_to_non_nullable
              as String,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$SolicitacaoMaterialFindOneUsuarioResponseDTOImplCopyWith<$Res>
    implements $SolicitacaoMaterialFindOneUsuarioResponseDTOCopyWith<$Res> {
  factory _$$SolicitacaoMaterialFindOneUsuarioResponseDTOImplCopyWith(
          _$SolicitacaoMaterialFindOneUsuarioResponseDTOImpl value,
          $Res Function(_$SolicitacaoMaterialFindOneUsuarioResponseDTOImpl)
              then) =
      __$$SolicitacaoMaterialFindOneUsuarioResponseDTOImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({int cod, String nome});
}

/// @nodoc
class __$$SolicitacaoMaterialFindOneUsuarioResponseDTOImplCopyWithImpl<$Res>
    extends _$SolicitacaoMaterialFindOneUsuarioResponseDTOCopyWithImpl<$Res,
        _$SolicitacaoMaterialFindOneUsuarioResponseDTOImpl>
    implements
        _$$SolicitacaoMaterialFindOneUsuarioResponseDTOImplCopyWith<$Res> {
  __$$SolicitacaoMaterialFindOneUsuarioResponseDTOImplCopyWithImpl(
      _$SolicitacaoMaterialFindOneUsuarioResponseDTOImpl _value,
      $Res Function(_$SolicitacaoMaterialFindOneUsuarioResponseDTOImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? cod = null,
    Object? nome = null,
  }) {
    return _then(_$SolicitacaoMaterialFindOneUsuarioResponseDTOImpl(
      cod: null == cod
          ? _value.cod
          : cod // ignore: cast_nullable_to_non_nullable
              as int,
      nome: null == nome
          ? _value.nome
          : nome // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$SolicitacaoMaterialFindOneUsuarioResponseDTOImpl
    with DiagnosticableTreeMixin
    implements _SolicitacaoMaterialFindOneUsuarioResponseDTO {
  _$SolicitacaoMaterialFindOneUsuarioResponseDTOImpl(
      {required this.cod, required this.nome});

  factory _$SolicitacaoMaterialFindOneUsuarioResponseDTOImpl.fromJson(
          Map<String, dynamic> json) =>
      _$$SolicitacaoMaterialFindOneUsuarioResponseDTOImplFromJson(json);

  @override
  int cod;
  @override
  String nome;

  @override
  String toString({DiagnosticLevel minLevel = DiagnosticLevel.info}) {
    return 'SolicitacaoMaterialFindOneUsuarioResponseDTO(cod: $cod, nome: $nome)';
  }

  @override
  void debugFillProperties(DiagnosticPropertiesBuilder properties) {
    super.debugFillProperties(properties);
    properties
      ..add(DiagnosticsProperty(
          'type', 'SolicitacaoMaterialFindOneUsuarioResponseDTO'))
      ..add(DiagnosticsProperty('cod', cod))
      ..add(DiagnosticsProperty('nome', nome));
  }

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$SolicitacaoMaterialFindOneUsuarioResponseDTOImplCopyWith<
          _$SolicitacaoMaterialFindOneUsuarioResponseDTOImpl>
      get copyWith =>
          __$$SolicitacaoMaterialFindOneUsuarioResponseDTOImplCopyWithImpl<
                  _$SolicitacaoMaterialFindOneUsuarioResponseDTOImpl>(
              this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$SolicitacaoMaterialFindOneUsuarioResponseDTOImplToJson(
      this,
    );
  }
}

abstract class _SolicitacaoMaterialFindOneUsuarioResponseDTO
    implements SolicitacaoMaterialFindOneUsuarioResponseDTO {
  factory _SolicitacaoMaterialFindOneUsuarioResponseDTO(
          {required int cod, required String nome}) =
      _$SolicitacaoMaterialFindOneUsuarioResponseDTOImpl;

  factory _SolicitacaoMaterialFindOneUsuarioResponseDTO.fromJson(
          Map<String, dynamic> json) =
      _$SolicitacaoMaterialFindOneUsuarioResponseDTOImpl.fromJson;

  @override
  int get cod;
  set cod(int value);
  @override
  String get nome;
  set nome(String value);
  @override
  @JsonKey(ignore: true)
  _$$SolicitacaoMaterialFindOneUsuarioResponseDTOImplCopyWith<
          _$SolicitacaoMaterialFindOneUsuarioResponseDTOImpl>
      get copyWith => throw _privateConstructorUsedError;
}
