// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'sigla_remove_dto.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

SiglaRemoveDTO _$SiglaRemoveDTOFromJson(Map<String, dynamic> json) {
  return _SiglaRemoveDTO.fromJson(json);
}

/// @nodoc
mixin _$SiglaRemoveDTO {
  int get cod => throw _privateConstructorUsedError;
  set cod(int value) => throw _privateConstructorUsedError;
  String get tstamp => throw _privateConstructorUsedError;
  set tstamp(String value) => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $SiglaRemoveDTOCopyWith<SiglaRemoveDTO> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $SiglaRemoveDTOCopyWith<$Res> {
  factory $SiglaRemoveDTOCopyWith(
          SiglaRemoveDTO value, $Res Function(SiglaRemoveDTO) then) =
      _$SiglaRemoveDTOCopyWithImpl<$Res, SiglaRemoveDTO>;
  @useResult
  $Res call({int cod, String tstamp});
}

/// @nodoc
class _$SiglaRemoveDTOCopyWithImpl<$Res, $Val extends SiglaRemoveDTO>
    implements $SiglaRemoveDTOCopyWith<$Res> {
  _$SiglaRemoveDTOCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? cod = null,
    Object? tstamp = null,
  }) {
    return _then(_value.copyWith(
      cod: null == cod
          ? _value.cod
          : cod // ignore: cast_nullable_to_non_nullable
              as int,
      tstamp: null == tstamp
          ? _value.tstamp
          : tstamp // ignore: cast_nullable_to_non_nullable
              as String,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$SiglaRemoveDTOImplCopyWith<$Res>
    implements $SiglaRemoveDTOCopyWith<$Res> {
  factory _$$SiglaRemoveDTOImplCopyWith(_$SiglaRemoveDTOImpl value,
          $Res Function(_$SiglaRemoveDTOImpl) then) =
      __$$SiglaRemoveDTOImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({int cod, String tstamp});
}

/// @nodoc
class __$$SiglaRemoveDTOImplCopyWithImpl<$Res>
    extends _$SiglaRemoveDTOCopyWithImpl<$Res, _$SiglaRemoveDTOImpl>
    implements _$$SiglaRemoveDTOImplCopyWith<$Res> {
  __$$SiglaRemoveDTOImplCopyWithImpl(
      _$SiglaRemoveDTOImpl _value, $Res Function(_$SiglaRemoveDTOImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? cod = null,
    Object? tstamp = null,
  }) {
    return _then(_$SiglaRemoveDTOImpl(
      cod: null == cod
          ? _value.cod
          : cod // ignore: cast_nullable_to_non_nullable
              as int,
      tstamp: null == tstamp
          ? _value.tstamp
          : tstamp // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$SiglaRemoveDTOImpl implements _SiglaRemoveDTO {
  _$SiglaRemoveDTOImpl({required this.cod, required this.tstamp});

  factory _$SiglaRemoveDTOImpl.fromJson(Map<String, dynamic> json) =>
      _$$SiglaRemoveDTOImplFromJson(json);

  @override
  int cod;
  @override
  String tstamp;

  @override
  String toString() {
    return 'SiglaRemoveDTO(cod: $cod, tstamp: $tstamp)';
  }

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$SiglaRemoveDTOImplCopyWith<_$SiglaRemoveDTOImpl> get copyWith =>
      __$$SiglaRemoveDTOImplCopyWithImpl<_$SiglaRemoveDTOImpl>(
          this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$SiglaRemoveDTOImplToJson(
      this,
    );
  }
}

abstract class _SiglaRemoveDTO implements SiglaRemoveDTO {
  factory _SiglaRemoveDTO({required int cod, required String tstamp}) =
      _$SiglaRemoveDTOImpl;

  factory _SiglaRemoveDTO.fromJson(Map<String, dynamic> json) =
      _$SiglaRemoveDTOImpl.fromJson;

  @override
  int get cod;
  set cod(int value);
  @override
  String get tstamp;
  set tstamp(String value);
  @override
  @JsonKey(ignore: true)
  _$$SiglaRemoveDTOImplCopyWith<_$SiglaRemoveDTOImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
