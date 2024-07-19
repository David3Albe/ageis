// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'epi_perfil_find_by_epi_response_dto.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

EpiPerfilFindByEpiResponseDTO _$EpiPerfilFindByEpiResponseDTOFromJson(
    Map<String, dynamic> json) {
  return _EpiPerfilFindByEpiResponseDTO.fromJson(json);
}

/// @nodoc
mixin _$EpiPerfilFindByEpiResponseDTO {
  List<EpiPerfilFindByEpiPerfilResponseDTO> get perfis =>
      throw _privateConstructorUsedError;
  set perfis(List<EpiPerfilFindByEpiPerfilResponseDTO> value) =>
      throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $EpiPerfilFindByEpiResponseDTOCopyWith<EpiPerfilFindByEpiResponseDTO>
      get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $EpiPerfilFindByEpiResponseDTOCopyWith<$Res> {
  factory $EpiPerfilFindByEpiResponseDTOCopyWith(
          EpiPerfilFindByEpiResponseDTO value,
          $Res Function(EpiPerfilFindByEpiResponseDTO) then) =
      _$EpiPerfilFindByEpiResponseDTOCopyWithImpl<$Res,
          EpiPerfilFindByEpiResponseDTO>;
  @useResult
  $Res call({List<EpiPerfilFindByEpiPerfilResponseDTO> perfis});
}

/// @nodoc
class _$EpiPerfilFindByEpiResponseDTOCopyWithImpl<$Res,
        $Val extends EpiPerfilFindByEpiResponseDTO>
    implements $EpiPerfilFindByEpiResponseDTOCopyWith<$Res> {
  _$EpiPerfilFindByEpiResponseDTOCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? perfis = null,
  }) {
    return _then(_value.copyWith(
      perfis: null == perfis
          ? _value.perfis
          : perfis // ignore: cast_nullable_to_non_nullable
              as List<EpiPerfilFindByEpiPerfilResponseDTO>,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$EpiPerfilFindByEpiResponseDTOImplCopyWith<$Res>
    implements $EpiPerfilFindByEpiResponseDTOCopyWith<$Res> {
  factory _$$EpiPerfilFindByEpiResponseDTOImplCopyWith(
          _$EpiPerfilFindByEpiResponseDTOImpl value,
          $Res Function(_$EpiPerfilFindByEpiResponseDTOImpl) then) =
      __$$EpiPerfilFindByEpiResponseDTOImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({List<EpiPerfilFindByEpiPerfilResponseDTO> perfis});
}

/// @nodoc
class __$$EpiPerfilFindByEpiResponseDTOImplCopyWithImpl<$Res>
    extends _$EpiPerfilFindByEpiResponseDTOCopyWithImpl<$Res,
        _$EpiPerfilFindByEpiResponseDTOImpl>
    implements _$$EpiPerfilFindByEpiResponseDTOImplCopyWith<$Res> {
  __$$EpiPerfilFindByEpiResponseDTOImplCopyWithImpl(
      _$EpiPerfilFindByEpiResponseDTOImpl _value,
      $Res Function(_$EpiPerfilFindByEpiResponseDTOImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? perfis = null,
  }) {
    return _then(_$EpiPerfilFindByEpiResponseDTOImpl(
      perfis: null == perfis
          ? _value.perfis
          : perfis // ignore: cast_nullable_to_non_nullable
              as List<EpiPerfilFindByEpiPerfilResponseDTO>,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$EpiPerfilFindByEpiResponseDTOImpl
    implements _EpiPerfilFindByEpiResponseDTO {
  _$EpiPerfilFindByEpiResponseDTOImpl({required this.perfis});

  factory _$EpiPerfilFindByEpiResponseDTOImpl.fromJson(
          Map<String, dynamic> json) =>
      _$$EpiPerfilFindByEpiResponseDTOImplFromJson(json);

  @override
  List<EpiPerfilFindByEpiPerfilResponseDTO> perfis;

  @override
  String toString() {
    return 'EpiPerfilFindByEpiResponseDTO(perfis: $perfis)';
  }

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$EpiPerfilFindByEpiResponseDTOImplCopyWith<
          _$EpiPerfilFindByEpiResponseDTOImpl>
      get copyWith => __$$EpiPerfilFindByEpiResponseDTOImplCopyWithImpl<
          _$EpiPerfilFindByEpiResponseDTOImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$EpiPerfilFindByEpiResponseDTOImplToJson(
      this,
    );
  }
}

abstract class _EpiPerfilFindByEpiResponseDTO
    implements EpiPerfilFindByEpiResponseDTO {
  factory _EpiPerfilFindByEpiResponseDTO(
          {required List<EpiPerfilFindByEpiPerfilResponseDTO> perfis}) =
      _$EpiPerfilFindByEpiResponseDTOImpl;

  factory _EpiPerfilFindByEpiResponseDTO.fromJson(Map<String, dynamic> json) =
      _$EpiPerfilFindByEpiResponseDTOImpl.fromJson;

  @override
  List<EpiPerfilFindByEpiPerfilResponseDTO> get perfis;
  set perfis(List<EpiPerfilFindByEpiPerfilResponseDTO> value);
  @override
  @JsonKey(ignore: true)
  _$$EpiPerfilFindByEpiResponseDTOImplCopyWith<
          _$EpiPerfilFindByEpiResponseDTOImpl>
      get copyWith => throw _privateConstructorUsedError;
}
