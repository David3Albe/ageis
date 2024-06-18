// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'registros_expirar_remover_registro_dto.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

RegistrosExpirarRemoverRegistroDTO _$RegistrosExpirarRemoverRegistroDTOFromJson(
    Map<String, dynamic> json) {
  return _RegistrosExpirarRemoverRegistroDTO.fromJson(json);
}

/// @nodoc
mixin _$RegistrosExpirarRemoverRegistroDTO {
  int get codTabela => throw _privateConstructorUsedError;
  set codTabela(int value) => throw _privateConstructorUsedError;
  String get nomeTabela => throw _privateConstructorUsedError;
  set nomeTabela(String value) => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $RegistrosExpirarRemoverRegistroDTOCopyWith<
          RegistrosExpirarRemoverRegistroDTO>
      get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $RegistrosExpirarRemoverRegistroDTOCopyWith<$Res> {
  factory $RegistrosExpirarRemoverRegistroDTOCopyWith(
          RegistrosExpirarRemoverRegistroDTO value,
          $Res Function(RegistrosExpirarRemoverRegistroDTO) then) =
      _$RegistrosExpirarRemoverRegistroDTOCopyWithImpl<$Res,
          RegistrosExpirarRemoverRegistroDTO>;
  @useResult
  $Res call({int codTabela, String nomeTabela});
}

/// @nodoc
class _$RegistrosExpirarRemoverRegistroDTOCopyWithImpl<$Res,
        $Val extends RegistrosExpirarRemoverRegistroDTO>
    implements $RegistrosExpirarRemoverRegistroDTOCopyWith<$Res> {
  _$RegistrosExpirarRemoverRegistroDTOCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? codTabela = null,
    Object? nomeTabela = null,
  }) {
    return _then(_value.copyWith(
      codTabela: null == codTabela
          ? _value.codTabela
          : codTabela // ignore: cast_nullable_to_non_nullable
              as int,
      nomeTabela: null == nomeTabela
          ? _value.nomeTabela
          : nomeTabela // ignore: cast_nullable_to_non_nullable
              as String,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$RegistrosExpirarRemoverRegistroDTOImplCopyWith<$Res>
    implements $RegistrosExpirarRemoverRegistroDTOCopyWith<$Res> {
  factory _$$RegistrosExpirarRemoverRegistroDTOImplCopyWith(
          _$RegistrosExpirarRemoverRegistroDTOImpl value,
          $Res Function(_$RegistrosExpirarRemoverRegistroDTOImpl) then) =
      __$$RegistrosExpirarRemoverRegistroDTOImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({int codTabela, String nomeTabela});
}

/// @nodoc
class __$$RegistrosExpirarRemoverRegistroDTOImplCopyWithImpl<$Res>
    extends _$RegistrosExpirarRemoverRegistroDTOCopyWithImpl<$Res,
        _$RegistrosExpirarRemoverRegistroDTOImpl>
    implements _$$RegistrosExpirarRemoverRegistroDTOImplCopyWith<$Res> {
  __$$RegistrosExpirarRemoverRegistroDTOImplCopyWithImpl(
      _$RegistrosExpirarRemoverRegistroDTOImpl _value,
      $Res Function(_$RegistrosExpirarRemoverRegistroDTOImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? codTabela = null,
    Object? nomeTabela = null,
  }) {
    return _then(_$RegistrosExpirarRemoverRegistroDTOImpl(
      codTabela: null == codTabela
          ? _value.codTabela
          : codTabela // ignore: cast_nullable_to_non_nullable
              as int,
      nomeTabela: null == nomeTabela
          ? _value.nomeTabela
          : nomeTabela // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$RegistrosExpirarRemoverRegistroDTOImpl
    implements _RegistrosExpirarRemoverRegistroDTO {
  _$RegistrosExpirarRemoverRegistroDTOImpl(
      {required this.codTabela, required this.nomeTabela});

  factory _$RegistrosExpirarRemoverRegistroDTOImpl.fromJson(
          Map<String, dynamic> json) =>
      _$$RegistrosExpirarRemoverRegistroDTOImplFromJson(json);

  @override
  int codTabela;
  @override
  String nomeTabela;

  @override
  String toString() {
    return 'RegistrosExpirarRemoverRegistroDTO(codTabela: $codTabela, nomeTabela: $nomeTabela)';
  }

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$RegistrosExpirarRemoverRegistroDTOImplCopyWith<
          _$RegistrosExpirarRemoverRegistroDTOImpl>
      get copyWith => __$$RegistrosExpirarRemoverRegistroDTOImplCopyWithImpl<
          _$RegistrosExpirarRemoverRegistroDTOImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$RegistrosExpirarRemoverRegistroDTOImplToJson(
      this,
    );
  }
}

abstract class _RegistrosExpirarRemoverRegistroDTO
    implements RegistrosExpirarRemoverRegistroDTO {
  factory _RegistrosExpirarRemoverRegistroDTO(
      {required int codTabela,
      required String nomeTabela}) = _$RegistrosExpirarRemoverRegistroDTOImpl;

  factory _RegistrosExpirarRemoverRegistroDTO.fromJson(
          Map<String, dynamic> json) =
      _$RegistrosExpirarRemoverRegistroDTOImpl.fromJson;

  @override
  int get codTabela;
  set codTabela(int value);
  @override
  String get nomeTabela;
  set nomeTabela(String value);
  @override
  @JsonKey(ignore: true)
  _$$RegistrosExpirarRemoverRegistroDTOImplCopyWith<
          _$RegistrosExpirarRemoverRegistroDTOImpl>
      get copyWith => throw _privateConstructorUsedError;
}
