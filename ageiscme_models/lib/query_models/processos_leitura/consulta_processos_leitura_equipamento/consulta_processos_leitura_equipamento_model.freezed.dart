// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'consulta_processos_leitura_equipamento_model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

ConsultaProcessosLeituraEquipamentoModel
    _$ConsultaProcessosLeituraEquipamentoModelFromJson(
        Map<String, dynamic> json) {
  return _ConsultaProcessosLeituraEquipamentoModel.fromJson(json);
}

/// @nodoc
mixin _$ConsultaProcessosLeituraEquipamentoModel {
  int get cod => throw _privateConstructorUsedError;
  set cod(int value) => throw _privateConstructorUsedError;
  String get nome => throw _privateConstructorUsedError;
  set nome(String value) => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $ConsultaProcessosLeituraEquipamentoModelCopyWith<
          ConsultaProcessosLeituraEquipamentoModel>
      get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $ConsultaProcessosLeituraEquipamentoModelCopyWith<$Res> {
  factory $ConsultaProcessosLeituraEquipamentoModelCopyWith(
          ConsultaProcessosLeituraEquipamentoModel value,
          $Res Function(ConsultaProcessosLeituraEquipamentoModel) then) =
      _$ConsultaProcessosLeituraEquipamentoModelCopyWithImpl<$Res,
          ConsultaProcessosLeituraEquipamentoModel>;
  @useResult
  $Res call({int cod, String nome});
}

/// @nodoc
class _$ConsultaProcessosLeituraEquipamentoModelCopyWithImpl<$Res,
        $Val extends ConsultaProcessosLeituraEquipamentoModel>
    implements $ConsultaProcessosLeituraEquipamentoModelCopyWith<$Res> {
  _$ConsultaProcessosLeituraEquipamentoModelCopyWithImpl(
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
abstract class _$$ConsultaProcessosLeituraEquipamentoModelImplCopyWith<$Res>
    implements $ConsultaProcessosLeituraEquipamentoModelCopyWith<$Res> {
  factory _$$ConsultaProcessosLeituraEquipamentoModelImplCopyWith(
          _$ConsultaProcessosLeituraEquipamentoModelImpl value,
          $Res Function(_$ConsultaProcessosLeituraEquipamentoModelImpl) then) =
      __$$ConsultaProcessosLeituraEquipamentoModelImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({int cod, String nome});
}

/// @nodoc
class __$$ConsultaProcessosLeituraEquipamentoModelImplCopyWithImpl<$Res>
    extends _$ConsultaProcessosLeituraEquipamentoModelCopyWithImpl<$Res,
        _$ConsultaProcessosLeituraEquipamentoModelImpl>
    implements _$$ConsultaProcessosLeituraEquipamentoModelImplCopyWith<$Res> {
  __$$ConsultaProcessosLeituraEquipamentoModelImplCopyWithImpl(
      _$ConsultaProcessosLeituraEquipamentoModelImpl _value,
      $Res Function(_$ConsultaProcessosLeituraEquipamentoModelImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? cod = null,
    Object? nome = null,
  }) {
    return _then(_$ConsultaProcessosLeituraEquipamentoModelImpl(
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
class _$ConsultaProcessosLeituraEquipamentoModelImpl
    extends _ConsultaProcessosLeituraEquipamentoModel {
  _$ConsultaProcessosLeituraEquipamentoModelImpl(
      {required this.cod, required this.nome})
      : super._();

  factory _$ConsultaProcessosLeituraEquipamentoModelImpl.fromJson(
          Map<String, dynamic> json) =>
      _$$ConsultaProcessosLeituraEquipamentoModelImplFromJson(json);

  @override
  int cod;
  @override
  String nome;

  @override
  String toString() {
    return 'ConsultaProcessosLeituraEquipamentoModel(cod: $cod, nome: $nome)';
  }

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$ConsultaProcessosLeituraEquipamentoModelImplCopyWith<
          _$ConsultaProcessosLeituraEquipamentoModelImpl>
      get copyWith =>
          __$$ConsultaProcessosLeituraEquipamentoModelImplCopyWithImpl<
              _$ConsultaProcessosLeituraEquipamentoModelImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$ConsultaProcessosLeituraEquipamentoModelImplToJson(
      this,
    );
  }
}

abstract class _ConsultaProcessosLeituraEquipamentoModel
    extends ConsultaProcessosLeituraEquipamentoModel {
  factory _ConsultaProcessosLeituraEquipamentoModel(
      {required int cod,
      required String nome}) = _$ConsultaProcessosLeituraEquipamentoModelImpl;
  _ConsultaProcessosLeituraEquipamentoModel._() : super._();

  factory _ConsultaProcessosLeituraEquipamentoModel.fromJson(
          Map<String, dynamic> json) =
      _$ConsultaProcessosLeituraEquipamentoModelImpl.fromJson;

  @override
  int get cod;
  set cod(int value);
  @override
  String get nome;
  set nome(String value);
  @override
  @JsonKey(ignore: true)
  _$$ConsultaProcessosLeituraEquipamentoModelImplCopyWith<
          _$ConsultaProcessosLeituraEquipamentoModelImpl>
      get copyWith => throw _privateConstructorUsedError;
}
