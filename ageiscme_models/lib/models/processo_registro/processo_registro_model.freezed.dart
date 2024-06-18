// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'processo_registro_model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

ProcessoRegistroModel _$ProcessoRegistroModelFromJson(
    Map<String, dynamic> json) {
  return _ProcessoRegistroModel.fromJson(json);
}

/// @nodoc
mixin _$ProcessoRegistroModel {
  int? get cod => throw _privateConstructorUsedError;
  set cod(int? value) => throw _privateConstructorUsedError;
  int? get codEtapaProcesso => throw _privateConstructorUsedError;
  set codEtapaProcesso(int? value) => throw _privateConstructorUsedError;
  DateTime? get dataHoraInicio => throw _privateConstructorUsedError;
  set dataHoraInicio(DateTime? value) => throw _privateConstructorUsedError;
  DateTime? get dataHoraTermino => throw _privateConstructorUsedError;
  set dataHoraTermino(DateTime? value) => throw _privateConstructorUsedError;
  int? get codUsuario => throw _privateConstructorUsedError;
  set codUsuario(int? value) => throw _privateConstructorUsedError;
  int? get codInstituicao => throw _privateConstructorUsedError;
  set codInstituicao(int? value) => throw _privateConstructorUsedError;
  DateTime? get ultimaAlteracao => throw _privateConstructorUsedError;
  set ultimaAlteracao(DateTime? value) => throw _privateConstructorUsedError;
  String? get indicador => throw _privateConstructorUsedError;
  set indicador(String? value) => throw _privateConstructorUsedError;
  String? get biologico => throw _privateConstructorUsedError;
  set biologico(String? value) => throw _privateConstructorUsedError;
  ProcessoLeituraModel? get leitura => throw _privateConstructorUsedError;
  set leitura(ProcessoLeituraModel? value) =>
      throw _privateConstructorUsedError;
  @JsonKey(name: 'tStamp')
  String? get tstamp => throw _privateConstructorUsedError;
  @JsonKey(name: 'tStamp')
  set tstamp(String? value) => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $ProcessoRegistroModelCopyWith<ProcessoRegistroModel> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $ProcessoRegistroModelCopyWith<$Res> {
  factory $ProcessoRegistroModelCopyWith(ProcessoRegistroModel value,
          $Res Function(ProcessoRegistroModel) then) =
      _$ProcessoRegistroModelCopyWithImpl<$Res, ProcessoRegistroModel>;
  @useResult
  $Res call(
      {int? cod,
      int? codEtapaProcesso,
      DateTime? dataHoraInicio,
      DateTime? dataHoraTermino,
      int? codUsuario,
      int? codInstituicao,
      DateTime? ultimaAlteracao,
      String? indicador,
      String? biologico,
      ProcessoLeituraModel? leitura,
      @JsonKey(name: 'tStamp') String? tstamp});

  $ProcessoLeituraModelCopyWith<$Res>? get leitura;
}

/// @nodoc
class _$ProcessoRegistroModelCopyWithImpl<$Res,
        $Val extends ProcessoRegistroModel>
    implements $ProcessoRegistroModelCopyWith<$Res> {
  _$ProcessoRegistroModelCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? cod = freezed,
    Object? codEtapaProcesso = freezed,
    Object? dataHoraInicio = freezed,
    Object? dataHoraTermino = freezed,
    Object? codUsuario = freezed,
    Object? codInstituicao = freezed,
    Object? ultimaAlteracao = freezed,
    Object? indicador = freezed,
    Object? biologico = freezed,
    Object? leitura = freezed,
    Object? tstamp = freezed,
  }) {
    return _then(_value.copyWith(
      cod: freezed == cod
          ? _value.cod
          : cod // ignore: cast_nullable_to_non_nullable
              as int?,
      codEtapaProcesso: freezed == codEtapaProcesso
          ? _value.codEtapaProcesso
          : codEtapaProcesso // ignore: cast_nullable_to_non_nullable
              as int?,
      dataHoraInicio: freezed == dataHoraInicio
          ? _value.dataHoraInicio
          : dataHoraInicio // ignore: cast_nullable_to_non_nullable
              as DateTime?,
      dataHoraTermino: freezed == dataHoraTermino
          ? _value.dataHoraTermino
          : dataHoraTermino // ignore: cast_nullable_to_non_nullable
              as DateTime?,
      codUsuario: freezed == codUsuario
          ? _value.codUsuario
          : codUsuario // ignore: cast_nullable_to_non_nullable
              as int?,
      codInstituicao: freezed == codInstituicao
          ? _value.codInstituicao
          : codInstituicao // ignore: cast_nullable_to_non_nullable
              as int?,
      ultimaAlteracao: freezed == ultimaAlteracao
          ? _value.ultimaAlteracao
          : ultimaAlteracao // ignore: cast_nullable_to_non_nullable
              as DateTime?,
      indicador: freezed == indicador
          ? _value.indicador
          : indicador // ignore: cast_nullable_to_non_nullable
              as String?,
      biologico: freezed == biologico
          ? _value.biologico
          : biologico // ignore: cast_nullable_to_non_nullable
              as String?,
      leitura: freezed == leitura
          ? _value.leitura
          : leitura // ignore: cast_nullable_to_non_nullable
              as ProcessoLeituraModel?,
      tstamp: freezed == tstamp
          ? _value.tstamp
          : tstamp // ignore: cast_nullable_to_non_nullable
              as String?,
    ) as $Val);
  }

  @override
  @pragma('vm:prefer-inline')
  $ProcessoLeituraModelCopyWith<$Res>? get leitura {
    if (_value.leitura == null) {
      return null;
    }

    return $ProcessoLeituraModelCopyWith<$Res>(_value.leitura!, (value) {
      return _then(_value.copyWith(leitura: value) as $Val);
    });
  }
}

