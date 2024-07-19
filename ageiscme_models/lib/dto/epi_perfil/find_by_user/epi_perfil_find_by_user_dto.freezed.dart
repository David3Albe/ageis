// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'epi_perfil_find_by_user_dto.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

EpiPerfilFindByUserDTO _$EpiPerfilFindByUserDTOFromJson(
    Map<String, dynamic> json) {
  return _EpiPerfilFindByUserDTO.fromJson(json);
}

/// @nodoc
mixin _$EpiPerfilFindByUserDTO {
  int get codUsuario => throw _privateConstructorUsedError;
  set codUsuario(int value) => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $EpiPerfilFindByUserDTOCopyWith<EpiPerfilFindByUserDTO> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $EpiPerfilFindByUserDTOCopyWith<$Res> {
  factory $EpiPerfilFindByUserDTOCopyWith(EpiPerfilFindByUserDTO value,
          $Res Function(EpiPerfilFindByUserDTO) then) =
      _$EpiPerfilFindByUserDTOCopyWithImpl<$Res, EpiPerfilFindByUserDTO>;
  @useResult
  $Res call({int codUsuario});
}

/// @nodoc
class _$EpiPerfilFindByUserDTOCopyWithImpl<$Res,
        $Val extends EpiPerfilFindByUserDTO>
    implements $EpiPerfilFindByUserDTOCopyWith<$Res> {
  _$EpiPerfilFindByUserDTOCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? codUsuario = null,
  }) {
    return _then(_value.copyWith(
      codUsuario: null == codUsuario
          ? _value.codUsuario
          : codUsuario // ignore: cast_nullable_to_non_nullable
              as int,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$EpiPerfilFindByUserDTOImplCopyWith<$Res>
    implements $EpiPerfilFindByUserDTOCopyWith<$Res> {
  factory _$$EpiPerfilFindByUserDTOImplCopyWith(
          _$EpiPerfilFindByUserDTOImpl value,
          $Res Function(_$EpiPerfilFindByUserDTOImpl) then) =
      __$$EpiPerfilFindByUserDTOImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({int codUsuario});
}

/// @nodoc
class __$$EpiPerfilFindByUserDTOImplCopyWithImpl<$Res>
    extends _$EpiPerfilFindByUserDTOCopyWithImpl<$Res,
        _$EpiPerfilFindByUserDTOImpl>
    implements _$$EpiPerfilFindByUserDTOImplCopyWith<$Res> {
  __$$EpiPerfilFindByUserDTOImplCopyWithImpl(
      _$EpiPerfilFindByUserDTOImpl _value,
      $Res Function(_$EpiPerfilFindByUserDTOImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? codUsuario = null,
  }) {
    return _then(_$EpiPerfilFindByUserDTOImpl(
      codUsuario: null == codUsuario
          ? _value.codUsuario
          : codUsuario // ignore: cast_nullable_to_non_nullable
              as int,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$EpiPerfilFindByUserDTOImpl implements _EpiPerfilFindByUserDTO {
  _$EpiPerfilFindByUserDTOImpl({required this.codUsuario});

  factory _$EpiPerfilFindByUserDTOImpl.fromJson(Map<String, dynamic> json) =>
      _$$EpiPerfilFindByUserDTOImplFromJson(json);

  @override
  int codUsuario;

  @override
  String toString() {
    return 'EpiPerfilFindByUserDTO(codUsuario: $codUsuario)';
  }

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$EpiPerfilFindByUserDTOImplCopyWith<_$EpiPerfilFindByUserDTOImpl>
      get copyWith => __$$EpiPerfilFindByUserDTOImplCopyWithImpl<
          _$EpiPerfilFindByUserDTOImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$EpiPerfilFindByUserDTOImplToJson(
      this,
    );
  }
}

abstract class _EpiPerfilFindByUserDTO implements EpiPerfilFindByUserDTO {
  factory _EpiPerfilFindByUserDTO({required int codUsuario}) =
      _$EpiPerfilFindByUserDTOImpl;

  factory _EpiPerfilFindByUserDTO.fromJson(Map<String, dynamic> json) =
      _$EpiPerfilFindByUserDTOImpl.fromJson;

  @override
  int get codUsuario;
  set codUsuario(int value);
  @override
  @JsonKey(ignore: true)
  _$$EpiPerfilFindByUserDTOImplCopyWith<_$EpiPerfilFindByUserDTOImpl>
      get copyWith => throw _privateConstructorUsedError;
}
