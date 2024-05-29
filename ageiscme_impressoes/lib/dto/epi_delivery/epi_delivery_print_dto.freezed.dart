// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'epi_delivery_print_dto.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

EpiDeliveryPrintDTO _$EpiDeliveryPrintDTOFromJson(Map<String, dynamic> json) {
  return _EpiDeliveryPrintDTO.fromJson(json);
}

/// @nodoc
mixin _$EpiDeliveryPrintDTO {
  String get instituition => throw _privateConstructorUsedError;
  set instituition(String value) => throw _privateConstructorUsedError;
  String get userName => throw _privateConstructorUsedError;
  set userName(String value) => throw _privateConstructorUsedError;
  List<EpiDeliveryEpiPrintDTO> get epis => throw _privateConstructorUsedError;
  set epis(List<EpiDeliveryEpiPrintDTO> value) =>
      throw _privateConstructorUsedError;
  String? get userDoc => throw _privateConstructorUsedError;
  set userDoc(String? value) => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $EpiDeliveryPrintDTOCopyWith<EpiDeliveryPrintDTO> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $EpiDeliveryPrintDTOCopyWith<$Res> {
  factory $EpiDeliveryPrintDTOCopyWith(
          EpiDeliveryPrintDTO value, $Res Function(EpiDeliveryPrintDTO) then) =
      _$EpiDeliveryPrintDTOCopyWithImpl<$Res, EpiDeliveryPrintDTO>;
  @useResult
  $Res call(
      {String instituition,
      String userName,
      List<EpiDeliveryEpiPrintDTO> epis,
      String? userDoc});
}

/// @nodoc
class _$EpiDeliveryPrintDTOCopyWithImpl<$Res, $Val extends EpiDeliveryPrintDTO>
    implements $EpiDeliveryPrintDTOCopyWith<$Res> {
  _$EpiDeliveryPrintDTOCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? instituition = null,
    Object? userName = null,
    Object? epis = null,
    Object? userDoc = freezed,
  }) {
    return _then(_value.copyWith(
      instituition: null == instituition
          ? _value.instituition
          : instituition // ignore: cast_nullable_to_non_nullable
              as String,
      userName: null == userName
          ? _value.userName
          : userName // ignore: cast_nullable_to_non_nullable
              as String,
      epis: null == epis
          ? _value.epis
          : epis // ignore: cast_nullable_to_non_nullable
              as List<EpiDeliveryEpiPrintDTO>,
      userDoc: freezed == userDoc
          ? _value.userDoc
          : userDoc // ignore: cast_nullable_to_non_nullable
              as String?,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$EpiDeliveryPrintDTOImplCopyWith<$Res>
    implements $EpiDeliveryPrintDTOCopyWith<$Res> {
  factory _$$EpiDeliveryPrintDTOImplCopyWith(_$EpiDeliveryPrintDTOImpl value,
          $Res Function(_$EpiDeliveryPrintDTOImpl) then) =
      __$$EpiDeliveryPrintDTOImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {String instituition,
      String userName,
      List<EpiDeliveryEpiPrintDTO> epis,
      String? userDoc});
}

/// @nodoc
class __$$EpiDeliveryPrintDTOImplCopyWithImpl<$Res>
    extends _$EpiDeliveryPrintDTOCopyWithImpl<$Res, _$EpiDeliveryPrintDTOImpl>
    implements _$$EpiDeliveryPrintDTOImplCopyWith<$Res> {
  __$$EpiDeliveryPrintDTOImplCopyWithImpl(_$EpiDeliveryPrintDTOImpl _value,
      $Res Function(_$EpiDeliveryPrintDTOImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? instituition = null,
    Object? userName = null,
    Object? epis = null,
    Object? userDoc = freezed,
  }) {
    return _then(_$EpiDeliveryPrintDTOImpl(
      instituition: null == instituition
          ? _value.instituition
          : instituition // ignore: cast_nullable_to_non_nullable
              as String,
      userName: null == userName
          ? _value.userName
          : userName // ignore: cast_nullable_to_non_nullable
              as String,
      epis: null == epis
          ? _value.epis
          : epis // ignore: cast_nullable_to_non_nullable
              as List<EpiDeliveryEpiPrintDTO>,
      userDoc: freezed == userDoc
          ? _value.userDoc
          : userDoc // ignore: cast_nullable_to_non_nullable
              as String?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$EpiDeliveryPrintDTOImpl
    with DiagnosticableTreeMixin
    implements _EpiDeliveryPrintDTO {
  _$EpiDeliveryPrintDTOImpl(
      {required this.instituition,
      required this.userName,
      required this.epis,
      this.userDoc});

  factory _$EpiDeliveryPrintDTOImpl.fromJson(Map<String, dynamic> json) =>
      _$$EpiDeliveryPrintDTOImplFromJson(json);

  @override
  String instituition;
  @override
  String userName;
  @override
  List<EpiDeliveryEpiPrintDTO> epis;
  @override
  String? userDoc;

  @override
  String toString({DiagnosticLevel minLevel = DiagnosticLevel.info}) {
    return 'EpiDeliveryPrintDTO(instituition: $instituition, userName: $userName, epis: $epis, userDoc: $userDoc)';
  }

  @override
  void debugFillProperties(DiagnosticPropertiesBuilder properties) {
    super.debugFillProperties(properties);
    properties
      ..add(DiagnosticsProperty('type', 'EpiDeliveryPrintDTO'))
      ..add(DiagnosticsProperty('instituition', instituition))
      ..add(DiagnosticsProperty('userName', userName))
      ..add(DiagnosticsProperty('epis', epis))
      ..add(DiagnosticsProperty('userDoc', userDoc));
  }

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$EpiDeliveryPrintDTOImplCopyWith<_$EpiDeliveryPrintDTOImpl> get copyWith =>
      __$$EpiDeliveryPrintDTOImplCopyWithImpl<_$EpiDeliveryPrintDTOImpl>(
          this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$EpiDeliveryPrintDTOImplToJson(
      this,
    );
  }
}

abstract class _EpiDeliveryPrintDTO implements EpiDeliveryPrintDTO {
  factory _EpiDeliveryPrintDTO(
      {required String instituition,
      required String userName,
      required List<EpiDeliveryEpiPrintDTO> epis,
      String? userDoc}) = _$EpiDeliveryPrintDTOImpl;

  factory _EpiDeliveryPrintDTO.fromJson(Map<String, dynamic> json) =
      _$EpiDeliveryPrintDTOImpl.fromJson;

  @override
  String get instituition;
  set instituition(String value);
  @override
  String get userName;
  set userName(String value);
  @override
  List<EpiDeliveryEpiPrintDTO> get epis;
  set epis(List<EpiDeliveryEpiPrintDTO> value);
  @override
  String? get userDoc;
  set userDoc(String? value);
  @override
  @JsonKey(ignore: true)
  _$$EpiDeliveryPrintDTOImplCopyWith<_$EpiDeliveryPrintDTOImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
