// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'epi_delivery_epi_print_dto.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

EpiDeliveryEpiPrintDTO _$EpiDeliveryEpiPrintDTOFromJson(
    Map<String, dynamic> json) {
  return _EpiDeliveryEpiPrintDTO.fromJson(json);
}

/// @nodoc
mixin _$EpiDeliveryEpiPrintDTO {
  String get description => throw _privateConstructorUsedError;
  set description(String value) => throw _privateConstructorUsedError;
  String? get CANumber => throw _privateConstructorUsedError;
  set CANumber(String? value) => throw _privateConstructorUsedError;
  DateTime? get validity => throw _privateConstructorUsedError;
  set validity(DateTime? value) => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $EpiDeliveryEpiPrintDTOCopyWith<EpiDeliveryEpiPrintDTO> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $EpiDeliveryEpiPrintDTOCopyWith<$Res> {
  factory $EpiDeliveryEpiPrintDTOCopyWith(EpiDeliveryEpiPrintDTO value,
          $Res Function(EpiDeliveryEpiPrintDTO) then) =
      _$EpiDeliveryEpiPrintDTOCopyWithImpl<$Res, EpiDeliveryEpiPrintDTO>;
  @useResult
  $Res call({String description, String? CANumber, DateTime? validity});
}

/// @nodoc
class _$EpiDeliveryEpiPrintDTOCopyWithImpl<$Res,
        $Val extends EpiDeliveryEpiPrintDTO>
    implements $EpiDeliveryEpiPrintDTOCopyWith<$Res> {
  _$EpiDeliveryEpiPrintDTOCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? description = null,
    Object? CANumber = freezed,
    Object? validity = freezed,
  }) {
    return _then(_value.copyWith(
      description: null == description
          ? _value.description
          : description // ignore: cast_nullable_to_non_nullable
              as String,
      CANumber: freezed == CANumber
          ? _value.CANumber
          : CANumber // ignore: cast_nullable_to_non_nullable
              as String?,
      validity: freezed == validity
          ? _value.validity
          : validity // ignore: cast_nullable_to_non_nullable
              as DateTime?,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$EpiDeliveryEpiPrintDTOImplCopyWith<$Res>
    implements $EpiDeliveryEpiPrintDTOCopyWith<$Res> {
  factory _$$EpiDeliveryEpiPrintDTOImplCopyWith(
          _$EpiDeliveryEpiPrintDTOImpl value,
          $Res Function(_$EpiDeliveryEpiPrintDTOImpl) then) =
      __$$EpiDeliveryEpiPrintDTOImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({String description, String? CANumber, DateTime? validity});
}

/// @nodoc
class __$$EpiDeliveryEpiPrintDTOImplCopyWithImpl<$Res>
    extends _$EpiDeliveryEpiPrintDTOCopyWithImpl<$Res,
        _$EpiDeliveryEpiPrintDTOImpl>
    implements _$$EpiDeliveryEpiPrintDTOImplCopyWith<$Res> {
  __$$EpiDeliveryEpiPrintDTOImplCopyWithImpl(
      _$EpiDeliveryEpiPrintDTOImpl _value,
      $Res Function(_$EpiDeliveryEpiPrintDTOImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? description = null,
    Object? CANumber = freezed,
    Object? validity = freezed,
  }) {
    return _then(_$EpiDeliveryEpiPrintDTOImpl(
      description: null == description
          ? _value.description
          : description // ignore: cast_nullable_to_non_nullable
              as String,
      CANumber: freezed == CANumber
          ? _value.CANumber
          : CANumber // ignore: cast_nullable_to_non_nullable
              as String?,
      validity: freezed == validity
          ? _value.validity
          : validity // ignore: cast_nullable_to_non_nullable
              as DateTime?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$EpiDeliveryEpiPrintDTOImpl
    with DiagnosticableTreeMixin
    implements _EpiDeliveryEpiPrintDTO {
  _$EpiDeliveryEpiPrintDTOImpl(
      {required this.description, this.CANumber, this.validity});

  factory _$EpiDeliveryEpiPrintDTOImpl.fromJson(Map<String, dynamic> json) =>
      _$$EpiDeliveryEpiPrintDTOImplFromJson(json);

  @override
  String description;
  @override
  String? CANumber;
  @override
  DateTime? validity;

  @override
  String toString({DiagnosticLevel minLevel = DiagnosticLevel.info}) {
    return 'EpiDeliveryEpiPrintDTO(description: $description, CANumber: $CANumber, validity: $validity)';
  }

  @override
  void debugFillProperties(DiagnosticPropertiesBuilder properties) {
    super.debugFillProperties(properties);
    properties
      ..add(DiagnosticsProperty('type', 'EpiDeliveryEpiPrintDTO'))
      ..add(DiagnosticsProperty('description', description))
      ..add(DiagnosticsProperty('CANumber', CANumber))
      ..add(DiagnosticsProperty('validity', validity));
  }

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$EpiDeliveryEpiPrintDTOImplCopyWith<_$EpiDeliveryEpiPrintDTOImpl>
      get copyWith => __$$EpiDeliveryEpiPrintDTOImplCopyWithImpl<
          _$EpiDeliveryEpiPrintDTOImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$EpiDeliveryEpiPrintDTOImplToJson(
      this,
    );
  }
}

abstract class _EpiDeliveryEpiPrintDTO implements EpiDeliveryEpiPrintDTO {
  factory _EpiDeliveryEpiPrintDTO(
      {required String description,
      String? CANumber,
      DateTime? validity}) = _$EpiDeliveryEpiPrintDTOImpl;

  factory _EpiDeliveryEpiPrintDTO.fromJson(Map<String, dynamic> json) =
      _$EpiDeliveryEpiPrintDTOImpl.fromJson;

  @override
  String get description;
  set description(String value);
  @override
  String? get CANumber;
  set CANumber(String? value);
  @override
  DateTime? get validity;
  set validity(DateTime? value);
  @override
  @JsonKey(ignore: true)
  _$$EpiDeliveryEpiPrintDTOImplCopyWith<_$EpiDeliveryEpiPrintDTOImpl>
      get copyWith => throw _privateConstructorUsedError;
}
