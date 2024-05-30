// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'pluto_grid_api_model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

PlutoGridApiModel _$PlutoGridApiModelFromJson(Map<String, dynamic> json) {
  return _PlutoGridApiModel.fromJson(json);
}

/// @nodoc
mixin _$PlutoGridApiModel {
  int get page => throw _privateConstructorUsedError;
  set page(int value) => throw _privateConstructorUsedError;
  List<PlutoGridApiFilterModel> get filters =>
      throw _privateConstructorUsedError;
  set filters(List<PlutoGridApiFilterModel> value) =>
      throw _privateConstructorUsedError;
  PlutoGridApiSortModel? get sort => throw _privateConstructorUsedError;
  set sort(PlutoGridApiSortModel? value) => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $PlutoGridApiModelCopyWith<PlutoGridApiModel> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $PlutoGridApiModelCopyWith<$Res> {
  factory $PlutoGridApiModelCopyWith(
          PlutoGridApiModel value, $Res Function(PlutoGridApiModel) then) =
      _$PlutoGridApiModelCopyWithImpl<$Res, PlutoGridApiModel>;
  @useResult
  $Res call(
      {int page,
      List<PlutoGridApiFilterModel> filters,
      PlutoGridApiSortModel? sort});

  $PlutoGridApiSortModelCopyWith<$Res>? get sort;
}

/// @nodoc
class _$PlutoGridApiModelCopyWithImpl<$Res, $Val extends PlutoGridApiModel>
    implements $PlutoGridApiModelCopyWith<$Res> {
  _$PlutoGridApiModelCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? page = null,
    Object? filters = null,
    Object? sort = freezed,
  }) {
    return _then(_value.copyWith(
      page: null == page
          ? _value.page
          : page // ignore: cast_nullable_to_non_nullable
              as int,
      filters: null == filters
          ? _value.filters
          : filters // ignore: cast_nullable_to_non_nullable
              as List<PlutoGridApiFilterModel>,
      sort: freezed == sort
          ? _value.sort
          : sort // ignore: cast_nullable_to_non_nullable
              as PlutoGridApiSortModel?,
    ) as $Val);
  }

  @override
  @pragma('vm:prefer-inline')
  $PlutoGridApiSortModelCopyWith<$Res>? get sort {
    if (_value.sort == null) {
      return null;
    }

    return $PlutoGridApiSortModelCopyWith<$Res>(_value.sort!, (value) {
      return _then(_value.copyWith(sort: value) as $Val);
    });
  }
}

/// @nodoc
abstract class _$$PlutoGridApiModelImplCopyWith<$Res>
    implements $PlutoGridApiModelCopyWith<$Res> {
  factory _$$PlutoGridApiModelImplCopyWith(_$PlutoGridApiModelImpl value,
          $Res Function(_$PlutoGridApiModelImpl) then) =
      __$$PlutoGridApiModelImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {int page,
      List<PlutoGridApiFilterModel> filters,
      PlutoGridApiSortModel? sort});

  @override
  $PlutoGridApiSortModelCopyWith<$Res>? get sort;
}

/// @nodoc
class __$$PlutoGridApiModelImplCopyWithImpl<$Res>
    extends _$PlutoGridApiModelCopyWithImpl<$Res, _$PlutoGridApiModelImpl>
    implements _$$PlutoGridApiModelImplCopyWith<$Res> {
  __$$PlutoGridApiModelImplCopyWithImpl(_$PlutoGridApiModelImpl _value,
      $Res Function(_$PlutoGridApiModelImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? page = null,
    Object? filters = null,
    Object? sort = freezed,
  }) {
    return _then(_$PlutoGridApiModelImpl(
      page: null == page
          ? _value.page
          : page // ignore: cast_nullable_to_non_nullable
              as int,
      filters: null == filters
          ? _value.filters
          : filters // ignore: cast_nullable_to_non_nullable
              as List<PlutoGridApiFilterModel>,
      sort: freezed == sort
          ? _value.sort
          : sort // ignore: cast_nullable_to_non_nullable
              as PlutoGridApiSortModel?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$PlutoGridApiModelImpl implements _PlutoGridApiModel {
  _$PlutoGridApiModelImpl(
      {required this.page, required this.filters, this.sort});

  factory _$PlutoGridApiModelImpl.fromJson(Map<String, dynamic> json) =>
      _$$PlutoGridApiModelImplFromJson(json);

  @override
  int page;
  @override
  List<PlutoGridApiFilterModel> filters;
  @override
  PlutoGridApiSortModel? sort;

  @override
  String toString() {
    return 'PlutoGridApiModel(page: $page, filters: $filters, sort: $sort)';
  }

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$PlutoGridApiModelImplCopyWith<_$PlutoGridApiModelImpl> get copyWith =>
      __$$PlutoGridApiModelImplCopyWithImpl<_$PlutoGridApiModelImpl>(
          this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$PlutoGridApiModelImplToJson(
      this,
    );
  }
}

abstract class _PlutoGridApiModel implements PlutoGridApiModel {
  factory _PlutoGridApiModel(
      {required int page,
      required List<PlutoGridApiFilterModel> filters,
      PlutoGridApiSortModel? sort}) = _$PlutoGridApiModelImpl;

  factory _PlutoGridApiModel.fromJson(Map<String, dynamic> json) =
      _$PlutoGridApiModelImpl.fromJson;

  @override
  int get page;
  set page(int value);
  @override
  List<PlutoGridApiFilterModel> get filters;
  set filters(List<PlutoGridApiFilterModel> value);
  @override
  PlutoGridApiSortModel? get sort;
  set sort(PlutoGridApiSortModel? value);
  @override
  @JsonKey(ignore: true)
  _$$PlutoGridApiModelImplCopyWith<_$PlutoGridApiModelImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
