// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'consulta_processos_leitura_motivo_model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

ConsultaProcessosLeituraMotivoModel
    _$ConsultaProcessosLeituraMotivoModelFromJson(Map<String, dynamic> json) {
  return _ConsultaProcessosLeituraMotivoModel.fromJson(json);
}

/// @nodoc
mixin _$ConsultaProcessosLeituraMotivoModel {
  int get cod => throw _privateConstructorUsedError;
  set cod(int value) => throw _privateConstructorUsedError;
  String get nome => throw _privateConstructorUsedError;
  set nome(String value) => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $ConsultaProcessosLeituraMotivoModelCopyWith<
          ConsultaProcessosLeituraMotivoModel>
      get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $ConsultaProcessosLeituraMotivoModelCopyWith<$Res> {
  factory $ConsultaProcessosLeituraMotivoModelCopyWith(
          ConsultaProcessosLeituraMotivoModel value,
          $Res Function(ConsultaProcessosLeituraMotivoModel) then) =
      _$ConsultaProcessosLeituraMotivoModelCopyWithImpl<$Res,
          ConsultaProcessosLeituraMotivoModel>;
  @useResult
  $Res call({int cod, String nome});
}

/// @nodoc
class _$ConsultaProcessosLeituraMotivoModelCopyWithImpl<$Res,
        $Val extends ConsultaProcessosLeituraMotivoModel>
    implements $ConsultaProcessosLeituraMotivoModelCopyWith<$Res> {
  _$ConsultaProcessosLeituraMotivoModelCopyWithImpl(this._value, this._then);

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
abstract class _$$ConsultaProcessosLeituraMotivoModelImplCopyWith<$Res>
    implements $ConsultaProcessosLeituraMotivoModelCopyWith<$Res> {
  factory _$$ConsultaProcessosLeituraMotivoModelImplCopyWith(
          _$ConsultaProcessosLeituraMotivoModelImpl value,
          $Res Function(_$ConsultaProcessosLeituraMotivoModelImpl) then) =
      __$$ConsultaProcessosLeituraMotivoModelImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({int cod, String nome});
}

/// @nodoc
class __$$ConsultaProcessosLeituraMotivoModelImplCopyWithImpl<$Res>
    extends _$ConsultaProcessosLeituraMotivoModelCopyWithImpl<$Res,
        _$ConsultaProcessosLeituraMotivoModelImpl>
    implements _$$ConsultaProcessosLeituraMotivoModelImplCopyWith<$Res> {
  __$$ConsultaProcessosLeituraMotivoModelImplCopyWithImpl(
      _$ConsultaProcessosLeituraMotivoModelImpl _value,
      $Res Function(_$ConsultaProcessosLeituraMotivoModelImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? cod = null,
    Object? nome = null,
  }) {
    return _then(_$ConsultaProcessosLeituraMotivoModelImpl(
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
class _$ConsultaProcessosLeituraMotivoModelImpl
    extends _ConsultaProcessosLeituraMotivoModel {
  _$ConsultaProcessosLeituraMotivoModelImpl(
      {required this.cod, required this.nome})
      : super._();

  factory _$ConsultaProcessosLeituraMotivoModelImpl.fromJson(
          Map<String, dynamic> json) =>
      _$$ConsultaProcessosLeituraMotivoModelImplFromJson(json);

  @override
  int cod;
  @override
  String nome;

  @override
  String toString() {
    return 'ConsultaProcessosLeituraMotivoModel(cod: $cod, nome: $nome)';
  }

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$ConsultaProcessosLeituraMotivoModelImplCopyWith<
          _$ConsultaProcessosLeituraMotivoModelImpl>
      get copyWith => __$$ConsultaProcessosLeituraMotivoModelImplCopyWithImpl<
          _$ConsultaProcessosLeituraMotivoModelImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$ConsultaProcessosLeituraMotivoModelImplToJson(
      this,
    );
  }
}

abstract class _ConsultaProcessosLeituraMotivoModel
    extends ConsultaProcessosLeituraMotivoModel {
  factory _ConsultaProcessosLeituraMotivoModel(
      {required int cod,
      required String nome}) = _$ConsultaProcessosLeituraMotivoModelImpl;
  _ConsultaProcessosLeituraMotivoModel._() : super._();

  factory _ConsultaProcessosLeituraMotivoModel.fromJson(
          Map<String, dynamic> json) =
      _$ConsultaProcessosLeituraMotivoModelImpl.fromJson;

  @override
  int get cod;
  set cod(int value);
  @override
  String get nome;
  set nome(String value);
  @override
  @JsonKey(ignore: true)
  _$$ConsultaProcessosLeituraMotivoModelImplCopyWith<
          _$ConsultaProcessosLeituraMotivoModelImpl>
      get copyWith => throw _privateConstructorUsedError;
}
