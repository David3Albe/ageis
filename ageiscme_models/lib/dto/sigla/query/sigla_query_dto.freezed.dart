// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'sigla_query_dto.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

SiglaQueryDTO _$SiglaQueryDTOFromJson(Map<String, dynamic> json) {
  return _SiglaQueryDTO.fromJson(json);
}

/// @nodoc
mixin _$SiglaQueryDTO {
  PlutoGridApiModel? get gridFilter => throw _privateConstructorUsedError;
  set gridFilter(PlutoGridApiModel? value) =>
      throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $SiglaQueryDTOCopyWith<SiglaQueryDTO> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $SiglaQueryDTOCopyWith<$Res> {
  factory $SiglaQueryDTOCopyWith(
          SiglaQueryDTO value, $Res Function(SiglaQueryDTO) then) =
      _$SiglaQueryDTOCopyWithImpl<$Res, SiglaQueryDTO>;
  @useResult
  $Res call({PlutoGridApiModel? gridFilter});

  $PlutoGridApiModelCopyWith<$Res>? get gridFilter;
}

/// @nodoc
class _$SiglaQueryDTOCopyWithImpl<$Res, $Val extends SiglaQueryDTO>
    implements $SiglaQueryDTOCopyWith<$Res> {
  _$SiglaQueryDTOCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? gridFilter = freezed,
  }) {
    return _then(_value.copyWith(
      gridFilter: freezed == gridFilter
          ? _value.gridFilter
          : gridFilter // ignore: cast_nullable_to_non_nullable
              as PlutoGridApiModel?,
    ) as $Val);
  }

  @override
  @pragma('vm:prefer-inline')
  $PlutoGridApiModelCopyWith<$Res>? get gridFilter {
    if (_value.gridFilter == null) {
      return null;
    }

    return $PlutoGridApiModelCopyWith<$Res>(_value.gridFilter!, (value) {
      return _then(_value.copyWith(gridFilter: value) as $Val);
    });
  }
}

/// @nodoc
abstract class _$$SiglaQueryDTOImplCopyWith<$Res>
    implements $SiglaQueryDTOCopyWith<$Res> {
  factory _$$SiglaQueryDTOImplCopyWith(
          _$SiglaQueryDTOImpl value, $Res Function(_$SiglaQueryDTOImpl) then) =
      __$$SiglaQueryDTOImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({PlutoGridApiModel? gridFilter});

  @override
  $PlutoGridApiModelCopyWith<$Res>? get gridFilter;
}

/// @nodoc
class __$$SiglaQueryDTOImplCopyWithImpl<$Res>
    extends _$SiglaQueryDTOCopyWithImpl<$Res, _$SiglaQueryDTOImpl>
    implements _$$SiglaQueryDTOImplCopyWith<$Res> {
  __$$SiglaQueryDTOImplCopyWithImpl(
      _$SiglaQueryDTOImpl _value, $Res Function(_$SiglaQueryDTOImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? gridFilter = freezed,
  }) {
    return _then(_$SiglaQueryDTOImpl(
      gridFilter: freezed == gridFilter
          ? _value.gridFilter
          : gridFilter // ignore: cast_nullable_to_non_nullable
              as PlutoGridApiModel?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$SiglaQueryDTOImpl implements _SiglaQueryDTO {
  _$SiglaQueryDTOImpl({this.gridFilter});

  factory _$SiglaQueryDTOImpl.fromJson(Map<String, dynamic> json) =>
      _$$SiglaQueryDTOImplFromJson(json);

  @override
  PlutoGridApiModel? gridFilter;

  @override
  String toString() {
    return 'SiglaQueryDTO(gridFilter: $gridFilter)';
  }

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$SiglaQueryDTOImplCopyWith<_$SiglaQueryDTOImpl> get copyWith =>
      __$$SiglaQueryDTOImplCopyWithImpl<_$SiglaQueryDTOImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$SiglaQueryDTOImplToJson(
      this,
    );
  }
}

abstract class _SiglaQueryDTO implements SiglaQueryDTO {
  factory _SiglaQueryDTO({PlutoGridApiModel? gridFilter}) = _$SiglaQueryDTOImpl;

  factory _SiglaQueryDTO.fromJson(Map<String, dynamic> json) =
      _$SiglaQueryDTOImpl.fromJson;

  @override
  PlutoGridApiModel? get gridFilter;
  set gridFilter(PlutoGridApiModel? value);
  @override
  @JsonKey(ignore: true)
  _$$SiglaQueryDTOImplCopyWith<_$SiglaQueryDTOImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
