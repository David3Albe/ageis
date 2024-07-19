// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'kit_mesma_cor_kit_response_dto.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

KitMesmaCorKitResponseDTO _$KitMesmaCorKitResponseDTOFromJson(
    Map<String, dynamic> json) {
  return _KitMesmaCorKitResponseDTO.fromJson(json);
}

/// @nodoc
mixin _$KitMesmaCorKitResponseDTO {
  String get codBarra => throw _privateConstructorUsedError;
  set codBarra(String value) => throw _privateConstructorUsedError;
  String? get descricao => throw _privateConstructorUsedError;
  set descricao(String? value) => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $KitMesmaCorKitResponseDTOCopyWith<KitMesmaCorKitResponseDTO> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $KitMesmaCorKitResponseDTOCopyWith<$Res> {
  factory $KitMesmaCorKitResponseDTOCopyWith(KitMesmaCorKitResponseDTO value,
          $Res Function(KitMesmaCorKitResponseDTO) then) =
      _$KitMesmaCorKitResponseDTOCopyWithImpl<$Res, KitMesmaCorKitResponseDTO>;
  @useResult
  $Res call({String codBarra, String? descricao});
}

/// @nodoc
class _$KitMesmaCorKitResponseDTOCopyWithImpl<$Res,
        $Val extends KitMesmaCorKitResponseDTO>
    implements $KitMesmaCorKitResponseDTOCopyWith<$Res> {
  _$KitMesmaCorKitResponseDTOCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? codBarra = null,
    Object? descricao = freezed,
  }) {
    return _then(_value.copyWith(
      codBarra: null == codBarra
          ? _value.codBarra
          : codBarra // ignore: cast_nullable_to_non_nullable
              as String,
      descricao: freezed == descricao
          ? _value.descricao
          : descricao // ignore: cast_nullable_to_non_nullable
              as String?,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$KitMesmaCorKitResponseDTOImplCopyWith<$Res>
    implements $KitMesmaCorKitResponseDTOCopyWith<$Res> {
  factory _$$KitMesmaCorKitResponseDTOImplCopyWith(
          _$KitMesmaCorKitResponseDTOImpl value,
          $Res Function(_$KitMesmaCorKitResponseDTOImpl) then) =
      __$$KitMesmaCorKitResponseDTOImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({String codBarra, String? descricao});
}

/// @nodoc
class __$$KitMesmaCorKitResponseDTOImplCopyWithImpl<$Res>
    extends _$KitMesmaCorKitResponseDTOCopyWithImpl<$Res,
        _$KitMesmaCorKitResponseDTOImpl>
    implements _$$KitMesmaCorKitResponseDTOImplCopyWith<$Res> {
  __$$KitMesmaCorKitResponseDTOImplCopyWithImpl(
      _$KitMesmaCorKitResponseDTOImpl _value,
      $Res Function(_$KitMesmaCorKitResponseDTOImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? codBarra = null,
    Object? descricao = freezed,
  }) {
    return _then(_$KitMesmaCorKitResponseDTOImpl(
      codBarra: null == codBarra
          ? _value.codBarra
          : codBarra // ignore: cast_nullable_to_non_nullable
              as String,
      descricao: freezed == descricao
          ? _value.descricao
          : descricao // ignore: cast_nullable_to_non_nullable
              as String?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$KitMesmaCorKitResponseDTOImpl
    with DiagnosticableTreeMixin
    implements _KitMesmaCorKitResponseDTO {
  _$KitMesmaCorKitResponseDTOImpl({required this.codBarra, this.descricao});

  factory _$KitMesmaCorKitResponseDTOImpl.fromJson(Map<String, dynamic> json) =>
      _$$KitMesmaCorKitResponseDTOImplFromJson(json);

  @override
  String codBarra;
  @override
  String? descricao;

  @override
  String toString({DiagnosticLevel minLevel = DiagnosticLevel.info}) {
    return 'KitMesmaCorKitResponseDTO(codBarra: $codBarra, descricao: $descricao)';
  }

  @override
  void debugFillProperties(DiagnosticPropertiesBuilder properties) {
    super.debugFillProperties(properties);
    properties
      ..add(DiagnosticsProperty('type', 'KitMesmaCorKitResponseDTO'))
      ..add(DiagnosticsProperty('codBarra', codBarra))
      ..add(DiagnosticsProperty('descricao', descricao));
  }

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$KitMesmaCorKitResponseDTOImplCopyWith<_$KitMesmaCorKitResponseDTOImpl>
      get copyWith => __$$KitMesmaCorKitResponseDTOImplCopyWithImpl<
          _$KitMesmaCorKitResponseDTOImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$KitMesmaCorKitResponseDTOImplToJson(
      this,
    );
  }
}

abstract class _KitMesmaCorKitResponseDTO implements KitMesmaCorKitResponseDTO {
  factory _KitMesmaCorKitResponseDTO(
      {required String codBarra,
      String? descricao}) = _$KitMesmaCorKitResponseDTOImpl;

  factory _KitMesmaCorKitResponseDTO.fromJson(Map<String, dynamic> json) =
      _$KitMesmaCorKitResponseDTOImpl.fromJson;

  @override
  String get codBarra;
  set codBarra(String value);
  @override
  String? get descricao;
  set descricao(String? value);
  @override
  @JsonKey(ignore: true)
  _$$KitMesmaCorKitResponseDTOImplCopyWith<_$KitMesmaCorKitResponseDTOImpl>
      get copyWith => throw _privateConstructorUsedError;
}
