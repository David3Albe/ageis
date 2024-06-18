// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'consulta_processos_leitura_prioridade_model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

ConsultaProcessosLeituraPrioridadeModel
    _$ConsultaProcessosLeituraPrioridadeModelFromJson(
        Map<String, dynamic> json) {
  return _ConsultaProcessosLeituraPrioridadeModel.fromJson(json);
}

/// @nodoc
mixin _$ConsultaProcessosLeituraPrioridadeModel {
  int get cod => throw _privateConstructorUsedError;
  set cod(int value) => throw _privateConstructorUsedError;
  String get nome => throw _privateConstructorUsedError;
  set nome(String value) => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $ConsultaProcessosLeituraPrioridadeModelCopyWith<
          ConsultaProcessosLeituraPrioridadeModel>
      get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $ConsultaProcessosLeituraPrioridadeModelCopyWith<$Res> {
  factory $ConsultaProcessosLeituraPrioridadeModelCopyWith(
          ConsultaProcessosLeituraPrioridadeModel value,
          $Res Function(ConsultaProcessosLeituraPrioridadeModel) then) =
      _$ConsultaProcessosLeituraPrioridadeModelCopyWithImpl<$Res,
          ConsultaProcessosLeituraPrioridadeModel>;
  @useResult
  $Res call({int cod, String nome});
}

/// @nodoc
class _$ConsultaProcessosLeituraPrioridadeModelCopyWithImpl<$Res,
        $Val extends ConsultaProcessosLeituraPrioridadeModel>
    implements $ConsultaProcessosLeituraPrioridadeModelCopyWith<$Res> {
  _$ConsultaProcessosLeituraPrioridadeModelCopyWithImpl(
      this._value, this._then);

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
abstract class _$$ConsultaProcessosLeituraPrioridadeModelImplCopyWith<$Res>
    implements $ConsultaProcessosLeituraPrioridadeModelCopyWith<$Res> {
  factory _$$ConsultaProcessosLeituraPrioridadeModelImplCopyWith(
          _$ConsultaProcessosLeituraPrioridadeModelImpl value,
          $Res Function(_$ConsultaProcessosLeituraPrioridadeModelImpl) then) =
      __$$ConsultaProcessosLeituraPrioridadeModelImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({int cod, String nome});
}

/// @nodoc
class __$$ConsultaProcessosLeituraPrioridadeModelImplCopyWithImpl<$Res>
    extends _$ConsultaProcessosLeituraPrioridadeModelCopyWithImpl<$Res,
        _$ConsultaProcessosLeituraPrioridadeModelImpl>
    implements _$$ConsultaProcessosLeituraPrioridadeModelImplCopyWith<$Res> {
  __$$ConsultaProcessosLeituraPrioridadeModelImplCopyWithImpl(
      _$ConsultaProcessosLeituraPrioridadeModelImpl _value,
      $Res Function(_$ConsultaProcessosLeituraPrioridadeModelImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? cod = null,
    Object? nome = null,
  }) {
    return _then(_$ConsultaProcessosLeituraPrioridadeModelImpl(
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
class _$ConsultaProcessosLeituraPrioridadeModelImpl
    extends _ConsultaProcessosLeituraPrioridadeModel {
  _$ConsultaProcessosLeituraPrioridadeModelImpl(
      {required this.cod, required this.nome})
      : super._();

  factory _$ConsultaProcessosLeituraPrioridadeModelImpl.fromJson(
          Map<String, dynamic> json) =>
      _$$ConsultaProcessosLeituraPrioridadeModelImplFromJson(json);

  @override
  int cod;
  @override
  String nome;

  @override
  String toString() {
    return 'ConsultaProcessosLeituraPrioridadeModel(cod: $cod, nome: $nome)';
  }

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$ConsultaProcessosLeituraPrioridadeModelImplCopyWith<
          _$ConsultaProcessosLeituraPrioridadeModelImpl>
      get copyWith =>
          __$$ConsultaProcessosLeituraPrioridadeModelImplCopyWithImpl<
              _$ConsultaProcessosLeituraPrioridadeModelImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$ConsultaProcessosLeituraPrioridadeModelImplToJson(
      this,
    );
  }
}

abstract class _ConsultaProcessosLeituraPrioridadeModel
    extends ConsultaProcessosLeituraPrioridadeModel {
  factory _ConsultaProcessosLeituraPrioridadeModel(
      {required int cod,
      required String nome}) = _$ConsultaProcessosLeituraPrioridadeModelImpl;
  _ConsultaProcessosLeituraPrioridadeModel._() : super._();

  factory _ConsultaProcessosLeituraPrioridadeModel.fromJson(
          Map<String, dynamic> json) =
      _$ConsultaProcessosLeituraPrioridadeModelImpl.fromJson;

  @override
  int get cod;
  set cod(int value);
  @override
  String get nome;
  set nome(String value);
  @override
  @JsonKey(ignore: true)
  _$$ConsultaProcessosLeituraPrioridadeModelImplCopyWith<
          _$ConsultaProcessosLeituraPrioridadeModelImpl>
      get copyWith => throw _privateConstructorUsedError;
}
