// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'equipment_maintenance_company_print_dto.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

EquipmentMaintenanceCompanyPrintDTO
    _$EquipmentMaintenanceCompanyPrintDTOFromJson(Map<String, dynamic> json) {
  return _EquipmentMaintenanceCompanyPrintDTO.fromJson(json);
}

/// @nodoc
mixin _$EquipmentMaintenanceCompanyPrintDTO {
  int get cod => throw _privateConstructorUsedError;
  set cod(int value) => throw _privateConstructorUsedError;
  String get name => throw _privateConstructorUsedError;
  set name(String value) => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $EquipmentMaintenanceCompanyPrintDTOCopyWith<
          EquipmentMaintenanceCompanyPrintDTO>
      get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $EquipmentMaintenanceCompanyPrintDTOCopyWith<$Res> {
  factory $EquipmentMaintenanceCompanyPrintDTOCopyWith(
          EquipmentMaintenanceCompanyPrintDTO value,
          $Res Function(EquipmentMaintenanceCompanyPrintDTO) then) =
      _$EquipmentMaintenanceCompanyPrintDTOCopyWithImpl<$Res,
          EquipmentMaintenanceCompanyPrintDTO>;
  @useResult
  $Res call({int cod, String name});
}

/// @nodoc
class _$EquipmentMaintenanceCompanyPrintDTOCopyWithImpl<$Res,
        $Val extends EquipmentMaintenanceCompanyPrintDTO>
    implements $EquipmentMaintenanceCompanyPrintDTOCopyWith<$Res> {
  _$EquipmentMaintenanceCompanyPrintDTOCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? cod = null,
    Object? name = null,
  }) {
    return _then(_value.copyWith(
      cod: null == cod
          ? _value.cod
          : cod // ignore: cast_nullable_to_non_nullable
              as int,
      name: null == name
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$EquipmentMaintenanceCompanyPrintDTOImplCopyWith<$Res>
    implements $EquipmentMaintenanceCompanyPrintDTOCopyWith<$Res> {
  factory _$$EquipmentMaintenanceCompanyPrintDTOImplCopyWith(
          _$EquipmentMaintenanceCompanyPrintDTOImpl value,
          $Res Function(_$EquipmentMaintenanceCompanyPrintDTOImpl) then) =
      __$$EquipmentMaintenanceCompanyPrintDTOImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({int cod, String name});
}

/// @nodoc
class __$$EquipmentMaintenanceCompanyPrintDTOImplCopyWithImpl<$Res>
    extends _$EquipmentMaintenanceCompanyPrintDTOCopyWithImpl<$Res,
        _$EquipmentMaintenanceCompanyPrintDTOImpl>
    implements _$$EquipmentMaintenanceCompanyPrintDTOImplCopyWith<$Res> {
  __$$EquipmentMaintenanceCompanyPrintDTOImplCopyWithImpl(
      _$EquipmentMaintenanceCompanyPrintDTOImpl _value,
      $Res Function(_$EquipmentMaintenanceCompanyPrintDTOImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? cod = null,
    Object? name = null,
  }) {
    return _then(_$EquipmentMaintenanceCompanyPrintDTOImpl(
      cod: null == cod
          ? _value.cod
          : cod // ignore: cast_nullable_to_non_nullable
              as int,
      name: null == name
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$EquipmentMaintenanceCompanyPrintDTOImpl
    with DiagnosticableTreeMixin
    implements _EquipmentMaintenanceCompanyPrintDTO {
  _$EquipmentMaintenanceCompanyPrintDTOImpl(
      {required this.cod, required this.name});

  factory _$EquipmentMaintenanceCompanyPrintDTOImpl.fromJson(
          Map<String, dynamic> json) =>
      _$$EquipmentMaintenanceCompanyPrintDTOImplFromJson(json);

  @override
  int cod;
  @override
  String name;

  @override
  String toString({DiagnosticLevel minLevel = DiagnosticLevel.info}) {
    return 'EquipmentMaintenanceCompanyPrintDTO(cod: $cod, name: $name)';
  }

  @override
  void debugFillProperties(DiagnosticPropertiesBuilder properties) {
    super.debugFillProperties(properties);
    properties
      ..add(DiagnosticsProperty('type', 'EquipmentMaintenanceCompanyPrintDTO'))
      ..add(DiagnosticsProperty('cod', cod))
      ..add(DiagnosticsProperty('name', name));
  }

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$EquipmentMaintenanceCompanyPrintDTOImplCopyWith<
          _$EquipmentMaintenanceCompanyPrintDTOImpl>
      get copyWith => __$$EquipmentMaintenanceCompanyPrintDTOImplCopyWithImpl<
          _$EquipmentMaintenanceCompanyPrintDTOImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$EquipmentMaintenanceCompanyPrintDTOImplToJson(
      this,
    );
  }
}

abstract class _EquipmentMaintenanceCompanyPrintDTO
    implements EquipmentMaintenanceCompanyPrintDTO {
  factory _EquipmentMaintenanceCompanyPrintDTO(
      {required int cod,
      required String name}) = _$EquipmentMaintenanceCompanyPrintDTOImpl;

  factory _EquipmentMaintenanceCompanyPrintDTO.fromJson(
          Map<String, dynamic> json) =
      _$EquipmentMaintenanceCompanyPrintDTOImpl.fromJson;

  @override
  int get cod;
  set cod(int value);
  @override
  String get name;
  set name(String value);
  @override
  @JsonKey(ignore: true)
  _$$EquipmentMaintenanceCompanyPrintDTOImplCopyWith<
          _$EquipmentMaintenanceCompanyPrintDTOImpl>
      get copyWith => throw _privateConstructorUsedError;
}
