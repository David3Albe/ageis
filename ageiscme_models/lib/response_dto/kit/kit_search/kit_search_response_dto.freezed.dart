// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'kit_search_response_dto.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

KitSearchResponseDTO _$KitSearchResponseDTOFromJson(Map<String, dynamic> json) {
  return _KitSearchResponseDTO.fromJson(json);
}

/// @nodoc
mixin _$KitSearchResponseDTO {
  List<KitSearchKitResponseDTO> get kits => throw _privateConstructorUsedError;
  set kits(List<KitSearchKitResponseDTO> value) =>
      throw _privateConstructorUsedError;
  Map<int, KitSearchDescritorResponseDTO> get descritores =>
      throw _privateConstructorUsedError;
  set descritores(Map<int, KitSearchDescritorResponseDTO> value) =>
      throw _privateConstructorUsedError;
  Map<int, KitSearchCorResponseDTO> get cores =>
      throw _privateConstructorUsedError;
  set cores(Map<int, KitSearchCorResponseDTO> value) =>
      throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $KitSearchResponseDTOCopyWith<KitSearchResponseDTO> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $KitSearchResponseDTOCopyWith<$Res> {
  factory $KitSearchResponseDTOCopyWith(KitSearchResponseDTO value,
          $Res Function(KitSearchResponseDTO) then) =
      _$KitSearchResponseDTOCopyWithImpl<$Res, KitSearchResponseDTO>;
  @useResult
  $Res call(
      {List<KitSearchKitResponseDTO> kits,
      Map<int, KitSearchDescritorResponseDTO> descritores,
      Map<int, KitSearchCorResponseDTO> cores});
}

/// @nodoc
class _$KitSearchResponseDTOCopyWithImpl<$Res,
        $Val extends KitSearchResponseDTO>
    implements $KitSearchResponseDTOCopyWith<$Res> {
  _$KitSearchResponseDTOCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? kits = null,
    Object? descritores = null,
    Object? cores = null,
  }) {
    return _then(_value.copyWith(
      kits: null == kits
          ? _value.kits
          : kits // ignore: cast_nullable_to_non_nullable
              as List<KitSearchKitResponseDTO>,
      descritores: null == descritores
          ? _value.descritores
          : descritores // ignore: cast_nullable_to_non_nullable
              as Map<int, KitSearchDescritorResponseDTO>,
      cores: null == cores
          ? _value.cores
          : cores // ignore: cast_nullable_to_non_nullable
              as Map<int, KitSearchCorResponseDTO>,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$KitSearchResponseDTOImplCopyWith<$Res>
    implements $KitSearchResponseDTOCopyWith<$Res> {
  factory _$$KitSearchResponseDTOImplCopyWith(_$KitSearchResponseDTOImpl value,
          $Res Function(_$KitSearchResponseDTOImpl) then) =
      __$$KitSearchResponseDTOImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {List<KitSearchKitResponseDTO> kits,
      Map<int, KitSearchDescritorResponseDTO> descritores,
      Map<int, KitSearchCorResponseDTO> cores});
}

/// @nodoc
class __$$KitSearchResponseDTOImplCopyWithImpl<$Res>
    extends _$KitSearchResponseDTOCopyWithImpl<$Res, _$KitSearchResponseDTOImpl>
    implements _$$KitSearchResponseDTOImplCopyWith<$Res> {
  __$$KitSearchResponseDTOImplCopyWithImpl(_$KitSearchResponseDTOImpl _value,
      $Res Function(_$KitSearchResponseDTOImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? kits = null,
    Object? descritores = null,
    Object? cores = null,
  }) {
    return _then(_$KitSearchResponseDTOImpl(
      kits: null == kits
          ? _value.kits
          : kits // ignore: cast_nullable_to_non_nullable
              as List<KitSearchKitResponseDTO>,
      descritores: null == descritores
          ? _value.descritores
          : descritores // ignore: cast_nullable_to_non_nullable
              as Map<int, KitSearchDescritorResponseDTO>,
      cores: null == cores
          ? _value.cores
          : cores // ignore: cast_nullable_to_non_nullable
              as Map<int, KitSearchCorResponseDTO>,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$KitSearchResponseDTOImpl
    with DiagnosticableTreeMixin
    implements _KitSearchResponseDTO {
  _$KitSearchResponseDTOImpl(
      {required this.kits, required this.descritores, required this.cores});

  factory _$KitSearchResponseDTOImpl.fromJson(Map<String, dynamic> json) =>
      _$$KitSearchResponseDTOImplFromJson(json);

  @override
  List<KitSearchKitResponseDTO> kits;
  @override
  Map<int, KitSearchDescritorResponseDTO> descritores;
  @override
  Map<int, KitSearchCorResponseDTO> cores;

  @override
  String toString({DiagnosticLevel minLevel = DiagnosticLevel.info}) {
    return 'KitSearchResponseDTO(kits: $kits, descritores: $descritores, cores: $cores)';
  }

  @override
  void debugFillProperties(DiagnosticPropertiesBuilder properties) {
    super.debugFillProperties(properties);
    properties
      ..add(DiagnosticsProperty('type', 'KitSearchResponseDTO'))
      ..add(DiagnosticsProperty('kits', kits))
      ..add(DiagnosticsProperty('descritores', descritores))
      ..add(DiagnosticsProperty('cores', cores));
  }

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$KitSearchResponseDTOImplCopyWith<_$KitSearchResponseDTOImpl>
      get copyWith =>
          __$$KitSearchResponseDTOImplCopyWithImpl<_$KitSearchResponseDTOImpl>(
              this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$KitSearchResponseDTOImplToJson(
      this,
    );
  }
}

abstract class _KitSearchResponseDTO implements KitSearchResponseDTO {
  factory _KitSearchResponseDTO(
          {required List<KitSearchKitResponseDTO> kits,
          required Map<int, KitSearchDescritorResponseDTO> descritores,
          required Map<int, KitSearchCorResponseDTO> cores}) =
      _$KitSearchResponseDTOImpl;

  factory _KitSearchResponseDTO.fromJson(Map<String, dynamic> json) =
      _$KitSearchResponseDTOImpl.fromJson;

  @override
  List<KitSearchKitResponseDTO> get kits;
  set kits(List<KitSearchKitResponseDTO> value);
  @override
  Map<int, KitSearchDescritorResponseDTO> get descritores;
  set descritores(Map<int, KitSearchDescritorResponseDTO> value);
  @override
  Map<int, KitSearchCorResponseDTO> get cores;
  set cores(Map<int, KitSearchCorResponseDTO> value);
  @override
  @JsonKey(ignore: true)
  _$$KitSearchResponseDTOImplCopyWith<_$KitSearchResponseDTOImpl>
      get copyWith => throw _privateConstructorUsedError;
}
