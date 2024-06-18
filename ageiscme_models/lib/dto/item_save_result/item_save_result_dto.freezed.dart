// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'item_save_result_dto.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

ItemSaveResultDTO _$ItemSaveResultDTOFromJson(Map<String, dynamic> json) {
  return _ItemSaveResultDTO.fromJson(json);
}

/// @nodoc
mixin _$ItemSaveResultDTO {
  ItemModel get item => throw _privateConstructorUsedError;
  set item(ItemModel value) => throw _privateConstructorUsedError;
  String? get impressaoConsignado => throw _privateConstructorUsedError;
  set impressaoConsignado(String? value) => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $ItemSaveResultDTOCopyWith<ItemSaveResultDTO> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $ItemSaveResultDTOCopyWith<$Res> {
  factory $ItemSaveResultDTOCopyWith(
          ItemSaveResultDTO value, $Res Function(ItemSaveResultDTO) then) =
      _$ItemSaveResultDTOCopyWithImpl<$Res, ItemSaveResultDTO>;
  @useResult
  $Res call({ItemModel item, String? impressaoConsignado});

  $ItemModelCopyWith<$Res> get item;
}

/// @nodoc
class _$ItemSaveResultDTOCopyWithImpl<$Res, $Val extends ItemSaveResultDTO>
    implements $ItemSaveResultDTOCopyWith<$Res> {
  _$ItemSaveResultDTOCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? item = null,
    Object? impressaoConsignado = freezed,
  }) {
    return _then(_value.copyWith(
      item: null == item
          ? _value.item
          : item // ignore: cast_nullable_to_non_nullable
              as ItemModel,
      impressaoConsignado: freezed == impressaoConsignado
          ? _value.impressaoConsignado
          : impressaoConsignado // ignore: cast_nullable_to_non_nullable
              as String?,
    ) as $Val);
  }

  @override
  @pragma('vm:prefer-inline')
  $ItemModelCopyWith<$Res> get item {
    return $ItemModelCopyWith<$Res>(_value.item, (value) {
      return _then(_value.copyWith(item: value) as $Val);
    });
  }
}

/// @nodoc
abstract class _$$ItemSaveResultDTOImplCopyWith<$Res>
    implements $ItemSaveResultDTOCopyWith<$Res> {
  factory _$$ItemSaveResultDTOImplCopyWith(_$ItemSaveResultDTOImpl value,
          $Res Function(_$ItemSaveResultDTOImpl) then) =
      __$$ItemSaveResultDTOImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({ItemModel item, String? impressaoConsignado});

  @override
  $ItemModelCopyWith<$Res> get item;
}

/// @nodoc
class __$$ItemSaveResultDTOImplCopyWithImpl<$Res>
    extends _$ItemSaveResultDTOCopyWithImpl<$Res, _$ItemSaveResultDTOImpl>
    implements _$$ItemSaveResultDTOImplCopyWith<$Res> {
  __$$ItemSaveResultDTOImplCopyWithImpl(_$ItemSaveResultDTOImpl _value,
      $Res Function(_$ItemSaveResultDTOImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? item = null,
    Object? impressaoConsignado = freezed,
  }) {
    return _then(_$ItemSaveResultDTOImpl(
      item: null == item
          ? _value.item
          : item // ignore: cast_nullable_to_non_nullable
              as ItemModel,
      impressaoConsignado: freezed == impressaoConsignado
          ? _value.impressaoConsignado
          : impressaoConsignado // ignore: cast_nullable_to_non_nullable
              as String?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$ItemSaveResultDTOImpl implements _ItemSaveResultDTO {
  _$ItemSaveResultDTOImpl({required this.item, this.impressaoConsignado});

  factory _$ItemSaveResultDTOImpl.fromJson(Map<String, dynamic> json) =>
      _$$ItemSaveResultDTOImplFromJson(json);

  @override
  ItemModel item;
  @override
  String? impressaoConsignado;

  @override
  String toString() {
    return 'ItemSaveResultDTO(item: $item, impressaoConsignado: $impressaoConsignado)';
  }

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$ItemSaveResultDTOImplCopyWith<_$ItemSaveResultDTOImpl> get copyWith =>
      __$$ItemSaveResultDTOImplCopyWithImpl<_$ItemSaveResultDTOImpl>(
          this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$ItemSaveResultDTOImplToJson(
      this,
    );
  }
}

abstract class _ItemSaveResultDTO implements ItemSaveResultDTO {
  factory _ItemSaveResultDTO(
      {required ItemModel item,
      String? impressaoConsignado}) = _$ItemSaveResultDTOImpl;

  factory _ItemSaveResultDTO.fromJson(Map<String, dynamic> json) =
      _$ItemSaveResultDTOImpl.fromJson;

  @override
  ItemModel get item;
  set item(ItemModel value);
  @override
  String? get impressaoConsignado;
  set impressaoConsignado(String? value);
  @override
  @JsonKey(ignore: true)
  _$$ItemSaveResultDTOImplCopyWith<_$ItemSaveResultDTOImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
