// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'turno_query_response_dto.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

TurnoQueryResponseDTO _$TurnoQueryResponseDTOFromJson(
    Map<String, dynamic> json) {
  return _TurnoQueryResponseDTO.fromJson(json);
}

/// @nodoc
mixin _$TurnoQueryResponseDTO {
  PlutoGridInfiniteScrollModel get plutoData =>
      throw _privateConstructorUsedError;
  set plutoData(PlutoGridInfiniteScrollModel value) =>
      throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $TurnoQueryResponseDTOCopyWith<TurnoQueryResponseDTO> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $TurnoQueryResponseDTOCopyWith<$Res> {
  factory $TurnoQueryResponseDTOCopyWith(TurnoQueryResponseDTO value,
          $Res Function(TurnoQueryResponseDTO) then) =
      _$TurnoQueryResponseDTOCopyWithImpl<$Res, TurnoQueryResponseDTO>;
  @useResult
  $Res call({PlutoGridInfiniteScrollModel plutoData});

  $PlutoGridInfiniteScrollModelCopyWith<$Res> get plutoData;
}

/// @nodoc
class _$TurnoQueryResponseDTOCopyWithImpl<$Res,
        $Val extends TurnoQueryResponseDTO>
    implements $TurnoQueryResponseDTOCopyWith<$Res> {
  _$TurnoQueryResponseDTOCopyWithImpl(this._value, this._then);

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
abstract class _$$TurnoQueryResponseDTOImplCopyWith<$Res>
    implements $TurnoQueryResponseDTOCopyWith<$Res> {
  factory _$$TurnoQueryResponseDTOImplCopyWith(
          _$TurnoQueryResponseDTOImpl value,
          $Res Function(_$TurnoQueryResponseDTOImpl) then) =
      __$$TurnoQueryResponseDTOImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({PlutoGridInfiniteScrollModel plutoData});

  @override
  $PlutoGridInfiniteScrollModelCopyWith<$Res> get plutoData;
}

/// @nodoc
class __$$TurnoQueryResponseDTOImplCopyWithImpl<$Res>
    extends _$TurnoQueryResponseDTOCopyWithImpl<$Res,
        _$TurnoQueryResponseDTOImpl>
    implements _$$TurnoQueryResponseDTOImplCopyWith<$Res> {
  __$$TurnoQueryResponseDTOImplCopyWithImpl(_$TurnoQueryResponseDTOImpl _value,
      $Res Function(_$TurnoQueryResponseDTOImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? plutoData = null,
  }) {
    return _then(_$TurnoQueryResponseDTOImpl(
      plutoData: null == plutoData
          ? _value.plutoData
          : plutoData // ignore: cast_nullable_to_non_nullable
              as PlutoGridInfiniteScrollModel,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$TurnoQueryResponseDTOImpl implements _TurnoQueryResponseDTO {
  _$TurnoQueryResponseDTOImpl({required this.plutoData});

  factory _$TurnoQueryResponseDTOImpl.fromJson(Map<String, dynamic> json) =>
      _$$TurnoQueryResponseDTOImplFromJson(json);

  @override
  PlutoGridInfiniteScrollModel plutoData;

  @override
  String toString() {
    return 'TurnoQueryResponseDTO(plutoData: $plutoData)';
  }

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$TurnoQueryResponseDTOImplCopyWith<_$TurnoQueryResponseDTOImpl>
      get copyWith => __$$TurnoQueryResponseDTOImplCopyWithImpl<
          _$TurnoQueryResponseDTOImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$TurnoQueryResponseDTOImplToJson(
      this,
    );
  }
}

abstract class _TurnoQueryResponseDTO implements TurnoQueryResponseDTO {
  factory _TurnoQueryResponseDTO(
          {required PlutoGridInfiniteScrollModel plutoData}) =
      _$TurnoQueryResponseDTOImpl;

  factory _TurnoQueryResponseDTO.fromJson(Map<String, dynamic> json) =
      _$TurnoQueryResponseDTOImpl.fromJson;

  @override
  PlutoGridInfiniteScrollModel get plutoData;
  set plutoData(PlutoGridInfiniteScrollModel value);
  @override
  @JsonKey(ignore: true)
  _$$TurnoQueryResponseDTOImplCopyWith<_$TurnoQueryResponseDTOImpl>
      get copyWith => throw _privateConstructorUsedError;
}
