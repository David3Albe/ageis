// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'user_print_user_response_dto.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

UserPrintUserResponseDTO _$UserPrintUserResponseDTOFromJson(
    Map<String, dynamic> json) {
  return _UserPrintUserResponseDTO.fromJson(json);
}

/// @nodoc
mixin _$UserPrintUserResponseDTO {
  String get userName => throw _privateConstructorUsedError;
  set userName(String value) => throw _privateConstructorUsedError;
  int get rg => throw _privateConstructorUsedError;
  set rg(int value) => throw _privateConstructorUsedError;
  int get tagId => throw _privateConstructorUsedError;
  set tagId(int value) => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $UserPrintUserResponseDTOCopyWith<UserPrintUserResponseDTO> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $UserPrintUserResponseDTOCopyWith<$Res> {
  factory $UserPrintUserResponseDTOCopyWith(UserPrintUserResponseDTO value,
          $Res Function(UserPrintUserResponseDTO) then) =
      _$UserPrintUserResponseDTOCopyWithImpl<$Res, UserPrintUserResponseDTO>;
  @useResult
  $Res call({String userName, int rg, int tagId});
}

/// @nodoc
class _$UserPrintUserResponseDTOCopyWithImpl<$Res,
        $Val extends UserPrintUserResponseDTO>
    implements $UserPrintUserResponseDTOCopyWith<$Res> {
  _$UserPrintUserResponseDTOCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? userName = null,
    Object? rg = null,
    Object? tagId = null,
  }) {
    return _then(_value.copyWith(
      userName: null == userName
          ? _value.userName
          : userName // ignore: cast_nullable_to_non_nullable
              as String,
      rg: null == rg
          ? _value.rg
          : rg // ignore: cast_nullable_to_non_nullable
              as int,
      tagId: null == tagId
          ? _value.tagId
          : tagId // ignore: cast_nullable_to_non_nullable
              as int,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$UserPrintUserResponseDTOImplCopyWith<$Res>
    implements $UserPrintUserResponseDTOCopyWith<$Res> {
  factory _$$UserPrintUserResponseDTOImplCopyWith(
          _$UserPrintUserResponseDTOImpl value,
          $Res Function(_$UserPrintUserResponseDTOImpl) then) =
      __$$UserPrintUserResponseDTOImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({String userName, int rg, int tagId});
}

/// @nodoc
class __$$UserPrintUserResponseDTOImplCopyWithImpl<$Res>
    extends _$UserPrintUserResponseDTOCopyWithImpl<$Res,
        _$UserPrintUserResponseDTOImpl>
    implements _$$UserPrintUserResponseDTOImplCopyWith<$Res> {
  __$$UserPrintUserResponseDTOImplCopyWithImpl(
      _$UserPrintUserResponseDTOImpl _value,
      $Res Function(_$UserPrintUserResponseDTOImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? userName = null,
    Object? rg = null,
    Object? tagId = null,
  }) {
    return _then(_$UserPrintUserResponseDTOImpl(
      userName: null == userName
          ? _value.userName
          : userName // ignore: cast_nullable_to_non_nullable
              as String,
      rg: null == rg
          ? _value.rg
          : rg // ignore: cast_nullable_to_non_nullable
              as int,
      tagId: null == tagId
          ? _value.tagId
          : tagId // ignore: cast_nullable_to_non_nullable
              as int,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$UserPrintUserResponseDTOImpl
    with DiagnosticableTreeMixin
    implements _UserPrintUserResponseDTO {
  _$UserPrintUserResponseDTOImpl(
      {required this.userName, required this.rg, required this.tagId});

  factory _$UserPrintUserResponseDTOImpl.fromJson(Map<String, dynamic> json) =>
      _$$UserPrintUserResponseDTOImplFromJson(json);

  @override
  String userName;
  @override
  int rg;
  @override
  int tagId;

  @override
  String toString({DiagnosticLevel minLevel = DiagnosticLevel.info}) {
    return 'UserPrintUserResponseDTO(userName: $userName, rg: $rg, tagId: $tagId)';
  }

  @override
  void debugFillProperties(DiagnosticPropertiesBuilder properties) {
    super.debugFillProperties(properties);
    properties
      ..add(DiagnosticsProperty('type', 'UserPrintUserResponseDTO'))
      ..add(DiagnosticsProperty('userName', userName))
      ..add(DiagnosticsProperty('rg', rg))
      ..add(DiagnosticsProperty('tagId', tagId));
  }

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$UserPrintUserResponseDTOImplCopyWith<_$UserPrintUserResponseDTOImpl>
      get copyWith => __$$UserPrintUserResponseDTOImplCopyWithImpl<
          _$UserPrintUserResponseDTOImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$UserPrintUserResponseDTOImplToJson(
      this,
    );
  }
}

abstract class _UserPrintUserResponseDTO implements UserPrintUserResponseDTO {
  factory _UserPrintUserResponseDTO(
      {required String userName,
      required int rg,
      required int tagId}) = _$UserPrintUserResponseDTOImpl;

  factory _UserPrintUserResponseDTO.fromJson(Map<String, dynamic> json) =
      _$UserPrintUserResponseDTOImpl.fromJson;

  @override
  String get userName;
  set userName(String value);
  @override
  int get rg;
  set rg(int value);
  @override
  int get tagId;
  set tagId(int value);
  @override
  @JsonKey(ignore: true)
  _$$UserPrintUserResponseDTOImplCopyWith<_$UserPrintUserResponseDTOImpl>
      get copyWith => throw _privateConstructorUsedError;
}
