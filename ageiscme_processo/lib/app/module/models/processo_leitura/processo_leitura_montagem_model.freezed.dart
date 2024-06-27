// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'processo_leitura_montagem_model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

ProcessoLeituraMontagemModel _$ProcessoLeituraMontagemModelFromJson(
    Map<String, dynamic> json) {
  return _ProcessoLeituraMontagemModel.fromJson(json);
}

/// @nodoc
mixin _$ProcessoLeituraMontagemModel {
  bool? get cancelado => throw _privateConstructorUsedError;
  set cancelado(bool? value) => throw _privateConstructorUsedError;
  String? get maquina => throw _privateConstructorUsedError;
  set maquina(String? value) => throw _privateConstructorUsedError;
  String? get tstamp => throw _privateConstructorUsedError;
  set tstamp(String? value) => throw _privateConstructorUsedError;
  int? get cod => throw _privateConstructorUsedError;
  set cod(int? value) => throw _privateConstructorUsedError;
  DateTime? get dataHora => throw _privateConstructorUsedError;
  set dataHora(DateTime? value) => throw _privateConstructorUsedError;
  ProcessoLeituraCodigoModel get leituraCodigo =>
      throw _privateConstructorUsedError;
  set leituraCodigo(ProcessoLeituraCodigoModel value) =>
      throw _privateConstructorUsedError;
  ProcessoLeituraAtualModel get leituraAtual =>
      throw _privateConstructorUsedError;
  set leituraAtual(ProcessoLeituraAtualModel value) =>
      throw _privateConstructorUsedError;
  List<String>? get filaLeituras => throw _privateConstructorUsedError;
  set filaLeituras(List<String>? value) => throw _privateConstructorUsedError;
  bool get automaticReadings => throw _privateConstructorUsedError;
  set automaticReadings(bool value) => throw _privateConstructorUsedError;
  List<ProcessoLeituraPassoModel> get passos =>
      throw _privateConstructorUsedError;
  set passos(List<ProcessoLeituraPassoModel> value) =>
      throw _privateConstructorUsedError;
  String get versao => throw _privateConstructorUsedError;
  set versao(String value) => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $ProcessoLeituraMontagemModelCopyWith<ProcessoLeituraMontagemModel>
      get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $ProcessoLeituraMontagemModelCopyWith<$Res> {
  factory $ProcessoLeituraMontagemModelCopyWith(
          ProcessoLeituraMontagemModel value,
          $Res Function(ProcessoLeituraMontagemModel) then) =
      _$ProcessoLeituraMontagemModelCopyWithImpl<$Res,
          ProcessoLeituraMontagemModel>;
  @useResult
  $Res call(
      {bool? cancelado,
      String? maquina,
      String? tstamp,
      int? cod,
      DateTime? dataHora,
      ProcessoLeituraCodigoModel leituraCodigo,
      ProcessoLeituraAtualModel leituraAtual,
      List<String>? filaLeituras,
      bool automaticReadings,
      List<ProcessoLeituraPassoModel> passos,
      String versao});

  $ProcessoLeituraCodigoModelCopyWith<$Res> get leituraCodigo;
  $ProcessoLeituraAtualModelCopyWith<$Res> get leituraAtual;
}

/// @nodoc
class _$ProcessoLeituraMontagemModelCopyWithImpl<$Res,
        $Val extends ProcessoLeituraMontagemModel>
    implements $ProcessoLeituraMontagemModelCopyWith<$Res> {
  _$ProcessoLeituraMontagemModelCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? cancelado = freezed,
    Object? maquina = freezed,
    Object? tstamp = freezed,
    Object? cod = freezed,
    Object? dataHora = freezed,
    Object? leituraCodigo = null,
    Object? leituraAtual = null,
    Object? filaLeituras = freezed,
    Object? automaticReadings = null,
    Object? passos = null,
    Object? versao = null,
  }) {
    return _then(_value.copyWith(
      cancelado: freezed == cancelado
          ? _value.cancelado
          : cancelado // ignore: cast_nullable_to_non_nullable
              as bool?,
      maquina: freezed == maquina
          ? _value.maquina
          : maquina // ignore: cast_nullable_to_non_nullable
              as String?,
      tstamp: freezed == tstamp
          ? _value.tstamp
          : tstamp // ignore: cast_nullable_to_non_nullable
              as String?,
      cod: freezed == cod
          ? _value.cod
          : cod // ignore: cast_nullable_to_non_nullable
              as int?,
      dataHora: freezed == dataHora
          ? _value.dataHora
          : dataHora // ignore: cast_nullable_to_non_nullable
              as DateTime?,
      leituraCodigo: null == leituraCodigo
          ? _value.leituraCodigo
          : leituraCodigo // ignore: cast_nullable_to_non_nullable
              as ProcessoLeituraCodigoModel,
      leituraAtual: null == leituraAtual
          ? _value.leituraAtual
          : leituraAtual // ignore: cast_nullable_to_non_nullable
              as ProcessoLeituraAtualModel,
      filaLeituras: freezed == filaLeituras
          ? _value.filaLeituras
          : filaLeituras // ignore: cast_nullable_to_non_nullable
              as List<String>?,
      automaticReadings: null == automaticReadings
          ? _value.automaticReadings
          : automaticReadings // ignore: cast_nullable_to_non_nullable
              as bool,
      passos: null == passos
          ? _value.passos
          : passos // ignore: cast_nullable_to_non_nullable
              as List<ProcessoLeituraPassoModel>,
      versao: null == versao
          ? _value.versao
          : versao // ignore: cast_nullable_to_non_nullable
              as String,
    ) as $Val);
  }

  @override
  @pragma('vm:prefer-inline')
  $ProcessoLeituraCodigoModelCopyWith<$Res> get leituraCodigo {
    return $ProcessoLeituraCodigoModelCopyWith<$Res>(_value.leituraCodigo,
        (value) {
      return _then(_value.copyWith(leituraCodigo: value) as $Val);
    });
  }

  @override
  @pragma('vm:prefer-inline')
  $ProcessoLeituraAtualModelCopyWith<$Res> get leituraAtual {
    return $ProcessoLeituraAtualModelCopyWith<$Res>(_value.leituraAtual,
        (value) {
      return _then(_value.copyWith(leituraAtual: value) as $Val);
    });
  }
}

