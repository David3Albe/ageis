// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'sigla_query_item_response_dto.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

SiglaQueryItemResponseDTO _$SiglaQueryItemResponseDTOFromJson(
    Map<String, dynamic> json) {
  return _SiglaQueryItemResponseDTO.fromJson(json);
}

/// @nodoc
mixin _$SiglaQueryItemResponseDTO {
  int get cod => throw _privateConstructorUsedError;
  set cod(int value) => throw _privateConstructorUsedError;
  String get sigla => throw _privateConstructorUsedError;
  set sigla(String value) => throw _privateConstructorUsedError;
  String get descricao => throw _privateConstructorUsedError;
  set descricao(String value) => throw _privateConstructorUsedError;
  bool get ativo => throw _privateConstructorUsedError;
  set ativo(bool value) => throw _privateConstructorUsedError;
  String get tstamp => throw _privateConstructorUsedError;
  set tstamp(String value) => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $SiglaQueryItemResponseDTOCopyWith<SiglaQueryItemResponseDTO> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $SiglaQueryItemResponseDTOCopyWith<$Res> {
  factory $SiglaQueryItemResponseDTOCopyWith(SiglaQueryItemResponseDTO value,
          $Res Function(SiglaQueryItemResponseDTO) then) =
      _$SiglaQueryItemResponseDTOCopyWithImpl<$Res, SiglaQueryItemResponseDTO>;
  @useResult
  $Res call(
      {int cod, String sigla, String descricao, bool ativo, String tstamp});
}

/// @nodoc
class _$SiglaQueryItemResponseDTOCopyWithImpl<$Res,
        $Val extends SiglaQueryItemResponseDTO>
    implements $SiglaQueryItemResponseDTOCopyWith<$Res> {
  _$SiglaQueryItemResponseDTOCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? cod = null,
    Object? sigla = null,
    Object? descricao = null,
    Object? ativo = null,
    Object? tstamp = null,
  }) {
    return _then(_value.copyWith(
      cod: null == cod
          ? _value.cod
          : cod // ignore: cast_nullable_to_non_nullable
              as int,
      sigla: null == sigla
          ? _value.sigla
          : sigla // ignore: cast_nullable_to_non_nullable
              as String,
      descricao: null == descricao
          ? _value.descricao
          : descricao // ignore: cast_nullable_to_non_nullable
              as String,
      ativo: null == ativo
          ? _value.ativo
          : ativo // ignore: cast_nullable_to_non_nullable
              as bool,
      tstamp: null == tstamp
          ? _value.tstamp
          : tstamp // ignore: cast_nullable_to_non_nullable
              as String,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$SiglaQueryItemResponseDTOImplCopyWith<$Res>
    implements $SiglaQueryItemResponseDTOCopyWith<$Res> {
  factory _$$SiglaQueryItemResponseDTOImplCopyWith(
          _$SiglaQueryItemResponseDTOImpl value,
          $Res Function(_$SiglaQueryItemResponseDTOImpl) then) =
      __$$SiglaQueryItemResponseDTOImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {int cod, String sigla, String descricao, bool ativo, String tstamp});
}

/// @nodoc
class __$$SiglaQueryItemResponseDTOImplCopyWithImpl<$Res>
    extends _$SiglaQueryItemResponseDTOCopyWithImpl<$Res,
        _$SiglaQueryItemResponseDTOImpl>
    implements _$$SiglaQueryItemResponseDTOImplCopyWith<$Res> {
  __$$SiglaQueryItemResponseDTOImplCopyWithImpl(
      _$SiglaQueryItemResponseDTOImpl _value,
      $Res Function(_$SiglaQueryItemResponseDTOImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? cod = null,
    Object? sigla = null,
    Object? descricao = null,
    Object? ativo = null,
    Object? tstamp = null,
  }) {
    return _then(_$SiglaQueryItemResponseDTOImpl(
      cod: null == cod
          ? _value.cod
          : cod // ignore: cast_nullable_to_non_nullable
              as int,
      sigla: null == sigla
          ? _value.sigla
          : sigla // ignore: cast_nullable_to_non_nullable
              as String,
      descricao: null == descricao
          ? _value.descricao
          : descricao // ignore: cast_nullable_to_non_nullable
              as String,
      ativo: null == ativo
          ? _value.ativo
          : ativo // ignore: cast_nullable_to_non_nullable
              as bool,
      tstamp: null == tstamp
          ? _value.tstamp
          : tstamp // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$SiglaQueryItemResponseDTOImpl implements _SiglaQueryItemResponseDTO {
  _$SiglaQueryItemResponseDTOImpl(
      {required this.cod,
      required this.sigla,
      required this.descricao,
      required this.ativo,
      required this.tstamp});

  factory _$SiglaQueryItemResponseDTOImpl.fromJson(Map<String, dynamic> json) =>
      _$$SiglaQueryItemResponseDTOImplFromJson(json);

  @override
  int cod;
  @override
  String sigla;
  @override
  String descricao;
  @override
  bool ativo;
  @override
  String tstamp;

  @override
  String toString() {
    return 'SiglaQueryItemResponseDTO(cod: $cod, sigla: $sigla, descricao: $descricao, ativo: $ativo, tstamp: $tstamp)';
  }

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$SiglaQueryItemResponseDTOImplCopyWith<_$SiglaQueryItemResponseDTOImpl>
      get copyWith => __$$SiglaQueryItemResponseDTOImplCopyWithImpl<
          _$SiglaQueryItemResponseDTOImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$SiglaQueryItemResponseDTOImplToJson(
      this,
    );
  }
}

abstract class _SiglaQueryItemResponseDTO implements SiglaQueryItemResponseDTO {
  factory _SiglaQueryItemResponseDTO(
      {required int cod,
      required String sigla,
      required String descricao,
      required bool ativo,
      required String tstamp}) = _$SiglaQueryItemResponseDTOImpl;

  factory _SiglaQueryItemResponseDTO.fromJson(Map<String, dynamic> json) =
      _$SiglaQueryItemResponseDTOImpl.fromJson;

  @override
  int get cod;
  set cod(int value);
  @override
  String get sigla;
  set sigla(String value);
  @override
  String get descricao;
  set descricao(String value);
  @override
  bool get ativo;
  set ativo(bool value);
  @override
  String get tstamp;
  set tstamp(String value);
  @override
  @JsonKey(ignore: true)
  _$$SiglaQueryItemResponseDTOImplCopyWith<_$SiglaQueryItemResponseDTOImpl>
      get copyWith => throw _privateConstructorUsedError;
}
