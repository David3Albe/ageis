// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'equipment_maintenance_employeer_print_dto.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

EquipmentMaintenanceEmployeerPrintDTO
    _$EquipmentMaintenanceEmployeerPrintDTOFromJson(Map<String, dynamic> json) {
  return _EquipmentMaintenanceEmployeerPrintDTO.fromJson(json);
}

/// @nodoc
mixin _$EquipmentMaintenanceEmployeerPrintDTO {
  String get name => throw _privateConstructorUsedError;
  set name(String value) => throw _privateConstructorUsedError;
  String? get doc => throw _privateConstructorUsedError;
  set doc(String? value) => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $EquipmentMaintenanceEmployeerPrintDTOCopyWith<
          EquipmentMaintenanceEmployeerPrintDTO>
      get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $EquipmentMaintenanceEmployeerPrintDTOCopyWith<$Res> {
  factory $EquipmentMaintenanceEmployeerPrintDTOCopyWith(
          EquipmentMaintenanceEmployeerPrintDTO value,
          $Res Function(EquipmentMaintenanceEmployeerPrintDTO) then) =
      _$EquipmentMaintenanceEmployeerPrintDTOCopyWithImpl<$Res,
          EquipmentMaintenanceEmployeerPrintDTO>;
  @useResult
  $Res call({String name, String? doc});
}

/// @nodoc
class _$EquipmentMaintenanceEmployeerPrintDTOCopyWithImpl<$Res,
        $Val extends EquipmentMaintenanceEmployeerPrintDTO>
    implements $EquipmentMaintenanceEmployeerPrintDTOCopyWith<$Res> {
  _$EquipmentMaintenanceEmployeerPrintDTOCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? name = null,
    Object? doc = freezed,
  }) {
    return _then(_value.copyWith(
      name: null == name
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String,
      doc: freezed == doc
          ? _value.doc
          : doc // ignore: cast_nullable_to_non_nullable
              as String?,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$EquipmentMaintenanceEmployeerPrintDTOImplCopyWith<$Res>
    implements $EquipmentMaintenanceEmployeerPrintDTOCopyWith<$Res> {
  factory _$$EquipmentMaintenanceEmployeerPrintDTOImplCopyWith(
          _$EquipmentMaintenanceEmployeerPrintDTOImpl value,
          $Res Function(_$EquipmentMaintenanceEmployeerPrintDTOImpl) then) =
      __$$EquipmentMaintenanceEmployeerPrintDTOImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({String name, String? doc});
}

/// @nodoc
class __$$EquipmentMaintenanceEmployeerPrintDTOImplCopyWithImpl<$Res>
    extends _$EquipmentMaintenanceEmployeerPrintDTOCopyWithImpl<$Res,
        _$EquipmentMaintenanceEmployeerPrintDTOImpl>
    implements _$$EquipmentMaintenanceEmployeerPrintDTOImplCopyWith<$Res> {
  __$$EquipmentMaintenanceEmployeerPrintDTOImplCopyWithImpl(
      _$EquipmentMaintenanceEmployeerPrintDTOImpl _value,
      $Res Function(_$EquipmentMaintenanceEmployeerPrintDTOImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? name = null,
    Object? doc = freezed,
  }) {
    return _then(_$EquipmentMaintenanceEmployeerPrintDTOImpl(
      name: null == name
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String,
      doc: freezed == doc
          ? _value.doc
          : doc // ignore: cast_nullable_to_non_nullable
              as String?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$EquipmentMaintenanceEmployeerPrintDTOImpl
    with DiagnosticableTreeMixin
    implements _EquipmentMaintenanceEmployeerPrintDTO {
  _$EquipmentMaintenanceEmployeerPrintDTOImpl({required this.name, this.doc});

  factory _$EquipmentMaintenanceEmployeerPrintDTOImpl.fromJson(
          Map<String, dynamic> json) =>
      _$$EquipmentMaintenanceEmployeerPrintDTOImplFromJson(json);

  @override
  String name;
  @override
  String? doc;

  @override
  String toString({DiagnosticLevel minLevel = DiagnosticLevel.info}) {
    return 'EquipmentMaintenanceEmployeerPrintDTO(name: $name, doc: $doc)';
  }

  @override
  void debugFillProperties(DiagnosticPropertiesBuilder properties) {
    super.debugFillProperties(properties);
    properties
      ..add(
          DiagnosticsProperty('type', 'EquipmentMaintenanceEmployeerPrintDTO'))
      ..add(DiagnosticsProperty('name', name))
      ..add(DiagnosticsProperty('doc', doc));
  }

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$EquipmentMaintenanceEmployeerPrintDTOImplCopyWith<
          _$EquipmentMaintenanceEmployeerPrintDTOImpl>
      get copyWith => __$$EquipmentMaintenanceEmployeerPrintDTOImplCopyWithImpl<
          _$EquipmentMaintenanceEmployeerPrintDTOImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$EquipmentMaintenanceEmployeerPrintDTOImplToJson(
      this,
    );
  }
}

abstract class _EquipmentMaintenanceEmployeerPrintDTO
    implements EquipmentMaintenanceEmployeerPrintDTO {
  factory _EquipmentMaintenanceEmployeerPrintDTO(
      {required String name,
      String? doc}) = _$EquipmentMaintenanceEmployeerPrintDTOImpl;

  factory _EquipmentMaintenanceEmployeerPrintDTO.fromJson(
          Map<String, dynamic> json) =
      _$EquipmentMaintenanceEmployeerPrintDTOImpl.fromJson;

  @override
  String get name;
  set name(String value);
  @override
  String? get doc;
  set doc(String? value);
  @override
  @JsonKey(ignore: true)
  _$$EquipmentMaintenanceEmployeerPrintDTOImplCopyWith<
          _$EquipmentMaintenanceEmployeerPrintDTOImpl>
      get copyWith => throw _privateConstructorUsedError;
}
