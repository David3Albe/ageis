// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'pluto_grid_api_filter_model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

PlutoGridApiFilterModel _$PlutoGridApiFilterModelFromJson(
    Map<String, dynamic> json) {
  return _PlutoGridApiFilterModel.fromJson(json);
}

/// @nodoc
mixin _$PlutoGridApiFilterModel {
  String get field => throw _privateConstructorUsedError;
  set field(String value) => throw _privateConstructorUsedError;
  PlutoGridFilterType get type => throw _privateConstructorUsedError;
  set type(PlutoGridFilterType value) => throw _privateConstructorUsedError;
  String get value => throw _privateConstructorUsedError;
  set value(String value) => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $PlutoGridApiFilterModelCopyWith<PlutoGridApiFilterModel> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $PlutoGridApiFilterModelCopyWith<$Res> {
  factory $PlutoGridApiFilterModelCopyWith(PlutoGridApiFilterModel value,
          $Res Function(PlutoGridApiFilterModel) then) =
      _$PlutoGridApiFilterModelCopyWithImpl<$Res, PlutoGridApiFilterModel>;
  @useResult
  $Res call({String field, PlutoGridFilterType type, String value});
}

/// @nodoc
class _$PlutoGridApiFilterModelCopyWithImpl<$Res,
        $Val extends PlutoGridApiFilterModel>
    implements $PlutoGridApiFilterModelCopyWith<$Res> {
  _$PlutoGridApiFilterModelCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? field = null,
    Object? type = null,
    Object? value = null,
  }) {
    return _then(_value.copyWith(
      field: null == field
          ? _value.field
          : field // ignore: cast_nullable_to_non_nullable
              as String,
      type: null == type
          ? _value.type
          : type // ignore: cast_nullable_to_non_nullable
              as PlutoGridFilterType,
      value: null == value
          ? _value.value
          : value // ignore: cast_nullable_to_non_nullable
              as String,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$PlutoGridApiFilterModelImplCopyWith<$Res>
    implements $PlutoGridApiFilterModelCopyWith<$Res> {
  factory _$$PlutoGridApiFilterModelImplCopyWith(
          _$PlutoGridApiFilterModelImpl value,
          $Res Function(_$PlutoGridApiFilterModelImpl) then) =
      __$$PlutoGridApiFilterModelImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({String field, PlutoGridFilterType type, String value});
}

/// @nodoc
class __$$PlutoGridApiFilterModelImplCopyWithImpl<$Res>
    extends _$PlutoGridApiFilterModelCopyWithImpl<$Res,
        _$PlutoGridApiFilterModelImpl>
    implements _$$PlutoGridApiFilterModelImplCopyWith<$Res> {
  __$$PlutoGridApiFilterModelImplCopyWithImpl(
      _$PlutoGridApiFilterModelImpl _value,
      $Res Function(_$PlutoGridApiFilterModelImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? field = null,
    Object? type = null,
    Object? value = null,
  }) {
    return _then(_$PlutoGridApiFilterModelImpl(
      field: null == field
          ? _value.field
          : field // ignore: cast_nullable_to_non_nullable
              as String,
      type: null == type
          ? _value.type
          : type // ignore: cast_nullable_to_non_nullable
              as PlutoGridFilterType,
      value: null == value
          ? _value.value
          : value // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$PlutoGridApiFilterModelImpl implements _PlutoGridApiFilterModel {
  _$PlutoGridApiFilterModelImpl(
      {required this.field, required this.type, required this.value});

  factory _$PlutoGridApiFilterModelImpl.fromJson(Map<String, dynamic> json) =>
      _$$PlutoGridApiFilterModelImplFromJson(json);

  @override
  String field;
  @override
  PlutoGridFilterType type;
  @override
  String value;

  @override
  String toString() {
    return 'PlutoGridApiFilterModel(field: $field, type: $type, value: $value)';
  }

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$PlutoGridApiFilterModelImplCopyWith<_$PlutoGridApiFilterModelImpl>
      get copyWith => __$$PlutoGridApiFilterModelImplCopyWithImpl<
          _$PlutoGridApiFilterModelImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$PlutoGridApiFilterModelImplToJson(
      this,
    );
  }
}

abstract class _PlutoGridApiFilterModel implements PlutoGridApiFilterModel {
  factory _PlutoGridApiFilterModel(
      {required String field,
      required PlutoGridFilterType type,
      required String value}) = _$PlutoGridApiFilterModelImpl;

  factory _PlutoGridApiFilterModel.fromJson(Map<String, dynamic> json) =
      _$PlutoGridApiFilterModelImpl.fromJson;

  @override
  String get field;
  set field(String value);
  @override
  PlutoGridFilterType get type;
  set type(PlutoGridFilterType value);
  @override
  String get value;
  set value(String value);
  @override
  @JsonKey(ignore: true)
  _$$PlutoGridApiFilterModelImplCopyWith<_$PlutoGridApiFilterModelImpl>
      get copyWith => throw _privateConstructorUsedError;
}
