// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'solicitacao_material_find_one_insumo_response_dto.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

SolicitacaoMaterialFindOneInsumoResponseDTO
    _$SolicitacaoMaterialFindOneInsumoResponseDTOFromJson(
        Map<String, dynamic> json) {
  return _SolicitacaoMaterialFindOneInsumoResponseDTO.fromJson(json);
}

/// @nodoc
mixin _$SolicitacaoMaterialFindOneInsumoResponseDTO {
  int get cod => throw _privateConstructorUsedError;
  set cod(int value) => throw _privateConstructorUsedError;
  String get nome => throw _privateConstructorUsedError;
  set nome(String value) => throw _privateConstructorUsedError;
  int get codBarra => throw _privateConstructorUsedError;
  set codBarra(int value) => throw _privateConstructorUsedError;
  String? get unidadeMedida => throw _privateConstructorUsedError;
  set unidadeMedida(String? value) => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $SolicitacaoMaterialFindOneInsumoResponseDTOCopyWith<
          SolicitacaoMaterialFindOneInsumoResponseDTO>
      get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $SolicitacaoMaterialFindOneInsumoResponseDTOCopyWith<$Res> {
  factory $SolicitacaoMaterialFindOneInsumoResponseDTOCopyWith(
          SolicitacaoMaterialFindOneInsumoResponseDTO value,
          $Res Function(SolicitacaoMaterialFindOneInsumoResponseDTO) then) =
      _$SolicitacaoMaterialFindOneInsumoResponseDTOCopyWithImpl<$Res,
          SolicitacaoMaterialFindOneInsumoResponseDTO>;
  @useResult
  $Res call({int cod, String nome, int codBarra, String? unidadeMedida});
}

/// @nodoc
class _$SolicitacaoMaterialFindOneInsumoResponseDTOCopyWithImpl<$Res,
        $Val extends SolicitacaoMaterialFindOneInsumoResponseDTO>
    implements $SolicitacaoMaterialFindOneInsumoResponseDTOCopyWith<$Res> {
  _$SolicitacaoMaterialFindOneInsumoResponseDTOCopyWithImpl(
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
    Object? codBarra = null,
    Object? unidadeMedida = freezed,
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
      codBarra: null == codBarra
          ? _value.codBarra
          : codBarra // ignore: cast_nullable_to_non_nullable
              as int,
      unidadeMedida: freezed == unidadeMedida
          ? _value.unidadeMedida
          : unidadeMedida // ignore: cast_nullable_to_non_nullable
              as String?,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$SolicitacaoMaterialFindOneInsumoResponseDTOImplCopyWith<$Res>
    implements $SolicitacaoMaterialFindOneInsumoResponseDTOCopyWith<$Res> {
  factory _$$SolicitacaoMaterialFindOneInsumoResponseDTOImplCopyWith(
          _$SolicitacaoMaterialFindOneInsumoResponseDTOImpl value,
          $Res Function(_$SolicitacaoMaterialFindOneInsumoResponseDTOImpl)
              then) =
      __$$SolicitacaoMaterialFindOneInsumoResponseDTOImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({int cod, String nome, int codBarra, String? unidadeMedida});
}

/// @nodoc
class __$$SolicitacaoMaterialFindOneInsumoResponseDTOImplCopyWithImpl<$Res>
    extends _$SolicitacaoMaterialFindOneInsumoResponseDTOCopyWithImpl<$Res,
        _$SolicitacaoMaterialFindOneInsumoResponseDTOImpl>
    implements
        _$$SolicitacaoMaterialFindOneInsumoResponseDTOImplCopyWith<$Res> {
  __$$SolicitacaoMaterialFindOneInsumoResponseDTOImplCopyWithImpl(
      _$SolicitacaoMaterialFindOneInsumoResponseDTOImpl _value,
      $Res Function(_$SolicitacaoMaterialFindOneInsumoResponseDTOImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? cod = null,
    Object? nome = null,
    Object? codBarra = null,
    Object? unidadeMedida = freezed,
  }) {
    return _then(_$SolicitacaoMaterialFindOneInsumoResponseDTOImpl(
      cod: null == cod
          ? _value.cod
          : cod // ignore: cast_nullable_to_non_nullable
              as int,
      nome: null == nome
          ? _value.nome
          : nome // ignore: cast_nullable_to_non_nullable
              as String,
      codBarra: null == codBarra
          ? _value.codBarra
          : codBarra // ignore: cast_nullable_to_non_nullable
              as int,
      unidadeMedida: freezed == unidadeMedida
          ? _value.unidadeMedida
          : unidadeMedida // ignore: cast_nullable_to_non_nullable
              as String?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$SolicitacaoMaterialFindOneInsumoResponseDTOImpl
    with DiagnosticableTreeMixin
    implements _SolicitacaoMaterialFindOneInsumoResponseDTO {
  _$SolicitacaoMaterialFindOneInsumoResponseDTOImpl(
      {required this.cod,
      required this.nome,
      required this.codBarra,
      this.unidadeMedida});

  factory _$SolicitacaoMaterialFindOneInsumoResponseDTOImpl.fromJson(
          Map<String, dynamic> json) =>
      _$$SolicitacaoMaterialFindOneInsumoResponseDTOImplFromJson(json);

  @override
  int cod;
  @override
  String nome;
  @override
  int codBarra;
  @override
  String? unidadeMedida;

  @override
  String toString({DiagnosticLevel minLevel = DiagnosticLevel.info}) {
    return 'SolicitacaoMaterialFindOneInsumoResponseDTO(cod: $cod, nome: $nome, codBarra: $codBarra, unidadeMedida: $unidadeMedida)';
  }

  @override
  void debugFillProperties(DiagnosticPropertiesBuilder properties) {
    super.debugFillProperties(properties);
    properties
      ..add(DiagnosticsProperty(
          'type', 'SolicitacaoMaterialFindOneInsumoResponseDTO'))
      ..add(DiagnosticsProperty('cod', cod))
      ..add(DiagnosticsProperty('nome', nome))
      ..add(DiagnosticsProperty('codBarra', codBarra))
      ..add(DiagnosticsProperty('unidadeMedida', unidadeMedida));
  }

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$SolicitacaoMaterialFindOneInsumoResponseDTOImplCopyWith<
          _$SolicitacaoMaterialFindOneInsumoResponseDTOImpl>
      get copyWith =>
          __$$SolicitacaoMaterialFindOneInsumoResponseDTOImplCopyWithImpl<
                  _$SolicitacaoMaterialFindOneInsumoResponseDTOImpl>(
              this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$SolicitacaoMaterialFindOneInsumoResponseDTOImplToJson(
      this,
    );
  }
}

abstract class _SolicitacaoMaterialFindOneInsumoResponseDTO
    implements SolicitacaoMaterialFindOneInsumoResponseDTO {
  factory _SolicitacaoMaterialFindOneInsumoResponseDTO(
          {required int cod,
          required String nome,
          required int codBarra,
          String? unidadeMedida}) =
      _$SolicitacaoMaterialFindOneInsumoResponseDTOImpl;

  factory _SolicitacaoMaterialFindOneInsumoResponseDTO.fromJson(
          Map<String, dynamic> json) =
      _$SolicitacaoMaterialFindOneInsumoResponseDTOImpl.fromJson;

  @override
  int get cod;
  set cod(int value);
  @override
  String get nome;
  set nome(String value);
  @override
  int get codBarra;
  set codBarra(int value);
  @override
  String? get unidadeMedida;
  set unidadeMedida(String? value);
  @override
  @JsonKey(ignore: true)
  _$$SolicitacaoMaterialFindOneInsumoResponseDTOImplCopyWith<
          _$SolicitacaoMaterialFindOneInsumoResponseDTOImpl>
      get copyWith => throw _privateConstructorUsedError;
}
