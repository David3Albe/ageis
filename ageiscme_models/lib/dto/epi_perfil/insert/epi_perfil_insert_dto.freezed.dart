// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'epi_perfil_insert_dto.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

EpiPerfilInsertDTO _$EpiPerfilInsertDTOFromJson(Map<String, dynamic> json) {
  return _EpiPerfilInsertDTO.fromJson(json);
}

/// @nodoc
mixin _$EpiPerfilInsertDTO {
  int get codDescritor => throw _privateConstructorUsedError;
  set codDescritor(int value) => throw _privateConstructorUsedError;
  int get codPerfil => throw _privateConstructorUsedError;
  set codPerfil(int value) => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $EpiPerfilInsertDTOCopyWith<EpiPerfilInsertDTO> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $EpiPerfilInsertDTOCopyWith<$Res> {
  factory $EpiPerfilInsertDTOCopyWith(
          EpiPerfilInsertDTO value, $Res Function(EpiPerfilInsertDTO) then) =
      _$EpiPerfilInsertDTOCopyWithImpl<$Res, EpiPerfilInsertDTO>;
  @useResult
  $Res call({int codDescritor, int codPerfil});
}

/// @nodoc
class _$EpiPerfilInsertDTOCopyWithImpl<$Res, $Val extends EpiPerfilInsertDTO>
    implements $EpiPerfilInsertDTOCopyWith<$Res> {
  _$EpiPerfilInsertDTOCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? codDescritor = null,
    Object? codPerfil = null,
  }) {
    return _then(_value.copyWith(
      codDescritor: null == codDescritor
          ? _value.codDescritor
          : codDescritor // ignore: cast_nullable_to_non_nullable
              as int,
      codPerfil: null == codPerfil
          ? _value.codPerfil
          : codPerfil // ignore: cast_nullable_to_non_nullable
              as int,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$EpiPerfilInsertDTOImplCopyWith<$Res>
    implements $EpiPerfilInsertDTOCopyWith<$Res> {
  factory _$$EpiPerfilInsertDTOImplCopyWith(_$EpiPerfilInsertDTOImpl value,
          $Res Function(_$EpiPerfilInsertDTOImpl) then) =
      __$$EpiPerfilInsertDTOImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({int codDescritor, int codPerfil});
}

/// @nodoc
class __$$EpiPerfilInsertDTOImplCopyWithImpl<$Res>
    extends _$EpiPerfilInsertDTOCopyWithImpl<$Res, _$EpiPerfilInsertDTOImpl>
    implements _$$EpiPerfilInsertDTOImplCopyWith<$Res> {
  __$$EpiPerfilInsertDTOImplCopyWithImpl(_$EpiPerfilInsertDTOImpl _value,
      $Res Function(_$EpiPerfilInsertDTOImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? codDescritor = null,
    Object? codPerfil = null,
  }) {
    return _then(_$EpiPerfilInsertDTOImpl(
      codDescritor: null == codDescritor
          ? _value.codDescritor
          : codDescritor // ignore: cast_nullable_to_non_nullable
              as int,
      codPerfil: null == codPerfil
          ? _value.codPerfil
          : codPerfil // ignore: cast_nullable_to_non_nullable
              as int,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$EpiPerfilInsertDTOImpl implements _EpiPerfilInsertDTO {
  _$EpiPerfilInsertDTOImpl(
      {required this.codDescritor, required this.codPerfil});

  factory _$EpiPerfilInsertDTOImpl.fromJson(Map<String, dynamic> json) =>
      _$$EpiPerfilInsertDTOImplFromJson(json);

  @override
  int codDescritor;
  @override
  int codPerfil;

  @override
  String toString() {
    return 'EpiPerfilInsertDTO(codDescritor: $codDescritor, codPerfil: $codPerfil)';
  }

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$EpiPerfilInsertDTOImplCopyWith<_$EpiPerfilInsertDTOImpl> get copyWith =>
      __$$EpiPerfilInsertDTOImplCopyWithImpl<_$EpiPerfilInsertDTOImpl>(
          this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$EpiPerfilInsertDTOImplToJson(
      this,
    );
  }
}

abstract class _EpiPerfilInsertDTO implements EpiPerfilInsertDTO {
  factory _EpiPerfilInsertDTO(
      {required int codDescritor,
      required int codPerfil}) = _$EpiPerfilInsertDTOImpl;

  factory _EpiPerfilInsertDTO.fromJson(Map<String, dynamic> json) =
      _$EpiPerfilInsertDTOImpl.fromJson;

  @override
  int get codDescritor;
  set codDescritor(int value);
  @override
  int get codPerfil;
  set codPerfil(int value);
  @override
  @JsonKey(ignore: true)
  _$$EpiPerfilInsertDTOImplCopyWith<_$EpiPerfilInsertDTOImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
