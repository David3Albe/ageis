// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'equipment_maintenance_item_print_dto.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

EquipmentMaintenanceItemPrintDTO _$EquipmentMaintenanceItemPrintDTOFromJson(
    Map<String, dynamic> json) {
  return _EquipmentMaintenanceItemPrintDTO.fromJson(json);
}

/// @nodoc
mixin _$EquipmentMaintenanceItemPrintDTO {
  int get cod => throw _privateConstructorUsedError;
  set cod(int value) => throw _privateConstructorUsedError;
  String get name => throw _privateConstructorUsedError;
  set name(String value) => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $EquipmentMaintenanceItemPrintDTOCopyWith<EquipmentMaintenanceItemPrintDTO>
      get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $EquipmentMaintenanceItemPrintDTOCopyWith<$Res> {
  factory $EquipmentMaintenanceItemPrintDTOCopyWith(
          EquipmentMaintenanceItemPrintDTO value,
          $Res Function(EquipmentMaintenanceItemPrintDTO) then) =
      _$EquipmentMaintenanceItemPrintDTOCopyWithImpl<$Res,
          EquipmentMaintenanceItemPrintDTO>;
  @useResult
  $Res call({int cod, String name});
}

/// @nodoc
class _$EquipmentMaintenanceItemPrintDTOCopyWithImpl<$Res,
        $Val extends EquipmentMaintenanceItemPrintDTO>
    implements $EquipmentMaintenanceItemPrintDTOCopyWith<$Res> {
  _$EquipmentMaintenanceItemPrintDTOCopyWithImpl(this._value, this._then);

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
abstract class _$$EquipmentMaintenanceItemPrintDTOImplCopyWith<$Res>
    implements $EquipmentMaintenanceItemPrintDTOCopyWith<$Res> {
  factory _$$EquipmentMaintenanceItemPrintDTOImplCopyWith(
          _$EquipmentMaintenanceItemPrintDTOImpl value,
          $Res Function(_$EquipmentMaintenanceItemPrintDTOImpl) then) =
      __$$EquipmentMaintenanceItemPrintDTOImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({int cod, String name});
}

/// @nodoc
class __$$EquipmentMaintenanceItemPrintDTOImplCopyWithImpl<$Res>
    extends _$EquipmentMaintenanceItemPrintDTOCopyWithImpl<$Res,
        _$EquipmentMaintenanceItemPrintDTOImpl>
    implements _$$EquipmentMaintenanceItemPrintDTOImplCopyWith<$Res> {
  __$$EquipmentMaintenanceItemPrintDTOImplCopyWithImpl(
      _$EquipmentMaintenanceItemPrintDTOImpl _value,
      $Res Function(_$EquipmentMaintenanceItemPrintDTOImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? cod = null,
    Object? name = null,
  }) {
    return _then(_$EquipmentMaintenanceItemPrintDTOImpl(
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
class _$EquipmentMaintenanceItemPrintDTOImpl
    with DiagnosticableTreeMixin
    implements _EquipmentMaintenanceItemPrintDTO {
  _$EquipmentMaintenanceItemPrintDTOImpl(
      {required this.cod, required this.name});

  factory _$EquipmentMaintenanceItemPrintDTOImpl.fromJson(
          Map<String, dynamic> json) =>
      _$$EquipmentMaintenanceItemPrintDTOImplFromJson(json);

  @override
  int cod;
  @override
  String name;

  @override
  String toString({DiagnosticLevel minLevel = DiagnosticLevel.info}) {
    return 'EquipmentMaintenanceItemPrintDTO(cod: $cod, name: $name)';
  }

  @override
  void debugFillProperties(DiagnosticPropertiesBuilder properties) {
    super.debugFillProperties(properties);
    properties
      ..add(DiagnosticsProperty('type', 'EquipmentMaintenanceItemPrintDTO'))
      ..add(DiagnosticsProperty('cod', cod))
      ..add(DiagnosticsProperty('name', name));
  }

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$EquipmentMaintenanceItemPrintDTOImplCopyWith<
          _$EquipmentMaintenanceItemPrintDTOImpl>
      get copyWith => __$$EquipmentMaintenanceItemPrintDTOImplCopyWithImpl<
          _$EquipmentMaintenanceItemPrintDTOImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$EquipmentMaintenanceItemPrintDTOImplToJson(
      this,
    );
  }
}

abstract class _EquipmentMaintenanceItemPrintDTO
    implements EquipmentMaintenanceItemPrintDTO {
  factory _EquipmentMaintenanceItemPrintDTO(
      {required int cod,
      required String name}) = _$EquipmentMaintenanceItemPrintDTOImpl;

  factory _EquipmentMaintenanceItemPrintDTO.fromJson(
          Map<String, dynamic> json) =
      _$EquipmentMaintenanceItemPrintDTOImpl.fromJson;

  @override
  int get cod;
  set cod(int value);
  @override
  String get name;
  set name(String value);
  @override
  @JsonKey(ignore: true)
  _$$EquipmentMaintenanceItemPrintDTOImplCopyWith<
          _$EquipmentMaintenanceItemPrintDTOImpl>
      get copyWith => throw _privateConstructorUsedError;
}
