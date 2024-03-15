// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'equipment_maintenance_print_dto.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

EquipmentMaintenancePrintDTO _$EquipmentMaintenancePrintDTOFromJson(
    Map<String, dynamic> json) {
  return _EquipmentMaintenancePrintDTO.fromJson(json);
}

/// @nodoc
mixin _$EquipmentMaintenancePrintDTO {
  int get cod => throw _privateConstructorUsedError;
  set cod(int value) => throw _privateConstructorUsedError;
  EquipmentMaintenanceCompanyPrintDTO get company =>
      throw _privateConstructorUsedError;
  set company(EquipmentMaintenanceCompanyPrintDTO value) =>
      throw _privateConstructorUsedError;
  EquipmentMaintenanceEmployeerPrintDTO get employeer =>
      throw _privateConstructorUsedError;
  set employeer(EquipmentMaintenanceEmployeerPrintDTO value) =>
      throw _privateConstructorUsedError;
  DateTime get impressionTime => throw _privateConstructorUsedError;
  set impressionTime(DateTime value) => throw _privateConstructorUsedError;
  String get serviceName => throw _privateConstructorUsedError;
  set serviceName(String value) => throw _privateConstructorUsedError;
  EquipmentMaintenanceEquipmentPrintDTO? get equipment =>
      throw _privateConstructorUsedError;
  set equipment(EquipmentMaintenanceEquipmentPrintDTO? value) =>
      throw _privateConstructorUsedError;
  EquipmentMaintenanceItemPrintDTO? get item =>
      throw _privateConstructorUsedError;
  set item(EquipmentMaintenanceItemPrintDTO? value) =>
      throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $EquipmentMaintenancePrintDTOCopyWith<EquipmentMaintenancePrintDTO>
      get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $EquipmentMaintenancePrintDTOCopyWith<$Res> {
  factory $EquipmentMaintenancePrintDTOCopyWith(
          EquipmentMaintenancePrintDTO value,
          $Res Function(EquipmentMaintenancePrintDTO) then) =
      _$EquipmentMaintenancePrintDTOCopyWithImpl<$Res,
          EquipmentMaintenancePrintDTO>;
  @useResult
  $Res call(
      {int cod,
      EquipmentMaintenanceCompanyPrintDTO company,
      EquipmentMaintenanceEmployeerPrintDTO employeer,
      DateTime impressionTime,
      String serviceName,
      EquipmentMaintenanceEquipmentPrintDTO? equipment,
      EquipmentMaintenanceItemPrintDTO? item});

  $EquipmentMaintenanceCompanyPrintDTOCopyWith<$Res> get company;
  $EquipmentMaintenanceEmployeerPrintDTOCopyWith<$Res> get employeer;
  $EquipmentMaintenanceEquipmentPrintDTOCopyWith<$Res>? get equipment;
  $EquipmentMaintenanceItemPrintDTOCopyWith<$Res>? get item;
}

/// @nodoc
class _$EquipmentMaintenancePrintDTOCopyWithImpl<$Res,
        $Val extends EquipmentMaintenancePrintDTO>
    implements $EquipmentMaintenancePrintDTOCopyWith<$Res> {
  _$EquipmentMaintenancePrintDTOCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? cod = null,
    Object? company = null,
    Object? employeer = null,
    Object? impressionTime = null,
    Object? serviceName = null,
    Object? equipment = freezed,
    Object? item = freezed,
  }) {
    return _then(_value.copyWith(
      cod: null == cod
          ? _value.cod
          : cod // ignore: cast_nullable_to_non_nullable
              as int,
      company: null == company
          ? _value.company
          : company // ignore: cast_nullable_to_non_nullable
              as EquipmentMaintenanceCompanyPrintDTO,
      employeer: null == employeer
          ? _value.employeer
          : employeer // ignore: cast_nullable_to_non_nullable
              as EquipmentMaintenanceEmployeerPrintDTO,
      impressionTime: null == impressionTime
          ? _value.impressionTime
          : impressionTime // ignore: cast_nullable_to_non_nullable
              as DateTime,
      serviceName: null == serviceName
          ? _value.serviceName
          : serviceName // ignore: cast_nullable_to_non_nullable
              as String,
      equipment: freezed == equipment
          ? _value.equipment
          : equipment // ignore: cast_nullable_to_non_nullable
              as EquipmentMaintenanceEquipmentPrintDTO?,
      item: freezed == item
          ? _value.item
          : item // ignore: cast_nullable_to_non_nullable
              as EquipmentMaintenanceItemPrintDTO?,
    ) as $Val);
  }

  @override
  @pragma('vm:prefer-inline')
  $EquipmentMaintenanceCompanyPrintDTOCopyWith<$Res> get company {
    return $EquipmentMaintenanceCompanyPrintDTOCopyWith<$Res>(_value.company,
        (value) {
      return _then(_value.copyWith(company: value) as $Val);
    });
  }

  @override
  @pragma('vm:prefer-inline')
  $EquipmentMaintenanceEmployeerPrintDTOCopyWith<$Res> get employeer {
    return $EquipmentMaintenanceEmployeerPrintDTOCopyWith<$Res>(
        _value.employeer, (value) {
      return _then(_value.copyWith(employeer: value) as $Val);
    });
  }

  @override
  @pragma('vm:prefer-inline')
  $EquipmentMaintenanceEquipmentPrintDTOCopyWith<$Res>? get equipment {
    if (_value.equipment == null) {
      return null;
    }

    return $EquipmentMaintenanceEquipmentPrintDTOCopyWith<$Res>(
        _value.equipment!, (value) {
      return _then(_value.copyWith(equipment: value) as $Val);
    });
  }

  @override
  @pragma('vm:prefer-inline')
  $EquipmentMaintenanceItemPrintDTOCopyWith<$Res>? get item {
    if (_value.item == null) {
      return null;
    }

    return $EquipmentMaintenanceItemPrintDTOCopyWith<$Res>(_value.item!,
        (value) {
      return _then(_value.copyWith(item: value) as $Val);
    });
  }
}

