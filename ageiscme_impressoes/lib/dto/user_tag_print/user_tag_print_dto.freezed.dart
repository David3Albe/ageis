// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'user_tag_print_dto.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

UserTagPrintDTO _$UserTagPrintDTOFromJson(Map<String, dynamic> json) {
  return _UserTagPrintDTO.fromJson(json);
}

/// @nodoc
mixin _$UserTagPrintDTO {
  int get tagId => throw _privateConstructorUsedError;
  set tagId(int value) => throw _privateConstructorUsedError;
  String get userName => throw _privateConstructorUsedError;
  set userName(String value) => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $UserTagPrintDTOCopyWith<UserTagPrintDTO> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $UserTagPrintDTOCopyWith<$Res> {
  factory $UserTagPrintDTOCopyWith(
          UserTagPrintDTO value, $Res Function(UserTagPrintDTO) then) =
      _$UserTagPrintDTOCopyWithImpl<$Res, UserTagPrintDTO>;
  @useResult
  $Res call({int tagId, String userName});
}

/// @nodoc
class _$UserTagPrintDTOCopyWithImpl<$Res, $Val extends UserTagPrintDTO>
    implements $UserTagPrintDTOCopyWith<$Res> {
  _$UserTagPrintDTOCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? tagId = null,
    Object? userName = null,
  }) {
    return _then(_value.copyWith(
      tagId: null == tagId
          ? _value.tagId
          : tagId // ignore: cast_nullable_to_non_nullable
              as int,
      userName: null == userName
          ? _value.userName
          : userName // ignore: cast_nullable_to_non_nullable
              as String,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$UserTagPrintDTOImplCopyWith<$Res>
    implements $UserTagPrintDTOCopyWith<$Res> {
  factory _$$UserTagPrintDTOImplCopyWith(_$UserTagPrintDTOImpl value,
          $Res Function(_$UserTagPrintDTOImpl) then) =
      __$$UserTagPrintDTOImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({int tagId, String userName});
}

/// @nodoc
class __$$UserTagPrintDTOImplCopyWithImpl<$Res>
    extends _$UserTagPrintDTOCopyWithImpl<$Res, _$UserTagPrintDTOImpl>
    implements _$$UserTagPrintDTOImplCopyWith<$Res> {
  __$$UserTagPrintDTOImplCopyWithImpl(
      _$UserTagPrintDTOImpl _value, $Res Function(_$UserTagPrintDTOImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? tagId = null,
    Object? userName = null,
  }) {
    return _then(_$UserTagPrintDTOImpl(
      tagId: null == tagId
          ? _value.tagId
          : tagId // ignore: cast_nullable_to_non_nullable
              as int,
      userName: null == userName
          ? _value.userName
          : userName // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$UserTagPrintDTOImpl
    with DiagnosticableTreeMixin
    implements _UserTagPrintDTO {
  _$UserTagPrintDTOImpl({required this.tagId, required this.userName});

  factory _$UserTagPrintDTOImpl.fromJson(Map<String, dynamic> json) =>
      _$$UserTagPrintDTOImplFromJson(json);

  @override
  int tagId;
  @override
  String userName;

  @override
  String toString({DiagnosticLevel minLevel = DiagnosticLevel.info}) {
    return 'UserTagPrintDTO(tagId: $tagId, userName: $userName)';
  }

  @override
  void debugFillProperties(DiagnosticPropertiesBuilder properties) {
    super.debugFillProperties(properties);
    properties
      ..add(DiagnosticsProperty('type', 'UserTagPrintDTO'))
      ..add(DiagnosticsProperty('tagId', tagId))
      ..add(DiagnosticsProperty('userName', userName));
  }

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$UserTagPrintDTOImplCopyWith<_$UserTagPrintDTOImpl> get copyWith =>
      __$$UserTagPrintDTOImplCopyWithImpl<_$UserTagPrintDTOImpl>(
          this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$UserTagPrintDTOImplToJson(
      this,
    );
  }
}

abstract class _UserTagPrintDTO implements UserTagPrintDTO {
  factory _UserTagPrintDTO({required int tagId, required String userName}) =
      _$UserTagPrintDTOImpl;

  factory _UserTagPrintDTO.fromJson(Map<String, dynamic> json) =
      _$UserTagPrintDTOImpl.fromJson;

  @override
  int get tagId;
  set tagId(int value);
  @override
  String get userName;
  set userName(String value);
  @override
  @JsonKey(ignore: true)
  _$$UserTagPrintDTOImplCopyWith<_$UserTagPrintDTOImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
