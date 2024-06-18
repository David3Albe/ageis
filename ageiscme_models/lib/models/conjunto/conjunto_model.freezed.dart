// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'conjunto_model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

ConjuntoModel _$ConjuntoModelFromJson(Map<String, dynamic> json) {
  return _ConjuntoModel.fromJson(json);
}

/// @nodoc
mixin _$ConjuntoModel {
  int? get cod => throw _privateConstructorUsedError;
  set cod(int? value) => throw _privateConstructorUsedError;
  String? get nome => throw _privateConstructorUsedError;
  set nome(String? value) => throw _privateConstructorUsedError;
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

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $ConjuntoModelCopyWith<ConjuntoModel> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $ConjuntoModelCopyWith<$Res> {
  factory $ConjuntoModelCopyWith(
          ConjuntoModel value, $Res Function(ConjuntoModel) then) =
      _$ConjuntoModelCopyWithImpl<$Res, ConjuntoModel>;
  @useResult
  $Res call(
      {int? cod,
      String? nome,
      int? codInstituicao,
      bool? ativo,
      DateTime? ultimaAlteracao,
      @JsonKey(name: 'tStamp') String? tstamp});
}

/// @nodoc
class _$ConjuntoModelCopyWithImpl<$Res, $Val extends ConjuntoModel>
    implements $ConjuntoModelCopyWith<$Res> {
  _$ConjuntoModelCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? cod = freezed,
    Object? nome = freezed,
    Object? codInstituicao = freezed,
    Object? ativo = freezed,
    Object? ultimaAlteracao = freezed,
    Object? tstamp = freezed,
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
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$ConjuntoModelImplCopyWith<$Res>
    implements $ConjuntoModelCopyWith<$Res> {
  factory _$$ConjuntoModelImplCopyWith(
          _$ConjuntoModelImpl value, $Res Function(_$ConjuntoModelImpl) then) =
      __$$ConjuntoModelImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {int? cod,
      String? nome,
      int? codInstituicao,
      bool? ativo,
      DateTime? ultimaAlteracao,
      @JsonKey(name: 'tStamp') String? tstamp});
}

/// @nodoc
class __$$ConjuntoModelImplCopyWithImpl<$Res>
    extends _$ConjuntoModelCopyWithImpl<$Res, _$ConjuntoModelImpl>
    implements _$$ConjuntoModelImplCopyWith<$Res> {
  __$$ConjuntoModelImplCopyWithImpl(
      _$ConjuntoModelImpl _value, $Res Function(_$ConjuntoModelImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? cod = freezed,
    Object? nome = freezed,
    Object? codInstituicao = freezed,
    Object? ativo = freezed,
    Object? ultimaAlteracao = freezed,
    Object? tstamp = freezed,
  }) {
    return _then(_$ConjuntoModelImpl(
      cod: freezed == cod
          ? _value.cod
          : cod // ignore: cast_nullable_to_non_nullable
              as int?,
      nome: freezed == nome
          ? _value.nome
          : nome // ignore: cast_nullable_to_non_nullable
              as String?,
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
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$ConjuntoModelImpl extends _ConjuntoModel {
  _$ConjuntoModelImpl(
      {required this.cod,
      required this.nome,
      required this.codInstituicao,
      required this.ativo,
      required this.ultimaAlteracao,
      @JsonKey(name: 'tStamp') required this.tstamp})
      : super._();

  factory _$ConjuntoModelImpl.fromJson(Map<String, dynamic> json) =>
      _$$ConjuntoModelImplFromJson(json);

  @override
  int? cod;
  @override
  String? nome;
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
  String toString() {
    return 'ConjuntoModel(cod: $cod, nome: $nome, codInstituicao: $codInstituicao, ativo: $ativo, ultimaAlteracao: $ultimaAlteracao, tstamp: $tstamp)';
  }

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$ConjuntoModelImplCopyWith<_$ConjuntoModelImpl> get copyWith =>
      __$$ConjuntoModelImplCopyWithImpl<_$ConjuntoModelImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$ConjuntoModelImplToJson(
      this,
    );
  }
}

abstract class _ConjuntoModel extends ConjuntoModel {
  factory _ConjuntoModel(
      {required int? cod,
      required String? nome,
      required int? codInstituicao,
      required bool? ativo,
      required DateTime? ultimaAlteracao,
      @JsonKey(name: 'tStamp') required String? tstamp}) = _$ConjuntoModelImpl;
  _ConjuntoModel._() : super._();

  factory _ConjuntoModel.fromJson(Map<String, dynamic> json) =
      _$ConjuntoModelImpl.fromJson;

  @override
  int? get cod;
  set cod(int? value);
  @override
  String? get nome;
  set nome(String? value);
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
  @JsonKey(ignore: true)
  _$$ConjuntoModelImplCopyWith<_$ConjuntoModelImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
