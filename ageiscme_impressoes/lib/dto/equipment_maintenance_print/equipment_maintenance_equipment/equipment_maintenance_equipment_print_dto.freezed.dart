// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'equipment_maintenance_equipment_print_dto.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

EquipmentMaintenanceEquipmentPrintDTO
    _$EquipmentMaintenanceEquipmentPrintDTOFromJson(Map<String, dynamic> json) {
  return _EquipmentMaintenanceEquipmentPrintDTO.fromJson(json);
}

/// @nodoc
mixin _$EquipmentMaintenanceEquipmentPrintDTO {
  int get cod => throw _privateConstructorUsedError;
  set cod(int value) => throw _privateConstructorUsedError;
  String get name => throw _privateConstructorUsedError;
  set name(String value) => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $EquipmentMaintenanceEquipmentPrintDTOCopyWith<
          EquipmentMaintenanceEquipmentPrintDTO>
      get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $EquipmentMaintenanceEquipmentPrintDTOCopyWith<$Res> {
  factory $EquipmentMaintenanceEquipmentPrintDTOCopyWith(
          EquipmentMaintenanceEquipmentPrintDTO value,
          $Res Function(EquipmentMaintenanceEquipmentPrintDTO) then) =
      _$EquipmentMaintenanceEquipmentPrintDTOCopyWithImpl<$Res,
          EquipmentMaintenanceEquipmentPrintDTO>;
  @useResult
  $Res call({int cod, String name});
}

/// @nodoc
class _$EquipmentMaintenanceEquipmentPrintDTOCopyWithImpl<$Res,
        $Val extends EquipmentMaintenanceEquipmentPrintDTO>
    implements $EquipmentMaintenanceEquipmentPrintDTOCopyWith<$Res> {
  _$EquipmentMaintenanceEquipmentPrintDTOCopyWithImpl(this._value, this._then);

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
abstract class _$$EquipmentMaintenanceEquipmentPrintDTOImplCopyWith<$Res>
    implements $EquipmentMaintenanceEquipmentPrintDTOCopyWith<$Res> {
  factory _$$EquipmentMaintenanceEquipmentPrintDTOImplCopyWith(
          _$EquipmentMaintenanceEquipmentPrintDTOImpl value,
          $Res Function(_$EquipmentMaintenanceEquipmentPrintDTOImpl) then) =
      __$$EquipmentMaintenanceEquipmentPrintDTOImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({int cod, String name});
}

/// @nodoc
class __$$EquipmentMaintenanceEquipmentPrintDTOImplCopyWithImpl<$Res>
    extends _$EquipmentMaintenanceEquipmentPrintDTOCopyWithImpl<$Res,
        _$EquipmentMaintenanceEquipmentPrintDTOImpl>
    implements _$$EquipmentMaintenanceEquipmentPrintDTOImplCopyWith<$Res> {
  __$$EquipmentMaintenanceEquipmentPrintDTOImplCopyWithImpl(
      _$EquipmentMaintenanceEquipmentPrintDTOImpl _value,
      $Res Function(_$EquipmentMaintenanceEquipmentPrintDTOImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? cod = null,
    Object? name = null,
  }) {
    return _then(_$EquipmentMaintenanceEquipmentPrintDTOImpl(
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
class _$EquipmentMaintenanceEquipmentPrintDTOImpl
    with DiagnosticableTreeMixin
    implements _EquipmentMaintenanceEquipmentPrintDTO {
  _$EquipmentMaintenanceEquipmentPrintDTOImpl(
      {required this.cod, required this.name});

  factory _$EquipmentMaintenanceEquipmentPrintDTOImpl.fromJson(
          Map<String, dynamic> json) =>
      _$$EquipmentMaintenanceEquipmentPrintDTOImplFromJson(json);

  @override
  int cod;
  @override
  String name;

  @override
  String toString({DiagnosticLevel minLevel = DiagnosticLevel.info}) {
    return 'EquipmentMaintenanceEquipmentPrintDTO(cod: $cod, name: $name)';
  }

  @override
  void debugFillProperties(DiagnosticPropertiesBuilder properties) {
    super.debugFillProperties(properties);
    properties
      ..add(
          DiagnosticsProperty('type', 'EquipmentMaintenanceEquipmentPrintDTO'))
      ..add(DiagnosticsProperty('cod', cod))
      ..add(DiagnosticsProperty('name', name));
  }

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$EquipmentMaintenanceEquipmentPrintDTOImplCopyWith<
          _$EquipmentMaintenanceEquipmentPrintDTOImpl>
      get copyWith => __$$EquipmentMaintenanceEquipmentPrintDTOImplCopyWithImpl<
          _$EquipmentMaintenanceEquipmentPrintDTOImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$EquipmentMaintenanceEquipmentPrintDTOImplToJson(
      this,
    );
  }
}

abstract class _EquipmentMaintenanceEquipmentPrintDTO
    implements EquipmentMaintenanceEquipmentPrintDTO {
  factory _EquipmentMaintenanceEquipmentPrintDTO(
      {required int cod,
      required String name}) = _$EquipmentMaintenanceEquipmentPrintDTOImpl;

  factory _EquipmentMaintenanceEquipmentPrintDTO.fromJson(
          Map<String, dynamic> json) =
      _$EquipmentMaintenanceEquipmentPrintDTOImpl.fromJson;

  @override
  int get cod;
  set cod(int value);
  @override
  String get name;
  set name(String value);
  @override
  @JsonKey(ignore: true)
  _$$EquipmentMaintenanceEquipmentPrintDTOImplCopyWith<
          _$EquipmentMaintenanceEquipmentPrintDTOImpl>
      get copyWith => throw _privateConstructorUsedError;
}
