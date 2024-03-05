// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'user_print_company_response_dto.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

UserPrintCompanyResponseDTO _$UserPrintCompanyResponseDTOFromJson(
    Map<String, dynamic> json) {
  return _UserPrintCompanyResponseDTO.fromJson(json);
}

/// @nodoc
mixin _$UserPrintCompanyResponseDTO {
  String get name => throw _privateConstructorUsedError;
  set name(String value) => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $UserPrintCompanyResponseDTOCopyWith<UserPrintCompanyResponseDTO>
      get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $UserPrintCompanyResponseDTOCopyWith<$Res> {
  factory $UserPrintCompanyResponseDTOCopyWith(
          UserPrintCompanyResponseDTO value,
          $Res Function(UserPrintCompanyResponseDTO) then) =
      _$UserPrintCompanyResponseDTOCopyWithImpl<$Res,
          UserPrintCompanyResponseDTO>;
  @useResult
  $Res call({String name});
}

/// @nodoc
class _$UserPrintCompanyResponseDTOCopyWithImpl<$Res,
        $Val extends UserPrintCompanyResponseDTO>
    implements $UserPrintCompanyResponseDTOCopyWith<$Res> {
  _$UserPrintCompanyResponseDTOCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? name = null,
  }) {
    return _then(_value.copyWith(
      name: null == name
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$UserPrintCompanyResponseDTOImplCopyWith<$Res>
    implements $UserPrintCompanyResponseDTOCopyWith<$Res> {
  factory _$$UserPrintCompanyResponseDTOImplCopyWith(
          _$UserPrintCompanyResponseDTOImpl value,
          $Res Function(_$UserPrintCompanyResponseDTOImpl) then) =
      __$$UserPrintCompanyResponseDTOImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({String name});
}

/// @nodoc
class __$$UserPrintCompanyResponseDTOImplCopyWithImpl<$Res>
    extends _$UserPrintCompanyResponseDTOCopyWithImpl<$Res,
        _$UserPrintCompanyResponseDTOImpl>
    implements _$$UserPrintCompanyResponseDTOImplCopyWith<$Res> {
  __$$UserPrintCompanyResponseDTOImplCopyWithImpl(
      _$UserPrintCompanyResponseDTOImpl _value,
      $Res Function(_$UserPrintCompanyResponseDTOImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? name = null,
  }) {
    return _then(_$UserPrintCompanyResponseDTOImpl(
      name: null == name
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$UserPrintCompanyResponseDTOImpl
    with DiagnosticableTreeMixin
    implements _UserPrintCompanyResponseDTO {
  _$UserPrintCompanyResponseDTOImpl({required this.name});

  factory _$UserPrintCompanyResponseDTOImpl.fromJson(
          Map<String, dynamic> json) =>
      _$$UserPrintCompanyResponseDTOImplFromJson(json);

  @override
  String name;

  @override
  String toString({DiagnosticLevel minLevel = DiagnosticLevel.info}) {
    return 'UserPrintCompanyResponseDTO(name: $name)';
  }

  @override
  void debugFillProperties(DiagnosticPropertiesBuilder properties) {
    super.debugFillProperties(properties);
    properties
      ..add(DiagnosticsProperty('type', 'UserPrintCompanyResponseDTO'))
      ..add(DiagnosticsProperty('name', name));
  }

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$UserPrintCompanyResponseDTOImplCopyWith<_$UserPrintCompanyResponseDTOImpl>
      get copyWith => __$$UserPrintCompanyResponseDTOImplCopyWithImpl<
          _$UserPrintCompanyResponseDTOImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$UserPrintCompanyResponseDTOImplToJson(
      this,
    );
  }
}

abstract class _UserPrintCompanyResponseDTO
    implements UserPrintCompanyResponseDTO {
  factory _UserPrintCompanyResponseDTO({required String name}) =
      _$UserPrintCompanyResponseDTOImpl;

  factory _UserPrintCompanyResponseDTO.fromJson(Map<String, dynamic> json) =
      _$UserPrintCompanyResponseDTOImpl.fromJson;

  @override
  String get name;
  set name(String value);
  @override
  @JsonKey(ignore: true)
  _$$UserPrintCompanyResponseDTOImplCopyWith<_$UserPrintCompanyResponseDTOImpl>
      get copyWith => throw _privateConstructorUsedError;
}
