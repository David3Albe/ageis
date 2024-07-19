// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'epi_perfil_remove_dto.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

EpiPerfilRemoveDTO _$EpiPerfilRemoveDTOFromJson(Map<String, dynamic> json) {
  return _EpiPerfilRemoveDTO.fromJson(json);
}

/// @nodoc
mixin _$EpiPerfilRemoveDTO {
  int get cod => throw _privateConstructorUsedError;
  set cod(int value) => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $EpiPerfilRemoveDTOCopyWith<EpiPerfilRemoveDTO> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $EpiPerfilRemoveDTOCopyWith<$Res> {
  factory $EpiPerfilRemoveDTOCopyWith(
          EpiPerfilRemoveDTO value, $Res Function(EpiPerfilRemoveDTO) then) =
      _$EpiPerfilRemoveDTOCopyWithImpl<$Res, EpiPerfilRemoveDTO>;
  @useResult
  $Res call({int cod});
}

/// @nodoc
class _$EpiPerfilRemoveDTOCopyWithImpl<$Res, $Val extends EpiPerfilRemoveDTO>
    implements $EpiPerfilRemoveDTOCopyWith<$Res> {
  _$EpiPerfilRemoveDTOCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? cod = null,
  }) {
    return _then(_value.copyWith(
      cod: null == cod
          ? _value.cod
          : cod // ignore: cast_nullable_to_non_nullable
              as int,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$EpiPerfilRemoveDTOImplCopyWith<$Res>
    implements $EpiPerfilRemoveDTOCopyWith<$Res> {
  factory _$$EpiPerfilRemoveDTOImplCopyWith(_$EpiPerfilRemoveDTOImpl value,
          $Res Function(_$EpiPerfilRemoveDTOImpl) then) =
      __$$EpiPerfilRemoveDTOImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({int cod});
}

/// @nodoc
class __$$EpiPerfilRemoveDTOImplCopyWithImpl<$Res>
    extends _$EpiPerfilRemoveDTOCopyWithImpl<$Res, _$EpiPerfilRemoveDTOImpl>
    implements _$$EpiPerfilRemoveDTOImplCopyWith<$Res> {
  __$$EpiPerfilRemoveDTOImplCopyWithImpl(_$EpiPerfilRemoveDTOImpl _value,
      $Res Function(_$EpiPerfilRemoveDTOImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? cod = null,
  }) {
    return _then(_$EpiPerfilRemoveDTOImpl(
      cod: null == cod
          ? _value.cod
          : cod // ignore: cast_nullable_to_non_nullable
              as int,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$EpiPerfilRemoveDTOImpl implements _EpiPerfilRemoveDTO {
  _$EpiPerfilRemoveDTOImpl({required this.cod});

  factory _$EpiPerfilRemoveDTOImpl.fromJson(Map<String, dynamic> json) =>
      _$$EpiPerfilRemoveDTOImplFromJson(json);

  @override
  int cod;

  @override
  String toString() {
    return 'EpiPerfilRemoveDTO(cod: $cod)';
  }

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$EpiPerfilRemoveDTOImplCopyWith<_$EpiPerfilRemoveDTOImpl> get copyWith =>
      __$$EpiPerfilRemoveDTOImplCopyWithImpl<_$EpiPerfilRemoveDTOImpl>(
          this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$EpiPerfilRemoveDTOImplToJson(
      this,
    );
  }
}

abstract class _EpiPerfilRemoveDTO implements EpiPerfilRemoveDTO {
  factory _EpiPerfilRemoveDTO({required int cod}) = _$EpiPerfilRemoveDTOImpl;

  factory _EpiPerfilRemoveDTO.fromJson(Map<String, dynamic> json) =
      _$EpiPerfilRemoveDTOImpl.fromJson;

  @override
  int get cod;
  set cod(int value);
  @override
  @JsonKey(ignore: true)
  _$$EpiPerfilRemoveDTOImplCopyWith<_$EpiPerfilRemoveDTOImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
