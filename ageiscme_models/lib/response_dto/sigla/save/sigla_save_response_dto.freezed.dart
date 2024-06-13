// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'sigla_save_response_dto.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

SiglaSaveResponseDTO _$SiglaSaveResponseDTOFromJson(Map<String, dynamic> json) {
  return _SiglaSaveResponseDTO.fromJson(json);
}

/// @nodoc
mixin _$SiglaSaveResponseDTO {
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $SiglaSaveResponseDTOCopyWith<$Res> {
  factory $SiglaSaveResponseDTOCopyWith(SiglaSaveResponseDTO value,
          $Res Function(SiglaSaveResponseDTO) then) =
      _$SiglaSaveResponseDTOCopyWithImpl<$Res, SiglaSaveResponseDTO>;
}

/// @nodoc
class _$SiglaSaveResponseDTOCopyWithImpl<$Res,
        $Val extends SiglaSaveResponseDTO>
    implements $SiglaSaveResponseDTOCopyWith<$Res> {
  _$SiglaSaveResponseDTOCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;
}

/// @nodoc
abstract class _$$SiglaSaveResponseDTOImplCopyWith<$Res> {
  factory _$$SiglaSaveResponseDTOImplCopyWith(_$SiglaSaveResponseDTOImpl value,
          $Res Function(_$SiglaSaveResponseDTOImpl) then) =
      __$$SiglaSaveResponseDTOImplCopyWithImpl<$Res>;
}

/// @nodoc
class __$$SiglaSaveResponseDTOImplCopyWithImpl<$Res>
    extends _$SiglaSaveResponseDTOCopyWithImpl<$Res, _$SiglaSaveResponseDTOImpl>
    implements _$$SiglaSaveResponseDTOImplCopyWith<$Res> {
  __$$SiglaSaveResponseDTOImplCopyWithImpl(_$SiglaSaveResponseDTOImpl _value,
      $Res Function(_$SiglaSaveResponseDTOImpl) _then)
      : super(_value, _then);
}

/// @nodoc
@JsonSerializable()
class _$SiglaSaveResponseDTOImpl implements _SiglaSaveResponseDTO {
  _$SiglaSaveResponseDTOImpl();

  factory _$SiglaSaveResponseDTOImpl.fromJson(Map<String, dynamic> json) =>
      _$$SiglaSaveResponseDTOImplFromJson(json);

  @override
  String toString() {
    return 'SiglaSaveResponseDTO()';
  }

  @override
  Map<String, dynamic> toJson() {
    return _$$SiglaSaveResponseDTOImplToJson(
      this,
    );
  }
}

abstract class _SiglaSaveResponseDTO implements SiglaSaveResponseDTO {
  factory _SiglaSaveResponseDTO() = _$SiglaSaveResponseDTOImpl;

  factory _SiglaSaveResponseDTO.fromJson(Map<String, dynamic> json) =
      _$SiglaSaveResponseDTOImpl.fromJson;
}
