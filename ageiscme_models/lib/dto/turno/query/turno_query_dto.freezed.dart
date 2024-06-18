// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'turno_query_dto.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

TurnoQueryDTO _$TurnoQueryDTOFromJson(Map<String, dynamic> json) {
  return _TurnoQueryDTO.fromJson(json);
}

/// @nodoc
mixin _$TurnoQueryDTO {
  PlutoGridApiModel? get gridFilter => throw _privateConstructorUsedError;
  set gridFilter(PlutoGridApiModel? value) =>
      throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $TurnoQueryDTOCopyWith<TurnoQueryDTO> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $TurnoQueryDTOCopyWith<$Res> {
  factory $TurnoQueryDTOCopyWith(
          TurnoQueryDTO value, $Res Function(TurnoQueryDTO) then) =
      _$TurnoQueryDTOCopyWithImpl<$Res, TurnoQueryDTO>;
  @useResult
  $Res call({PlutoGridApiModel? gridFilter});

  $PlutoGridApiModelCopyWith<$Res>? get gridFilter;
}

/// @nodoc
class _$TurnoQueryDTOCopyWithImpl<$Res, $Val extends TurnoQueryDTO>
    implements $TurnoQueryDTOCopyWith<$Res> {
  _$TurnoQueryDTOCopyWithImpl(this._value, this._then);

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
abstract class _$$TurnoQueryDTOImplCopyWith<$Res>
    implements $TurnoQueryDTOCopyWith<$Res> {
  factory _$$TurnoQueryDTOImplCopyWith(
          _$TurnoQueryDTOImpl value, $Res Function(_$TurnoQueryDTOImpl) then) =
      __$$TurnoQueryDTOImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({PlutoGridApiModel? gridFilter});

  @override
  $PlutoGridApiModelCopyWith<$Res>? get gridFilter;
}

/// @nodoc
class __$$TurnoQueryDTOImplCopyWithImpl<$Res>
    extends _$TurnoQueryDTOCopyWithImpl<$Res, _$TurnoQueryDTOImpl>
    implements _$$TurnoQueryDTOImplCopyWith<$Res> {
  __$$TurnoQueryDTOImplCopyWithImpl(
      _$TurnoQueryDTOImpl _value, $Res Function(_$TurnoQueryDTOImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? gridFilter = freezed,
  }) {
    return _then(_$TurnoQueryDTOImpl(
      gridFilter: freezed == gridFilter
          ? _value.gridFilter
          : gridFilter // ignore: cast_nullable_to_non_nullable
              as PlutoGridApiModel?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$TurnoQueryDTOImpl implements _TurnoQueryDTO {
  _$TurnoQueryDTOImpl({this.gridFilter});

  factory _$TurnoQueryDTOImpl.fromJson(Map<String, dynamic> json) =>
      _$$TurnoQueryDTOImplFromJson(json);

  @override
  PlutoGridApiModel? gridFilter;

  @override
  String toString() {
    return 'TurnoQueryDTO(gridFilter: $gridFilter)';
  }

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$TurnoQueryDTOImplCopyWith<_$TurnoQueryDTOImpl> get copyWith =>
      __$$TurnoQueryDTOImplCopyWithImpl<_$TurnoQueryDTOImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$TurnoQueryDTOImplToJson(
      this,
    );
  }
}

abstract class _TurnoQueryDTO implements TurnoQueryDTO {
  factory _TurnoQueryDTO({PlutoGridApiModel? gridFilter}) = _$TurnoQueryDTOImpl;

  factory _TurnoQueryDTO.fromJson(Map<String, dynamic> json) =
      _$TurnoQueryDTOImpl.fromJson;

  @override
  PlutoGridApiModel? get gridFilter;
  set gridFilter(PlutoGridApiModel? value);
  @override
  @JsonKey(ignore: true)
  _$$TurnoQueryDTOImplCopyWith<_$TurnoQueryDTOImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
