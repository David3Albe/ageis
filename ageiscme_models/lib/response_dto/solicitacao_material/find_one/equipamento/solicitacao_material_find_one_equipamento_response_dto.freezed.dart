// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'solicitacao_material_find_one_equipamento_response_dto.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

SolicitacaoMaterialFindOneEquipamentoResponseDTO
    _$SolicitacaoMaterialFindOneEquipamentoResponseDTOFromJson(
        Map<String, dynamic> json) {
  return _SolicitacaoMaterialFindOneEquipamentoResponseDTO.fromJson(json);
}

/// @nodoc
mixin _$SolicitacaoMaterialFindOneEquipamentoResponseDTO {
  int get cod => throw _privateConstructorUsedError;
  set cod(int value) => throw _privateConstructorUsedError;
  String get nome => throw _privateConstructorUsedError;
  set nome(String value) => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $SolicitacaoMaterialFindOneEquipamentoResponseDTOCopyWith<
          SolicitacaoMaterialFindOneEquipamentoResponseDTO>
      get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $SolicitacaoMaterialFindOneEquipamentoResponseDTOCopyWith<$Res> {
  factory $SolicitacaoMaterialFindOneEquipamentoResponseDTOCopyWith(
          SolicitacaoMaterialFindOneEquipamentoResponseDTO value,
          $Res Function(SolicitacaoMaterialFindOneEquipamentoResponseDTO)
              then) =
      _$SolicitacaoMaterialFindOneEquipamentoResponseDTOCopyWithImpl<$Res,
          SolicitacaoMaterialFindOneEquipamentoResponseDTO>;
  @useResult
  $Res call({int cod, String nome});
}

/// @nodoc
class _$SolicitacaoMaterialFindOneEquipamentoResponseDTOCopyWithImpl<$Res,
        $Val extends SolicitacaoMaterialFindOneEquipamentoResponseDTO>
    implements $SolicitacaoMaterialFindOneEquipamentoResponseDTOCopyWith<$Res> {
  _$SolicitacaoMaterialFindOneEquipamentoResponseDTOCopyWithImpl(
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
abstract class _$$SolicitacaoMaterialFindOneEquipamentoResponseDTOImplCopyWith<
        $Res>
    implements $SolicitacaoMaterialFindOneEquipamentoResponseDTOCopyWith<$Res> {
  factory _$$SolicitacaoMaterialFindOneEquipamentoResponseDTOImplCopyWith(
          _$SolicitacaoMaterialFindOneEquipamentoResponseDTOImpl value,
          $Res Function(_$SolicitacaoMaterialFindOneEquipamentoResponseDTOImpl)
              then) =
      __$$SolicitacaoMaterialFindOneEquipamentoResponseDTOImplCopyWithImpl<
          $Res>;
  @override
  @useResult
  $Res call({int cod, String nome});
}

/// @nodoc
class __$$SolicitacaoMaterialFindOneEquipamentoResponseDTOImplCopyWithImpl<$Res>
    extends _$SolicitacaoMaterialFindOneEquipamentoResponseDTOCopyWithImpl<$Res,
        _$SolicitacaoMaterialFindOneEquipamentoResponseDTOImpl>
    implements
        _$$SolicitacaoMaterialFindOneEquipamentoResponseDTOImplCopyWith<$Res> {
  __$$SolicitacaoMaterialFindOneEquipamentoResponseDTOImplCopyWithImpl(
      _$SolicitacaoMaterialFindOneEquipamentoResponseDTOImpl _value,
      $Res Function(_$SolicitacaoMaterialFindOneEquipamentoResponseDTOImpl)
          _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? cod = null,
    Object? nome = null,
  }) {
    return _then(_$SolicitacaoMaterialFindOneEquipamentoResponseDTOImpl(
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
class _$SolicitacaoMaterialFindOneEquipamentoResponseDTOImpl
    with DiagnosticableTreeMixin
    implements _SolicitacaoMaterialFindOneEquipamentoResponseDTO {
  _$SolicitacaoMaterialFindOneEquipamentoResponseDTOImpl(
      {required this.cod, required this.nome});

  factory _$SolicitacaoMaterialFindOneEquipamentoResponseDTOImpl.fromJson(
          Map<String, dynamic> json) =>
      _$$SolicitacaoMaterialFindOneEquipamentoResponseDTOImplFromJson(json);

  @override
  int cod;
  @override
  String nome;

  @override
  String toString({DiagnosticLevel minLevel = DiagnosticLevel.info}) {
    return 'SolicitacaoMaterialFindOneEquipamentoResponseDTO(cod: $cod, nome: $nome)';
  }

  @override
  void debugFillProperties(DiagnosticPropertiesBuilder properties) {
    super.debugFillProperties(properties);
    properties
      ..add(DiagnosticsProperty(
          'type', 'SolicitacaoMaterialFindOneEquipamentoResponseDTO'))
      ..add(DiagnosticsProperty('cod', cod))
      ..add(DiagnosticsProperty('nome', nome));
  }

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$SolicitacaoMaterialFindOneEquipamentoResponseDTOImplCopyWith<
          _$SolicitacaoMaterialFindOneEquipamentoResponseDTOImpl>
      get copyWith =>
          __$$SolicitacaoMaterialFindOneEquipamentoResponseDTOImplCopyWithImpl<
                  _$SolicitacaoMaterialFindOneEquipamentoResponseDTOImpl>(
              this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$SolicitacaoMaterialFindOneEquipamentoResponseDTOImplToJson(
      this,
    );
  }
}

abstract class _SolicitacaoMaterialFindOneEquipamentoResponseDTO
    implements SolicitacaoMaterialFindOneEquipamentoResponseDTO {
  factory _SolicitacaoMaterialFindOneEquipamentoResponseDTO(
          {required int cod, required String nome}) =
      _$SolicitacaoMaterialFindOneEquipamentoResponseDTOImpl;

  factory _SolicitacaoMaterialFindOneEquipamentoResponseDTO.fromJson(
          Map<String, dynamic> json) =
      _$SolicitacaoMaterialFindOneEquipamentoResponseDTOImpl.fromJson;

  @override
  int get cod;
  set cod(int value);
  @override
  String get nome;
  set nome(String value);
  @override
  @JsonKey(ignore: true)
  _$$SolicitacaoMaterialFindOneEquipamentoResponseDTOImplCopyWith<
          _$SolicitacaoMaterialFindOneEquipamentoResponseDTOImpl>
      get copyWith => throw _privateConstructorUsedError;
}
