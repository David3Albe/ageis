// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'consulta_processos_leitura_embalagem_model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

ConsultaProcessosLeituraEmbalagemModel
    _$ConsultaProcessosLeituraEmbalagemModelFromJson(
        Map<String, dynamic> json) {
  return _ConsultaProcessosLeituraEmbalagemModel.fromJson(json);
}

/// @nodoc
mixin _$ConsultaProcessosLeituraEmbalagemModel {
  int get cod => throw _privateConstructorUsedError;
  set cod(int value) => throw _privateConstructorUsedError;
  String get nome => throw _privateConstructorUsedError;
  set nome(String value) => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $ConsultaProcessosLeituraEmbalagemModelCopyWith<
          ConsultaProcessosLeituraEmbalagemModel>
      get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $ConsultaProcessosLeituraEmbalagemModelCopyWith<$Res> {
  factory $ConsultaProcessosLeituraEmbalagemModelCopyWith(
          ConsultaProcessosLeituraEmbalagemModel value,
          $Res Function(ConsultaProcessosLeituraEmbalagemModel) then) =
      _$ConsultaProcessosLeituraEmbalagemModelCopyWithImpl<$Res,
          ConsultaProcessosLeituraEmbalagemModel>;
  @useResult
  $Res call({int cod, String nome});
}

/// @nodoc
class _$ConsultaProcessosLeituraEmbalagemModelCopyWithImpl<$Res,
        $Val extends ConsultaProcessosLeituraEmbalagemModel>
    implements $ConsultaProcessosLeituraEmbalagemModelCopyWith<$Res> {
  _$ConsultaProcessosLeituraEmbalagemModelCopyWithImpl(this._value, this._then);

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
abstract class _$$ConsultaProcessosLeituraEmbalagemModelImplCopyWith<$Res>
    implements $ConsultaProcessosLeituraEmbalagemModelCopyWith<$Res> {
  factory _$$ConsultaProcessosLeituraEmbalagemModelImplCopyWith(
          _$ConsultaProcessosLeituraEmbalagemModelImpl value,
          $Res Function(_$ConsultaProcessosLeituraEmbalagemModelImpl) then) =
      __$$ConsultaProcessosLeituraEmbalagemModelImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({int cod, String nome});
}

/// @nodoc
class __$$ConsultaProcessosLeituraEmbalagemModelImplCopyWithImpl<$Res>
    extends _$ConsultaProcessosLeituraEmbalagemModelCopyWithImpl<$Res,
        _$ConsultaProcessosLeituraEmbalagemModelImpl>
    implements _$$ConsultaProcessosLeituraEmbalagemModelImplCopyWith<$Res> {
  __$$ConsultaProcessosLeituraEmbalagemModelImplCopyWithImpl(
      _$ConsultaProcessosLeituraEmbalagemModelImpl _value,
      $Res Function(_$ConsultaProcessosLeituraEmbalagemModelImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? cod = null,
    Object? nome = null,
  }) {
    return _then(_$ConsultaProcessosLeituraEmbalagemModelImpl(
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
class _$ConsultaProcessosLeituraEmbalagemModelImpl
    extends _ConsultaProcessosLeituraEmbalagemModel {
  _$ConsultaProcessosLeituraEmbalagemModelImpl(
      {required this.cod, required this.nome})
      : super._();

  factory _$ConsultaProcessosLeituraEmbalagemModelImpl.fromJson(
          Map<String, dynamic> json) =>
      _$$ConsultaProcessosLeituraEmbalagemModelImplFromJson(json);

  @override
  int cod;
  @override
  String nome;

  @override
  String toString() {
    return 'ConsultaProcessosLeituraEmbalagemModel(cod: $cod, nome: $nome)';
  }

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$ConsultaProcessosLeituraEmbalagemModelImplCopyWith<
          _$ConsultaProcessosLeituraEmbalagemModelImpl>
      get copyWith =>
          __$$ConsultaProcessosLeituraEmbalagemModelImplCopyWithImpl<
              _$ConsultaProcessosLeituraEmbalagemModelImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$ConsultaProcessosLeituraEmbalagemModelImplToJson(
      this,
    );
  }
}

abstract class _ConsultaProcessosLeituraEmbalagemModel
    extends ConsultaProcessosLeituraEmbalagemModel {
  factory _ConsultaProcessosLeituraEmbalagemModel(
      {required int cod,
      required String nome}) = _$ConsultaProcessosLeituraEmbalagemModelImpl;
  _ConsultaProcessosLeituraEmbalagemModel._() : super._();

  factory _ConsultaProcessosLeituraEmbalagemModel.fromJson(
          Map<String, dynamic> json) =
      _$ConsultaProcessosLeituraEmbalagemModelImpl.fromJson;

  @override
  int get cod;
  set cod(int value);
  @override
  String get nome;
  set nome(String value);
  @override
  @JsonKey(ignore: true)
  _$$ConsultaProcessosLeituraEmbalagemModelImplCopyWith<
          _$ConsultaProcessosLeituraEmbalagemModelImpl>
      get copyWith => throw _privateConstructorUsedError;
}
