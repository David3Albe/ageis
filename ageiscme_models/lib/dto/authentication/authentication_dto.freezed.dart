// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'authentication_dto.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

AuthenticationDTO _$AuthenticationDTOFromJson(Map<String, dynamic> json) {
  return _AuthenticationDTO.fromJson(json);
}

/// @nodoc
mixin _$AuthenticationDTO {
  String? get usuario => throw _privateConstructorUsedError;
  set usuario(String? value) => throw _privateConstructorUsedError;
  String? get senha => throw _privateConstructorUsedError;
  set senha(String? value) => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $AuthenticationDTOCopyWith<AuthenticationDTO> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $AuthenticationDTOCopyWith<$Res> {
  factory $AuthenticationDTOCopyWith(
          AuthenticationDTO value, $Res Function(AuthenticationDTO) then) =
      _$AuthenticationDTOCopyWithImpl<$Res, AuthenticationDTO>;
  @useResult
  $Res call({String? usuario, String? senha});
}

/// @nodoc
class _$AuthenticationDTOCopyWithImpl<$Res, $Val extends AuthenticationDTO>
    implements $AuthenticationDTOCopyWith<$Res> {
  _$AuthenticationDTOCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? usuario = freezed,
    Object? senha = freezed,
  }) {
    return _then(_value.copyWith(
      usuario: freezed == usuario
          ? _value.usuario
          : usuario // ignore: cast_nullable_to_non_nullable
              as String?,
      senha: freezed == senha
          ? _value.senha
          : senha // ignore: cast_nullable_to_non_nullable
              as String?,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$AuthenticationDTOImplCopyWith<$Res>
    implements $AuthenticationDTOCopyWith<$Res> {
  factory _$$AuthenticationDTOImplCopyWith(_$AuthenticationDTOImpl value,
          $Res Function(_$AuthenticationDTOImpl) then) =
      __$$AuthenticationDTOImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({String? usuario, String? senha});
}

/// @nodoc
class __$$AuthenticationDTOImplCopyWithImpl<$Res>
    extends _$AuthenticationDTOCopyWithImpl<$Res, _$AuthenticationDTOImpl>
    implements _$$AuthenticationDTOImplCopyWith<$Res> {
  __$$AuthenticationDTOImplCopyWithImpl(_$AuthenticationDTOImpl _value,
      $Res Function(_$AuthenticationDTOImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? usuario = freezed,
    Object? senha = freezed,
  }) {
    return _then(_$AuthenticationDTOImpl(
      usuario: freezed == usuario
          ? _value.usuario
          : usuario // ignore: cast_nullable_to_non_nullable
              as String?,
      senha: freezed == senha
          ? _value.senha
          : senha // ignore: cast_nullable_to_non_nullable
              as String?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$AuthenticationDTOImpl
    with DiagnosticableTreeMixin
    implements _AuthenticationDTO {
  _$AuthenticationDTOImpl({required this.usuario, required this.senha});

  factory _$AuthenticationDTOImpl.fromJson(Map<String, dynamic> json) =>
      _$$AuthenticationDTOImplFromJson(json);

  @override
  String? usuario;
  @override
  String? senha;

  @override
  String toString({DiagnosticLevel minLevel = DiagnosticLevel.info}) {
    return 'AuthenticationDTO(usuario: $usuario, senha: $senha)';
  }

  @override
  void debugFillProperties(DiagnosticPropertiesBuilder properties) {
    super.debugFillProperties(properties);
    properties
      ..add(DiagnosticsProperty('type', 'AuthenticationDTO'))
      ..add(DiagnosticsProperty('usuario', usuario))
      ..add(DiagnosticsProperty('senha', senha));
  }

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$AuthenticationDTOImplCopyWith<_$AuthenticationDTOImpl> get copyWith =>
      __$$AuthenticationDTOImplCopyWithImpl<_$AuthenticationDTOImpl>(
          this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$AuthenticationDTOImplToJson(
      this,
    );
  }
}

abstract class _AuthenticationDTO implements AuthenticationDTO {
  factory _AuthenticationDTO(
      {required String? usuario,
      required String? senha}) = _$AuthenticationDTOImpl;

  factory _AuthenticationDTO.fromJson(Map<String, dynamic> json) =
      _$AuthenticationDTOImpl.fromJson;

  @override
  String? get usuario;
  set usuario(String? value);
  @override
  String? get senha;
  set senha(String? value);
  @override
  @JsonKey(ignore: true)
  _$$AuthenticationDTOImplCopyWith<_$AuthenticationDTOImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
