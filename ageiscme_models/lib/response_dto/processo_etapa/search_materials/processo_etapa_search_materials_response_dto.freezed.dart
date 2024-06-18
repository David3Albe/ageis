// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'processo_etapa_search_materials_response_dto.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

ProcessoEtapaSearchMaterialsResponseDTO
    _$ProcessoEtapaSearchMaterialsResponseDTOFromJson(
        Map<String, dynamic> json) {
  return _ProcessoEtapaSearchMaterialsResponseDTO.fromJson(json);
}

/// @nodoc
mixin _$ProcessoEtapaSearchMaterialsResponseDTO {
  List<String> get materiais => throw _privateConstructorUsedError;
  set materiais(List<String> value) => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $ProcessoEtapaSearchMaterialsResponseDTOCopyWith<
          ProcessoEtapaSearchMaterialsResponseDTO>
      get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $ProcessoEtapaSearchMaterialsResponseDTOCopyWith<$Res> {
  factory $ProcessoEtapaSearchMaterialsResponseDTOCopyWith(
          ProcessoEtapaSearchMaterialsResponseDTO value,
          $Res Function(ProcessoEtapaSearchMaterialsResponseDTO) then) =
      _$ProcessoEtapaSearchMaterialsResponseDTOCopyWithImpl<$Res,
          ProcessoEtapaSearchMaterialsResponseDTO>;
  @useResult
  $Res call({List<String> materiais});
}

/// @nodoc
class _$ProcessoEtapaSearchMaterialsResponseDTOCopyWithImpl<$Res,
        $Val extends ProcessoEtapaSearchMaterialsResponseDTO>
    implements $ProcessoEtapaSearchMaterialsResponseDTOCopyWith<$Res> {
  _$ProcessoEtapaSearchMaterialsResponseDTOCopyWithImpl(
      this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? materiais = null,
  }) {
    return _then(_value.copyWith(
      materiais: null == materiais
          ? _value.materiais
          : materiais // ignore: cast_nullable_to_non_nullable
              as List<String>,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$ProcessoEtapaSearchMaterialsResponseDTOImplCopyWith<$Res>
    implements $ProcessoEtapaSearchMaterialsResponseDTOCopyWith<$Res> {
  factory _$$ProcessoEtapaSearchMaterialsResponseDTOImplCopyWith(
          _$ProcessoEtapaSearchMaterialsResponseDTOImpl value,
          $Res Function(_$ProcessoEtapaSearchMaterialsResponseDTOImpl) then) =
      __$$ProcessoEtapaSearchMaterialsResponseDTOImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({List<String> materiais});
}

/// @nodoc
class __$$ProcessoEtapaSearchMaterialsResponseDTOImplCopyWithImpl<$Res>
    extends _$ProcessoEtapaSearchMaterialsResponseDTOCopyWithImpl<$Res,
        _$ProcessoEtapaSearchMaterialsResponseDTOImpl>
    implements _$$ProcessoEtapaSearchMaterialsResponseDTOImplCopyWith<$Res> {
  __$$ProcessoEtapaSearchMaterialsResponseDTOImplCopyWithImpl(
      _$ProcessoEtapaSearchMaterialsResponseDTOImpl _value,
      $Res Function(_$ProcessoEtapaSearchMaterialsResponseDTOImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? materiais = null,
  }) {
    return _then(_$ProcessoEtapaSearchMaterialsResponseDTOImpl(
      materiais: null == materiais
          ? _value.materiais
          : materiais // ignore: cast_nullable_to_non_nullable
              as List<String>,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$ProcessoEtapaSearchMaterialsResponseDTOImpl
    implements _ProcessoEtapaSearchMaterialsResponseDTO {
  _$ProcessoEtapaSearchMaterialsResponseDTOImpl({required this.materiais});

  factory _$ProcessoEtapaSearchMaterialsResponseDTOImpl.fromJson(
          Map<String, dynamic> json) =>
      _$$ProcessoEtapaSearchMaterialsResponseDTOImplFromJson(json);

  @override
  List<String> materiais;

  @override
  String toString() {
    return 'ProcessoEtapaSearchMaterialsResponseDTO(materiais: $materiais)';
  }

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$ProcessoEtapaSearchMaterialsResponseDTOImplCopyWith<
          _$ProcessoEtapaSearchMaterialsResponseDTOImpl>
      get copyWith =>
          __$$ProcessoEtapaSearchMaterialsResponseDTOImplCopyWithImpl<
              _$ProcessoEtapaSearchMaterialsResponseDTOImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$ProcessoEtapaSearchMaterialsResponseDTOImplToJson(
      this,
    );
  }
}

abstract class _ProcessoEtapaSearchMaterialsResponseDTO
    implements ProcessoEtapaSearchMaterialsResponseDTO {
  factory _ProcessoEtapaSearchMaterialsResponseDTO(
          {required List<String> materiais}) =
      _$ProcessoEtapaSearchMaterialsResponseDTOImpl;

  factory _ProcessoEtapaSearchMaterialsResponseDTO.fromJson(
          Map<String, dynamic> json) =
      _$ProcessoEtapaSearchMaterialsResponseDTOImpl.fromJson;

  @override
  List<String> get materiais;
  set materiais(List<String> value);
  @override
  @JsonKey(ignore: true)
  _$$ProcessoEtapaSearchMaterialsResponseDTOImplCopyWith<
          _$ProcessoEtapaSearchMaterialsResponseDTOImpl>
      get copyWith => throw _privateConstructorUsedError;
}
