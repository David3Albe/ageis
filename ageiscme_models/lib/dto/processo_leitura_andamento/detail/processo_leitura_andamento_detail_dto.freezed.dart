// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'processo_leitura_andamento_detail_dto.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

ProcessoLeituraAndamentoDetailDTO _$ProcessoLeituraAndamentoDetailDTOFromJson(
    Map<String, dynamic> json) {
  return _ProcessoLeituraAndamentoDetailDTO.fromJson(json);
}

/// @nodoc
mixin _$ProcessoLeituraAndamentoDetailDTO {
  int get cod => throw _privateConstructorUsedError;
  set cod(int value) => throw _privateConstructorUsedError;
  DateTime get dataHora => throw _privateConstructorUsedError;
  set dataHora(DateTime value) => throw _privateConstructorUsedError;
  String get maquina => throw _privateConstructorUsedError;
  set maquina(String value) => throw _privateConstructorUsedError;
  String get nomeUsuario => throw _privateConstructorUsedError;
  set nomeUsuario(String value) => throw _privateConstructorUsedError;
  List<ProcessoLeituraAndamentoItemDetailDTO> get itens =>
      throw _privateConstructorUsedError;
  set itens(List<ProcessoLeituraAndamentoItemDetailDTO> value) =>
      throw _privateConstructorUsedError;
  List<ProcessoLeituraAndamentoKitDetailDTO> get kits =>
      throw _privateConstructorUsedError;
  set kits(List<ProcessoLeituraAndamentoKitDetailDTO> value) =>
      throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $ProcessoLeituraAndamentoDetailDTOCopyWith<ProcessoLeituraAndamentoDetailDTO>
      get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $ProcessoLeituraAndamentoDetailDTOCopyWith<$Res> {
  factory $ProcessoLeituraAndamentoDetailDTOCopyWith(
          ProcessoLeituraAndamentoDetailDTO value,
          $Res Function(ProcessoLeituraAndamentoDetailDTO) then) =
      _$ProcessoLeituraAndamentoDetailDTOCopyWithImpl<$Res,
          ProcessoLeituraAndamentoDetailDTO>;
  @useResult
  $Res call(
      {int cod,
      DateTime dataHora,
      String maquina,
      String nomeUsuario,
      List<ProcessoLeituraAndamentoItemDetailDTO> itens,
      List<ProcessoLeituraAndamentoKitDetailDTO> kits});
}

/// @nodoc
class _$ProcessoLeituraAndamentoDetailDTOCopyWithImpl<$Res,
        $Val extends ProcessoLeituraAndamentoDetailDTO>
    implements $ProcessoLeituraAndamentoDetailDTOCopyWith<$Res> {
  _$ProcessoLeituraAndamentoDetailDTOCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? cod = null,
    Object? dataHora = null,
    Object? maquina = null,
    Object? nomeUsuario = null,
    Object? itens = null,
    Object? kits = null,
  }) {
    return _then(_value.copyWith(
      cod: null == cod
          ? _value.cod
          : cod // ignore: cast_nullable_to_non_nullable
              as int,
      dataHora: null == dataHora
          ? _value.dataHora
          : dataHora // ignore: cast_nullable_to_non_nullable
              as DateTime,
      maquina: null == maquina
          ? _value.maquina
          : maquina // ignore: cast_nullable_to_non_nullable
              as String,
      nomeUsuario: null == nomeUsuario
          ? _value.nomeUsuario
          : nomeUsuario // ignore: cast_nullable_to_non_nullable
              as String,
      itens: null == itens
          ? _value.itens
          : itens // ignore: cast_nullable_to_non_nullable
              as List<ProcessoLeituraAndamentoItemDetailDTO>,
      kits: null == kits
          ? _value.kits
          : kits // ignore: cast_nullable_to_non_nullable
              as List<ProcessoLeituraAndamentoKitDetailDTO>,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$ProcessoLeituraAndamentoDetailDTOImplCopyWith<$Res>
    implements $ProcessoLeituraAndamentoDetailDTOCopyWith<$Res> {
  factory _$$ProcessoLeituraAndamentoDetailDTOImplCopyWith(
          _$ProcessoLeituraAndamentoDetailDTOImpl value,
          $Res Function(_$ProcessoLeituraAndamentoDetailDTOImpl) then) =
      __$$ProcessoLeituraAndamentoDetailDTOImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {int cod,
      DateTime dataHora,
      String maquina,
      String nomeUsuario,
      List<ProcessoLeituraAndamentoItemDetailDTO> itens,
      List<ProcessoLeituraAndamentoKitDetailDTO> kits});
}

/// @nodoc
class __$$ProcessoLeituraAndamentoDetailDTOImplCopyWithImpl<$Res>
    extends _$ProcessoLeituraAndamentoDetailDTOCopyWithImpl<$Res,
        _$ProcessoLeituraAndamentoDetailDTOImpl>
    implements _$$ProcessoLeituraAndamentoDetailDTOImplCopyWith<$Res> {
  __$$ProcessoLeituraAndamentoDetailDTOImplCopyWithImpl(
      _$ProcessoLeituraAndamentoDetailDTOImpl _value,
      $Res Function(_$ProcessoLeituraAndamentoDetailDTOImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? cod = null,
    Object? dataHora = null,
    Object? maquina = null,
    Object? nomeUsuario = null,
    Object? itens = null,
    Object? kits = null,
  }) {
    return _then(_$ProcessoLeituraAndamentoDetailDTOImpl(
      cod: null == cod
          ? _value.cod
          : cod // ignore: cast_nullable_to_non_nullable
              as int,
      dataHora: null == dataHora
          ? _value.dataHora
          : dataHora // ignore: cast_nullable_to_non_nullable
              as DateTime,
      maquina: null == maquina
          ? _value.maquina
          : maquina // ignore: cast_nullable_to_non_nullable
              as String,
      nomeUsuario: null == nomeUsuario
          ? _value.nomeUsuario
          : nomeUsuario // ignore: cast_nullable_to_non_nullable
              as String,
      itens: null == itens
          ? _value.itens
          : itens // ignore: cast_nullable_to_non_nullable
              as List<ProcessoLeituraAndamentoItemDetailDTO>,
      kits: null == kits
          ? _value.kits
          : kits // ignore: cast_nullable_to_non_nullable
              as List<ProcessoLeituraAndamentoKitDetailDTO>,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$ProcessoLeituraAndamentoDetailDTOImpl
    with DiagnosticableTreeMixin
    implements _ProcessoLeituraAndamentoDetailDTO {
  _$ProcessoLeituraAndamentoDetailDTOImpl(
      {required this.cod,
      required this.dataHora,
      required this.maquina,
      required this.nomeUsuario,
      required this.itens,
      required this.kits});

  factory _$ProcessoLeituraAndamentoDetailDTOImpl.fromJson(
          Map<String, dynamic> json) =>
      _$$ProcessoLeituraAndamentoDetailDTOImplFromJson(json);

  @override
  int cod;
  @override
  DateTime dataHora;
  @override
  String maquina;
  @override
  String nomeUsuario;
  @override
  List<ProcessoLeituraAndamentoItemDetailDTO> itens;
  @override
  List<ProcessoLeituraAndamentoKitDetailDTO> kits;

  @override
  String toString({DiagnosticLevel minLevel = DiagnosticLevel.info}) {
    return 'ProcessoLeituraAndamentoDetailDTO(cod: $cod, dataHora: $dataHora, maquina: $maquina, nomeUsuario: $nomeUsuario, itens: $itens, kits: $kits)';
  }

  @override
  void debugFillProperties(DiagnosticPropertiesBuilder properties) {
    super.debugFillProperties(properties);
    properties
      ..add(DiagnosticsProperty('type', 'ProcessoLeituraAndamentoDetailDTO'))
      ..add(DiagnosticsProperty('cod', cod))
      ..add(DiagnosticsProperty('dataHora', dataHora))
      ..add(DiagnosticsProperty('maquina', maquina))
      ..add(DiagnosticsProperty('nomeUsuario', nomeUsuario))
      ..add(DiagnosticsProperty('itens', itens))
      ..add(DiagnosticsProperty('kits', kits));
  }

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$ProcessoLeituraAndamentoDetailDTOImplCopyWith<
          _$ProcessoLeituraAndamentoDetailDTOImpl>
      get copyWith => __$$ProcessoLeituraAndamentoDetailDTOImplCopyWithImpl<
          _$ProcessoLeituraAndamentoDetailDTOImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$ProcessoLeituraAndamentoDetailDTOImplToJson(
      this,
    );
  }
}

abstract class _ProcessoLeituraAndamentoDetailDTO
    implements ProcessoLeituraAndamentoDetailDTO {
  factory _ProcessoLeituraAndamentoDetailDTO(
          {required int cod,
          required DateTime dataHora,
          required String maquina,
          required String nomeUsuario,
          required List<ProcessoLeituraAndamentoItemDetailDTO> itens,
          required List<ProcessoLeituraAndamentoKitDetailDTO> kits}) =
      _$ProcessoLeituraAndamentoDetailDTOImpl;

  factory _ProcessoLeituraAndamentoDetailDTO.fromJson(
          Map<String, dynamic> json) =
      _$ProcessoLeituraAndamentoDetailDTOImpl.fromJson;

  @override
  int get cod;
  set cod(int value);
  @override
  DateTime get dataHora;
  set dataHora(DateTime value);
  @override
  String get maquina;
  set maquina(String value);
  @override
  String get nomeUsuario;
  set nomeUsuario(String value);
  @override
  List<ProcessoLeituraAndamentoItemDetailDTO> get itens;
  set itens(List<ProcessoLeituraAndamentoItemDetailDTO> value);
  @override
  List<ProcessoLeituraAndamentoKitDetailDTO> get kits;
  set kits(List<ProcessoLeituraAndamentoKitDetailDTO> value);
  @override
  @JsonKey(ignore: true)
  _$$ProcessoLeituraAndamentoDetailDTOImplCopyWith<
          _$ProcessoLeituraAndamentoDetailDTOImpl>
      get copyWith => throw _privateConstructorUsedError;
}
