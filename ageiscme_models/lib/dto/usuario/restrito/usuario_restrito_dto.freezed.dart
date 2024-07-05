// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'usuario_restrito_dto.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

UsuarioRestritoDTO _$UsuarioRestritoDTOFromJson(Map<String, dynamic> json) {
  return _UsuarioRestritoDTO.fromJson(json);
}

/// @nodoc
mixin _$UsuarioRestritoDTO {
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $UsuarioRestritoDTOCopyWith<$Res> {
  factory $UsuarioRestritoDTOCopyWith(
          UsuarioRestritoDTO value, $Res Function(UsuarioRestritoDTO) then) =
      _$UsuarioRestritoDTOCopyWithImpl<$Res, UsuarioRestritoDTO>;
}

/// @nodoc
class _$UsuarioRestritoDTOCopyWithImpl<$Res, $Val extends UsuarioRestritoDTO>
    implements $UsuarioRestritoDTOCopyWith<$Res> {
  _$UsuarioRestritoDTOCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;
}

/// @nodoc
abstract class _$$UsuarioRestritoDTOImplCopyWith<$Res> {
  factory _$$UsuarioRestritoDTOImplCopyWith(_$UsuarioRestritoDTOImpl value,
          $Res Function(_$UsuarioRestritoDTOImpl) then) =
      __$$UsuarioRestritoDTOImplCopyWithImpl<$Res>;
}

/// @nodoc
class __$$UsuarioRestritoDTOImplCopyWithImpl<$Res>
    extends _$UsuarioRestritoDTOCopyWithImpl<$Res, _$UsuarioRestritoDTOImpl>
    implements _$$UsuarioRestritoDTOImplCopyWith<$Res> {
  __$$UsuarioRestritoDTOImplCopyWithImpl(_$UsuarioRestritoDTOImpl _value,
      $Res Function(_$UsuarioRestritoDTOImpl) _then)
      : super(_value, _then);
}

/// @nodoc
@JsonSerializable()
class _$UsuarioRestritoDTOImpl implements _UsuarioRestritoDTO {
  _$UsuarioRestritoDTOImpl();

  factory _$UsuarioRestritoDTOImpl.fromJson(Map<String, dynamic> json) =>
      _$$UsuarioRestritoDTOImplFromJson(json);

  @override
  String toString() {
    return 'UsuarioRestritoDTO()';
  }

  @override
  Map<String, dynamic> toJson() {
    return _$$UsuarioRestritoDTOImplToJson(
      this,
    );
  }
}

abstract class _UsuarioRestritoDTO implements UsuarioRestritoDTO {
  factory _UsuarioRestritoDTO() = _$UsuarioRestritoDTOImpl;

  factory _UsuarioRestritoDTO.fromJson(Map<String, dynamic> json) =
      _$UsuarioRestritoDTOImpl.fromJson;
}
