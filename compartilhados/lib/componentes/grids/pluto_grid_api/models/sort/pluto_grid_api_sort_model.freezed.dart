// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'pluto_grid_api_sort_model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

PlutoGridApiSortModel _$PlutoGridApiSortModelFromJson(
    Map<String, dynamic> json) {
  return _PlutoGridApiSortModel.fromJson(json);
}

/// @nodoc
mixin _$PlutoGridApiSortModel {
  String get field => throw _privateConstructorUsedError;
  set field(String value) => throw _privateConstructorUsedError;
  PlutoGridOrderType get name => throw _privateConstructorUsedError;
  set name(PlutoGridOrderType value) => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $PlutoGridApiSortModelCopyWith<PlutoGridApiSortModel> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $PlutoGridApiSortModelCopyWith<$Res> {
  factory $PlutoGridApiSortModelCopyWith(PlutoGridApiSortModel value,
          $Res Function(PlutoGridApiSortModel) then) =
      _$PlutoGridApiSortModelCopyWithImpl<$Res, PlutoGridApiSortModel>;
  @useResult
  $Res call({String field, PlutoGridOrderType name});
}

/// @nodoc
class _$PlutoGridApiSortModelCopyWithImpl<$Res,
        $Val extends PlutoGridApiSortModel>
    implements $PlutoGridApiSortModelCopyWith<$Res> {
  _$PlutoGridApiSortModelCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? field = null,
    Object? name = null,
  }) {
    return _then(_value.copyWith(
      field: null == field
          ? _value.field
          : field // ignore: cast_nullable_to_non_nullable
              as String,
      name: null == name
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as PlutoGridOrderType,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$PlutoGridApiSortModelImplCopyWith<$Res>
    implements $PlutoGridApiSortModelCopyWith<$Res> {
  factory _$$PlutoGridApiSortModelImplCopyWith(
          _$PlutoGridApiSortModelImpl value,
          $Res Function(_$PlutoGridApiSortModelImpl) then) =
      __$$PlutoGridApiSortModelImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({String field, PlutoGridOrderType name});
}

/// @nodoc
class __$$PlutoGridApiSortModelImplCopyWithImpl<$Res>
    extends _$PlutoGridApiSortModelCopyWithImpl<$Res,
        _$PlutoGridApiSortModelImpl>
    implements _$$PlutoGridApiSortModelImplCopyWith<$Res> {
  __$$PlutoGridApiSortModelImplCopyWithImpl(_$PlutoGridApiSortModelImpl _value,
      $Res Function(_$PlutoGridApiSortModelImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? field = null,
    Object? name = null,
  }) {
    return _then(_$PlutoGridApiSortModelImpl(
      field: null == field
          ? _value.field
          : field // ignore: cast_nullable_to_non_nullable
              as String,
      name: null == name
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as PlutoGridOrderType,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$PlutoGridApiSortModelImpl implements _PlutoGridApiSortModel {
  _$PlutoGridApiSortModelImpl({required this.field, required this.name});

  factory _$PlutoGridApiSortModelImpl.fromJson(Map<String, dynamic> json) =>
      _$$PlutoGridApiSortModelImplFromJson(json);

  @override
  String field;
  @override
  PlutoGridOrderType name;

  @override
  String toString() {
    return 'PlutoGridApiSortModel(field: $field, name: $name)';
  }

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$PlutoGridApiSortModelImplCopyWith<_$PlutoGridApiSortModelImpl>
      get copyWith => __$$PlutoGridApiSortModelImplCopyWithImpl<
          _$PlutoGridApiSortModelImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$PlutoGridApiSortModelImplToJson(
      this,
    );
  }
}

abstract class _PlutoGridApiSortModel implements PlutoGridApiSortModel {
  factory _PlutoGridApiSortModel(
      {required String field,
      required PlutoGridOrderType name}) = _$PlutoGridApiSortModelImpl;

  factory _PlutoGridApiSortModel.fromJson(Map<String, dynamic> json) =
      _$PlutoGridApiSortModelImpl.fromJson;

  @override
  String get field;
  set field(String value);
  @override
  PlutoGridOrderType get name;
  set name(PlutoGridOrderType value);
  @override
  @JsonKey(ignore: true)
  _$$PlutoGridApiSortModelImplCopyWith<_$PlutoGridApiSortModelImpl>
      get copyWith => throw _privateConstructorUsedError;
}
