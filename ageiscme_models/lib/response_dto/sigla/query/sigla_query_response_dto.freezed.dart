// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'sigla_query_response_dto.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

SiglaQueryResponseDTO _$SiglaQueryResponseDTOFromJson(
    Map<String, dynamic> json) {
  return _SiglaQueryResponseDTO.fromJson(json);
}

/// @nodoc
mixin _$SiglaQueryResponseDTO {
  PlutoGridInfiniteScrollModel get plutoData =>
      throw _privateConstructorUsedError;
  set plutoData(PlutoGridInfiniteScrollModel value) =>
      throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $SiglaQueryResponseDTOCopyWith<SiglaQueryResponseDTO> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $SiglaQueryResponseDTOCopyWith<$Res> {
  factory $SiglaQueryResponseDTOCopyWith(SiglaQueryResponseDTO value,
          $Res Function(SiglaQueryResponseDTO) then) =
      _$SiglaQueryResponseDTOCopyWithImpl<$Res, SiglaQueryResponseDTO>;
  @useResult
  $Res call({PlutoGridInfiniteScrollModel plutoData});

  $PlutoGridInfiniteScrollModelCopyWith<$Res> get plutoData;
}

/// @nodoc
class _$SiglaQueryResponseDTOCopyWithImpl<$Res,
        $Val extends SiglaQueryResponseDTO>
    implements $SiglaQueryResponseDTOCopyWith<$Res> {
  _$SiglaQueryResponseDTOCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? plutoData = null,
  }) {
    return _then(_value.copyWith(
      plutoData: null == plutoData
          ? _value.plutoData
          : plutoData // ignore: cast_nullable_to_non_nullable
              as PlutoGridInfiniteScrollModel,
    ) as $Val);
  }

  @override
  @pragma('vm:prefer-inline')
  $PlutoGridInfiniteScrollModelCopyWith<$Res> get plutoData {
    return $PlutoGridInfiniteScrollModelCopyWith<$Res>(_value.plutoData,
        (value) {
      return _then(_value.copyWith(plutoData: value) as $Val);
    });
  }
}

/// @nodoc
abstract class _$$SiglaQueryResponseDTOImplCopyWith<$Res>
    implements $SiglaQueryResponseDTOCopyWith<$Res> {
  factory _$$SiglaQueryResponseDTOImplCopyWith(
          _$SiglaQueryResponseDTOImpl value,
          $Res Function(_$SiglaQueryResponseDTOImpl) then) =
      __$$SiglaQueryResponseDTOImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({PlutoGridInfiniteScrollModel plutoData});

  @override
  $PlutoGridInfiniteScrollModelCopyWith<$Res> get plutoData;
}

/// @nodoc
class __$$SiglaQueryResponseDTOImplCopyWithImpl<$Res>
    extends _$SiglaQueryResponseDTOCopyWithImpl<$Res,
        _$SiglaQueryResponseDTOImpl>
    implements _$$SiglaQueryResponseDTOImplCopyWith<$Res> {
  __$$SiglaQueryResponseDTOImplCopyWithImpl(_$SiglaQueryResponseDTOImpl _value,
      $Res Function(_$SiglaQueryResponseDTOImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? plutoData = null,
  }) {
    return _then(_$SiglaQueryResponseDTOImpl(
      plutoData: null == plutoData
          ? _value.plutoData
          : plutoData // ignore: cast_nullable_to_non_nullable
              as PlutoGridInfiniteScrollModel,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$SiglaQueryResponseDTOImpl implements _SiglaQueryResponseDTO {
  _$SiglaQueryResponseDTOImpl({required this.plutoData});

  factory _$SiglaQueryResponseDTOImpl.fromJson(Map<String, dynamic> json) =>
      _$$SiglaQueryResponseDTOImplFromJson(json);

  @override
  PlutoGridInfiniteScrollModel plutoData;

  @override
  String toString() {
    return 'SiglaQueryResponseDTO(plutoData: $plutoData)';
  }

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$SiglaQueryResponseDTOImplCopyWith<_$SiglaQueryResponseDTOImpl>
      get copyWith => __$$SiglaQueryResponseDTOImplCopyWithImpl<
          _$SiglaQueryResponseDTOImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$SiglaQueryResponseDTOImplToJson(
      this,
    );
  }
}

abstract class _SiglaQueryResponseDTO implements SiglaQueryResponseDTO {
  factory _SiglaQueryResponseDTO(
          {required PlutoGridInfiniteScrollModel plutoData}) =
      _$SiglaQueryResponseDTOImpl;

  factory _SiglaQueryResponseDTO.fromJson(Map<String, dynamic> json) =
      _$SiglaQueryResponseDTOImpl.fromJson;

  @override
  PlutoGridInfiniteScrollModel get plutoData;
  set plutoData(PlutoGridInfiniteScrollModel value);
  @override
  @JsonKey(ignore: true)
  _$$SiglaQueryResponseDTOImplCopyWith<_$SiglaQueryResponseDTOImpl>
      get copyWith => throw _privateConstructorUsedError;
}
