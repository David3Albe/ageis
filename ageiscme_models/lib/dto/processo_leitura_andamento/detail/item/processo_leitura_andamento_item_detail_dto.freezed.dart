// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'processo_leitura_andamento_item_detail_dto.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

ProcessoLeituraAndamentoItemDetailDTO
    _$ProcessoLeituraAndamentoItemDetailDTOFromJson(Map<String, dynamic> json) {
  return _ProcessoLeituraAndamentoItemDetailDTO.fromJson(json);
}

/// @nodoc
mixin _$ProcessoLeituraAndamentoItemDetailDTO {
  int get cod => throw _privateConstructorUsedError;
  set cod(int value) => throw _privateConstructorUsedError;
  String get idEtiqueta => throw _privateConstructorUsedError;
  set idEtiqueta(String value) => throw _privateConstructorUsedError;
  String get descricao => throw _privateConstructorUsedError;
  set descricao(String value) => throw _privateConstructorUsedError;
  int? get codKit => throw _privateConstructorUsedError;
  set codKit(int? value) => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $ProcessoLeituraAndamentoItemDetailDTOCopyWith<
          ProcessoLeituraAndamentoItemDetailDTO>
      get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $ProcessoLeituraAndamentoItemDetailDTOCopyWith<$Res> {
  factory $ProcessoLeituraAndamentoItemDetailDTOCopyWith(
          ProcessoLeituraAndamentoItemDetailDTO value,
          $Res Function(ProcessoLeituraAndamentoItemDetailDTO) then) =
      _$ProcessoLeituraAndamentoItemDetailDTOCopyWithImpl<$Res,
          ProcessoLeituraAndamentoItemDetailDTO>;
  @useResult
  $Res call({int cod, String idEtiqueta, String descricao, int? codKit});
}

/// @nodoc
class _$ProcessoLeituraAndamentoItemDetailDTOCopyWithImpl<$Res,
        $Val extends ProcessoLeituraAndamentoItemDetailDTO>
    implements $ProcessoLeituraAndamentoItemDetailDTOCopyWith<$Res> {
  _$ProcessoLeituraAndamentoItemDetailDTOCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? cod = null,
    Object? idEtiqueta = null,
    Object? descricao = null,
    Object? codKit = freezed,
  }) {
    return _then(_value.copyWith(
      cod: null == cod
          ? _value.cod
          : cod // ignore: cast_nullable_to_non_nullable
              as int,
      idEtiqueta: null == idEtiqueta
          ? _value.idEtiqueta
          : idEtiqueta // ignore: cast_nullable_to_non_nullable
              as String,
      descricao: null == descricao
          ? _value.descricao
          : descricao // ignore: cast_nullable_to_non_nullable
              as String,
      codKit: freezed == codKit
          ? _value.codKit
          : codKit // ignore: cast_nullable_to_non_nullable
              as int?,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$ProcessoLeituraAndamentoItemDetailDTOImplCopyWith<$Res>
    implements $ProcessoLeituraAndamentoItemDetailDTOCopyWith<$Res> {
  factory _$$ProcessoLeituraAndamentoItemDetailDTOImplCopyWith(
          _$ProcessoLeituraAndamentoItemDetailDTOImpl value,
          $Res Function(_$ProcessoLeituraAndamentoItemDetailDTOImpl) then) =
      __$$ProcessoLeituraAndamentoItemDetailDTOImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({int cod, String idEtiqueta, String descricao, int? codKit});
}

/// @nodoc
class __$$ProcessoLeituraAndamentoItemDetailDTOImplCopyWithImpl<$Res>
    extends _$ProcessoLeituraAndamentoItemDetailDTOCopyWithImpl<$Res,
        _$ProcessoLeituraAndamentoItemDetailDTOImpl>
    implements _$$ProcessoLeituraAndamentoItemDetailDTOImplCopyWith<$Res> {
  __$$ProcessoLeituraAndamentoItemDetailDTOImplCopyWithImpl(
      _$ProcessoLeituraAndamentoItemDetailDTOImpl _value,
      $Res Function(_$ProcessoLeituraAndamentoItemDetailDTOImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? cod = null,
    Object? idEtiqueta = null,
    Object? descricao = null,
    Object? codKit = freezed,
  }) {
    return _then(_$ProcessoLeituraAndamentoItemDetailDTOImpl(
      cod: null == cod
          ? _value.cod
          : cod // ignore: cast_nullable_to_non_nullable
              as int,
      idEtiqueta: null == idEtiqueta
          ? _value.idEtiqueta
          : idEtiqueta // ignore: cast_nullable_to_non_nullable
              as String,
      descricao: null == descricao
          ? _value.descricao
          : descricao // ignore: cast_nullable_to_non_nullable
              as String,
      codKit: freezed == codKit
          ? _value.codKit
          : codKit // ignore: cast_nullable_to_non_nullable
              as int?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$ProcessoLeituraAndamentoItemDetailDTOImpl
    with DiagnosticableTreeMixin
    implements _ProcessoLeituraAndamentoItemDetailDTO {
  _$ProcessoLeituraAndamentoItemDetailDTOImpl(
      {required this.cod,
      required this.idEtiqueta,
      required this.descricao,
      this.codKit});

  factory _$ProcessoLeituraAndamentoItemDetailDTOImpl.fromJson(
          Map<String, dynamic> json) =>
      _$$ProcessoLeituraAndamentoItemDetailDTOImplFromJson(json);

  @override
  int cod;
  @override
  String idEtiqueta;
  @override
  String descricao;
  @override
  int? codKit;

  @override
  String toString({DiagnosticLevel minLevel = DiagnosticLevel.info}) {
    return 'ProcessoLeituraAndamentoItemDetailDTO(cod: $cod, idEtiqueta: $idEtiqueta, descricao: $descricao, codKit: $codKit)';
  }

  @override
  void debugFillProperties(DiagnosticPropertiesBuilder properties) {
    super.debugFillProperties(properties);
    properties
      ..add(
          DiagnosticsProperty('type', 'ProcessoLeituraAndamentoItemDetailDTO'))
      ..add(DiagnosticsProperty('cod', cod))
      ..add(DiagnosticsProperty('idEtiqueta', idEtiqueta))
      ..add(DiagnosticsProperty('descricao', descricao))
      ..add(DiagnosticsProperty('codKit', codKit));
  }

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$ProcessoLeituraAndamentoItemDetailDTOImplCopyWith<
          _$ProcessoLeituraAndamentoItemDetailDTOImpl>
      get copyWith => __$$ProcessoLeituraAndamentoItemDetailDTOImplCopyWithImpl<
          _$ProcessoLeituraAndamentoItemDetailDTOImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$ProcessoLeituraAndamentoItemDetailDTOImplToJson(
      this,
    );
  }
}

abstract class _ProcessoLeituraAndamentoItemDetailDTO
    implements ProcessoLeituraAndamentoItemDetailDTO {
  factory _ProcessoLeituraAndamentoItemDetailDTO(
      {required int cod,
      required String idEtiqueta,
      required String descricao,
      int? codKit}) = _$ProcessoLeituraAndamentoItemDetailDTOImpl;

  factory _ProcessoLeituraAndamentoItemDetailDTO.fromJson(
          Map<String, dynamic> json) =
      _$ProcessoLeituraAndamentoItemDetailDTOImpl.fromJson;

  @override
  int get cod;
  set cod(int value);
  @override
  String get idEtiqueta;
  set idEtiqueta(String value);
  @override
  String get descricao;
  set descricao(String value);
  @override
  int? get codKit;
  set codKit(int? value);
  @override
  @JsonKey(ignore: true)
  _$$ProcessoLeituraAndamentoItemDetailDTOImplCopyWith<
          _$ProcessoLeituraAndamentoItemDetailDTOImpl>
      get copyWith => throw _privateConstructorUsedError;
}
