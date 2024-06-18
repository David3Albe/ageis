// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'consulta_documento_model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

ConsultaDocumentoModel _$ConsultaDocumentoModelFromJson(
    Map<String, dynamic> json) {
  return _ConsultaDocumentoModel.fromJson(json);
}

/// @nodoc
mixin _$ConsultaDocumentoModel {
  int? get cod => throw _privateConstructorUsedError;
  set cod(int? value) => throw _privateConstructorUsedError;
  String? get nome => throw _privateConstructorUsedError;
  set nome(String? value) => throw _privateConstructorUsedError;
  DateTime? get validade => throw _privateConstructorUsedError;
  set validade(DateTime? value) => throw _privateConstructorUsedError;
  String? get tipoDocumento => throw _privateConstructorUsedError;
  set tipoDocumento(String? value) => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $ConsultaDocumentoModelCopyWith<ConsultaDocumentoModel> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $ConsultaDocumentoModelCopyWith<$Res> {
  factory $ConsultaDocumentoModelCopyWith(ConsultaDocumentoModel value,
          $Res Function(ConsultaDocumentoModel) then) =
      _$ConsultaDocumentoModelCopyWithImpl<$Res, ConsultaDocumentoModel>;
  @useResult
  $Res call(
      {int? cod, String? nome, DateTime? validade, String? tipoDocumento});
}

/// @nodoc
class _$ConsultaDocumentoModelCopyWithImpl<$Res,
        $Val extends ConsultaDocumentoModel>
    implements $ConsultaDocumentoModelCopyWith<$Res> {
  _$ConsultaDocumentoModelCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? cod = freezed,
    Object? nome = freezed,
    Object? validade = freezed,
    Object? tipoDocumento = freezed,
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
      validade: freezed == validade
          ? _value.validade
          : validade // ignore: cast_nullable_to_non_nullable
              as DateTime?,
      tipoDocumento: freezed == tipoDocumento
          ? _value.tipoDocumento
          : tipoDocumento // ignore: cast_nullable_to_non_nullable
              as String?,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$ConsultaDocumentoModelImplCopyWith<$Res>
    implements $ConsultaDocumentoModelCopyWith<$Res> {
  factory _$$ConsultaDocumentoModelImplCopyWith(
          _$ConsultaDocumentoModelImpl value,
          $Res Function(_$ConsultaDocumentoModelImpl) then) =
      __$$ConsultaDocumentoModelImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {int? cod, String? nome, DateTime? validade, String? tipoDocumento});
}

/// @nodoc
class __$$ConsultaDocumentoModelImplCopyWithImpl<$Res>
    extends _$ConsultaDocumentoModelCopyWithImpl<$Res,
        _$ConsultaDocumentoModelImpl>
    implements _$$ConsultaDocumentoModelImplCopyWith<$Res> {
  __$$ConsultaDocumentoModelImplCopyWithImpl(
      _$ConsultaDocumentoModelImpl _value,
      $Res Function(_$ConsultaDocumentoModelImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? cod = freezed,
    Object? nome = freezed,
    Object? validade = freezed,
    Object? tipoDocumento = freezed,
  }) {
    return _then(_$ConsultaDocumentoModelImpl(
      cod: freezed == cod
          ? _value.cod
          : cod // ignore: cast_nullable_to_non_nullable
              as int?,
      nome: freezed == nome
          ? _value.nome
          : nome // ignore: cast_nullable_to_non_nullable
              as String?,
      validade: freezed == validade
          ? _value.validade
          : validade // ignore: cast_nullable_to_non_nullable
              as DateTime?,
      tipoDocumento: freezed == tipoDocumento
          ? _value.tipoDocumento
          : tipoDocumento // ignore: cast_nullable_to_non_nullable
              as String?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$ConsultaDocumentoModelImpl extends _ConsultaDocumentoModel {
  _$ConsultaDocumentoModelImpl(
      {required this.cod,
      required this.nome,
      required this.validade,
      required this.tipoDocumento})
      : super._();

  factory _$ConsultaDocumentoModelImpl.fromJson(Map<String, dynamic> json) =>
      _$$ConsultaDocumentoModelImplFromJson(json);

  @override
  int? cod;
  @override
  String? nome;
  @override
  DateTime? validade;
  @override
  String? tipoDocumento;

  @override
  String toString() {
    return 'ConsultaDocumentoModel(cod: $cod, nome: $nome, validade: $validade, tipoDocumento: $tipoDocumento)';
  }

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$ConsultaDocumentoModelImplCopyWith<_$ConsultaDocumentoModelImpl>
      get copyWith => __$$ConsultaDocumentoModelImplCopyWithImpl<
          _$ConsultaDocumentoModelImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$ConsultaDocumentoModelImplToJson(
      this,
    );
  }
}

abstract class _ConsultaDocumentoModel extends ConsultaDocumentoModel {
  factory _ConsultaDocumentoModel(
      {required int? cod,
      required String? nome,
      required DateTime? validade,
      required String? tipoDocumento}) = _$ConsultaDocumentoModelImpl;
  _ConsultaDocumentoModel._() : super._();

  factory _ConsultaDocumentoModel.fromJson(Map<String, dynamic> json) =
      _$ConsultaDocumentoModelImpl.fromJson;

  @override
  int? get cod;
  set cod(int? value);
  @override
  String? get nome;
  set nome(String? value);
  @override
  DateTime? get validade;
  set validade(DateTime? value);
  @override
  String? get tipoDocumento;
  set tipoDocumento(String? value);
  @override
  @JsonKey(ignore: true)
  _$$ConsultaDocumentoModelImplCopyWith<_$ConsultaDocumentoModelImpl>
      get copyWith => throw _privateConstructorUsedError;
}
