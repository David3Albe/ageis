// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'consulta_processos_leitura_kit_model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

ConsultaProcessosLeituraKitModel _$ConsultaProcessosLeituraKitModelFromJson(
    Map<String, dynamic> json) {
  return _ConsultaProcessosLeituraKitModel.fromJson(json);
}

/// @nodoc
mixin _$ConsultaProcessosLeituraKitModel {
  int get cod => throw _privateConstructorUsedError;
  set cod(int value) => throw _privateConstructorUsedError;
  String get codBarra => throw _privateConstructorUsedError;
  set codBarra(String value) => throw _privateConstructorUsedError;
  String? get nome => throw _privateConstructorUsedError;
  set nome(String? value) => throw _privateConstructorUsedError;
  String? get restricao => throw _privateConstructorUsedError;
  set restricao(String? value) => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $ConsultaProcessosLeituraKitModelCopyWith<ConsultaProcessosLeituraKitModel>
      get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $ConsultaProcessosLeituraKitModelCopyWith<$Res> {
  factory $ConsultaProcessosLeituraKitModelCopyWith(
          ConsultaProcessosLeituraKitModel value,
          $Res Function(ConsultaProcessosLeituraKitModel) then) =
      _$ConsultaProcessosLeituraKitModelCopyWithImpl<$Res,
          ConsultaProcessosLeituraKitModel>;
  @useResult
  $Res call({int cod, String codBarra, String? nome, String? restricao});
}

/// @nodoc
class _$ConsultaProcessosLeituraKitModelCopyWithImpl<$Res,
        $Val extends ConsultaProcessosLeituraKitModel>
    implements $ConsultaProcessosLeituraKitModelCopyWith<$Res> {
  _$ConsultaProcessosLeituraKitModelCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? cod = null,
    Object? codBarra = null,
    Object? nome = freezed,
    Object? restricao = freezed,
  }) {
    return _then(_value.copyWith(
      cod: null == cod
          ? _value.cod
          : cod // ignore: cast_nullable_to_non_nullable
              as int,
      codBarra: null == codBarra
          ? _value.codBarra
          : codBarra // ignore: cast_nullable_to_non_nullable
              as String,
      nome: freezed == nome
          ? _value.nome
          : nome // ignore: cast_nullable_to_non_nullable
              as String?,
      restricao: freezed == restricao
          ? _value.restricao
          : restricao // ignore: cast_nullable_to_non_nullable
              as String?,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$ConsultaProcessosLeituraKitModelImplCopyWith<$Res>
    implements $ConsultaProcessosLeituraKitModelCopyWith<$Res> {
  factory _$$ConsultaProcessosLeituraKitModelImplCopyWith(
          _$ConsultaProcessosLeituraKitModelImpl value,
          $Res Function(_$ConsultaProcessosLeituraKitModelImpl) then) =
      __$$ConsultaProcessosLeituraKitModelImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({int cod, String codBarra, String? nome, String? restricao});
}

/// @nodoc
class __$$ConsultaProcessosLeituraKitModelImplCopyWithImpl<$Res>
    extends _$ConsultaProcessosLeituraKitModelCopyWithImpl<$Res,
        _$ConsultaProcessosLeituraKitModelImpl>
    implements _$$ConsultaProcessosLeituraKitModelImplCopyWith<$Res> {
  __$$ConsultaProcessosLeituraKitModelImplCopyWithImpl(
      _$ConsultaProcessosLeituraKitModelImpl _value,
      $Res Function(_$ConsultaProcessosLeituraKitModelImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? cod = null,
    Object? codBarra = null,
    Object? nome = freezed,
    Object? restricao = freezed,
  }) {
    return _then(_$ConsultaProcessosLeituraKitModelImpl(
      cod: null == cod
          ? _value.cod
          : cod // ignore: cast_nullable_to_non_nullable
              as int,
      codBarra: null == codBarra
          ? _value.codBarra
          : codBarra // ignore: cast_nullable_to_non_nullable
              as String,
      nome: freezed == nome
          ? _value.nome
          : nome // ignore: cast_nullable_to_non_nullable
              as String?,
      restricao: freezed == restricao
          ? _value.restricao
          : restricao // ignore: cast_nullable_to_non_nullable
              as String?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$ConsultaProcessosLeituraKitModelImpl
    extends _ConsultaProcessosLeituraKitModel {
  _$ConsultaProcessosLeituraKitModelImpl(
      {required this.cod, required this.codBarra, this.nome, this.restricao})
      : super._();

  factory _$ConsultaProcessosLeituraKitModelImpl.fromJson(
          Map<String, dynamic> json) =>
      _$$ConsultaProcessosLeituraKitModelImplFromJson(json);

  @override
  int cod;
  @override
  String codBarra;
  @override
  String? nome;
  @override
  String? restricao;

  @override
  String toString() {
    return 'ConsultaProcessosLeituraKitModel(cod: $cod, codBarra: $codBarra, nome: $nome, restricao: $restricao)';
  }

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$ConsultaProcessosLeituraKitModelImplCopyWith<
          _$ConsultaProcessosLeituraKitModelImpl>
      get copyWith => __$$ConsultaProcessosLeituraKitModelImplCopyWithImpl<
          _$ConsultaProcessosLeituraKitModelImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$ConsultaProcessosLeituraKitModelImplToJson(
      this,
    );
  }
}

abstract class _ConsultaProcessosLeituraKitModel
    extends ConsultaProcessosLeituraKitModel {
  factory _ConsultaProcessosLeituraKitModel(
      {required int cod,
      required String codBarra,
      String? nome,
      String? restricao}) = _$ConsultaProcessosLeituraKitModelImpl;
  _ConsultaProcessosLeituraKitModel._() : super._();

  factory _ConsultaProcessosLeituraKitModel.fromJson(
          Map<String, dynamic> json) =
      _$ConsultaProcessosLeituraKitModelImpl.fromJson;

  @override
  int get cod;
  set cod(int value);
  @override
  String get codBarra;
  set codBarra(String value);
  @override
  String? get nome;
  set nome(String? value);
  @override
  String? get restricao;
  set restricao(String? value);
  @override
  @JsonKey(ignore: true)
  _$$ConsultaProcessosLeituraKitModelImplCopyWith<
          _$ConsultaProcessosLeituraKitModelImpl>
      get copyWith => throw _privateConstructorUsedError;
}
