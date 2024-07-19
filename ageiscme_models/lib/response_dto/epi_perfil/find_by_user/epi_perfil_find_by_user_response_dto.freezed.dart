// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'epi_perfil_find_by_user_response_dto.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

EpiPerfilFindByUserResponseDTO _$EpiPerfilFindByUserResponseDTOFromJson(
    Map<String, dynamic> json) {
  return _EpiPerfilFindByUserResponseDTO.fromJson(json);
}

/// @nodoc
mixin _$EpiPerfilFindByUserResponseDTO {
  List<EpiPerfilFindByUserEpiResponseDTO> get epis =>
      throw _privateConstructorUsedError;
  set epis(List<EpiPerfilFindByUserEpiResponseDTO> value) =>
      throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $EpiPerfilFindByUserResponseDTOCopyWith<EpiPerfilFindByUserResponseDTO>
      get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $EpiPerfilFindByUserResponseDTOCopyWith<$Res> {
  factory $EpiPerfilFindByUserResponseDTOCopyWith(
          EpiPerfilFindByUserResponseDTO value,
          $Res Function(EpiPerfilFindByUserResponseDTO) then) =
      _$EpiPerfilFindByUserResponseDTOCopyWithImpl<$Res,
          EpiPerfilFindByUserResponseDTO>;
  @useResult
  $Res call({List<EpiPerfilFindByUserEpiResponseDTO> epis});
}

/// @nodoc
class _$EpiPerfilFindByUserResponseDTOCopyWithImpl<$Res,
        $Val extends EpiPerfilFindByUserResponseDTO>
    implements $EpiPerfilFindByUserResponseDTOCopyWith<$Res> {
  _$EpiPerfilFindByUserResponseDTOCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? epis = null,
  }) {
    return _then(_value.copyWith(
      epis: null == epis
          ? _value.epis
          : epis // ignore: cast_nullable_to_non_nullable
              as List<EpiPerfilFindByUserEpiResponseDTO>,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$EpiPerfilFindByUserResponseDTOImplCopyWith<$Res>
    implements $EpiPerfilFindByUserResponseDTOCopyWith<$Res> {
  factory _$$EpiPerfilFindByUserResponseDTOImplCopyWith(
          _$EpiPerfilFindByUserResponseDTOImpl value,
          $Res Function(_$EpiPerfilFindByUserResponseDTOImpl) then) =
      __$$EpiPerfilFindByUserResponseDTOImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({List<EpiPerfilFindByUserEpiResponseDTO> epis});
}

/// @nodoc
class __$$EpiPerfilFindByUserResponseDTOImplCopyWithImpl<$Res>
    extends _$EpiPerfilFindByUserResponseDTOCopyWithImpl<$Res,
        _$EpiPerfilFindByUserResponseDTOImpl>
    implements _$$EpiPerfilFindByUserResponseDTOImplCopyWith<$Res> {
  __$$EpiPerfilFindByUserResponseDTOImplCopyWithImpl(
      _$EpiPerfilFindByUserResponseDTOImpl _value,
      $Res Function(_$EpiPerfilFindByUserResponseDTOImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? epis = null,
  }) {
    return _then(_$EpiPerfilFindByUserResponseDTOImpl(
      epis: null == epis
          ? _value.epis
          : epis // ignore: cast_nullable_to_non_nullable
              as List<EpiPerfilFindByUserEpiResponseDTO>,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$EpiPerfilFindByUserResponseDTOImpl
    implements _EpiPerfilFindByUserResponseDTO {
  _$EpiPerfilFindByUserResponseDTOImpl({required this.epis});

  factory _$EpiPerfilFindByUserResponseDTOImpl.fromJson(
          Map<String, dynamic> json) =>
      _$$EpiPerfilFindByUserResponseDTOImplFromJson(json);

  @override
  List<EpiPerfilFindByUserEpiResponseDTO> epis;

  @override
  String toString() {
    return 'EpiPerfilFindByUserResponseDTO(epis: $epis)';
  }

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$EpiPerfilFindByUserResponseDTOImplCopyWith<
          _$EpiPerfilFindByUserResponseDTOImpl>
      get copyWith => __$$EpiPerfilFindByUserResponseDTOImplCopyWithImpl<
          _$EpiPerfilFindByUserResponseDTOImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$EpiPerfilFindByUserResponseDTOImplToJson(
      this,
    );
  }
}

abstract class _EpiPerfilFindByUserResponseDTO
    implements EpiPerfilFindByUserResponseDTO {
  factory _EpiPerfilFindByUserResponseDTO(
          {required List<EpiPerfilFindByUserEpiResponseDTO> epis}) =
      _$EpiPerfilFindByUserResponseDTOImpl;

  factory _EpiPerfilFindByUserResponseDTO.fromJson(Map<String, dynamic> json) =
      _$EpiPerfilFindByUserResponseDTOImpl.fromJson;

  @override
  List<EpiPerfilFindByUserEpiResponseDTO> get epis;
  set epis(List<EpiPerfilFindByUserEpiResponseDTO> value);
  @override
  @JsonKey(ignore: true)
  _$$EpiPerfilFindByUserResponseDTOImplCopyWith<
          _$EpiPerfilFindByUserResponseDTOImpl>
      get copyWith => throw _privateConstructorUsedError;
}