/// @nodoc
abstract class _$$EquipmentMaintenancePrintDTOImplCopyWith<$Res>
    implements $EquipmentMaintenancePrintDTOCopyWith<$Res> {
  factory _$$EquipmentMaintenancePrintDTOImplCopyWith(
          _$EquipmentMaintenancePrintDTOImpl value,
          $Res Function(_$EquipmentMaintenancePrintDTOImpl) then) =
      __$$EquipmentMaintenancePrintDTOImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {int cod,
      EquipmentMaintenanceCompanyPrintDTO company,
      EquipmentMaintenanceEmployeerPrintDTO employeer,
      DateTime impressionTime,
      String serviceName,
      EquipmentMaintenanceEquipmentPrintDTO? equipment,
      EquipmentMaintenanceItemPrintDTO? item});

  @override
  $EquipmentMaintenanceCompanyPrintDTOCopyWith<$Res> get company;
  @override
  $EquipmentMaintenanceEmployeerPrintDTOCopyWith<$Res> get employeer;
  @override
  $EquipmentMaintenanceEquipmentPrintDTOCopyWith<$Res>? get equipment;
  @override
  $EquipmentMaintenanceItemPrintDTOCopyWith<$Res>? get item;
}

/// @nodoc
class __$$EquipmentMaintenancePrintDTOImplCopyWithImpl<$Res>
    extends _$EquipmentMaintenancePrintDTOCopyWithImpl<$Res,
        _$EquipmentMaintenancePrintDTOImpl>
    implements _$$EquipmentMaintenancePrintDTOImplCopyWith<$Res> {
  __$$EquipmentMaintenancePrintDTOImplCopyWithImpl(
      _$EquipmentMaintenancePrintDTOImpl _value,
      $Res Function(_$EquipmentMaintenancePrintDTOImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? cod = null,
    Object? company = null,
    Object? employeer = null,
    Object? impressionTime = null,
    Object? serviceName = null,
    Object? equipment = freezed,
    Object? item = freezed,
  }) {
    return _then(_$EquipmentMaintenancePrintDTOImpl(
      cod: null == cod
          ? _value.cod
          : cod // ignore: cast_nullable_to_non_nullable
              as int,
      company: null == company
          ? _value.company
          : company // ignore: cast_nullable_to_non_nullable
              as EquipmentMaintenanceCompanyPrintDTO,
      employeer: null == employeer
          ? _value.employeer
          : employeer // ignore: cast_nullable_to_non_nullable
              as EquipmentMaintenanceEmployeerPrintDTO,
      impressionTime: null == impressionTime
          ? _value.impressionTime
          : impressionTime // ignore: cast_nullable_to_non_nullable
              as DateTime,
      serviceName: null == serviceName
          ? _value.serviceName
          : serviceName // ignore: cast_nullable_to_non_nullable
              as String,
      equipment: freezed == equipment
          ? _value.equipment
          : equipment // ignore: cast_nullable_to_non_nullable
              as EquipmentMaintenanceEquipmentPrintDTO?,
      item: freezed == item
          ? _value.item
          : item // ignore: cast_nullable_to_non_nullable
              as EquipmentMaintenanceItemPrintDTO?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$EquipmentMaintenancePrintDTOImpl
    with DiagnosticableTreeMixin
    implements _EquipmentMaintenancePrintDTO {
  _$EquipmentMaintenancePrintDTOImpl(
      {required this.cod,
      required this.company,
      required this.employeer,
      required this.impressionTime,
      required this.serviceName,
      this.equipment,
      this.item});

  factory _$EquipmentMaintenancePrintDTOImpl.fromJson(
          Map<String, dynamic> json) =>
      _$$EquipmentMaintenancePrintDTOImplFromJson(json);

  @override
  int cod;
  @override
  EquipmentMaintenanceCompanyPrintDTO company;
  @override
  EquipmentMaintenanceEmployeerPrintDTO employeer;
  @override
  DateTime impressionTime;
  @override
  String serviceName;
  @override
  EquipmentMaintenanceEquipmentPrintDTO? equipment;
  @override
  EquipmentMaintenanceItemPrintDTO? item;

  @override
  String toString({DiagnosticLevel minLevel = DiagnosticLevel.info}) {
    return 'EquipmentMaintenancePrintDTO(cod: $cod, company: $company, employeer: $employeer, impressionTime: $impressionTime, serviceName: $serviceName, equipment: $equipment, item: $item)';
  }

  @override
  void debugFillProperties(DiagnosticPropertiesBuilder properties) {
    super.debugFillProperties(properties);
    properties
      ..add(DiagnosticsProperty('type', 'EquipmentMaintenancePrintDTO'))
      ..add(DiagnosticsProperty('cod', cod))
      ..add(DiagnosticsProperty('company', company))
      ..add(DiagnosticsProperty('employeer', employeer))
      ..add(DiagnosticsProperty('impressionTime', impressionTime))
      ..add(DiagnosticsProperty('serviceName', serviceName))
      ..add(DiagnosticsProperty('equipment', equipment))
      ..add(DiagnosticsProperty('item', item));
  }

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$EquipmentMaintenancePrintDTOImplCopyWith<
          _$EquipmentMaintenancePrintDTOImpl>
      get copyWith => __$$EquipmentMaintenancePrintDTOImplCopyWithImpl<
          _$EquipmentMaintenancePrintDTOImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$EquipmentMaintenancePrintDTOImplToJson(
      this,
    );
  }
}

abstract class _EquipmentMaintenancePrintDTO
    implements EquipmentMaintenancePrintDTO {
  factory _EquipmentMaintenancePrintDTO(
          {required int cod,
          required EquipmentMaintenanceCompanyPrintDTO company,
          required EquipmentMaintenanceEmployeerPrintDTO employeer,
          required DateTime impressionTime,
          required String serviceName,
          EquipmentMaintenanceEquipmentPrintDTO? equipment,
          EquipmentMaintenanceItemPrintDTO? item}) =
      _$EquipmentMaintenancePrintDTOImpl;

  factory _EquipmentMaintenancePrintDTO.fromJson(Map<String, dynamic> json) =
      _$EquipmentMaintenancePrintDTOImpl.fromJson;

  @override
  int get cod;
  set cod(int value);
  @override
  EquipmentMaintenanceCompanyPrintDTO get company;
  set company(EquipmentMaintenanceCompanyPrintDTO value);
  @override
  EquipmentMaintenanceEmployeerPrintDTO get employeer;
  set employeer(EquipmentMaintenanceEmployeerPrintDTO value);
  @override
  DateTime get impressionTime;
  set impressionTime(DateTime value);
  @override
  String get serviceName;
  set serviceName(String value);
  @override
  EquipmentMaintenanceEquipmentPrintDTO? get equipment;
  set equipment(EquipmentMaintenanceEquipmentPrintDTO? value);
  @override
  EquipmentMaintenanceItemPrintDTO? get item;
  set item(EquipmentMaintenanceItemPrintDTO? value);
  @override
  @JsonKey(ignore: true)
  _$$EquipmentMaintenancePrintDTOImplCopyWith<
          _$EquipmentMaintenancePrintDTOImpl>
      get copyWith => throw _privateConstructorUsedError;
}
