// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'kit_search_dto.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

KitSearchDTO _$KitSearchDTOFromJson(Map<String, dynamic> json) {
  return _KitSearchDTO.fromJson(json);
}

/// @nodoc
mixin _$KitSearchDTO {
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $KitSearchDTOCopyWith<$Res> {
  factory $KitSearchDTOCopyWith(
          KitSearchDTO value, $Res Function(KitSearchDTO) then) =
      _$KitSearchDTOCopyWithImpl<$Res, KitSearchDTO>;
}

/// @nodoc
class _$KitSearchDTOCopyWithImpl<$Res, $Val extends KitSearchDTO>
    implements $KitSearchDTOCopyWith<$Res> {
  _$KitSearchDTOCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;
}

/// @nodoc
abstract class _$$KitSearchDTOImplCopyWith<$Res> {
  factory _$$KitSearchDTOImplCopyWith(
          _$KitSearchDTOImpl value, $Res Function(_$KitSearchDTOImpl) then) =
      __$$KitSearchDTOImplCopyWithImpl<$Res>;
}

/// @nodoc
class __$$KitSearchDTOImplCopyWithImpl<$Res>
    extends _$KitSearchDTOCopyWithImpl<$Res, _$KitSearchDTOImpl>
    implements _$$KitSearchDTOImplCopyWith<$Res> {
  __$$KitSearchDTOImplCopyWithImpl(
      _$KitSearchDTOImpl _value, $Res Function(_$KitSearchDTOImpl) _then)
      : super(_value, _then);
}

/// @nodoc
@JsonSerializable()
class _$KitSearchDTOImpl implements _KitSearchDTO {
  _$KitSearchDTOImpl();

  factory _$KitSearchDTOImpl.fromJson(Map<String, dynamic> json) =>
      _$$KitSearchDTOImplFromJson(json);

  @override
  String toString() {
    return 'KitSearchDTO()';
  }

  @override
  Map<String, dynamic> toJson() {
    return _$$KitSearchDTOImplToJson(
      this,
    );
  }
}

abstract class _KitSearchDTO implements KitSearchDTO {
  factory _KitSearchDTO() = _$KitSearchDTOImpl;

  factory _KitSearchDTO.fromJson(Map<String, dynamic> json) =
      _$KitSearchDTOImpl.fromJson;
}
