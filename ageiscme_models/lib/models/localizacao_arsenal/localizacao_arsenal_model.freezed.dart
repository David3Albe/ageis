// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'localizacao_arsenal_model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

LocalizacaoArsenalModel _$LocalizacaoArsenalModelFromJson(
    Map<String, dynamic> json) {
  return _LocalizacaoArsenalModel.fromJson(json);
}

/// @nodoc
mixin _$LocalizacaoArsenalModel {
  int? get cod => throw _privateConstructorUsedError;
  set cod(int? value) => throw _privateConstructorUsedError;
  String? get local => throw _privateConstructorUsedError;
  set local(String? value) => throw _privateConstructorUsedError;
  int? get codEstoque => throw _privateConstructorUsedError;
  set codEstoque(int? value) => throw _privateConstructorUsedError;
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
  ArsenalEstoqueModel? get arsenal => throw _privateConstructorUsedError;
  set arsenal(ArsenalEstoqueModel? value) => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $LocalizacaoArsenalModelCopyWith<LocalizacaoArsenalModel> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $LocalizacaoArsenalModelCopyWith<$Res> {
  factory $LocalizacaoArsenalModelCopyWith(LocalizacaoArsenalModel value,
          $Res Function(LocalizacaoArsenalModel) then) =
      _$LocalizacaoArsenalModelCopyWithImpl<$Res, LocalizacaoArsenalModel>;
  @useResult
  $Res call(
      {int? cod,
      String? local,
      int? codEstoque,
      int? codBarra,
      int? codInstituicao,
      bool? ativo,
      DateTime? ultimaAlteracao,
      @JsonKey(name: 'tStamp') String? tstamp,
      ArsenalEstoqueModel? arsenal});

  $ArsenalEstoqueModelCopyWith<$Res>? get arsenal;
}

/// @nodoc
class _$LocalizacaoArsenalModelCopyWithImpl<$Res,
        $Val extends LocalizacaoArsenalModel>
    implements $LocalizacaoArsenalModelCopyWith<$Res> {
  _$LocalizacaoArsenalModelCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? cod = freezed,
    Object? local = freezed,
    Object? codEstoque = freezed,
    Object? codBarra = freezed,
    Object? codInstituicao = freezed,
    Object? ativo = freezed,
    Object? ultimaAlteracao = freezed,
    Object? tstamp = freezed,
    Object? arsenal = freezed,
  }) {
    return _then(_value.copyWith(
      cod: freezed == cod
          ? _value.cod
          : cod // ignore: cast_nullable_to_non_nullable
              as int?,
      local: freezed == local
          ? _value.local
          : local // ignore: cast_nullable_to_non_nullable
              as String?,
      codEstoque: freezed == codEstoque
          ? _value.codEstoque
          : codEstoque // ignore: cast_nullable_to_non_nullable
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
      arsenal: freezed == arsenal
          ? _value.arsenal
          : arsenal // ignore: cast_nullable_to_non_nullable
              as ArsenalEstoqueModel?,
    ) as $Val);
  }

  @override
  @pragma('vm:prefer-inline')
  $ArsenalEstoqueModelCopyWith<$Res>? get arsenal {
    if (_value.arsenal == null) {
      return null;
    }

    return $ArsenalEstoqueModelCopyWith<$Res>(_value.arsenal!, (value) {
      return _then(_value.copyWith(arsenal: value) as $Val);
    });
  }
}

/// @nodoc
abstract class _$$LocalizacaoArsenalModelImplCopyWith<$Res>
    implements $LocalizacaoArsenalModelCopyWith<$Res> {
  factory _$$LocalizacaoArsenalModelImplCopyWith(
          _$LocalizacaoArsenalModelImpl value,
          $Res Function(_$LocalizacaoArsenalModelImpl) then) =
      __$$LocalizacaoArsenalModelImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {int? cod,
      String? local,
      int? codEstoque,
      int? codBarra,
      int? codInstituicao,
      bool? ativo,
      DateTime? ultimaAlteracao,
      @JsonKey(name: 'tStamp') String? tstamp,
      ArsenalEstoqueModel? arsenal});

  @override
  $ArsenalEstoqueModelCopyWith<$Res>? get arsenal;
}

