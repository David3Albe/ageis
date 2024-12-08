// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'authentication_result_dto.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

AuthenticationResultDTO _$AuthenticationResultDTOFromJson(
    Map<String, dynamic> json) {
  return _AuthenticationResultDTO.fromJson(json);
}

/// @nodoc
mixin _$AuthenticationResultDTO {
  UsuarioModel? get usuario => throw _privateConstructorUsedError;
  set usuario(UsuarioModel? value) => throw _privateConstructorUsedError;
  InstituicaoModel? get instituicao => throw _privateConstructorUsedError;
  set instituicao(InstituicaoModel? value) =>
      throw _privateConstructorUsedError;
  String? get token => throw _privateConstructorUsedError;
  set token(String? value) => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $AuthenticationResultDTOCopyWith<AuthenticationResultDTO> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $AuthenticationResultDTOCopyWith<$Res> {
  factory $AuthenticationResultDTOCopyWith(AuthenticationResultDTO value,
          $Res Function(AuthenticationResultDTO) then) =
      _$AuthenticationResultDTOCopyWithImpl<$Res, AuthenticationResultDTO>;
  @useResult
  $Res call(
      {UsuarioModel? usuario, InstituicaoModel? instituicao, String? token});

  $UsuarioModelCopyWith<$Res>? get usuario;
  $InstituicaoModelCopyWith<$Res>? get instituicao;
}

/// @nodoc
class _$AuthenticationResultDTOCopyWithImpl<$Res,
        $Val extends AuthenticationResultDTO>
    implements $AuthenticationResultDTOCopyWith<$Res> {
  _$AuthenticationResultDTOCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? usuario = freezed,
    Object? instituicao = freezed,
    Object? token = freezed,
  }) {
    return _then(_value.copyWith(
      usuario: freezed == usuario
          ? _value.usuario
          : usuario // ignore: cast_nullable_to_non_nullable
              as UsuarioModel?,
      instituicao: freezed == instituicao
          ? _value.instituicao
          : instituicao // ignore: cast_nullable_to_non_nullable
              as InstituicaoModel?,
      token: freezed == token
          ? _value.token
          : token // ignore: cast_nullable_to_non_nullable
              as String?,
    ) as $Val);
  }

  @override
  @pragma('vm:prefer-inline')
  $UsuarioModelCopyWith<$Res>? get usuario {
    if (_value.usuario == null) {
      return null;
    }

    return $UsuarioModelCopyWith<$Res>(_value.usuario!, (value) {
      return _then(_value.copyWith(usuario: value) as $Val);
    });
  }

  @override
  @pragma('vm:prefer-inline')
  $InstituicaoModelCopyWith<$Res>? get instituicao {
    if (_value.instituicao == null) {
      return null;
    }

    return $InstituicaoModelCopyWith<$Res>(_value.instituicao!, (value) {
      return _then(_value.copyWith(instituicao: value) as $Val);
    });
  }
}

/// @nodoc
abstract class _$$AuthenticationResultDTOImplCopyWith<$Res>
    implements $AuthenticationResultDTOCopyWith<$Res> {
  factory _$$AuthenticationResultDTOImplCopyWith(
          _$AuthenticationResultDTOImpl value,
          $Res Function(_$AuthenticationResultDTOImpl) then) =
      __$$AuthenticationResultDTOImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {UsuarioModel? usuario, InstituicaoModel? instituicao, String? token});

  @override
  $UsuarioModelCopyWith<$Res>? get usuario;
  @override
  $InstituicaoModelCopyWith<$Res>? get instituicao;
}

/// @nodoc
class __$$AuthenticationResultDTOImplCopyWithImpl<$Res>
    extends _$AuthenticationResultDTOCopyWithImpl<$Res,
        _$AuthenticationResultDTOImpl>
    implements _$$AuthenticationResultDTOImplCopyWith<$Res> {
  __$$AuthenticationResultDTOImplCopyWithImpl(
      _$AuthenticationResultDTOImpl _value,
      $Res Function(_$AuthenticationResultDTOImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? usuario = freezed,
    Object? instituicao = freezed,
    Object? token = freezed,
  }) {
    return _then(_$AuthenticationResultDTOImpl(
      usuario: freezed == usuario
          ? _value.usuario
          : usuario // ignore: cast_nullable_to_non_nullable
              as UsuarioModel?,
      instituicao: freezed == instituicao
          ? _value.instituicao
          : instituicao // ignore: cast_nullable_to_non_nullable
              as InstituicaoModel?,
      token: freezed == token
          ? _value.token
          : token // ignore: cast_nullable_to_non_nullable
              as String?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$AuthenticationResultDTOImpl implements _AuthenticationResultDTO {
  _$AuthenticationResultDTOImpl(
      {required this.usuario, required this.instituicao, required this.token});

  factory _$AuthenticationResultDTOImpl.fromJson(Map<String, dynamic> json) =>
      _$$AuthenticationResultDTOImplFromJson(json);

  @override
  UsuarioModel? usuario;
  @override
  InstituicaoModel? instituicao;
  @override
  String? token;

  @override
  String toString() {
    return 'AuthenticationResultDTO(usuario: $usuario, instituicao: $instituicao, token: $token)';
  }

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$AuthenticationResultDTOImplCopyWith<_$AuthenticationResultDTOImpl>
      get copyWith => __$$AuthenticationResultDTOImplCopyWithImpl<
          _$AuthenticationResultDTOImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$AuthenticationResultDTOImplToJson(
      this,
    );
  }
}

abstract class _AuthenticationResultDTO implements AuthenticationResultDTO {
  factory _AuthenticationResultDTO(
      {required UsuarioModel? usuario,
      required InstituicaoModel? instituicao,
      required String? token}) = _$AuthenticationResultDTOImpl;

  factory _AuthenticationResultDTO.fromJson(Map<String, dynamic> json) =
      _$AuthenticationResultDTOImpl.fromJson;

  @override
  UsuarioModel? get usuario;
  set usuario(UsuarioModel? value);
  @override
  InstituicaoModel? get instituicao;
  set instituicao(InstituicaoModel? value);
  @override
  String? get token;
  set token(String? value);
  @override
  @JsonKey(ignore: true)
  _$$AuthenticationResultDTOImplCopyWith<_$AuthenticationResultDTOImpl>
      get copyWith => throw _privateConstructorUsedError;
}
