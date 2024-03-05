// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'deposito_insumo_model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

DepositoInsumoModel _$DepositoInsumoModelFromJson(Map<String, dynamic> json) {
  return _DepositoInsumoModel.fromJson(json);
}

/// @nodoc
mixin _$DepositoInsumoModel {
  int? get cod => throw _privateConstructorUsedError;
  set cod(int? value) => throw _privateConstructorUsedError;
  String? get nome => throw _privateConstructorUsedError;
  set nome(String? value) => throw _privateConstructorUsedError;
  String? get status => throw _privateConstructorUsedError;
  set status(String? value) => throw _privateConstructorUsedError;
  int? get codLocal => throw _privateConstructorUsedError;
  set codLocal(int? value) => throw _privateConstructorUsedError;
  int? get codBarra => throw _privateConstructorUsedError;
  set codBarra(int? value) => throw _privateConstructorUsedError;
  int? get codInstituicao => throw _privateConstructorUsedError;
  set codInstituicao(int? value) => throw _privateConstructorUsedError;
  bool? get ativo => throw _privateConstructorUsedError;
  set ativo(bool? value) => throw _privateConstructorUsedError;
  DateTime? get ultimaAlteracao => throw _privateConstructorUsedError;
  set ultimaAlteracao(DateTime? value) => throw _privateConstructorUsedError;
  @JsonKey(name: 'tStamp')
  String? get tstamp => throw _privateConstructorUsedError;
  @JsonKey(name: 'tStamp')
  set tstamp(String? value) => throw _privateConstructorUsedError;
  LocalInstituicaoModel? get local => throw _privateConstructorUsedError;
  set local(LocalInstituicaoModel? value) => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $DepositoInsumoModelCopyWith<DepositoInsumoModel> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $DepositoInsumoModelCopyWith<$Res> {
  factory $DepositoInsumoModelCopyWith(
          DepositoInsumoModel value, $Res Function(DepositoInsumoModel) then) =
      _$DepositoInsumoModelCopyWithImpl<$Res, DepositoInsumoModel>;
  @useResult
  $Res call(
      {int? cod,
      String? nome,
      String? status,
      int? codLocal,
      int? codBarra,
      int? codInstituicao,
      bool? ativo,
      DateTime? ultimaAlteracao,
      @JsonKey(name: 'tStamp') String? tstamp,
      LocalInstituicaoModel? local});

  $LocalInstituicaoModelCopyWith<$Res>? get local;
}

/// @nodoc
class _$DepositoInsumoModelCopyWithImpl<$Res, $Val extends DepositoInsumoModel>
    implements $DepositoInsumoModelCopyWith<$Res> {
  _$DepositoInsumoModelCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? cod = freezed,
    Object? nome = freezed,
    Object? status = freezed,
    Object? codLocal = freezed,
    Object? codBarra = freezed,
    Object? codInstituicao = freezed,
    Object? ativo = freezed,
    Object? ultimaAlteracao = freezed,
    Object? tstamp = freezed,
    Object? local = freezed,
  }) {
    return _then(_value.copyWith(
      cod: freezed == cod
          ? _value.cod
          : cod // ignore: cast_nullable_to_non_nullable
              as int?,
      nome: freezed == nome
          ? _value.nome
          : nome // ignore: cast_nullable_to_non_nullable
              as String?,
      status: freezed == status
          ? _value.status
          : status // ignore: cast_nullable_to_non_nullable
              as String?,
      codLocal: freezed == codLocal
          ? _value.codLocal
          : codLocal // ignore: cast_nullable_to_non_nullable
              as int?,
      codBarra: freezed == codBarra
          ? _value.codBarra
          : codBarra // ignore: cast_nullable_to_non_nullable
              as int?,
      codInstituicao: freezed == codInstituicao
          ? _value.codInstituicao
          : codInstituicao // ignore: cast_nullable_to_non_nullable
              as int?,
      ativo: freezed == ativo
          ? _value.ativo
          : ativo // ignore: cast_nullable_to_non_nullable
              as bool?,
      ultimaAlteracao: freezed == ultimaAlteracao
          ? _value.ultimaAlteracao
          : ultimaAlteracao // ignore: cast_nullable_to_non_nullable
              as DateTime?,
      tstamp: freezed == tstamp
          ? _value.tstamp
          : tstamp // ignore: cast_nullable_to_non_nullable
              as String?,
      local: freezed == local
          ? _value.local
          : local // ignore: cast_nullable_to_non_nullable
              as LocalInstituicaoModel?,
    ) as $Val);
  }

  @override
  @pragma('vm:prefer-inline')
  $LocalInstituicaoModelCopyWith<$Res>? get local {
    if (_value.local == null) {
      return null;
    }

    return $LocalInstituicaoModelCopyWith<$Res>(_value.local!, (value) {
      return _then(_value.copyWith(local: value) as $Val);
    });
  }
}

