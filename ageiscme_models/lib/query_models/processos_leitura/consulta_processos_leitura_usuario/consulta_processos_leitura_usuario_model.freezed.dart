// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'consulta_processos_leitura_usuario_model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

ConsultaProcessosLeituraUsuarioModel
    _$ConsultaProcessosLeituraUsuarioModelFromJson(Map<String, dynamic> json) {
  return _ConsultaProcessosLeituraUsuarioModel.fromJson(json);
}

/// @nodoc
mixin _$ConsultaProcessosLeituraUsuarioModel {
  int get cod => throw _privateConstructorUsedError;
  set cod(int value) => throw _privateConstructorUsedError;
  String get nome => throw _privateConstructorUsedError;
  set nome(String value) => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $ConsultaProcessosLeituraUsuarioModelCopyWith<
          ConsultaProcessosLeituraUsuarioModel>
      get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $ConsultaProcessosLeituraUsuarioModelCopyWith<$Res> {
  factory $ConsultaProcessosLeituraUsuarioModelCopyWith(
          ConsultaProcessosLeituraUsuarioModel value,
          $Res Function(ConsultaProcessosLeituraUsuarioModel) then) =
      _$ConsultaProcessosLeituraUsuarioModelCopyWithImpl<$Res,
          ConsultaProcessosLeituraUsuarioModel>;
  @useResult
  $Res call({int cod, String nome});
}

/// @nodoc
class _$ConsultaProcessosLeituraUsuarioModelCopyWithImpl<$Res,
        $Val extends ConsultaProcessosLeituraUsuarioModel>
    implements $ConsultaProcessosLeituraUsuarioModelCopyWith<$Res> {
  _$ConsultaProcessosLeituraUsuarioModelCopyWithImpl(this._value, this._then);

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
abstract class _$$ConsultaProcessosLeituraUsuarioModelImplCopyWith<$Res>
    implements $ConsultaProcessosLeituraUsuarioModelCopyWith<$Res> {
  factory _$$ConsultaProcessosLeituraUsuarioModelImplCopyWith(
          _$ConsultaProcessosLeituraUsuarioModelImpl value,
          $Res Function(_$ConsultaProcessosLeituraUsuarioModelImpl) then) =
      __$$ConsultaProcessosLeituraUsuarioModelImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({int cod, String nome});
}

/// @nodoc
class __$$ConsultaProcessosLeituraUsuarioModelImplCopyWithImpl<$Res>
    extends _$ConsultaProcessosLeituraUsuarioModelCopyWithImpl<$Res,
        _$ConsultaProcessosLeituraUsuarioModelImpl>
    implements _$$ConsultaProcessosLeituraUsuarioModelImplCopyWith<$Res> {
  __$$ConsultaProcessosLeituraUsuarioModelImplCopyWithImpl(
      _$ConsultaProcessosLeituraUsuarioModelImpl _value,
      $Res Function(_$ConsultaProcessosLeituraUsuarioModelImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? cod = null,
    Object? nome = null,
  }) {
    return _then(_$ConsultaProcessosLeituraUsuarioModelImpl(
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
class _$ConsultaProcessosLeituraUsuarioModelImpl
    extends _ConsultaProcessosLeituraUsuarioModel {
  _$ConsultaProcessosLeituraUsuarioModelImpl(
      {required this.cod, required this.nome})
      : super._();

  factory _$ConsultaProcessosLeituraUsuarioModelImpl.fromJson(
          Map<String, dynamic> json) =>
      _$$ConsultaProcessosLeituraUsuarioModelImplFromJson(json);

  @override
  int cod;
  @override
  String nome;

  @override
  String toString() {
    return 'ConsultaProcessosLeituraUsuarioModel(cod: $cod, nome: $nome)';
  }

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$ConsultaProcessosLeituraUsuarioModelImplCopyWith<
          _$ConsultaProcessosLeituraUsuarioModelImpl>
      get copyWith => __$$ConsultaProcessosLeituraUsuarioModelImplCopyWithImpl<
          _$ConsultaProcessosLeituraUsuarioModelImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$ConsultaProcessosLeituraUsuarioModelImplToJson(
      this,
    );
  }
}

abstract class _ConsultaProcessosLeituraUsuarioModel
    extends ConsultaProcessosLeituraUsuarioModel {
  factory _ConsultaProcessosLeituraUsuarioModel(
      {required int cod,
      required String nome}) = _$ConsultaProcessosLeituraUsuarioModelImpl;
  _ConsultaProcessosLeituraUsuarioModel._() : super._();

  factory _ConsultaProcessosLeituraUsuarioModel.fromJson(
          Map<String, dynamic> json) =
      _$ConsultaProcessosLeituraUsuarioModelImpl.fromJson;

  @override
  int get cod;
  set cod(int value);
  @override
  String get nome;
  set nome(String value);
  @override
  @JsonKey(ignore: true)
  _$$ConsultaProcessosLeituraUsuarioModelImplCopyWith<
          _$ConsultaProcessosLeituraUsuarioModelImpl>
      get copyWith => throw _privateConstructorUsedError;
}