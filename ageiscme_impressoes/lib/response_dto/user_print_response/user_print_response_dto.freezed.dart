// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'user_print_response_dto.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

UserPrintResponseDTO _$UserPrintResponseDTOFromJson(Map<String, dynamic> json) {
  return _UserPrintResponseDTO.fromJson(json);
}

/// @nodoc
mixin _$UserPrintResponseDTO {
  List<UserPrintUserResponseDTO> get users =>
      throw _privateConstructorUsedError;
  set users(List<UserPrintUserResponseDTO> value) =>
      throw _privateConstructorUsedError;
  UserPrintCompanyResponseDTO get company => throw _privateConstructorUsedError;
  set company(UserPrintCompanyResponseDTO value) =>
      throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $UserPrintResponseDTOCopyWith<UserPrintResponseDTO> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $UserPrintResponseDTOCopyWith<$Res> {
  factory $UserPrintResponseDTOCopyWith(UserPrintResponseDTO value,
          $Res Function(UserPrintResponseDTO) then) =
      _$UserPrintResponseDTOCopyWithImpl<$Res, UserPrintResponseDTO>;
  @useResult
  $Res call(
      {List<UserPrintUserResponseDTO> users,
      UserPrintCompanyResponseDTO company});

  $UserPrintCompanyResponseDTOCopyWith<$Res> get company;
}

/// @nodoc
class _$UserPrintResponseDTOCopyWithImpl<$Res,
        $Val extends UserPrintResponseDTO>
    implements $UserPrintResponseDTOCopyWith<$Res> {
  _$UserPrintResponseDTOCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? users = null,
    Object? company = null,
  }) {
    return _then(_value.copyWith(
      users: null == users
          ? _value.users
          : users // ignore: cast_nullable_to_non_nullable
              as List<UserPrintUserResponseDTO>,
      company: null == company
          ? _value.company
          : company // ignore: cast_nullable_to_non_nullable
              as UserPrintCompanyResponseDTO,
    ) as $Val);
  }

  @override
  @pragma('vm:prefer-inline')
  $UserPrintCompanyResponseDTOCopyWith<$Res> get company {
    return $UserPrintCompanyResponseDTOCopyWith<$Res>(_value.company, (value) {
      return _then(_value.copyWith(company: value) as $Val);
    });
  }
}

/// @nodoc
abstract class _$$UserPrintResponseDTOImplCopyWith<$Res>
    implements $UserPrintResponseDTOCopyWith<$Res> {
  factory _$$UserPrintResponseDTOImplCopyWith(_$UserPrintResponseDTOImpl value,
          $Res Function(_$UserPrintResponseDTOImpl) then) =
      __$$UserPrintResponseDTOImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {List<UserPrintUserResponseDTO> users,
      UserPrintCompanyResponseDTO company});

  @override
  $UserPrintCompanyResponseDTOCopyWith<$Res> get company;
}

/// @nodoc
class __$$UserPrintResponseDTOImplCopyWithImpl<$Res>
    extends _$UserPrintResponseDTOCopyWithImpl<$Res, _$UserPrintResponseDTOImpl>
    implements _$$UserPrintResponseDTOImplCopyWith<$Res> {
  __$$UserPrintResponseDTOImplCopyWithImpl(_$UserPrintResponseDTOImpl _value,
      $Res Function(_$UserPrintResponseDTOImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? users = null,
    Object? company = null,
  }) {
    return _then(_$UserPrintResponseDTOImpl(
      users: null == users
          ? _value.users
          : users // ignore: cast_nullable_to_non_nullable
              as List<UserPrintUserResponseDTO>,
      company: null == company
          ? _value.company
          : company // ignore: cast_nullable_to_non_nullable
              as UserPrintCompanyResponseDTO,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$UserPrintResponseDTOImpl
    with DiagnosticableTreeMixin
    implements _UserPrintResponseDTO {
  _$UserPrintResponseDTOImpl({required this.users, required this.company});

  factory _$UserPrintResponseDTOImpl.fromJson(Map<String, dynamic> json) =>
      _$$UserPrintResponseDTOImplFromJson(json);

  @override
  List<UserPrintUserResponseDTO> users;
  @override
  UserPrintCompanyResponseDTO company;

  @override
  String toString({DiagnosticLevel minLevel = DiagnosticLevel.info}) {
    return 'UserPrintResponseDTO(users: $users, company: $company)';
  }

  @override
  void debugFillProperties(DiagnosticPropertiesBuilder properties) {
    super.debugFillProperties(properties);
    properties
      ..add(DiagnosticsProperty('type', 'UserPrintResponseDTO'))
      ..add(DiagnosticsProperty('users', users))
      ..add(DiagnosticsProperty('company', company));
  }

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$UserPrintResponseDTOImplCopyWith<_$UserPrintResponseDTOImpl>
      get copyWith =>
          __$$UserPrintResponseDTOImplCopyWithImpl<_$UserPrintResponseDTOImpl>(
              this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$UserPrintResponseDTOImplToJson(
      this,
    );
  }
}

abstract class _UserPrintResponseDTO implements UserPrintResponseDTO {
  factory _UserPrintResponseDTO(
          {required List<UserPrintUserResponseDTO> users,
          required UserPrintCompanyResponseDTO company}) =
      _$UserPrintResponseDTOImpl;

  factory _UserPrintResponseDTO.fromJson(Map<String, dynamic> json) =
      _$UserPrintResponseDTOImpl.fromJson;

  @override
  List<UserPrintUserResponseDTO> get users;
  set users(List<UserPrintUserResponseDTO> value);
  @override
  UserPrintCompanyResponseDTO get company;
  set company(UserPrintCompanyResponseDTO value);
  @override
  @JsonKey(ignore: true)
  _$$UserPrintResponseDTOImplCopyWith<_$UserPrintResponseDTOImpl>
      get copyWith => throw _privateConstructorUsedError;
}
