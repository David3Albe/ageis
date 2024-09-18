// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'processo_leitura_andamento_kit_detail_dto.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

ProcessoLeituraAndamentoKitDetailDTO
    _$ProcessoLeituraAndamentoKitDetailDTOFromJson(Map<String, dynamic> json) {
  return _ProcessoLeituraAndamentoKitDetailDTO.fromJson(json);
}

/// @nodoc
mixin _$ProcessoLeituraAndamentoKitDetailDTO {
  int get cod => throw _privateConstructorUsedError;
  set cod(int value) => throw _privateConstructorUsedError;
  String get codBarra => throw _privateConstructorUsedError;
  set codBarra(String value) => throw _privateConstructorUsedError;
  String get descricao => throw _privateConstructorUsedError;
  set descricao(String value) => throw _privateConstructorUsedError;
  List<ProcessoLeituraAndamentoItemDetailDTO> get itens =>
      throw _privateConstructorUsedError;
  set itens(List<ProcessoLeituraAndamentoItemDetailDTO> value) =>
      throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $ProcessoLeituraAndamentoKitDetailDTOCopyWith<
          ProcessoLeituraAndamentoKitDetailDTO>
      get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $ProcessoLeituraAndamentoKitDetailDTOCopyWith<$Res> {
  factory $ProcessoLeituraAndamentoKitDetailDTOCopyWith(
          ProcessoLeituraAndamentoKitDetailDTO value,
          $Res Function(ProcessoLeituraAndamentoKitDetailDTO) then) =
      _$ProcessoLeituraAndamentoKitDetailDTOCopyWithImpl<$Res,
          ProcessoLeituraAndamentoKitDetailDTO>;
  @useResult
  $Res call(
      {int cod,
      String codBarra,
      String descricao,
      List<ProcessoLeituraAndamentoItemDetailDTO> itens});
}

/// @nodoc
class _$ProcessoLeituraAndamentoKitDetailDTOCopyWithImpl<$Res,
        $Val extends ProcessoLeituraAndamentoKitDetailDTO>
    implements $ProcessoLeituraAndamentoKitDetailDTOCopyWith<$Res> {
  _$ProcessoLeituraAndamentoKitDetailDTOCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? cod = null,
    Object? codBarra = null,
    Object? descricao = null,
    Object? itens = null,
  }) {
    return _then(_value.copyWith(
      cod: null == cod
          ? _value.cod
          : cod // ignore: cast_nullable_to_non_nullable
              as int,
      codBarra: null == codBarra
          ? _value.codBarra
          : codBarra // ignore: cast_nullable_to_non_nullable
              as String,
      descricao: null == descricao
          ? _value.descricao
          : descricao // ignore: cast_nullable_to_non_nullable
              as String,
      itens: null == itens
          ? _value.itens
          : itens // ignore: cast_nullable_to_non_nullable
              as List<ProcessoLeituraAndamentoItemDetailDTO>,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$ProcessoLeituraAndamentoKitDetailDTOImplCopyWith<$Res>
    implements $ProcessoLeituraAndamentoKitDetailDTOCopyWith<$Res> {
  factory _$$ProcessoLeituraAndamentoKitDetailDTOImplCopyWith(
          _$ProcessoLeituraAndamentoKitDetailDTOImpl value,
          $Res Function(_$ProcessoLeituraAndamentoKitDetailDTOImpl) then) =
      __$$ProcessoLeituraAndamentoKitDetailDTOImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {int cod,
      String codBarra,
      String descricao,
      List<ProcessoLeituraAndamentoItemDetailDTO> itens});
}

/// @nodoc
class __$$ProcessoLeituraAndamentoKitDetailDTOImplCopyWithImpl<$Res>
    extends _$ProcessoLeituraAndamentoKitDetailDTOCopyWithImpl<$Res,
        _$ProcessoLeituraAndamentoKitDetailDTOImpl>
    implements _$$ProcessoLeituraAndamentoKitDetailDTOImplCopyWith<$Res> {
  __$$ProcessoLeituraAndamentoKitDetailDTOImplCopyWithImpl(
      _$ProcessoLeituraAndamentoKitDetailDTOImpl _value,
      $Res Function(_$ProcessoLeituraAndamentoKitDetailDTOImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? cod = null,
    Object? codBarra = null,
    Object? descricao = null,
    Object? itens = null,
  }) {
    return _then(_$ProcessoLeituraAndamentoKitDetailDTOImpl(
      cod: null == cod
          ? _value.cod
          : cod // ignore: cast_nullable_to_non_nullable
              as int,
      codBarra: null == codBarra
          ? _value.codBarra
          : codBarra // ignore: cast_nullable_to_non_nullable
              as String,
      descricao: null == descricao
          ? _value.descricao
          : descricao // ignore: cast_nullable_to_non_nullable
              as String,
      itens: null == itens
          ? _value.itens
          : itens // ignore: cast_nullable_to_non_nullable
              as List<ProcessoLeituraAndamentoItemDetailDTO>,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$ProcessoLeituraAndamentoKitDetailDTOImpl
    with DiagnosticableTreeMixin
    implements _ProcessoLeituraAndamentoKitDetailDTO {
  _$ProcessoLeituraAndamentoKitDetailDTOImpl(
      {required this.cod,
      required this.codBarra,
      required this.descricao,
      required this.itens});

  factory _$ProcessoLeituraAndamentoKitDetailDTOImpl.fromJson(
          Map<String, dynamic> json) =>
      _$$ProcessoLeituraAndamentoKitDetailDTOImplFromJson(json);

  @override
  int cod;
  @override
  String codBarra;
  @override
  String descricao;
  @override
  List<ProcessoLeituraAndamentoItemDetailDTO> itens;

  @override
  String toString({DiagnosticLevel minLevel = DiagnosticLevel.info}) {
    return 'ProcessoLeituraAndamentoKitDetailDTO(cod: $cod, codBarra: $codBarra, descricao: $descricao, itens: $itens)';
  }

  @override
  void debugFillProperties(DiagnosticPropertiesBuilder properties) {
    super.debugFillProperties(properties);
    properties
      ..add(DiagnosticsProperty('type', 'ProcessoLeituraAndamentoKitDetailDTO'))
      ..add(DiagnosticsProperty('cod', cod))
      ..add(DiagnosticsProperty('codBarra', codBarra))
      ..add(DiagnosticsProperty('descricao', descricao))
      ..add(DiagnosticsProperty('itens', itens));
  }

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$ProcessoLeituraAndamentoKitDetailDTOImplCopyWith<
          _$ProcessoLeituraAndamentoKitDetailDTOImpl>
      get copyWith => __$$ProcessoLeituraAndamentoKitDetailDTOImplCopyWithImpl<
          _$ProcessoLeituraAndamentoKitDetailDTOImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$ProcessoLeituraAndamentoKitDetailDTOImplToJson(
      this,
    );
  }
}

abstract class _ProcessoLeituraAndamentoKitDetailDTO
    implements ProcessoLeituraAndamentoKitDetailDTO {
  factory _ProcessoLeituraAndamentoKitDetailDTO(
          {required int cod,
          required String codBarra,
          required String descricao,
          required List<ProcessoLeituraAndamentoItemDetailDTO> itens}) =
      _$ProcessoLeituraAndamentoKitDetailDTOImpl;

  factory _ProcessoLeituraAndamentoKitDetailDTO.fromJson(
          Map<String, dynamic> json) =
      _$ProcessoLeituraAndamentoKitDetailDTOImpl.fromJson;

  @override
  int get cod;
  set cod(int value);
  @override
  String get codBarra;
  set codBarra(String value);
  @override
  String get descricao;
  set descricao(String value);
  @override
  List<ProcessoLeituraAndamentoItemDetailDTO> get itens;
  set itens(List<ProcessoLeituraAndamentoItemDetailDTO> value);
  @override
  @JsonKey(ignore: true)
  _$$ProcessoLeituraAndamentoKitDetailDTOImplCopyWith<
          _$ProcessoLeituraAndamentoKitDetailDTOImpl>
      get copyWith => throw _privateConstructorUsedError;
}