/// @nodoc
abstract class _$$ProcessoLeituraMontagemModelImplCopyWith<$Res>
    implements $ProcessoLeituraMontagemModelCopyWith<$Res> {
  factory _$$ProcessoLeituraMontagemModelImplCopyWith(
          _$ProcessoLeituraMontagemModelImpl value,
          $Res Function(_$ProcessoLeituraMontagemModelImpl) then) =
      __$$ProcessoLeituraMontagemModelImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {bool? cancelado,
      String? maquina,
      String? tstamp,
      int? cod,
      DateTime? dataHora,
      ProcessoLeituraCodigoModel leituraCodigo,
      ProcessoLeituraAtualModel leituraAtual,
      List<String>? filaLeituras,
      bool automaticReadings,
      List<ProcessoLeituraPassoModel> passos,
      String versao});

  @override
  $ProcessoLeituraCodigoModelCopyWith<$Res> get leituraCodigo;
  @override
  $ProcessoLeituraAtualModelCopyWith<$Res> get leituraAtual;
}

/// @nodoc
class __$$ProcessoLeituraMontagemModelImplCopyWithImpl<$Res>
    extends _$ProcessoLeituraMontagemModelCopyWithImpl<$Res,
        _$ProcessoLeituraMontagemModelImpl>
    implements _$$ProcessoLeituraMontagemModelImplCopyWith<$Res> {
  __$$ProcessoLeituraMontagemModelImplCopyWithImpl(
      _$ProcessoLeituraMontagemModelImpl _value,
      $Res Function(_$ProcessoLeituraMontagemModelImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? cancelado = freezed,
    Object? maquina = freezed,
    Object? tstamp = freezed,
    Object? cod = freezed,
    Object? dataHora = freezed,
    Object? leituraCodigo = null,
    Object? leituraAtual = null,
    Object? filaLeituras = freezed,
    Object? automaticReadings = null,
    Object? passos = null,
    Object? versao = null,
  }) {
    return _then(_$ProcessoLeituraMontagemModelImpl(
      cancelado: freezed == cancelado
          ? _value.cancelado
          : cancelado // ignore: cast_nullable_to_non_nullable
              as bool?,
      maquina: freezed == maquina
          ? _value.maquina
          : maquina // ignore: cast_nullable_to_non_nullable
              as String?,
      tstamp: freezed == tstamp
          ? _value.tstamp
          : tstamp // ignore: cast_nullable_to_non_nullable
              as String?,
      cod: freezed == cod
          ? _value.cod
          : cod // ignore: cast_nullable_to_non_nullable
              as int?,
      dataHora: freezed == dataHora
          ? _value.dataHora
          : dataHora // ignore: cast_nullable_to_non_nullable
              as DateTime?,
      leituraCodigo: null == leituraCodigo
          ? _value.leituraCodigo
          : leituraCodigo // ignore: cast_nullable_to_non_nullable
              as ProcessoLeituraCodigoModel,
      leituraAtual: null == leituraAtual
          ? _value.leituraAtual
          : leituraAtual // ignore: cast_nullable_to_non_nullable
              as ProcessoLeituraAtualModel,
      filaLeituras: freezed == filaLeituras
          ? _value.filaLeituras
          : filaLeituras // ignore: cast_nullable_to_non_nullable
              as List<String>?,
      automaticReadings: null == automaticReadings
          ? _value.automaticReadings
          : automaticReadings // ignore: cast_nullable_to_non_nullable
              as bool,
      passos: null == passos
          ? _value.passos
          : passos // ignore: cast_nullable_to_non_nullable
              as List<ProcessoLeituraPassoModel>,
      versao: null == versao
          ? _value.versao
          : versao // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$ProcessoLeituraMontagemModelImpl extends _ProcessoLeituraMontagemModel
    with DiagnosticableTreeMixin {
  _$ProcessoLeituraMontagemModelImpl(
      {required this.cancelado,
      required this.maquina,
      required this.tstamp,
      required this.cod,
      required this.dataHora,
      required this.leituraCodigo,
      required this.leituraAtual,
      required this.filaLeituras,
      required this.automaticReadings,
      required this.passos,
      required this.versao})
      : super._();

  factory _$ProcessoLeituraMontagemModelImpl.fromJson(
          Map<String, dynamic> json) =>
      _$$ProcessoLeituraMontagemModelImplFromJson(json);

  @override
  bool? cancelado;
  @override
  String? maquina;
  @override
  String? tstamp;
  @override
  int? cod;
  @override
  DateTime? dataHora;
  @override
  ProcessoLeituraCodigoModel leituraCodigo;
  @override
  ProcessoLeituraAtualModel leituraAtual;
  @override
  List<String>? filaLeituras;
  @override
  bool automaticReadings;
  @override
  List<ProcessoLeituraPassoModel> passos;
  @override
  String versao;

  @override
  String toString({DiagnosticLevel minLevel = DiagnosticLevel.info}) {
    return 'ProcessoLeituraMontagemModel(cancelado: $cancelado, maquina: $maquina, tstamp: $tstamp, cod: $cod, dataHora: $dataHora, leituraCodigo: $leituraCodigo, leituraAtual: $leituraAtual, filaLeituras: $filaLeituras, automaticReadings: $automaticReadings, passos: $passos, versao: $versao)';
  }

  @override
  void debugFillProperties(DiagnosticPropertiesBuilder properties) {
    super.debugFillProperties(properties);
    properties
      ..add(DiagnosticsProperty('type', 'ProcessoLeituraMontagemModel'))
      ..add(DiagnosticsProperty('cancelado', cancelado))
      ..add(DiagnosticsProperty('maquina', maquina))
      ..add(DiagnosticsProperty('tstamp', tstamp))
      ..add(DiagnosticsProperty('cod', cod))
      ..add(DiagnosticsProperty('dataHora', dataHora))
      ..add(DiagnosticsProperty('leituraCodigo', leituraCodigo))
      ..add(DiagnosticsProperty('leituraAtual', leituraAtual))
      ..add(DiagnosticsProperty('filaLeituras', filaLeituras))
      ..add(DiagnosticsProperty('automaticReadings', automaticReadings))
      ..add(DiagnosticsProperty('passos', passos))
      ..add(DiagnosticsProperty('versao', versao));
  }

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$ProcessoLeituraMontagemModelImplCopyWith<
          _$ProcessoLeituraMontagemModelImpl>
      get copyWith => __$$ProcessoLeituraMontagemModelImplCopyWithImpl<
          _$ProcessoLeituraMontagemModelImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$ProcessoLeituraMontagemModelImplToJson(
      this,
    );
  }
}

abstract class _ProcessoLeituraMontagemModel
    extends ProcessoLeituraMontagemModel {
  factory _ProcessoLeituraMontagemModel(
      {required bool? cancelado,
      required String? maquina,
      required String? tstamp,
      required int? cod,
      required DateTime? dataHora,
      required ProcessoLeituraCodigoModel leituraCodigo,
      required ProcessoLeituraAtualModel leituraAtual,
      required List<String>? filaLeituras,
      required bool automaticReadings,
      required List<ProcessoLeituraPassoModel> passos,
      required String versao}) = _$ProcessoLeituraMontagemModelImpl;
  _ProcessoLeituraMontagemModel._() : super._();

  factory _ProcessoLeituraMontagemModel.fromJson(Map<String, dynamic> json) =
      _$ProcessoLeituraMontagemModelImpl.fromJson;

  @override
  bool? get cancelado;
  set cancelado(bool? value);
  @override
  String? get maquina;
  set maquina(String? value);
  @override
  String? get tstamp;
  set tstamp(String? value);
  @override
  int? get cod;
  set cod(int? value);
  @override
  DateTime? get dataHora;
  set dataHora(DateTime? value);
  @override
  ProcessoLeituraCodigoModel get leituraCodigo;
  set leituraCodigo(ProcessoLeituraCodigoModel value);
  @override
  ProcessoLeituraAtualModel get leituraAtual;
  set leituraAtual(ProcessoLeituraAtualModel value);
  @override
  List<String>? get filaLeituras;
  set filaLeituras(List<String>? value);
  @override
  bool get automaticReadings;
  set automaticReadings(bool value);
  @override
  List<ProcessoLeituraPassoModel> get passos;
  set passos(List<ProcessoLeituraPassoModel> value);
  @override
  String get versao;
  set versao(String value);
  @override
  @JsonKey(ignore: true)
  _$$ProcessoLeituraMontagemModelImplCopyWith<
          _$ProcessoLeituraMontagemModelImpl>
      get copyWith => throw _privateConstructorUsedError;
}