/// @nodoc
abstract class _$$DepositoInsumoModelImplCopyWith<$Res>
    implements $DepositoInsumoModelCopyWith<$Res> {
  factory _$$DepositoInsumoModelImplCopyWith(_$DepositoInsumoModelImpl value,
          $Res Function(_$DepositoInsumoModelImpl) then) =
      __$$DepositoInsumoModelImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {int? cod,
      String? nome,
      String? status,
      int? codLocal,
      int? codBarra,
      int? codInstituicao,
      bool? ativo,
      DateTime? ultimaAlteracao,
      @JsonKey(name: 'tStamp') String? tstamp,
      LocalInstituicaoModel? local});

  @override
  $LocalInstituicaoModelCopyWith<$Res>? get local;
}

/// @nodoc
class __$$DepositoInsumoModelImplCopyWithImpl<$Res>
    extends _$DepositoInsumoModelCopyWithImpl<$Res, _$DepositoInsumoModelImpl>
    implements _$$DepositoInsumoModelImplCopyWith<$Res> {
  __$$DepositoInsumoModelImplCopyWithImpl(_$DepositoInsumoModelImpl _value,
      $Res Function(_$DepositoInsumoModelImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? cod = freezed,
    Object? nome = freezed,
    Object? status = freezed,
    Object? codLocal = freezed,
    Object? codBarra = freezed,
    Object? codInstituicao = freezed,
    Object? ativo = freezed,
    Object? ultimaAlteracao = freezed,
    Object? tstamp = freezed,
    Object? local = freezed,
  }) {
    return _then(_$DepositoInsumoModelImpl(
      cod: freezed == cod
          ? _value.cod
          : cod // ignore: cast_nullable_to_non_nullable
              as int?,
      nome: freezed == nome
          ? _value.nome
          : nome // ignore: cast_nullable_to_non_nullable
              as String?,
      status: freezed == status
          ? _value.status
          : status // ignore: cast_nullable_to_non_nullable
              as String?,
      codLocal: freezed == codLocal
          ? _value.codLocal
          : codLocal // ignore: cast_nullable_to_non_nullable
              as int?,
      codBarra: freezed == codBarra
          ? _value.codBarra
          : codBarra // ignore: cast_nullable_to_non_nullable
              as int?,
      codInstituicao: freezed == codInstituicao
          ? _value.codInstituicao
          : codInstituicao // ignore: cast_nullable_to_non_nullable
              as int?,
      ativo: freezed == ativo
          ? _value.ativo
          : ativo // ignore: cast_nullable_to_non_nullable
              as bool?,
      ultimaAlteracao: freezed == ultimaAlteracao
          ? _value.ultimaAlteracao
          : ultimaAlteracao // ignore: cast_nullable_to_non_nullable
              as DateTime?,
      tstamp: freezed == tstamp
          ? _value.tstamp
          : tstamp // ignore: cast_nullable_to_non_nullable
              as String?,
      local: freezed == local
          ? _value.local
          : local // ignore: cast_nullable_to_non_nullable
              as LocalInstituicaoModel?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$DepositoInsumoModelImpl extends _DepositoInsumoModel
    with DiagnosticableTreeMixin {
  _$DepositoInsumoModelImpl(
      {required this.cod,
      required this.nome,
      required this.status,
      required this.codLocal,
      required this.codBarra,
      required this.codInstituicao,
      required this.ativo,
      required this.ultimaAlteracao,
      @JsonKey(name: 'tStamp') required this.tstamp,
      required this.local})
      : super._();

  factory _$DepositoInsumoModelImpl.fromJson(Map<String, dynamic> json) =>
      _$$DepositoInsumoModelImplFromJson(json);

  @override
  int? cod;
  @override
  String? nome;
  @override
  String? status;
  @override
  int? codLocal;
  @override
  int? codBarra;
  @override
  int? codInstituicao;
  @override
  bool? ativo;
  @override
  DateTime? ultimaAlteracao;
  @override
  @JsonKey(name: 'tStamp')
  String? tstamp;
  @override
  LocalInstituicaoModel? local;

  @override
  String toString({DiagnosticLevel minLevel = DiagnosticLevel.info}) {
    return 'DepositoInsumoModel(cod: $cod, nome: $nome, status: $status, codLocal: $codLocal, codBarra: $codBarra, codInstituicao: $codInstituicao, ativo: $ativo, ultimaAlteracao: $ultimaAlteracao, tstamp: $tstamp, local: $local)';
  }

  @override
  void debugFillProperties(DiagnosticPropertiesBuilder properties) {
    super.debugFillProperties(properties);
    properties
      ..add(DiagnosticsProperty('type', 'DepositoInsumoModel'))
      ..add(DiagnosticsProperty('cod', cod))
      ..add(DiagnosticsProperty('nome', nome))
      ..add(DiagnosticsProperty('status', status))
      ..add(DiagnosticsProperty('codLocal', codLocal))
      ..add(DiagnosticsProperty('codBarra', codBarra))
      ..add(DiagnosticsProperty('codInstituicao', codInstituicao))
      ..add(DiagnosticsProperty('ativo', ativo))
      ..add(DiagnosticsProperty('ultimaAlteracao', ultimaAlteracao))
      ..add(DiagnosticsProperty('tstamp', tstamp))
      ..add(DiagnosticsProperty('local', local));
  }

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$DepositoInsumoModelImplCopyWith<_$DepositoInsumoModelImpl> get copyWith =>
      __$$DepositoInsumoModelImplCopyWithImpl<_$DepositoInsumoModelImpl>(
          this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$DepositoInsumoModelImplToJson(
      this,
    );
  }
}

abstract class _DepositoInsumoModel extends DepositoInsumoModel {
  factory _DepositoInsumoModel(
      {required int? cod,
      required String? nome,
      required String? status,
      required int? codLocal,
      required int? codBarra,
      required int? codInstituicao,
      required bool? ativo,
      required DateTime? ultimaAlteracao,
      @JsonKey(name: 'tStamp') required String? tstamp,
      required LocalInstituicaoModel? local}) = _$DepositoInsumoModelImpl;
  _DepositoInsumoModel._() : super._();

  factory _DepositoInsumoModel.fromJson(Map<String, dynamic> json) =
      _$DepositoInsumoModelImpl.fromJson;

  @override
  int? get cod;
  set cod(int? value);
  @override
  String? get nome;
  set nome(String? value);
  @override
  String? get status;
  set status(String? value);
  @override
  int? get codLocal;
  set codLocal(int? value);
  @override
  int? get codBarra;
  set codBarra(int? value);
  @override
  int? get codInstituicao;
  set codInstituicao(int? value);
  @override
  bool? get ativo;
  set ativo(bool? value);
  @override
  DateTime? get ultimaAlteracao;
  set ultimaAlteracao(DateTime? value);
  @override
  @JsonKey(name: 'tStamp')
  String? get tstamp;
  @JsonKey(name: 'tStamp')
  set tstamp(String? value);
  @override
  LocalInstituicaoModel? get local;
  set local(LocalInstituicaoModel? value);
  @override
  @JsonKey(ignore: true)
  _$$DepositoInsumoModelImplCopyWith<_$DepositoInsumoModelImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
