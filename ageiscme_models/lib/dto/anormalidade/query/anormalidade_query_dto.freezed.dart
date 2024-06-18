// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'anormalidade_query_dto.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

AnormalidadeQueryDTO _$AnormalidadeQueryDTOFromJson(Map<String, dynamic> json) {
  return _AnormalidadeQueryDTO.fromJson(json);
}

/// @nodoc
mixin _$AnormalidadeQueryDTO {
  PlutoGridApiModel? get gridFilter => throw _privateConstructorUsedError;
  set gridFilter(PlutoGridApiModel? value) =>
      throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $AnormalidadeQueryDTOCopyWith<AnormalidadeQueryDTO> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $AnormalidadeQueryDTOCopyWith<$Res> {
  factory $AnormalidadeQueryDTOCopyWith(AnormalidadeQueryDTO value,
          $Res Function(AnormalidadeQueryDTO) then) =
      _$AnormalidadeQueryDTOCopyWithImpl<$Res, AnormalidadeQueryDTO>;
  @useResult
  $Res call({PlutoGridApiModel? gridFilter});

  $PlutoGridApiModelCopyWith<$Res>? get gridFilter;
}

/// @nodoc
class _$AnormalidadeQueryDTOCopyWithImpl<$Res,
        $Val extends AnormalidadeQueryDTO>
    implements $AnormalidadeQueryDTOCopyWith<$Res> {
  _$AnormalidadeQueryDTOCopyWithImpl(this._value, this._then);

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
abstract class _$$AnormalidadeQueryDTOImplCopyWith<$Res>
    implements $AnormalidadeQueryDTOCopyWith<$Res> {
  factory _$$AnormalidadeQueryDTOImplCopyWith(_$AnormalidadeQueryDTOImpl value,
          $Res Function(_$AnormalidadeQueryDTOImpl) then) =
      __$$AnormalidadeQueryDTOImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({PlutoGridApiModel? gridFilter});

  @override
  $PlutoGridApiModelCopyWith<$Res>? get gridFilter;
}

/// @nodoc
class __$$AnormalidadeQueryDTOImplCopyWithImpl<$Res>
    extends _$AnormalidadeQueryDTOCopyWithImpl<$Res, _$AnormalidadeQueryDTOImpl>
    implements _$$AnormalidadeQueryDTOImplCopyWith<$Res> {
  __$$AnormalidadeQueryDTOImplCopyWithImpl(_$AnormalidadeQueryDTOImpl _value,
      $Res Function(_$AnormalidadeQueryDTOImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? gridFilter = freezed,
  }) {
    return _then(_$AnormalidadeQueryDTOImpl(
      gridFilter: freezed == gridFilter
          ? _value.gridFilter
          : gridFilter // ignore: cast_nullable_to_non_nullable
              as PlutoGridApiModel?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$AnormalidadeQueryDTOImpl implements _AnormalidadeQueryDTO {
  _$AnormalidadeQueryDTOImpl({this.gridFilter});

  factory _$AnormalidadeQueryDTOImpl.fromJson(Map<String, dynamic> json) =>
      _$$AnormalidadeQueryDTOImplFromJson(json);

  @override
  PlutoGridApiModel? gridFilter;

  @override
  String toString() {
    return 'AnormalidadeQueryDTO(gridFilter: $gridFilter)';
  }

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$AnormalidadeQueryDTOImplCopyWith<_$AnormalidadeQueryDTOImpl>
      get copyWith =>
          __$$AnormalidadeQueryDTOImplCopyWithImpl<_$AnormalidadeQueryDTOImpl>(
              this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$AnormalidadeQueryDTOImplToJson(
      this,
    );
  }
}

abstract class _AnormalidadeQueryDTO implements AnormalidadeQueryDTO {
  factory _AnormalidadeQueryDTO({PlutoGridApiModel? gridFilter}) =
      _$AnormalidadeQueryDTOImpl;

  factory _AnormalidadeQueryDTO.fromJson(Map<String, dynamic> json) =
      _$AnormalidadeQueryDTOImpl.fromJson;

  @override
  PlutoGridApiModel? get gridFilter;
  set gridFilter(PlutoGridApiModel? value);
  @override
  @JsonKey(ignore: true)
  _$$AnormalidadeQueryDTOImplCopyWith<_$AnormalidadeQueryDTOImpl>
      get copyWith => throw _privateConstructorUsedError;
}
