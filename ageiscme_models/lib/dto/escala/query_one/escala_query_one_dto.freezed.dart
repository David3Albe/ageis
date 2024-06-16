// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'escala_query_one_dto.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

EscalaQueryOneDTO _$EscalaQueryOneDTOFromJson(Map<String, dynamic> json) {
  return _EscalaQueryOneDTO.fromJson(json);
}

/// @nodoc
mixin _$EscalaQueryOneDTO {
  DateTime get anoMes => throw _privateConstructorUsedError;
  set anoMes(DateTime value) => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $EscalaQueryOneDTOCopyWith<EscalaQueryOneDTO> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $EscalaQueryOneDTOCopyWith<$Res> {
  factory $EscalaQueryOneDTOCopyWith(
          EscalaQueryOneDTO value, $Res Function(EscalaQueryOneDTO) then) =
      _$EscalaQueryOneDTOCopyWithImpl<$Res, EscalaQueryOneDTO>;
  @useResult
  $Res call({DateTime anoMes});
}

/// @nodoc
class _$EscalaQueryOneDTOCopyWithImpl<$Res, $Val extends EscalaQueryOneDTO>
    implements $EscalaQueryOneDTOCopyWith<$Res> {
  _$EscalaQueryOneDTOCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? anoMes = null,
  }) {
    return _then(_value.copyWith(
      anoMes: null == anoMes
          ? _value.anoMes
          : anoMes // ignore: cast_nullable_to_non_nullable
              as DateTime,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$EscalaQueryOneDTOImplCopyWith<$Res>
    implements $EscalaQueryOneDTOCopyWith<$Res> {
  factory _$$EscalaQueryOneDTOImplCopyWith(_$EscalaQueryOneDTOImpl value,
          $Res Function(_$EscalaQueryOneDTOImpl) then) =
      __$$EscalaQueryOneDTOImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({DateTime anoMes});
}

/// @nodoc
class __$$EscalaQueryOneDTOImplCopyWithImpl<$Res>
    extends _$EscalaQueryOneDTOCopyWithImpl<$Res, _$EscalaQueryOneDTOImpl>
    implements _$$EscalaQueryOneDTOImplCopyWith<$Res> {
  __$$EscalaQueryOneDTOImplCopyWithImpl(_$EscalaQueryOneDTOImpl _value,
      $Res Function(_$EscalaQueryOneDTOImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? anoMes = null,
  }) {
    return _then(_$EscalaQueryOneDTOImpl(
      anoMes: null == anoMes
          ? _value.anoMes
          : anoMes // ignore: cast_nullable_to_non_nullable
              as DateTime,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$EscalaQueryOneDTOImpl implements _EscalaQueryOneDTO {
  _$EscalaQueryOneDTOImpl({required this.anoMes});

  factory _$EscalaQueryOneDTOImpl.fromJson(Map<String, dynamic> json) =>
      _$$EscalaQueryOneDTOImplFromJson(json);

  @override
  DateTime anoMes;

  @override
  String toString() {
    return 'EscalaQueryOneDTO(anoMes: $anoMes)';
  }

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$EscalaQueryOneDTOImplCopyWith<_$EscalaQueryOneDTOImpl> get copyWith =>
      __$$EscalaQueryOneDTOImplCopyWithImpl<_$EscalaQueryOneDTOImpl>(
          this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$EscalaQueryOneDTOImplToJson(
      this,
    );
  }
}

abstract class _EscalaQueryOneDTO implements EscalaQueryOneDTO {
  factory _EscalaQueryOneDTO({required DateTime anoMes}) =
      _$EscalaQueryOneDTOImpl;

  factory _EscalaQueryOneDTO.fromJson(Map<String, dynamic> json) =
      _$EscalaQueryOneDTOImpl.fromJson;

  @override
  DateTime get anoMes;
  set anoMes(DateTime value);
  @override
  @JsonKey(ignore: true)
  _$$EscalaQueryOneDTOImplCopyWith<_$EscalaQueryOneDTOImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
