// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'sigla_query_one_dto.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

SiglaQueryOneDTO _$SiglaQueryOneDTOFromJson(Map<String, dynamic> json) {
  return _SiglaQueryOneDTO.fromJson(json);
}

/// @nodoc
mixin _$SiglaQueryOneDTO {
  int get cod => throw _privateConstructorUsedError;
  set cod(int value) => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $SiglaQueryOneDTOCopyWith<SiglaQueryOneDTO> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $SiglaQueryOneDTOCopyWith<$Res> {
  factory $SiglaQueryOneDTOCopyWith(
          SiglaQueryOneDTO value, $Res Function(SiglaQueryOneDTO) then) =
      _$SiglaQueryOneDTOCopyWithImpl<$Res, SiglaQueryOneDTO>;
  @useResult
  $Res call({int cod});
}

/// @nodoc
class _$SiglaQueryOneDTOCopyWithImpl<$Res, $Val extends SiglaQueryOneDTO>
    implements $SiglaQueryOneDTOCopyWith<$Res> {
  _$SiglaQueryOneDTOCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? cod = null,
  }) {
    return _then(_value.copyWith(
      cod: null == cod
          ? _value.cod
          : cod // ignore: cast_nullable_to_non_nullable
              as int,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$SiglaQueryOneDTOImplCopyWith<$Res>
    implements $SiglaQueryOneDTOCopyWith<$Res> {
  factory _$$SiglaQueryOneDTOImplCopyWith(_$SiglaQueryOneDTOImpl value,
          $Res Function(_$SiglaQueryOneDTOImpl) then) =
      __$$SiglaQueryOneDTOImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({int cod});
}

/// @nodoc
class __$$SiglaQueryOneDTOImplCopyWithImpl<$Res>
    extends _$SiglaQueryOneDTOCopyWithImpl<$Res, _$SiglaQueryOneDTOImpl>
    implements _$$SiglaQueryOneDTOImplCopyWith<$Res> {
  __$$SiglaQueryOneDTOImplCopyWithImpl(_$SiglaQueryOneDTOImpl _value,
      $Res Function(_$SiglaQueryOneDTOImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? cod = null,
  }) {
    return _then(_$SiglaQueryOneDTOImpl(
      cod: null == cod
          ? _value.cod
          : cod // ignore: cast_nullable_to_non_nullable
              as int,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$SiglaQueryOneDTOImpl implements _SiglaQueryOneDTO {
  _$SiglaQueryOneDTOImpl({required this.cod});

  factory _$SiglaQueryOneDTOImpl.fromJson(Map<String, dynamic> json) =>
      _$$SiglaQueryOneDTOImplFromJson(json);

  @override
  int cod;

  @override
  String toString() {
    return 'SiglaQueryOneDTO(cod: $cod)';
  }

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$SiglaQueryOneDTOImplCopyWith<_$SiglaQueryOneDTOImpl> get copyWith =>
      __$$SiglaQueryOneDTOImplCopyWithImpl<_$SiglaQueryOneDTOImpl>(
          this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$SiglaQueryOneDTOImplToJson(
      this,
    );
  }
}

abstract class _SiglaQueryOneDTO implements SiglaQueryOneDTO {
  factory _SiglaQueryOneDTO({required int cod}) = _$SiglaQueryOneDTOImpl;

  factory _SiglaQueryOneDTO.fromJson(Map<String, dynamic> json) =
      _$SiglaQueryOneDTOImpl.fromJson;

  @override
  int get cod;
  set cod(int value);
  @override
  @JsonKey(ignore: true)
  _$$SiglaQueryOneDTOImplCopyWith<_$SiglaQueryOneDTOImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