/// @nodoc
abstract class _$$ProcessoRegistroModelImplCopyWith<$Res>
    implements $ProcessoRegistroModelCopyWith<$Res> {
  factory _$$ProcessoRegistroModelImplCopyWith(
          _$ProcessoRegistroModelImpl value,
          $Res Function(_$ProcessoRegistroModelImpl) then) =
      __$$ProcessoRegistroModelImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {int? cod,
      int? codEtapaProcesso,
      DateTime? dataHoraInicio,
      DateTime? dataHoraTermino,
      int? codUsuario,
      int? codInstituicao,
      DateTime? ultimaAlteracao,
      String? indicador,
      String? biologico,
      ProcessoLeituraModel? leitura,
      @JsonKey(name: 'tStamp') String? tstamp});

  @override
  $ProcessoLeituraModelCopyWith<$Res>? get leitura;
}

/// @nodoc
class __$$ProcessoRegistroModelImplCopyWithImpl<$Res>
    extends _$ProcessoRegistroModelCopyWithImpl<$Res,
        _$ProcessoRegistroModelImpl>
    implements _$$ProcessoRegistroModelImplCopyWith<$Res> {
  __$$ProcessoRegistroModelImplCopyWithImpl(_$ProcessoRegistroModelImpl _value,
      $Res Function(_$ProcessoRegistroModelImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? cod = freezed,
    Object? codEtapaProcesso = freezed,
    Object? dataHoraInicio = freezed,
    Object? dataHoraTermino = freezed,
    Object? codUsuario = freezed,
    Object? codInstituicao = freezed,
    Object? ultimaAlteracao = freezed,
    Object? indicador = freezed,
    Object? biologico = freezed,
    Object? leitura = freezed,
    Object? tstamp = freezed,
  }) {
    return _then(_$ProcessoRegistroModelImpl(
      cod: freezed == cod
          ? _value.cod
          : cod // ignore: cast_nullable_to_non_nullable
              as int?,
      codEtapaProcesso: freezed == codEtapaProcesso
          ? _value.codEtapaProcesso
          : codEtapaProcesso // ignore: cast_nullable_to_non_nullable
              as int?,
      dataHoraInicio: freezed == dataHoraInicio
          ? _value.dataHoraInicio
          : dataHoraInicio // ignore: cast_nullable_to_non_nullable
              as DateTime?,
      dataHoraTermino: freezed == dataHoraTermino
          ? _value.dataHoraTermino
          : dataHoraTermino // ignore: cast_nullable_to_non_nullable
              as DateTime?,
      codUsuario: freezed == codUsuario
          ? _value.codUsuario
          : codUsuario // ignore: cast_nullable_to_non_nullable
              as int?,
      codInstituicao: freezed == codInstituicao
          ? _value.codInstituicao
          : codInstituicao // ignore: cast_nullable_to_non_nullable
              as int?,
      ultimaAlteracao: freezed == ultimaAlteracao
          ? _value.ultimaAlteracao
          : ultimaAlteracao // ignore: cast_nullable_to_non_nullable
              as DateTime?,
      indicador: freezed == indicador
          ? _value.indicador
          : indicador // ignore: cast_nullable_to_non_nullable
              as String?,
      biologico: freezed == biologico
          ? _value.biologico
          : biologico // ignore: cast_nullable_to_non_nullable
              as String?,
      leitura: freezed == leitura
          ? _value.leitura
          : leitura // ignore: cast_nullable_to_non_nullable
              as ProcessoLeituraModel?,
      tstamp: freezed == tstamp
          ? _value.tstamp
          : tstamp // ignore: cast_nullable_to_non_nullable
              as String?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$ProcessoRegistroModelImpl extends _ProcessoRegistroModel
    with DiagnosticableTreeMixin {
  _$ProcessoRegistroModelImpl(
      {required this.cod,
      required this.codEtapaProcesso,
      required this.dataHoraInicio,
      required this.dataHoraTermino,
      required this.codUsuario,
      required this.codInstituicao,
      required this.ultimaAlteracao,
      required this.indicador,
      required this.biologico,
      required this.leitura,
      @JsonKey(name: 'tStamp') required this.tstamp})
      : super._();

  factory _$ProcessoRegistroModelImpl.fromJson(Map<String, dynamic> json) =>
      _$$ProcessoRegistroModelImplFromJson(json);

  @override
  int? cod;
  @override
  int? codEtapaProcesso;
  @override
  DateTime? dataHoraInicio;
  @override
  DateTime? dataHoraTermino;
  @override
  int? codUsuario;
  @override
  int? codInstituicao;
  @override
  DateTime? ultimaAlteracao;
  @override
  String? indicador;
  @override
  String? biologico;
  @override
  ProcessoLeituraModel? leitura;
  @override
  @JsonKey(name: 'tStamp')
  String? tstamp;

  @override
  String toString({DiagnosticLevel minLevel = DiagnosticLevel.info}) {
    return 'ProcessoRegistroModel(cod: $cod, codEtapaProcesso: $codEtapaProcesso, dataHoraInicio: $dataHoraInicio, dataHoraTermino: $dataHoraTermino, codUsuario: $codUsuario, codInstituicao: $codInstituicao, ultimaAlteracao: $ultimaAlteracao, indicador: $indicador, biologico: $biologico, leitura: $leitura, tstamp: $tstamp)';
  }

  @override
  void debugFillProperties(DiagnosticPropertiesBuilder properties) {
    super.debugFillProperties(properties);
    properties
      ..add(DiagnosticsProperty('type', 'ProcessoRegistroModel'))
      ..add(DiagnosticsProperty('cod', cod))
      ..add(DiagnosticsProperty('codEtapaProcesso', codEtapaProcesso))
      ..add(DiagnosticsProperty('dataHoraInicio', dataHoraInicio))
      ..add(DiagnosticsProperty('dataHoraTermino', dataHoraTermino))
      ..add(DiagnosticsProperty('codUsuario', codUsuario))
      ..add(DiagnosticsProperty('codInstituicao', codInstituicao))
      ..add(DiagnosticsProperty('ultimaAlteracao', ultimaAlteracao))
      ..add(DiagnosticsProperty('indicador', indicador))
      ..add(DiagnosticsProperty('biologico', biologico))
      ..add(DiagnosticsProperty('leitura', leitura))
      ..add(DiagnosticsProperty('tstamp', tstamp));
  }

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$ProcessoRegistroModelImplCopyWith<_$ProcessoRegistroModelImpl>
      get copyWith => __$$ProcessoRegistroModelImplCopyWithImpl<
          _$ProcessoRegistroModelImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$ProcessoRegistroModelImplToJson(
      this,
    );
  }
}

abstract class _ProcessoRegistroModel extends ProcessoRegistroModel {
  factory _ProcessoRegistroModel(
          {required int? cod,
          required int? codEtapaProcesso,
          required DateTime? dataHoraInicio,
          required DateTime? dataHoraTermino,
          required int? codUsuario,
          required int? codInstituicao,
          required DateTime? ultimaAlteracao,
          required String? indicador,
          required String? biologico,
          required ProcessoLeituraModel? leitura,
          @JsonKey(name: 'tStamp') required String? tstamp}) =
      _$ProcessoRegistroModelImpl;
  _ProcessoRegistroModel._() : super._();

  factory _ProcessoRegistroModel.fromJson(Map<String, dynamic> json) =
      _$ProcessoRegistroModelImpl.fromJson;

  @override
  int? get cod;
  set cod(int? value);
  @override
  int? get codEtapaProcesso;
  set codEtapaProcesso(int? value);
  @override
  DateTime? get dataHoraInicio;
  set dataHoraInicio(DateTime? value);
  @override
  DateTime? get dataHoraTermino;
  set dataHoraTermino(DateTime? value);
  @override
  int? get codUsuario;
  set codUsuario(int? value);
  @override
  int? get codInstituicao;
  set codInstituicao(int? value);
  @override
  DateTime? get ultimaAlteracao;
  set ultimaAlteracao(DateTime? value);
  @override
  String? get indicador;
  set indicador(String? value);
  @override
  String? get biologico;
  set biologico(String? value);
  @override
  ProcessoLeituraModel? get leitura;
  set leitura(ProcessoLeituraModel? value);
  @override
  @JsonKey(name: 'tStamp')
  String? get tstamp;
  @JsonKey(name: 'tStamp')
  set tstamp(String? value);
  @override
  @JsonKey(ignore: true)
  _$$ProcessoRegistroModelImplCopyWith<_$ProcessoRegistroModelImpl>
      get copyWith => throw _privateConstructorUsedError;
}
