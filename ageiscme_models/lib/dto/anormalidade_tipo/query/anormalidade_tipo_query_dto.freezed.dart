// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'anormalidade_tipo_query_dto.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

AnormalidadeTipoQueryDTO _$AnormalidadeTipoQueryDTOFromJson(
    Map<String, dynamic> json) {
  return _AnormalidadeTipoQueryDTO.fromJson(json);
}

/// @nodoc
mixin _$AnormalidadeTipoQueryDTO {
  PlutoGridApiModel? get gridFilter => throw _privateConstructorUsedError;
  set gridFilter(PlutoGridApiModel? value) =>
      throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $AnormalidadeTipoQueryDTOCopyWith<AnormalidadeTipoQueryDTO> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $AnormalidadeTipoQueryDTOCopyWith<$Res> {
  factory $AnormalidadeTipoQueryDTOCopyWith(AnormalidadeTipoQueryDTO value,
          $Res Function(AnormalidadeTipoQueryDTO) then) =
      _$AnormalidadeTipoQueryDTOCopyWithImpl<$Res, AnormalidadeTipoQueryDTO>;
  @useResult
  $Res call({PlutoGridApiModel? gridFilter});

  $PlutoGridApiModelCopyWith<$Res>? get gridFilter;
}

/// @nodoc
class _$AnormalidadeTipoQueryDTOCopyWithImpl<$Res,
        $Val extends AnormalidadeTipoQueryDTO>
    implements $AnormalidadeTipoQueryDTOCopyWith<$Res> {
  _$AnormalidadeTipoQueryDTOCopyWithImpl(this._value, this._then);

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
abstract class _$$AnormalidadeTipoQueryDTOImplCopyWith<$Res>
    implements $AnormalidadeTipoQueryDTOCopyWith<$Res> {
  factory _$$AnormalidadeTipoQueryDTOImplCopyWith(
          _$AnormalidadeTipoQueryDTOImpl value,
          $Res Function(_$AnormalidadeTipoQueryDTOImpl) then) =
      __$$AnormalidadeTipoQueryDTOImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({PlutoGridApiModel? gridFilter});

  @override
  $PlutoGridApiModelCopyWith<$Res>? get gridFilter;
}

/// @nodoc
class __$$AnormalidadeTipoQueryDTOImplCopyWithImpl<$Res>
    extends _$AnormalidadeTipoQueryDTOCopyWithImpl<$Res,
        _$AnormalidadeTipoQueryDTOImpl>
    implements _$$AnormalidadeTipoQueryDTOImplCopyWith<$Res> {
  __$$AnormalidadeTipoQueryDTOImplCopyWithImpl(
      _$AnormalidadeTipoQueryDTOImpl _value,
      $Res Function(_$AnormalidadeTipoQueryDTOImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? gridFilter = freezed,
  }) {
    return _then(_$AnormalidadeTipoQueryDTOImpl(
      gridFilter: freezed == gridFilter
          ? _value.gridFilter
          : gridFilter // ignore: cast_nullable_to_non_nullable
              as PlutoGridApiModel?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$AnormalidadeTipoQueryDTOImpl implements _AnormalidadeTipoQueryDTO {
  _$AnormalidadeTipoQueryDTOImpl({this.gridFilter});

  factory _$AnormalidadeTipoQueryDTOImpl.fromJson(Map<String, dynamic> json) =>
      _$$AnormalidadeTipoQueryDTOImplFromJson(json);

  @override
  PlutoGridApiModel? gridFilter;

  @override
  String toString() {
    return 'AnormalidadeTipoQueryDTO(gridFilter: $gridFilter)';
  }

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$AnormalidadeTipoQueryDTOImplCopyWith<_$AnormalidadeTipoQueryDTOImpl>
      get copyWith => __$$AnormalidadeTipoQueryDTOImplCopyWithImpl<
          _$AnormalidadeTipoQueryDTOImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$AnormalidadeTipoQueryDTOImplToJson(
      this,
    );
  }
}

abstract class _AnormalidadeTipoQueryDTO implements AnormalidadeTipoQueryDTO {
  factory _AnormalidadeTipoQueryDTO({PlutoGridApiModel? gridFilter}) =
      _$AnormalidadeTipoQueryDTOImpl;

  factory _AnormalidadeTipoQueryDTO.fromJson(Map<String, dynamic> json) =
      _$AnormalidadeTipoQueryDTOImpl.fromJson;

  @override
  PlutoGridApiModel? get gridFilter;
  set gridFilter(PlutoGridApiModel? value);
  @override
  @JsonKey(ignore: true)
  _$$AnormalidadeTipoQueryDTOImplCopyWith<_$AnormalidadeTipoQueryDTOImpl>
      get copyWith => throw _privateConstructorUsedError;
}
