// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'consulta_processos_leitura_local_model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

ConsultaProcessosLeituraLocalModel _$ConsultaProcessosLeituraLocalModelFromJson(
    Map<String, dynamic> json) {
  return _ConsultaProcessosLeituraLocalModel.fromJson(json);
}

/// @nodoc
mixin _$ConsultaProcessosLeituraLocalModel {
  int get cod => throw _privateConstructorUsedError;
  set cod(int value) => throw _privateConstructorUsedError;
  String get nome => throw _privateConstructorUsedError;
  set nome(String value) => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $ConsultaProcessosLeituraLocalModelCopyWith<
          ConsultaProcessosLeituraLocalModel>
      get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $ConsultaProcessosLeituraLocalModelCopyWith<$Res> {
  factory $ConsultaProcessosLeituraLocalModelCopyWith(
          ConsultaProcessosLeituraLocalModel value,
          $Res Function(ConsultaProcessosLeituraLocalModel) then) =
      _$ConsultaProcessosLeituraLocalModelCopyWithImpl<$Res,
          ConsultaProcessosLeituraLocalModel>;
  @useResult
  $Res call({int cod, String nome});
}

/// @nodoc
class _$ConsultaProcessosLeituraLocalModelCopyWithImpl<$Res,
        $Val extends ConsultaProcessosLeituraLocalModel>
    implements $ConsultaProcessosLeituraLocalModelCopyWith<$Res> {
  _$ConsultaProcessosLeituraLocalModelCopyWithImpl(this._value, this._then);

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
abstract class _$$ConsultaProcessosLeituraLocalModelImplCopyWith<$Res>
    implements $ConsultaProcessosLeituraLocalModelCopyWith<$Res> {
  factory _$$ConsultaProcessosLeituraLocalModelImplCopyWith(
          _$ConsultaProcessosLeituraLocalModelImpl value,
          $Res Function(_$ConsultaProcessosLeituraLocalModelImpl) then) =
      __$$ConsultaProcessosLeituraLocalModelImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({int cod, String nome});
}

/// @nodoc
class __$$ConsultaProcessosLeituraLocalModelImplCopyWithImpl<$Res>
    extends _$ConsultaProcessosLeituraLocalModelCopyWithImpl<$Res,
        _$ConsultaProcessosLeituraLocalModelImpl>
    implements _$$ConsultaProcessosLeituraLocalModelImplCopyWith<$Res> {
  __$$ConsultaProcessosLeituraLocalModelImplCopyWithImpl(
      _$ConsultaProcessosLeituraLocalModelImpl _value,
      $Res Function(_$ConsultaProcessosLeituraLocalModelImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? cod = null,
    Object? nome = null,
  }) {
    return _then(_$ConsultaProcessosLeituraLocalModelImpl(
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
class _$ConsultaProcessosLeituraLocalModelImpl
    extends _ConsultaProcessosLeituraLocalModel {
  _$ConsultaProcessosLeituraLocalModelImpl(
      {required this.cod, required this.nome})
      : super._();

  factory _$ConsultaProcessosLeituraLocalModelImpl.fromJson(
          Map<String, dynamic> json) =>
      _$$ConsultaProcessosLeituraLocalModelImplFromJson(json);

  @override
  int cod;
  @override
  String nome;

  @override
  String toString() {
    return 'ConsultaProcessosLeituraLocalModel(cod: $cod, nome: $nome)';
  }

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$ConsultaProcessosLeituraLocalModelImplCopyWith<
          _$ConsultaProcessosLeituraLocalModelImpl>
      get copyWith => __$$ConsultaProcessosLeituraLocalModelImplCopyWithImpl<
          _$ConsultaProcessosLeituraLocalModelImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$ConsultaProcessosLeituraLocalModelImplToJson(
      this,
    );
  }
}

abstract class _ConsultaProcessosLeituraLocalModel
    extends ConsultaProcessosLeituraLocalModel {
  factory _ConsultaProcessosLeituraLocalModel(
      {required int cod,
      required String nome}) = _$ConsultaProcessosLeituraLocalModelImpl;
  _ConsultaProcessosLeituraLocalModel._() : super._();

  factory _ConsultaProcessosLeituraLocalModel.fromJson(
          Map<String, dynamic> json) =
      _$ConsultaProcessosLeituraLocalModelImpl.fromJson;

  @override
  int get cod;
  set cod(int value);
  @override
  String get nome;
  set nome(String value);
  @override
  @JsonKey(ignore: true)
  _$$ConsultaProcessosLeituraLocalModelImplCopyWith<
          _$ConsultaProcessosLeituraLocalModelImpl>
      get copyWith => throw _privateConstructorUsedError;
}
