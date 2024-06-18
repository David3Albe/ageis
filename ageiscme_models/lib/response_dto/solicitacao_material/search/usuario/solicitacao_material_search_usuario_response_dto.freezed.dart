// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'solicitacao_material_search_usuario_response_dto.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

SolicitacaoMaterialSearchUsuarioResponseDTO
    _$SolicitacaoMaterialSearchUsuarioResponseDTOFromJson(
        Map<String, dynamic> json) {
  return _SolicitacaoMaterialSearchUsuarioResponseDTO.fromJson(json);
}

/// @nodoc
mixin _$SolicitacaoMaterialSearchUsuarioResponseDTO {
  int get cod => throw _privateConstructorUsedError;
  set cod(int value) => throw _privateConstructorUsedError;
  String get nome => throw _privateConstructorUsedError;
  set nome(String value) => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $SolicitacaoMaterialSearchUsuarioResponseDTOCopyWith<
          SolicitacaoMaterialSearchUsuarioResponseDTO>
      get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $SolicitacaoMaterialSearchUsuarioResponseDTOCopyWith<$Res> {
  factory $SolicitacaoMaterialSearchUsuarioResponseDTOCopyWith(
          SolicitacaoMaterialSearchUsuarioResponseDTO value,
          $Res Function(SolicitacaoMaterialSearchUsuarioResponseDTO) then) =
      _$SolicitacaoMaterialSearchUsuarioResponseDTOCopyWithImpl<$Res,
          SolicitacaoMaterialSearchUsuarioResponseDTO>;
  @useResult
  $Res call({int cod, String nome});
}

/// @nodoc
class _$SolicitacaoMaterialSearchUsuarioResponseDTOCopyWithImpl<$Res,
        $Val extends SolicitacaoMaterialSearchUsuarioResponseDTO>
    implements $SolicitacaoMaterialSearchUsuarioResponseDTOCopyWith<$Res> {
  _$SolicitacaoMaterialSearchUsuarioResponseDTOCopyWithImpl(
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
abstract class _$$SolicitacaoMaterialSearchUsuarioResponseDTOImplCopyWith<$Res>
    implements $SolicitacaoMaterialSearchUsuarioResponseDTOCopyWith<$Res> {
  factory _$$SolicitacaoMaterialSearchUsuarioResponseDTOImplCopyWith(
          _$SolicitacaoMaterialSearchUsuarioResponseDTOImpl value,
          $Res Function(_$SolicitacaoMaterialSearchUsuarioResponseDTOImpl)
              then) =
      __$$SolicitacaoMaterialSearchUsuarioResponseDTOImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({int cod, String nome});
}

/// @nodoc
class __$$SolicitacaoMaterialSearchUsuarioResponseDTOImplCopyWithImpl<$Res>
    extends _$SolicitacaoMaterialSearchUsuarioResponseDTOCopyWithImpl<$Res,
        _$SolicitacaoMaterialSearchUsuarioResponseDTOImpl>
    implements
        _$$SolicitacaoMaterialSearchUsuarioResponseDTOImplCopyWith<$Res> {
  __$$SolicitacaoMaterialSearchUsuarioResponseDTOImplCopyWithImpl(
      _$SolicitacaoMaterialSearchUsuarioResponseDTOImpl _value,
      $Res Function(_$SolicitacaoMaterialSearchUsuarioResponseDTOImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? cod = null,
    Object? nome = null,
  }) {
    return _then(_$SolicitacaoMaterialSearchUsuarioResponseDTOImpl(
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
class _$SolicitacaoMaterialSearchUsuarioResponseDTOImpl
    with DiagnosticableTreeMixin
    implements _SolicitacaoMaterialSearchUsuarioResponseDTO {
  _$SolicitacaoMaterialSearchUsuarioResponseDTOImpl(
      {required this.cod, required this.nome});

  factory _$SolicitacaoMaterialSearchUsuarioResponseDTOImpl.fromJson(
          Map<String, dynamic> json) =>
      _$$SolicitacaoMaterialSearchUsuarioResponseDTOImplFromJson(json);

  @override
  int cod;
  @override
  String nome;

  @override
  String toString({DiagnosticLevel minLevel = DiagnosticLevel.info}) {
    return 'SolicitacaoMaterialSearchUsuarioResponseDTO(cod: $cod, nome: $nome)';
  }

  @override
  void debugFillProperties(DiagnosticPropertiesBuilder properties) {
    super.debugFillProperties(properties);
    properties
      ..add(DiagnosticsProperty(
          'type', 'SolicitacaoMaterialSearchUsuarioResponseDTO'))
      ..add(DiagnosticsProperty('cod', cod))
      ..add(DiagnosticsProperty('nome', nome));
  }

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$SolicitacaoMaterialSearchUsuarioResponseDTOImplCopyWith<
          _$SolicitacaoMaterialSearchUsuarioResponseDTOImpl>
      get copyWith =>
          __$$SolicitacaoMaterialSearchUsuarioResponseDTOImplCopyWithImpl<
                  _$SolicitacaoMaterialSearchUsuarioResponseDTOImpl>(
              this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$SolicitacaoMaterialSearchUsuarioResponseDTOImplToJson(
      this,
    );
  }
}

abstract class _SolicitacaoMaterialSearchUsuarioResponseDTO
    implements SolicitacaoMaterialSearchUsuarioResponseDTO {
  factory _SolicitacaoMaterialSearchUsuarioResponseDTO(
          {required int cod, required String nome}) =
      _$SolicitacaoMaterialSearchUsuarioResponseDTOImpl;

  factory _SolicitacaoMaterialSearchUsuarioResponseDTO.fromJson(
          Map<String, dynamic> json) =
      _$SolicitacaoMaterialSearchUsuarioResponseDTOImpl.fromJson;

  @override
  int get cod;
  set cod(int value);
  @override
  String get nome;
  set nome(String value);
  @override
  @JsonKey(ignore: true)
  _$$SolicitacaoMaterialSearchUsuarioResponseDTOImplCopyWith<
          _$SolicitacaoMaterialSearchUsuarioResponseDTOImpl>
      get copyWith => throw _privateConstructorUsedError;
}
