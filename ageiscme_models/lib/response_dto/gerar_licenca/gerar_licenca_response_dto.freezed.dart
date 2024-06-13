// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'gerar_licenca_response_dto.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

GerarLicencaResponseDTO _$GerarLicencaResponseDTOFromJson(
    Map<String, dynamic> json) {
  return _GerarLicencaResponseDTO.fromJson(json);
}

/// @nodoc
mixin _$GerarLicencaResponseDTO {
  String? get licenca => throw _privateConstructorUsedError;
  set licenca(String? value) => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $GerarLicencaResponseDTOCopyWith<GerarLicencaResponseDTO> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $GerarLicencaResponseDTOCopyWith<$Res> {
  factory $GerarLicencaResponseDTOCopyWith(GerarLicencaResponseDTO value,
          $Res Function(GerarLicencaResponseDTO) then) =
      _$GerarLicencaResponseDTOCopyWithImpl<$Res, GerarLicencaResponseDTO>;
  @useResult
  $Res call({String? licenca});
}

/// @nodoc
class _$GerarLicencaResponseDTOCopyWithImpl<$Res,
        $Val extends GerarLicencaResponseDTO>
    implements $GerarLicencaResponseDTOCopyWith<$Res> {
  _$GerarLicencaResponseDTOCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? licenca = freezed,
  }) {
    return _then(_value.copyWith(
      licenca: freezed == licenca
          ? _value.licenca
          : licenca // ignore: cast_nullable_to_non_nullable
              as String?,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$GerarLicencaResponseDTOImplCopyWith<$Res>
    implements $GerarLicencaResponseDTOCopyWith<$Res> {
  factory _$$GerarLicencaResponseDTOImplCopyWith(
          _$GerarLicencaResponseDTOImpl value,
          $Res Function(_$GerarLicencaResponseDTOImpl) then) =
      __$$GerarLicencaResponseDTOImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({String? licenca});
}

/// @nodoc
class __$$GerarLicencaResponseDTOImplCopyWithImpl<$Res>
    extends _$GerarLicencaResponseDTOCopyWithImpl<$Res,
        _$GerarLicencaResponseDTOImpl>
    implements _$$GerarLicencaResponseDTOImplCopyWith<$Res> {
  __$$GerarLicencaResponseDTOImplCopyWithImpl(
      _$GerarLicencaResponseDTOImpl _value,
      $Res Function(_$GerarLicencaResponseDTOImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? licenca = freezed,
  }) {
    return _then(_$GerarLicencaResponseDTOImpl(
      licenca: freezed == licenca
          ? _value.licenca
          : licenca // ignore: cast_nullable_to_non_nullable
              as String?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$GerarLicencaResponseDTOImpl
    with DiagnosticableTreeMixin
    implements _GerarLicencaResponseDTO {
  _$GerarLicencaResponseDTOImpl({this.licenca});

  factory _$GerarLicencaResponseDTOImpl.fromJson(Map<String, dynamic> json) =>
      _$$GerarLicencaResponseDTOImplFromJson(json);

  @override
  String? licenca;

  @override
  String toString({DiagnosticLevel minLevel = DiagnosticLevel.info}) {
    return 'GerarLicencaResponseDTO(licenca: $licenca)';
  }

  @override
  void debugFillProperties(DiagnosticPropertiesBuilder properties) {
    super.debugFillProperties(properties);
    properties
      ..add(DiagnosticsProperty('type', 'GerarLicencaResponseDTO'))
      ..add(DiagnosticsProperty('licenca', licenca));
  }

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$GerarLicencaResponseDTOImplCopyWith<_$GerarLicencaResponseDTOImpl>
      get copyWith => __$$GerarLicencaResponseDTOImplCopyWithImpl<
          _$GerarLicencaResponseDTOImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$GerarLicencaResponseDTOImplToJson(
      this,
    );
  }
}

abstract class _GerarLicencaResponseDTO implements GerarLicencaResponseDTO {
  factory _GerarLicencaResponseDTO({String? licenca}) =
      _$GerarLicencaResponseDTOImpl;

  factory _GerarLicencaResponseDTO.fromJson(Map<String, dynamic> json) =
      _$GerarLicencaResponseDTOImpl.fromJson;

  @override
  String? get licenca;
  set licenca(String? value);
  @override
  @JsonKey(ignore: true)
  _$$GerarLicencaResponseDTOImplCopyWith<_$GerarLicencaResponseDTOImpl>
      get copyWith => throw _privateConstructorUsedError;
}
