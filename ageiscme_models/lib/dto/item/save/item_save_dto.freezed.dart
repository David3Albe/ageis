// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'item_save_dto.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

ItemSaveDTO _$ItemSaveDTOFromJson(Map<String, dynamic> json) {
  return _ItemSaveDTO.fromJson(json);
}

/// @nodoc
mixin _$ItemSaveDTO {
  bool? get atualizarTodosItensZ => throw _privateConstructorUsedError;
  set atualizarTodosItensZ(bool? value) => throw _privateConstructorUsedError;
  ItemModel get item => throw _privateConstructorUsedError;
  set item(ItemModel value) => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $ItemSaveDTOCopyWith<ItemSaveDTO> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $ItemSaveDTOCopyWith<$Res> {
  factory $ItemSaveDTOCopyWith(
          ItemSaveDTO value, $Res Function(ItemSaveDTO) then) =
      _$ItemSaveDTOCopyWithImpl<$Res, ItemSaveDTO>;
  @useResult
  $Res call({bool? atualizarTodosItensZ, ItemModel item});

  $ItemModelCopyWith<$Res> get item;
}

/// @nodoc
class _$ItemSaveDTOCopyWithImpl<$Res, $Val extends ItemSaveDTO>
    implements $ItemSaveDTOCopyWith<$Res> {
  _$ItemSaveDTOCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? atualizarTodosItensZ = freezed,
    Object? item = null,
  }) {
    return _then(_value.copyWith(
      atualizarTodosItensZ: freezed == atualizarTodosItensZ
          ? _value.atualizarTodosItensZ
          : atualizarTodosItensZ // ignore: cast_nullable_to_non_nullable
              as bool?,
      item: null == item
          ? _value.item
          : item // ignore: cast_nullable_to_non_nullable
              as ItemModel,
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
abstract class _$$ItemSaveDTOImplCopyWith<$Res>
    implements $ItemSaveDTOCopyWith<$Res> {
  factory _$$ItemSaveDTOImplCopyWith(
          _$ItemSaveDTOImpl value, $Res Function(_$ItemSaveDTOImpl) then) =
      __$$ItemSaveDTOImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({bool? atualizarTodosItensZ, ItemModel item});

  @override
  $ItemModelCopyWith<$Res> get item;
}

/// @nodoc
class __$$ItemSaveDTOImplCopyWithImpl<$Res>
    extends _$ItemSaveDTOCopyWithImpl<$Res, _$ItemSaveDTOImpl>
    implements _$$ItemSaveDTOImplCopyWith<$Res> {
  __$$ItemSaveDTOImplCopyWithImpl(
      _$ItemSaveDTOImpl _value, $Res Function(_$ItemSaveDTOImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? atualizarTodosItensZ = freezed,
    Object? item = null,
  }) {
    return _then(_$ItemSaveDTOImpl(
      atualizarTodosItensZ: freezed == atualizarTodosItensZ
          ? _value.atualizarTodosItensZ
          : atualizarTodosItensZ // ignore: cast_nullable_to_non_nullable
              as bool?,
      item: null == item
          ? _value.item
          : item // ignore: cast_nullable_to_non_nullable
              as ItemModel,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$ItemSaveDTOImpl implements _ItemSaveDTO {
  _$ItemSaveDTOImpl({required this.atualizarTodosItensZ, required this.item});

  factory _$ItemSaveDTOImpl.fromJson(Map<String, dynamic> json) =>
      _$$ItemSaveDTOImplFromJson(json);

  @override
  bool? atualizarTodosItensZ;
  @override
  ItemModel item;

  @override
  String toString() {
    return 'ItemSaveDTO(atualizarTodosItensZ: $atualizarTodosItensZ, item: $item)';
  }

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$ItemSaveDTOImplCopyWith<_$ItemSaveDTOImpl> get copyWith =>
      __$$ItemSaveDTOImplCopyWithImpl<_$ItemSaveDTOImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$ItemSaveDTOImplToJson(
      this,
    );
  }
}

abstract class _ItemSaveDTO implements ItemSaveDTO {
  factory _ItemSaveDTO(
      {required bool? atualizarTodosItensZ,
      required ItemModel item}) = _$ItemSaveDTOImpl;

  factory _ItemSaveDTO.fromJson(Map<String, dynamic> json) =
      _$ItemSaveDTOImpl.fromJson;

  @override
  bool? get atualizarTodosItensZ;
  set atualizarTodosItensZ(bool? value);
  @override
  ItemModel get item;
  set item(ItemModel value);
  @override
  @JsonKey(ignore: true)
  _$$ItemSaveDTOImplCopyWith<_$ItemSaveDTOImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
