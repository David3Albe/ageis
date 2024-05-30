// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'pluto_grid_infinite_scroll_model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

PlutoGridInfiniteScrollModel _$PlutoGridInfiniteScrollModelFromJson(
    Map<String, dynamic> json) {
  return _PlutoGridInfiniteScrollModel.fromJson(json);
}

/// @nodoc
mixin _$PlutoGridInfiniteScrollModel {
  bool get lastRow => throw _privateConstructorUsedError;
  set lastRow(bool value) => throw _privateConstructorUsedError;
  int get records => throw _privateConstructorUsedError;
  set records(int value) => throw _privateConstructorUsedError;
  List<dynamic> get data => throw _privateConstructorUsedError;
  set data(List<dynamic> value) => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $PlutoGridInfiniteScrollModelCopyWith<PlutoGridInfiniteScrollModel>
      get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $PlutoGridInfiniteScrollModelCopyWith<$Res> {
  factory $PlutoGridInfiniteScrollModelCopyWith(
          PlutoGridInfiniteScrollModel value,
          $Res Function(PlutoGridInfiniteScrollModel) then) =
      _$PlutoGridInfiniteScrollModelCopyWithImpl<$Res,
          PlutoGridInfiniteScrollModel>;
  @useResult
  $Res call({bool lastRow, int records, List<dynamic> data});
}

/// @nodoc
class _$PlutoGridInfiniteScrollModelCopyWithImpl<$Res,
        $Val extends PlutoGridInfiniteScrollModel>
    implements $PlutoGridInfiniteScrollModelCopyWith<$Res> {
  _$PlutoGridInfiniteScrollModelCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? lastRow = null,
    Object? records = null,
    Object? data = null,
  }) {
    return _then(_value.copyWith(
      lastRow: null == lastRow
          ? _value.lastRow
          : lastRow // ignore: cast_nullable_to_non_nullable
              as bool,
      records: null == records
          ? _value.records
          : records // ignore: cast_nullable_to_non_nullable
              as int,
      data: null == data
          ? _value.data
          : data // ignore: cast_nullable_to_non_nullable
              as List<dynamic>,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$PlutoGridInfiniteScrollModelImplCopyWith<$Res>
    implements $PlutoGridInfiniteScrollModelCopyWith<$Res> {
  factory _$$PlutoGridInfiniteScrollModelImplCopyWith(
          _$PlutoGridInfiniteScrollModelImpl value,
          $Res Function(_$PlutoGridInfiniteScrollModelImpl) then) =
      __$$PlutoGridInfiniteScrollModelImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({bool lastRow, int records, List<dynamic> data});
}

/// @nodoc
class __$$PlutoGridInfiniteScrollModelImplCopyWithImpl<$Res>
    extends _$PlutoGridInfiniteScrollModelCopyWithImpl<$Res,
        _$PlutoGridInfiniteScrollModelImpl>
    implements _$$PlutoGridInfiniteScrollModelImplCopyWith<$Res> {
  __$$PlutoGridInfiniteScrollModelImplCopyWithImpl(
      _$PlutoGridInfiniteScrollModelImpl _value,
      $Res Function(_$PlutoGridInfiniteScrollModelImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? lastRow = null,
    Object? records = null,
    Object? data = null,
  }) {
    return _then(_$PlutoGridInfiniteScrollModelImpl(
      lastRow: null == lastRow
          ? _value.lastRow
          : lastRow // ignore: cast_nullable_to_non_nullable
              as bool,
      records: null == records
          ? _value.records
          : records // ignore: cast_nullable_to_non_nullable
              as int,
      data: null == data
          ? _value.data
          : data // ignore: cast_nullable_to_non_nullable
              as List<dynamic>,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$PlutoGridInfiniteScrollModelImpl
    implements _PlutoGridInfiniteScrollModel {
  _$PlutoGridInfiniteScrollModelImpl(
      {required this.lastRow, required this.records, required this.data});

  factory _$PlutoGridInfiniteScrollModelImpl.fromJson(
          Map<String, dynamic> json) =>
      _$$PlutoGridInfiniteScrollModelImplFromJson(json);

  @override
  bool lastRow;
  @override
  int records;
  @override
  List<dynamic> data;

  @override
  String toString() {
    return 'PlutoGridInfiniteScrollModel(lastRow: $lastRow, records: $records, data: $data)';
  }

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$PlutoGridInfiniteScrollModelImplCopyWith<
          _$PlutoGridInfiniteScrollModelImpl>
      get copyWith => __$$PlutoGridInfiniteScrollModelImplCopyWithImpl<
          _$PlutoGridInfiniteScrollModelImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$PlutoGridInfiniteScrollModelImplToJson(
      this,
    );
  }
}

abstract class _PlutoGridInfiniteScrollModel
    implements PlutoGridInfiniteScrollModel {
  factory _PlutoGridInfiniteScrollModel(
      {required bool lastRow,
      required int records,
      required List<dynamic> data}) = _$PlutoGridInfiniteScrollModelImpl;

  factory _PlutoGridInfiniteScrollModel.fromJson(Map<String, dynamic> json) =
      _$PlutoGridInfiniteScrollModelImpl.fromJson;

  @override
  bool get lastRow;
  set lastRow(bool value);
  @override
  int get records;
  set records(int value);
  @override
  List<dynamic> get data;
  set data(List<dynamic> value);
  @override
  @JsonKey(ignore: true)
  _$$PlutoGridInfiniteScrollModelImplCopyWith<
          _$PlutoGridInfiniteScrollModelImpl>
      get copyWith => throw _privateConstructorUsedError;
}
