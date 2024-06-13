// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'anormalidade_query_response_dto.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

AnormalidadeQueryResponseDTO _$AnormalidadeQueryResponseDTOFromJson(
    Map<String, dynamic> json) {
  return _AnormalidadeQueryResponseDTO.fromJson(json);
}

/// @nodoc
mixin _$AnormalidadeQueryResponseDTO {
  PlutoGridInfiniteScrollModel get plutoData =>
      throw _privateConstructorUsedError;
  set plutoData(PlutoGridInfiniteScrollModel value) =>
      throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $AnormalidadeQueryResponseDTOCopyWith<AnormalidadeQueryResponseDTO>
      get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $AnormalidadeQueryResponseDTOCopyWith<$Res> {
  factory $AnormalidadeQueryResponseDTOCopyWith(
          AnormalidadeQueryResponseDTO value,
          $Res Function(AnormalidadeQueryResponseDTO) then) =
      _$AnormalidadeQueryResponseDTOCopyWithImpl<$Res,
          AnormalidadeQueryResponseDTO>;
  @useResult
  $Res call({PlutoGridInfiniteScrollModel plutoData});

  $PlutoGridInfiniteScrollModelCopyWith<$Res> get plutoData;
}

/// @nodoc
class _$AnormalidadeQueryResponseDTOCopyWithImpl<$Res,
        $Val extends AnormalidadeQueryResponseDTO>
    implements $AnormalidadeQueryResponseDTOCopyWith<$Res> {
  _$AnormalidadeQueryResponseDTOCopyWithImpl(this._value, this._then);

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
abstract class _$$AnormalidadeQueryResponseDTOImplCopyWith<$Res>
    implements $AnormalidadeQueryResponseDTOCopyWith<$Res> {
  factory _$$AnormalidadeQueryResponseDTOImplCopyWith(
          _$AnormalidadeQueryResponseDTOImpl value,
          $Res Function(_$AnormalidadeQueryResponseDTOImpl) then) =
      __$$AnormalidadeQueryResponseDTOImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({PlutoGridInfiniteScrollModel plutoData});

  @override
  $PlutoGridInfiniteScrollModelCopyWith<$Res> get plutoData;
}

/// @nodoc
class __$$AnormalidadeQueryResponseDTOImplCopyWithImpl<$Res>
    extends _$AnormalidadeQueryResponseDTOCopyWithImpl<$Res,
        _$AnormalidadeQueryResponseDTOImpl>
    implements _$$AnormalidadeQueryResponseDTOImplCopyWith<$Res> {
  __$$AnormalidadeQueryResponseDTOImplCopyWithImpl(
      _$AnormalidadeQueryResponseDTOImpl _value,
      $Res Function(_$AnormalidadeQueryResponseDTOImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? plutoData = null,
  }) {
    return _then(_$AnormalidadeQueryResponseDTOImpl(
      plutoData: null == plutoData
          ? _value.plutoData
          : plutoData // ignore: cast_nullable_to_non_nullable
              as PlutoGridInfiniteScrollModel,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$AnormalidadeQueryResponseDTOImpl
    implements _AnormalidadeQueryResponseDTO {
  _$AnormalidadeQueryResponseDTOImpl({required this.plutoData});

  factory _$AnormalidadeQueryResponseDTOImpl.fromJson(
          Map<String, dynamic> json) =>
      _$$AnormalidadeQueryResponseDTOImplFromJson(json);

  @override
  PlutoGridInfiniteScrollModel plutoData;

  @override
  String toString() {
    return 'AnormalidadeQueryResponseDTO(plutoData: $plutoData)';
  }

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$AnormalidadeQueryResponseDTOImplCopyWith<
          _$AnormalidadeQueryResponseDTOImpl>
      get copyWith => __$$AnormalidadeQueryResponseDTOImplCopyWithImpl<
          _$AnormalidadeQueryResponseDTOImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$AnormalidadeQueryResponseDTOImplToJson(
      this,
    );
  }
}

abstract class _AnormalidadeQueryResponseDTO
    implements AnormalidadeQueryResponseDTO {
  factory _AnormalidadeQueryResponseDTO(
          {required PlutoGridInfiniteScrollModel plutoData}) =
      _$AnormalidadeQueryResponseDTOImpl;

  factory _AnormalidadeQueryResponseDTO.fromJson(Map<String, dynamic> json) =
      _$AnormalidadeQueryResponseDTOImpl.fromJson;

  @override
  PlutoGridInfiniteScrollModel get plutoData;
  set plutoData(PlutoGridInfiniteScrollModel value);
  @override
  @JsonKey(ignore: true)
  _$$AnormalidadeQueryResponseDTOImplCopyWith<
          _$AnormalidadeQueryResponseDTOImpl>
      get copyWith => throw _privateConstructorUsedError;
}
