// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'kit_mesma_cor_response_dto.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

KitMesmaCorResponseDTO _$KitMesmaCorResponseDTOFromJson(
    Map<String, dynamic> json) {
  return _KitMesmaCorResponseDTO.fromJson(json);
}

/// @nodoc
mixin _$KitMesmaCorResponseDTO {
  List<KitMesmaCorKitResponseDTO> get kits =>
      throw _privateConstructorUsedError;
  set kits(List<KitMesmaCorKitResponseDTO> value) =>
      throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $KitMesmaCorResponseDTOCopyWith<KitMesmaCorResponseDTO> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $KitMesmaCorResponseDTOCopyWith<$Res> {
  factory $KitMesmaCorResponseDTOCopyWith(KitMesmaCorResponseDTO value,
          $Res Function(KitMesmaCorResponseDTO) then) =
      _$KitMesmaCorResponseDTOCopyWithImpl<$Res, KitMesmaCorResponseDTO>;
  @useResult
  $Res call({List<KitMesmaCorKitResponseDTO> kits});
}

/// @nodoc
class _$KitMesmaCorResponseDTOCopyWithImpl<$Res,
        $Val extends KitMesmaCorResponseDTO>
    implements $KitMesmaCorResponseDTOCopyWith<$Res> {
  _$KitMesmaCorResponseDTOCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? kits = null,
  }) {
    return _then(_value.copyWith(
      kits: null == kits
          ? _value.kits
          : kits // ignore: cast_nullable_to_non_nullable
              as List<KitMesmaCorKitResponseDTO>,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$KitMesmaCorResponseDTOImplCopyWith<$Res>
    implements $KitMesmaCorResponseDTOCopyWith<$Res> {
  factory _$$KitMesmaCorResponseDTOImplCopyWith(
          _$KitMesmaCorResponseDTOImpl value,
          $Res Function(_$KitMesmaCorResponseDTOImpl) then) =
      __$$KitMesmaCorResponseDTOImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({List<KitMesmaCorKitResponseDTO> kits});
}

/// @nodoc
class __$$KitMesmaCorResponseDTOImplCopyWithImpl<$Res>
    extends _$KitMesmaCorResponseDTOCopyWithImpl<$Res,
        _$KitMesmaCorResponseDTOImpl>
    implements _$$KitMesmaCorResponseDTOImplCopyWith<$Res> {
  __$$KitMesmaCorResponseDTOImplCopyWithImpl(
      _$KitMesmaCorResponseDTOImpl _value,
      $Res Function(_$KitMesmaCorResponseDTOImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? kits = null,
  }) {
    return _then(_$KitMesmaCorResponseDTOImpl(
      kits: null == kits
          ? _value.kits
          : kits // ignore: cast_nullable_to_non_nullable
              as List<KitMesmaCorKitResponseDTO>,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$KitMesmaCorResponseDTOImpl
    with DiagnosticableTreeMixin
    implements _KitMesmaCorResponseDTO {
  _$KitMesmaCorResponseDTOImpl({required this.kits});

  factory _$KitMesmaCorResponseDTOImpl.fromJson(Map<String, dynamic> json) =>
      _$$KitMesmaCorResponseDTOImplFromJson(json);

  @override
  List<KitMesmaCorKitResponseDTO> kits;

  @override
  String toString({DiagnosticLevel minLevel = DiagnosticLevel.info}) {
    return 'KitMesmaCorResponseDTO(kits: $kits)';
  }

  @override
  void debugFillProperties(DiagnosticPropertiesBuilder properties) {
    super.debugFillProperties(properties);
    properties
      ..add(DiagnosticsProperty('type', 'KitMesmaCorResponseDTO'))
      ..add(DiagnosticsProperty('kits', kits));
  }

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$KitMesmaCorResponseDTOImplCopyWith<_$KitMesmaCorResponseDTOImpl>
      get copyWith => __$$KitMesmaCorResponseDTOImplCopyWithImpl<
          _$KitMesmaCorResponseDTOImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$KitMesmaCorResponseDTOImplToJson(
      this,
    );
  }
}

abstract class _KitMesmaCorResponseDTO implements KitMesmaCorResponseDTO {
  factory _KitMesmaCorResponseDTO(
          {required List<KitMesmaCorKitResponseDTO> kits}) =
      _$KitMesmaCorResponseDTOImpl;

  factory _KitMesmaCorResponseDTO.fromJson(Map<String, dynamic> json) =
      _$KitMesmaCorResponseDTOImpl.fromJson;

  @override
  List<KitMesmaCorKitResponseDTO> get kits;
  set kits(List<KitMesmaCorKitResponseDTO> value);
  @override
  @JsonKey(ignore: true)
  _$$KitMesmaCorResponseDTOImplCopyWith<_$KitMesmaCorResponseDTOImpl>
      get copyWith => throw _privateConstructorUsedError;
}
