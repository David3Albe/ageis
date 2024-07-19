// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'epi_perfil_insert_response_dto.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

EpiPerfilInsertResponseDTO _$EpiPerfilInsertResponseDTOFromJson(
    Map<String, dynamic> json) {
  return _EpiPerfilInsertResponseDTO.fromJson(json);
}

/// @nodoc
mixin _$EpiPerfilInsertResponseDTO {
  int get cod => throw _privateConstructorUsedError;
  set cod(int value) => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $EpiPerfilInsertResponseDTOCopyWith<EpiPerfilInsertResponseDTO>
      get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $EpiPerfilInsertResponseDTOCopyWith<$Res> {
  factory $EpiPerfilInsertResponseDTOCopyWith(EpiPerfilInsertResponseDTO value,
          $Res Function(EpiPerfilInsertResponseDTO) then) =
      _$EpiPerfilInsertResponseDTOCopyWithImpl<$Res,
          EpiPerfilInsertResponseDTO>;
  @useResult
  $Res call({int cod});
}

/// @nodoc
class _$EpiPerfilInsertResponseDTOCopyWithImpl<$Res,
        $Val extends EpiPerfilInsertResponseDTO>
    implements $EpiPerfilInsertResponseDTOCopyWith<$Res> {
  _$EpiPerfilInsertResponseDTOCopyWithImpl(this._value, this._then);

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
abstract class _$$EpiPerfilInsertResponseDTOImplCopyWith<$Res>
    implements $EpiPerfilInsertResponseDTOCopyWith<$Res> {
  factory _$$EpiPerfilInsertResponseDTOImplCopyWith(
          _$EpiPerfilInsertResponseDTOImpl value,
          $Res Function(_$EpiPerfilInsertResponseDTOImpl) then) =
      __$$EpiPerfilInsertResponseDTOImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({int cod});
}

/// @nodoc
class __$$EpiPerfilInsertResponseDTOImplCopyWithImpl<$Res>
    extends _$EpiPerfilInsertResponseDTOCopyWithImpl<$Res,
        _$EpiPerfilInsertResponseDTOImpl>
    implements _$$EpiPerfilInsertResponseDTOImplCopyWith<$Res> {
  __$$EpiPerfilInsertResponseDTOImplCopyWithImpl(
      _$EpiPerfilInsertResponseDTOImpl _value,
      $Res Function(_$EpiPerfilInsertResponseDTOImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? cod = null,
  }) {
    return _then(_$EpiPerfilInsertResponseDTOImpl(
      cod: null == cod
          ? _value.cod
          : cod // ignore: cast_nullable_to_non_nullable
              as int,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$EpiPerfilInsertResponseDTOImpl implements _EpiPerfilInsertResponseDTO {
  _$EpiPerfilInsertResponseDTOImpl({required this.cod});

  factory _$EpiPerfilInsertResponseDTOImpl.fromJson(
          Map<String, dynamic> json) =>
      _$$EpiPerfilInsertResponseDTOImplFromJson(json);

  @override
  int cod;

  @override
  String toString() {
    return 'EpiPerfilInsertResponseDTO(cod: $cod)';
  }

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$EpiPerfilInsertResponseDTOImplCopyWith<_$EpiPerfilInsertResponseDTOImpl>
      get copyWith => __$$EpiPerfilInsertResponseDTOImplCopyWithImpl<
          _$EpiPerfilInsertResponseDTOImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$EpiPerfilInsertResponseDTOImplToJson(
      this,
    );
  }
}

abstract class _EpiPerfilInsertResponseDTO
    implements EpiPerfilInsertResponseDTO {
  factory _EpiPerfilInsertResponseDTO({required int cod}) =
      _$EpiPerfilInsertResponseDTOImpl;

  factory _EpiPerfilInsertResponseDTO.fromJson(Map<String, dynamic> json) =
      _$EpiPerfilInsertResponseDTOImpl.fromJson;

  @override
  int get cod;
  set cod(int value);
  @override
  @JsonKey(ignore: true)
  _$$EpiPerfilInsertResponseDTOImplCopyWith<_$EpiPerfilInsertResponseDTOImpl>
      get copyWith => throw _privateConstructorUsedError;
}
