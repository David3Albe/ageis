// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'consulta_processos_leitura_tipo_processo_model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

ConsultaProcessosLeituraTipoProcessoModel
    _$ConsultaProcessosLeituraTipoProcessoModelFromJson(
        Map<String, dynamic> json) {
  return _ConsultaProcessosLeituraTipoProcessoModel.fromJson(json);
}

/// @nodoc
mixin _$ConsultaProcessosLeituraTipoProcessoModel {
  int get cod => throw _privateConstructorUsedError;
  set cod(int value) => throw _privateConstructorUsedError;
  String get nome => throw _privateConstructorUsedError;
  set nome(String value) => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $ConsultaProcessosLeituraTipoProcessoModelCopyWith<
          ConsultaProcessosLeituraTipoProcessoModel>
      get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $ConsultaProcessosLeituraTipoProcessoModelCopyWith<$Res> {
  factory $ConsultaProcessosLeituraTipoProcessoModelCopyWith(
          ConsultaProcessosLeituraTipoProcessoModel value,
          $Res Function(ConsultaProcessosLeituraTipoProcessoModel) then) =
      _$ConsultaProcessosLeituraTipoProcessoModelCopyWithImpl<$Res,
          ConsultaProcessosLeituraTipoProcessoModel>;
  @useResult
  $Res call({int cod, String nome});
}

/// @nodoc
class _$ConsultaProcessosLeituraTipoProcessoModelCopyWithImpl<$Res,
        $Val extends ConsultaProcessosLeituraTipoProcessoModel>
    implements $ConsultaProcessosLeituraTipoProcessoModelCopyWith<$Res> {
  _$ConsultaProcessosLeituraTipoProcessoModelCopyWithImpl(
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
abstract class _$$ConsultaProcessosLeituraTipoProcessoModelImplCopyWith<$Res>
    implements $ConsultaProcessosLeituraTipoProcessoModelCopyWith<$Res> {
  factory _$$ConsultaProcessosLeituraTipoProcessoModelImplCopyWith(
          _$ConsultaProcessosLeituraTipoProcessoModelImpl value,
          $Res Function(_$ConsultaProcessosLeituraTipoProcessoModelImpl) then) =
      __$$ConsultaProcessosLeituraTipoProcessoModelImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({int cod, String nome});
}

/// @nodoc
class __$$ConsultaProcessosLeituraTipoProcessoModelImplCopyWithImpl<$Res>
    extends _$ConsultaProcessosLeituraTipoProcessoModelCopyWithImpl<$Res,
        _$ConsultaProcessosLeituraTipoProcessoModelImpl>
    implements _$$ConsultaProcessosLeituraTipoProcessoModelImplCopyWith<$Res> {
  __$$ConsultaProcessosLeituraTipoProcessoModelImplCopyWithImpl(
      _$ConsultaProcessosLeituraTipoProcessoModelImpl _value,
      $Res Function(_$ConsultaProcessosLeituraTipoProcessoModelImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? cod = null,
    Object? nome = null,
  }) {
    return _then(_$ConsultaProcessosLeituraTipoProcessoModelImpl(
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
class _$ConsultaProcessosLeituraTipoProcessoModelImpl
    extends _ConsultaProcessosLeituraTipoProcessoModel {
  _$ConsultaProcessosLeituraTipoProcessoModelImpl(
      {required this.cod, required this.nome})
      : super._();

  factory _$ConsultaProcessosLeituraTipoProcessoModelImpl.fromJson(
          Map<String, dynamic> json) =>
      _$$ConsultaProcessosLeituraTipoProcessoModelImplFromJson(json);

  @override
  int cod;
  @override
  String nome;

  @override
  String toString() {
    return 'ConsultaProcessosLeituraTipoProcessoModel(cod: $cod, nome: $nome)';
  }

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$ConsultaProcessosLeituraTipoProcessoModelImplCopyWith<
          _$ConsultaProcessosLeituraTipoProcessoModelImpl>
      get copyWith =>
          __$$ConsultaProcessosLeituraTipoProcessoModelImplCopyWithImpl<
                  _$ConsultaProcessosLeituraTipoProcessoModelImpl>(
              this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$ConsultaProcessosLeituraTipoProcessoModelImplToJson(
      this,
    );
  }
}

abstract class _ConsultaProcessosLeituraTipoProcessoModel
    extends ConsultaProcessosLeituraTipoProcessoModel {
  factory _ConsultaProcessosLeituraTipoProcessoModel(
      {required int cod,
      required String nome}) = _$ConsultaProcessosLeituraTipoProcessoModelImpl;
  _ConsultaProcessosLeituraTipoProcessoModel._() : super._();

  factory _ConsultaProcessosLeituraTipoProcessoModel.fromJson(
          Map<String, dynamic> json) =
      _$ConsultaProcessosLeituraTipoProcessoModelImpl.fromJson;

  @override
  int get cod;
  set cod(int value);
  @override
  String get nome;
  set nome(String value);
  @override
  @JsonKey(ignore: true)
  _$$ConsultaProcessosLeituraTipoProcessoModelImplCopyWith<
          _$ConsultaProcessosLeituraTipoProcessoModelImpl>
      get copyWith => throw _privateConstructorUsedError;
}
