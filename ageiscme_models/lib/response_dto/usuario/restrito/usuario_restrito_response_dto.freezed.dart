// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'usuario_restrito_response_dto.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

UsuarioRestritoResponseDTO _$UsuarioRestritoResponseDTOFromJson(
    Map<String, dynamic> json) {
  return _UsuarioRestritoResponseDTO.fromJson(json);
}

/// @nodoc
mixin _$UsuarioRestritoResponseDTO {
  bool get restrito => throw _privateConstructorUsedError;
  set restrito(bool value) => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $UsuarioRestritoResponseDTOCopyWith<UsuarioRestritoResponseDTO>
      get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $UsuarioRestritoResponseDTOCopyWith<$Res> {
  factory $UsuarioRestritoResponseDTOCopyWith(UsuarioRestritoResponseDTO value,
          $Res Function(UsuarioRestritoResponseDTO) then) =
      _$UsuarioRestritoResponseDTOCopyWithImpl<$Res,
          UsuarioRestritoResponseDTO>;
  @useResult
  $Res call({bool restrito});
}

/// @nodoc
class _$UsuarioRestritoResponseDTOCopyWithImpl<$Res,
        $Val extends UsuarioRestritoResponseDTO>
    implements $UsuarioRestritoResponseDTOCopyWith<$Res> {
  _$UsuarioRestritoResponseDTOCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? restrito = null,
  }) {
    return _then(_value.copyWith(
      restrito: null == restrito
          ? _value.restrito
          : restrito // ignore: cast_nullable_to_non_nullable
              as bool,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$UsuarioRestritoResponseDTOImplCopyWith<$Res>
    implements $UsuarioRestritoResponseDTOCopyWith<$Res> {
  factory _$$UsuarioRestritoResponseDTOImplCopyWith(
          _$UsuarioRestritoResponseDTOImpl value,
          $Res Function(_$UsuarioRestritoResponseDTOImpl) then) =
      __$$UsuarioRestritoResponseDTOImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({bool restrito});
}

/// @nodoc
class __$$UsuarioRestritoResponseDTOImplCopyWithImpl<$Res>
    extends _$UsuarioRestritoResponseDTOCopyWithImpl<$Res,
        _$UsuarioRestritoResponseDTOImpl>
    implements _$$UsuarioRestritoResponseDTOImplCopyWith<$Res> {
  __$$UsuarioRestritoResponseDTOImplCopyWithImpl(
      _$UsuarioRestritoResponseDTOImpl _value,
      $Res Function(_$UsuarioRestritoResponseDTOImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? restrito = null,
  }) {
    return _then(_$UsuarioRestritoResponseDTOImpl(
      restrito: null == restrito
          ? _value.restrito
          : restrito // ignore: cast_nullable_to_non_nullable
              as bool,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$UsuarioRestritoResponseDTOImpl extends _UsuarioRestritoResponseDTO {
  _$UsuarioRestritoResponseDTOImpl({required this.restrito}) : super._();

  factory _$UsuarioRestritoResponseDTOImpl.fromJson(
          Map<String, dynamic> json) =>
      _$$UsuarioRestritoResponseDTOImplFromJson(json);

  @override
  bool restrito;

  @override
  String toString() {
    return 'UsuarioRestritoResponseDTO(restrito: $restrito)';
  }

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$UsuarioRestritoResponseDTOImplCopyWith<_$UsuarioRestritoResponseDTOImpl>
      get copyWith => __$$UsuarioRestritoResponseDTOImplCopyWithImpl<
          _$UsuarioRestritoResponseDTOImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$UsuarioRestritoResponseDTOImplToJson(
      this,
    );
  }
}

abstract class _UsuarioRestritoResponseDTO extends UsuarioRestritoResponseDTO {
  factory _UsuarioRestritoResponseDTO({required bool restrito}) =
      _$UsuarioRestritoResponseDTOImpl;
  _UsuarioRestritoResponseDTO._() : super._();

  factory _UsuarioRestritoResponseDTO.fromJson(Map<String, dynamic> json) =
      _$UsuarioRestritoResponseDTOImpl.fromJson;

  @override
  bool get restrito;
  set restrito(bool value);
  @override
  @JsonKey(ignore: true)
  _$$UsuarioRestritoResponseDTOImplCopyWith<_$UsuarioRestritoResponseDTOImpl>
      get copyWith => throw _privateConstructorUsedError;
}
