// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'user_print_dto.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

UserPrintDTO _$UserPrintDTOFromJson(Map<String, dynamic> json) {
  return _UserPrintDTO.fromJson(json);
}

/// @nodoc
mixin _$UserPrintDTO {
  bool get actives => throw _privateConstructorUsedError;
  set actives(bool value) => throw _privateConstructorUsedError;
  bool get inactives => throw _privateConstructorUsedError;
  set inactives(bool value) => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $UserPrintDTOCopyWith<UserPrintDTO> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $UserPrintDTOCopyWith<$Res> {
  factory $UserPrintDTOCopyWith(
          UserPrintDTO value, $Res Function(UserPrintDTO) then) =
      _$UserPrintDTOCopyWithImpl<$Res, UserPrintDTO>;
  @useResult
  $Res call({bool actives, bool inactives});
}

/// @nodoc
class _$UserPrintDTOCopyWithImpl<$Res, $Val extends UserPrintDTO>
    implements $UserPrintDTOCopyWith<$Res> {
  _$UserPrintDTOCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? actives = null,
    Object? inactives = null,
  }) {
    return _then(_value.copyWith(
      actives: null == actives
          ? _value.actives
          : actives // ignore: cast_nullable_to_non_nullable
              as bool,
      inactives: null == inactives
          ? _value.inactives
          : inactives // ignore: cast_nullable_to_non_nullable
              as bool,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$UserPrintDTOImplCopyWith<$Res>
    implements $UserPrintDTOCopyWith<$Res> {
  factory _$$UserPrintDTOImplCopyWith(
          _$UserPrintDTOImpl value, $Res Function(_$UserPrintDTOImpl) then) =
      __$$UserPrintDTOImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({bool actives, bool inactives});
}

/// @nodoc
class __$$UserPrintDTOImplCopyWithImpl<$Res>
    extends _$UserPrintDTOCopyWithImpl<$Res, _$UserPrintDTOImpl>
    implements _$$UserPrintDTOImplCopyWith<$Res> {
  __$$UserPrintDTOImplCopyWithImpl(
      _$UserPrintDTOImpl _value, $Res Function(_$UserPrintDTOImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? actives = null,
    Object? inactives = null,
  }) {
    return _then(_$UserPrintDTOImpl(
      actives: null == actives
          ? _value.actives
          : actives // ignore: cast_nullable_to_non_nullable
              as bool,
      inactives: null == inactives
          ? _value.inactives
          : inactives // ignore: cast_nullable_to_non_nullable
              as bool,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$UserPrintDTOImpl with DiagnosticableTreeMixin implements _UserPrintDTO {
  _$UserPrintDTOImpl({required this.actives, required this.inactives});

  factory _$UserPrintDTOImpl.fromJson(Map<String, dynamic> json) =>
      _$$UserPrintDTOImplFromJson(json);

  @override
  bool actives;
  @override
  bool inactives;

  @override
  String toString({DiagnosticLevel minLevel = DiagnosticLevel.info}) {
    return 'UserPrintDTO(actives: $actives, inactives: $inactives)';
  }

  @override
  void debugFillProperties(DiagnosticPropertiesBuilder properties) {
    super.debugFillProperties(properties);
    properties
      ..add(DiagnosticsProperty('type', 'UserPrintDTO'))
      ..add(DiagnosticsProperty('actives', actives))
      ..add(DiagnosticsProperty('inactives', inactives));
  }

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$UserPrintDTOImplCopyWith<_$UserPrintDTOImpl> get copyWith =>
      __$$UserPrintDTOImplCopyWithImpl<_$UserPrintDTOImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$UserPrintDTOImplToJson(
      this,
    );
  }
}

abstract class _UserPrintDTO implements UserPrintDTO {
  factory _UserPrintDTO({required bool actives, required bool inactives}) =
      _$UserPrintDTOImpl;

  factory _UserPrintDTO.fromJson(Map<String, dynamic> json) =
      _$UserPrintDTOImpl.fromJson;

  @override
  bool get actives;
  set actives(bool value);
  @override
  bool get inactives;
  set inactives(bool value);
  @override
  @JsonKey(ignore: true)
  _$$UserPrintDTOImplCopyWith<_$UserPrintDTOImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
