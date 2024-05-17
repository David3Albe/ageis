// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'training_record_print_dto.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

TrainingRecordPrintDTO _$TrainingRecordPrintDTOFromJson(
    Map<String, dynamic> json) {
  return _TrainingRecordPrintDTO.fromJson(json);
}

/// @nodoc
mixin _$TrainingRecordPrintDTO {
  String get name => throw _privateConstructorUsedError;
  set name(String value) => throw _privateConstructorUsedError;
  List<TrainingRecordUserPrintDTO> get users =>
      throw _privateConstructorUsedError;
  set users(List<TrainingRecordUserPrintDTO> value) =>
      throw _privateConstructorUsedError;
  String? get description => throw _privateConstructorUsedError;
  set description(String? value) => throw _privateConstructorUsedError;
  String? get entity => throw _privateConstructorUsedError;
  set entity(String? value) => throw _privateConstructorUsedError;
  DateTime? get date => throw _privateConstructorUsedError;
  set date(DateTime? value) => throw _privateConstructorUsedError;
  double? get workload => throw _privateConstructorUsedError;
  set workload(double? value) => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $TrainingRecordPrintDTOCopyWith<TrainingRecordPrintDTO> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $TrainingRecordPrintDTOCopyWith<$Res> {
  factory $TrainingRecordPrintDTOCopyWith(TrainingRecordPrintDTO value,
          $Res Function(TrainingRecordPrintDTO) then) =
      _$TrainingRecordPrintDTOCopyWithImpl<$Res, TrainingRecordPrintDTO>;
  @useResult
  $Res call(
      {String name,
      List<TrainingRecordUserPrintDTO> users,
      String? description,
      String? entity,
      DateTime? date,
      double? workload});
}

/// @nodoc
class _$TrainingRecordPrintDTOCopyWithImpl<$Res,
        $Val extends TrainingRecordPrintDTO>
    implements $TrainingRecordPrintDTOCopyWith<$Res> {
  _$TrainingRecordPrintDTOCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? name = null,
    Object? users = null,
    Object? description = freezed,
    Object? entity = freezed,
    Object? date = freezed,
    Object? workload = freezed,
  }) {
    return _then(_value.copyWith(
      name: null == name
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String,
      users: null == users
          ? _value.users
          : users // ignore: cast_nullable_to_non_nullable
              as List<TrainingRecordUserPrintDTO>,
      description: freezed == description
          ? _value.description
          : description // ignore: cast_nullable_to_non_nullable
              as String?,
      entity: freezed == entity
          ? _value.entity
          : entity // ignore: cast_nullable_to_non_nullable
              as String?,
      date: freezed == date
          ? _value.date
          : date // ignore: cast_nullable_to_non_nullable
              as DateTime?,
      workload: freezed == workload
          ? _value.workload
          : workload // ignore: cast_nullable_to_non_nullable
              as double?,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$TrainingRecordPrintDTOImplCopyWith<$Res>
    implements $TrainingRecordPrintDTOCopyWith<$Res> {
  factory _$$TrainingRecordPrintDTOImplCopyWith(
          _$TrainingRecordPrintDTOImpl value,
          $Res Function(_$TrainingRecordPrintDTOImpl) then) =
      __$$TrainingRecordPrintDTOImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {String name,
      List<TrainingRecordUserPrintDTO> users,
      String? description,
      String? entity,
      DateTime? date,
      double? workload});
}

/// @nodoc
class __$$TrainingRecordPrintDTOImplCopyWithImpl<$Res>
    extends _$TrainingRecordPrintDTOCopyWithImpl<$Res,
        _$TrainingRecordPrintDTOImpl>
    implements _$$TrainingRecordPrintDTOImplCopyWith<$Res> {
  __$$TrainingRecordPrintDTOImplCopyWithImpl(
      _$TrainingRecordPrintDTOImpl _value,
      $Res Function(_$TrainingRecordPrintDTOImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? name = null,
    Object? users = null,
    Object? description = freezed,
    Object? entity = freezed,
    Object? date = freezed,
    Object? workload = freezed,
  }) {
    return _then(_$TrainingRecordPrintDTOImpl(
      name: null == name
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String,
      users: null == users
          ? _value.users
          : users // ignore: cast_nullable_to_non_nullable
              as List<TrainingRecordUserPrintDTO>,
      description: freezed == description
          ? _value.description
          : description // ignore: cast_nullable_to_non_nullable
              as String?,
      entity: freezed == entity
          ? _value.entity
          : entity // ignore: cast_nullable_to_non_nullable
              as String?,
      date: freezed == date
          ? _value.date
          : date // ignore: cast_nullable_to_non_nullable
              as DateTime?,
      workload: freezed == workload
          ? _value.workload
          : workload // ignore: cast_nullable_to_non_nullable
              as double?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$TrainingRecordPrintDTOImpl
    with DiagnosticableTreeMixin
    implements _TrainingRecordPrintDTO {
  _$TrainingRecordPrintDTOImpl(
      {required this.name,
      required this.users,
      this.description,
      this.entity,
      this.date,
      this.workload});

  factory _$TrainingRecordPrintDTOImpl.fromJson(Map<String, dynamic> json) =>
      _$$TrainingRecordPrintDTOImplFromJson(json);

  @override
  String name;
  @override
  List<TrainingRecordUserPrintDTO> users;
  @override
  String? description;
  @override
  String? entity;
  @override
  DateTime? date;
  @override
  double? workload;

  @override
  String toString({DiagnosticLevel minLevel = DiagnosticLevel.info}) {
    return 'TrainingRecordPrintDTO(name: $name, users: $users, description: $description, entity: $entity, date: $date, workload: $workload)';
  }

  @override
  void debugFillProperties(DiagnosticPropertiesBuilder properties) {
    super.debugFillProperties(properties);
    properties
      ..add(DiagnosticsProperty('type', 'TrainingRecordPrintDTO'))
      ..add(DiagnosticsProperty('name', name))
      ..add(DiagnosticsProperty('users', users))
      ..add(DiagnosticsProperty('description', description))
      ..add(DiagnosticsProperty('entity', entity))
      ..add(DiagnosticsProperty('date', date))
      ..add(DiagnosticsProperty('workload', workload));
  }

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$TrainingRecordPrintDTOImplCopyWith<_$TrainingRecordPrintDTOImpl>
      get copyWith => __$$TrainingRecordPrintDTOImplCopyWithImpl<
          _$TrainingRecordPrintDTOImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$TrainingRecordPrintDTOImplToJson(
      this,
    );
  }
}

abstract class _TrainingRecordPrintDTO implements TrainingRecordPrintDTO {
  factory _TrainingRecordPrintDTO(
      {required String name,
      required List<TrainingRecordUserPrintDTO> users,
      String? description,
      String? entity,
      DateTime? date,
      double? workload}) = _$TrainingRecordPrintDTOImpl;

  factory _TrainingRecordPrintDTO.fromJson(Map<String, dynamic> json) =
      _$TrainingRecordPrintDTOImpl.fromJson;

  @override
  String get name;
  set name(String value);
  @override
  List<TrainingRecordUserPrintDTO> get users;
  set users(List<TrainingRecordUserPrintDTO> value);
  @override
  String? get description;
  set description(String? value);
  @override
  String? get entity;
  set entity(String? value);
  @override
  DateTime? get date;
  set date(DateTime? value);
  @override
  double? get workload;
  set workload(double? value);
  @override
  @JsonKey(ignore: true)
  _$$TrainingRecordPrintDTOImplCopyWith<_$TrainingRecordPrintDTOImpl>
      get copyWith => throw _privateConstructorUsedError;
}
