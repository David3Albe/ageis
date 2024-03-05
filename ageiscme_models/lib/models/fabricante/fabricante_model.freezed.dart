// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'fabricante_model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

FabricanteModel _$FabricanteModelFromJson(Map<String, dynamic> json) {
  return _FabricanteModel.fromJson(json);
}

/// @nodoc
mixin _$FabricanteModel {
  int? get cod => throw _privateConstructorUsedError;
  set cod(int? value) => throw _privateConstructorUsedError;
  String? get nome => throw _privateConstructorUsedError;
  set nome(String? value) => throw _privateConstructorUsedError;
  int? get codInstituicao => throw _privateConstructorUsedError;
  set codInstituicao(int? value) => throw _privateConstructorUsedError;
  DateTime? get ultimaAlteracao => throw _privateConstructorUsedError;
  set ultimaAlteracao(DateTime? value) => throw _privateConstructorUsedError;
  @JsonKey(name: 'tStamp')
  String? get tstamp => throw _privateConstructorUsedError;
  @JsonKey(name: 'tStamp')
  set tstamp(String? value) => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $FabricanteModelCopyWith<FabricanteModel> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $FabricanteModelCopyWith<$Res> {
  factory $FabricanteModelCopyWith(
          FabricanteModel value, $Res Function(FabricanteModel) then) =
      _$FabricanteModelCopyWithImpl<$Res, FabricanteModel>;
  @useResult
  $Res call(
      {int? cod,
      String? nome,
      int? codInstituicao,
      DateTime? ultimaAlteracao,
      @JsonKey(name: 'tStamp') String? tstamp});
}

/// @nodoc
class _$FabricanteModelCopyWithImpl<$Res, $Val extends FabricanteModel>
    implements $FabricanteModelCopyWith<$Res> {
  _$FabricanteModelCopyWithImpl(this._value, this._then);

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
abstract class _$$FabricanteModelImplCopyWith<$Res>
    implements $FabricanteModelCopyWith<$Res> {
  factory _$$FabricanteModelImplCopyWith(_$FabricanteModelImpl value,
          $Res Function(_$FabricanteModelImpl) then) =
      __$$FabricanteModelImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {int? cod,
      String? nome,
      int? codInstituicao,
      DateTime? ultimaAlteracao,
      @JsonKey(name: 'tStamp') String? tstamp});
}

/// @nodoc
class __$$FabricanteModelImplCopyWithImpl<$Res>
    extends _$FabricanteModelCopyWithImpl<$Res, _$FabricanteModelImpl>
    implements _$$FabricanteModelImplCopyWith<$Res> {
  __$$FabricanteModelImplCopyWithImpl(
      _$FabricanteModelImpl _value, $Res Function(_$FabricanteModelImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? cod = freezed,
    Object? nome = freezed,
    Object? codInstituicao = freezed,
    Object? ultimaAlteracao = freezed,
    Object? tstamp = freezed,
  }) {
    return _then(_$FabricanteModelImpl(
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
class _$FabricanteModelImpl extends _FabricanteModel
    with DiagnosticableTreeMixin {
  _$FabricanteModelImpl(
      {required this.cod,
      required this.nome,
      required this.codInstituicao,
      required this.ultimaAlteracao,
      @JsonKey(name: 'tStamp') required this.tstamp})
      : super._();

  factory _$FabricanteModelImpl.fromJson(Map<String, dynamic> json) =>
      _$$FabricanteModelImplFromJson(json);

  @override
  int? cod;
  @override
  String? nome;
  @override
  int? codInstituicao;
  @override
  DateTime? ultimaAlteracao;
  @override
  @JsonKey(name: 'tStamp')
  String? tstamp;

  @override
  String toString({DiagnosticLevel minLevel = DiagnosticLevel.info}) {
    return 'FabricanteModel(cod: $cod, nome: $nome, codInstituicao: $codInstituicao, ultimaAlteracao: $ultimaAlteracao, tstamp: $tstamp)';
  }

  @override
  void debugFillProperties(DiagnosticPropertiesBuilder properties) {
    super.debugFillProperties(properties);
    properties
      ..add(DiagnosticsProperty('type', 'FabricanteModel'))
      ..add(DiagnosticsProperty('cod', cod))
      ..add(DiagnosticsProperty('nome', nome))
      ..add(DiagnosticsProperty('codInstituicao', codInstituicao))
      ..add(DiagnosticsProperty('ultimaAlteracao', ultimaAlteracao))
      ..add(DiagnosticsProperty('tstamp', tstamp));
  }

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$FabricanteModelImplCopyWith<_$FabricanteModelImpl> get copyWith =>
      __$$FabricanteModelImplCopyWithImpl<_$FabricanteModelImpl>(
          this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$FabricanteModelImplToJson(
      this,
    );
  }
}

abstract class _FabricanteModel extends FabricanteModel {
  factory _FabricanteModel(
          {required int? cod,
          required String? nome,
          required int? codInstituicao,
          required DateTime? ultimaAlteracao,
          @JsonKey(name: 'tStamp') required String? tstamp}) =
      _$FabricanteModelImpl;
  _FabricanteModel._() : super._();

  factory _FabricanteModel.fromJson(Map<String, dynamic> json) =
      _$FabricanteModelImpl.fromJson;

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
  DateTime? get ultimaAlteracao;
  set ultimaAlteracao(DateTime? value);
  @override
  @JsonKey(name: 'tStamp')
  String? get tstamp;
  @JsonKey(name: 'tStamp')
  set tstamp(String? value);
  @override
  @JsonKey(ignore: true)
  _$$FabricanteModelImplCopyWith<_$FabricanteModelImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
