// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'sigla_short_response_dto.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

SiglaShortResponseDTO _$SiglaShortResponseDTOFromJson(
    Map<String, dynamic> json) {
  return _SiglaShortResponseDTO.fromJson(json);
}

/// @nodoc
mixin _$SiglaShortResponseDTO {
  int get cod => throw _privateConstructorUsedError;
  set cod(int value) => throw _privateConstructorUsedError;
  String get descricao => throw _privateConstructorUsedError;
  set descricao(String value) => throw _privateConstructorUsedError;
  String get sigla => throw _privateConstructorUsedError;
  set sigla(String value) => throw _privateConstructorUsedError;
  int? get corRGB => throw _privateConstructorUsedError;
  set corRGB(int? value) => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $SiglaShortResponseDTOCopyWith<SiglaShortResponseDTO> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $SiglaShortResponseDTOCopyWith<$Res> {
  factory $SiglaShortResponseDTOCopyWith(SiglaShortResponseDTO value,
          $Res Function(SiglaShortResponseDTO) then) =
      _$SiglaShortResponseDTOCopyWithImpl<$Res, SiglaShortResponseDTO>;
  @useResult
  $Res call({int cod, String descricao, String sigla, int? corRGB});
}

/// @nodoc
class _$SiglaShortResponseDTOCopyWithImpl<$Res,
        $Val extends SiglaShortResponseDTO>
    implements $SiglaShortResponseDTOCopyWith<$Res> {
  _$SiglaShortResponseDTOCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? cod = null,
    Object? descricao = null,
    Object? sigla = null,
    Object? corRGB = freezed,
  }) {
    return _then(_value.copyWith(
      cod: null == cod
          ? _value.cod
          : cod // ignore: cast_nullable_to_non_nullable
              as int,
      descricao: null == descricao
          ? _value.descricao
          : descricao // ignore: cast_nullable_to_non_nullable
              as String,
      sigla: null == sigla
          ? _value.sigla
          : sigla // ignore: cast_nullable_to_non_nullable
              as String,
      corRGB: freezed == corRGB
          ? _value.corRGB
          : corRGB // ignore: cast_nullable_to_non_nullable
              as int?,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$SiglaShortResponseDTOImplCopyWith<$Res>
    implements $SiglaShortResponseDTOCopyWith<$Res> {
  factory _$$SiglaShortResponseDTOImplCopyWith(
          _$SiglaShortResponseDTOImpl value,
          $Res Function(_$SiglaShortResponseDTOImpl) then) =
      __$$SiglaShortResponseDTOImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({int cod, String descricao, String sigla, int? corRGB});
}

/// @nodoc
class __$$SiglaShortResponseDTOImplCopyWithImpl<$Res>
    extends _$SiglaShortResponseDTOCopyWithImpl<$Res,
        _$SiglaShortResponseDTOImpl>
    implements _$$SiglaShortResponseDTOImplCopyWith<$Res> {
  __$$SiglaShortResponseDTOImplCopyWithImpl(_$SiglaShortResponseDTOImpl _value,
      $Res Function(_$SiglaShortResponseDTOImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? cod = null,
    Object? descricao = null,
    Object? sigla = null,
    Object? corRGB = freezed,
  }) {
    return _then(_$SiglaShortResponseDTOImpl(
      cod: null == cod
          ? _value.cod
          : cod // ignore: cast_nullable_to_non_nullable
              as int,
      descricao: null == descricao
          ? _value.descricao
          : descricao // ignore: cast_nullable_to_non_nullable
              as String,
      sigla: null == sigla
          ? _value.sigla
          : sigla // ignore: cast_nullable_to_non_nullable
              as String,
      corRGB: freezed == corRGB
          ? _value.corRGB
          : corRGB // ignore: cast_nullable_to_non_nullable
              as int?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$SiglaShortResponseDTOImpl extends _SiglaShortResponseDTO {
  _$SiglaShortResponseDTOImpl(
      {required this.cod,
      required this.descricao,
      required this.sigla,
      this.corRGB})
      : super._();

  factory _$SiglaShortResponseDTOImpl.fromJson(Map<String, dynamic> json) =>
      _$$SiglaShortResponseDTOImplFromJson(json);

  @override
  int cod;
  @override
  String descricao;
  @override
  String sigla;
  @override
  int? corRGB;

  @override
  String toString() {
    return 'SiglaShortResponseDTO(cod: $cod, descricao: $descricao, sigla: $sigla, corRGB: $corRGB)';
  }

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$SiglaShortResponseDTOImplCopyWith<_$SiglaShortResponseDTOImpl>
      get copyWith => __$$SiglaShortResponseDTOImplCopyWithImpl<
          _$SiglaShortResponseDTOImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$SiglaShortResponseDTOImplToJson(
      this,
    );
  }
}

abstract class _SiglaShortResponseDTO extends SiglaShortResponseDTO {
  factory _SiglaShortResponseDTO(
      {required int cod,
      required String descricao,
      required String sigla,
      int? corRGB}) = _$SiglaShortResponseDTOImpl;
  _SiglaShortResponseDTO._() : super._();

  factory _SiglaShortResponseDTO.fromJson(Map<String, dynamic> json) =
      _$SiglaShortResponseDTOImpl.fromJson;

  @override
  int get cod;
  set cod(int value);
  @override
  String get descricao;
  set descricao(String value);
  @override
  String get sigla;
  set sigla(String value);
  @override
  int? get corRGB;
  set corRGB(int? value);
  @override
  @JsonKey(ignore: true)
  _$$SiglaShortResponseDTOImplCopyWith<_$SiglaShortResponseDTOImpl>
      get copyWith => throw _privateConstructorUsedError;
}