/// @nodoc
class __$$LocalizacaoArsenalModelImplCopyWithImpl<$Res>
    extends _$LocalizacaoArsenalModelCopyWithImpl<$Res,
        _$LocalizacaoArsenalModelImpl>
    implements _$$LocalizacaoArsenalModelImplCopyWith<$Res> {
  __$$LocalizacaoArsenalModelImplCopyWithImpl(
      _$LocalizacaoArsenalModelImpl _value,
      $Res Function(_$LocalizacaoArsenalModelImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? cod = freezed,
    Object? local = freezed,
    Object? codEstoque = freezed,
    Object? codBarra = freezed,
    Object? codInstituicao = freezed,
    Object? ativo = freezed,
    Object? ultimaAlteracao = freezed,
    Object? tstamp = freezed,
    Object? arsenal = freezed,
  }) {
    return _then(_$LocalizacaoArsenalModelImpl(
      cod: freezed == cod
          ? _value.cod
          : cod // ignore: cast_nullable_to_non_nullable
              as int?,
      local: freezed == local
          ? _value.local
          : local // ignore: cast_nullable_to_non_nullable
              as String?,
      codEstoque: freezed == codEstoque
          ? _value.codEstoque
          : codEstoque // ignore: cast_nullable_to_non_nullable
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
      arsenal: freezed == arsenal
          ? _value.arsenal
          : arsenal // ignore: cast_nullable_to_non_nullable
              as ArsenalEstoqueModel?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$LocalizacaoArsenalModelImpl extends _LocalizacaoArsenalModel
    with DiagnosticableTreeMixin {
  _$LocalizacaoArsenalModelImpl(
      {required this.cod,
      required this.local,
      required this.codEstoque,
      required this.codBarra,
      required this.codInstituicao,
      required this.ativo,
      required this.ultimaAlteracao,
      @JsonKey(name: 'tStamp') required this.tstamp,
      required this.arsenal})
      : super._();

  factory _$LocalizacaoArsenalModelImpl.fromJson(Map<String, dynamic> json) =>
      _$$LocalizacaoArsenalModelImplFromJson(json);

  @override
  int? cod;
  @override
  String? local;
  @override
  int? codEstoque;
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
  ArsenalEstoqueModel? arsenal;

  @override
  String toString({DiagnosticLevel minLevel = DiagnosticLevel.info}) {
    return 'LocalizacaoArsenalModel(cod: $cod, local: $local, codEstoque: $codEstoque, codBarra: $codBarra, codInstituicao: $codInstituicao, ativo: $ativo, ultimaAlteracao: $ultimaAlteracao, tstamp: $tstamp, arsenal: $arsenal)';
  }

  @override
  void debugFillProperties(DiagnosticPropertiesBuilder properties) {
    super.debugFillProperties(properties);
    properties
      ..add(DiagnosticsProperty('type', 'LocalizacaoArsenalModel'))
      ..add(DiagnosticsProperty('cod', cod))
      ..add(DiagnosticsProperty('local', local))
      ..add(DiagnosticsProperty('codEstoque', codEstoque))
      ..add(DiagnosticsProperty('codBarra', codBarra))
      ..add(DiagnosticsProperty('codInstituicao', codInstituicao))
      ..add(DiagnosticsProperty('ativo', ativo))
      ..add(DiagnosticsProperty('ultimaAlteracao', ultimaAlteracao))
      ..add(DiagnosticsProperty('tstamp', tstamp))
      ..add(DiagnosticsProperty('arsenal', arsenal));
  }

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$LocalizacaoArsenalModelImplCopyWith<_$LocalizacaoArsenalModelImpl>
      get copyWith => __$$LocalizacaoArsenalModelImplCopyWithImpl<
          _$LocalizacaoArsenalModelImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$LocalizacaoArsenalModelImplToJson(
      this,
    );
  }
}

abstract class _LocalizacaoArsenalModel extends LocalizacaoArsenalModel {
  factory _LocalizacaoArsenalModel(
      {required int? cod,
      required String? local,
      required int? codEstoque,
      required int? codBarra,
      required int? codInstituicao,
      required bool? ativo,
      required DateTime? ultimaAlteracao,
      @JsonKey(name: 'tStamp') required String? tstamp,
      required ArsenalEstoqueModel? arsenal}) = _$LocalizacaoArsenalModelImpl;
  _LocalizacaoArsenalModel._() : super._();

  factory _LocalizacaoArsenalModel.fromJson(Map<String, dynamic> json) =
      _$LocalizacaoArsenalModelImpl.fromJson;

  @override
  int? get cod;
  set cod(int? value);
  @override
  String? get local;
  set local(String? value);
  @override
  int? get codEstoque;
  set codEstoque(int? value);
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
  ArsenalEstoqueModel? get arsenal;
  set arsenal(ArsenalEstoqueModel? value);
  @override
  @JsonKey(ignore: true)
  _$$LocalizacaoArsenalModelImplCopyWith<_$LocalizacaoArsenalModelImpl>
      get copyWith => throw _privateConstructorUsedError;
}
