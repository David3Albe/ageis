// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'item_etiqueta_dto.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

ItemEtiquetaDTO _$ItemEtiquetaDTOFromJson(Map<String, dynamic> json) {
  return _ItemEtiquetaDTO.fromJson(json);
}

/// @nodoc
mixin _$ItemEtiquetaDTO {
  int? get codItem => throw _privateConstructorUsedError;
  set codItem(int? value) => throw _privateConstructorUsedError;
  String? get idEtiquetaContem => throw _privateConstructorUsedError;
  set idEtiquetaContem(String? value) => throw _privateConstructorUsedError;
  String? get idEtiquetaItemContem => throw _privateConstructorUsedError;
  set idEtiquetaItemContem(String? value) => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $ItemEtiquetaDTOCopyWith<ItemEtiquetaDTO> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $ItemEtiquetaDTOCopyWith<$Res> {
  factory $ItemEtiquetaDTOCopyWith(
          ItemEtiquetaDTO value, $Res Function(ItemEtiquetaDTO) then) =
      _$ItemEtiquetaDTOCopyWithImpl<$Res, ItemEtiquetaDTO>;
  @useResult
  $Res call(
      {int? codItem, String? idEtiquetaContem, String? idEtiquetaItemContem});
}

/// @nodoc
class _$ItemEtiquetaDTOCopyWithImpl<$Res, $Val extends ItemEtiquetaDTO>
    implements $ItemEtiquetaDTOCopyWith<$Res> {
  _$ItemEtiquetaDTOCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? codItem = freezed,
    Object? idEtiquetaContem = freezed,
    Object? idEtiquetaItemContem = freezed,
  }) {
    return _then(_value.copyWith(
      codItem: freezed == codItem
          ? _value.codItem
          : codItem // ignore: cast_nullable_to_non_nullable
              as int?,
      idEtiquetaContem: freezed == idEtiquetaContem
          ? _value.idEtiquetaContem
          : idEtiquetaContem // ignore: cast_nullable_to_non_nullable
              as String?,
      idEtiquetaItemContem: freezed == idEtiquetaItemContem
          ? _value.idEtiquetaItemContem
          : idEtiquetaItemContem // ignore: cast_nullable_to_non_nullable
              as String?,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$ItemEtiquetaDTOImplCopyWith<$Res>
    implements $ItemEtiquetaDTOCopyWith<$Res> {
  factory _$$ItemEtiquetaDTOImplCopyWith(_$ItemEtiquetaDTOImpl value,
          $Res Function(_$ItemEtiquetaDTOImpl) then) =
      __$$ItemEtiquetaDTOImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {int? codItem, String? idEtiquetaContem, String? idEtiquetaItemContem});
}

/// @nodoc
class __$$ItemEtiquetaDTOImplCopyWithImpl<$Res>
    extends _$ItemEtiquetaDTOCopyWithImpl<$Res, _$ItemEtiquetaDTOImpl>
    implements _$$ItemEtiquetaDTOImplCopyWith<$Res> {
  __$$ItemEtiquetaDTOImplCopyWithImpl(
      _$ItemEtiquetaDTOImpl _value, $Res Function(_$ItemEtiquetaDTOImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? codItem = freezed,
    Object? idEtiquetaContem = freezed,
    Object? idEtiquetaItemContem = freezed,
  }) {
    return _then(_$ItemEtiquetaDTOImpl(
      codItem: freezed == codItem
          ? _value.codItem
          : codItem // ignore: cast_nullable_to_non_nullable
              as int?,
      idEtiquetaContem: freezed == idEtiquetaContem
          ? _value.idEtiquetaContem
          : idEtiquetaContem // ignore: cast_nullable_to_non_nullable
              as String?,
      idEtiquetaItemContem: freezed == idEtiquetaItemContem
          ? _value.idEtiquetaItemContem
          : idEtiquetaItemContem // ignore: cast_nullable_to_non_nullable
              as String?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$ItemEtiquetaDTOImpl implements _ItemEtiquetaDTO {
  _$ItemEtiquetaDTOImpl(
      {this.codItem, this.idEtiquetaContem, this.idEtiquetaItemContem});

  factory _$ItemEtiquetaDTOImpl.fromJson(Map<String, dynamic> json) =>
      _$$ItemEtiquetaDTOImplFromJson(json);

  @override
  int? codItem;
  @override
  String? idEtiquetaContem;
  @override
  String? idEtiquetaItemContem;

  @override
  String toString() {
    return 'ItemEtiquetaDTO(codItem: $codItem, idEtiquetaContem: $idEtiquetaContem, idEtiquetaItemContem: $idEtiquetaItemContem)';
  }

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$ItemEtiquetaDTOImplCopyWith<_$ItemEtiquetaDTOImpl> get copyWith =>
      __$$ItemEtiquetaDTOImplCopyWithImpl<_$ItemEtiquetaDTOImpl>(
          this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$ItemEtiquetaDTOImplToJson(
      this,
    );
  }
}

abstract class _ItemEtiquetaDTO implements ItemEtiquetaDTO {
  factory _ItemEtiquetaDTO(
      {int? codItem,
      String? idEtiquetaContem,
      String? idEtiquetaItemContem}) = _$ItemEtiquetaDTOImpl;

  factory _ItemEtiquetaDTO.fromJson(Map<String, dynamic> json) =
      _$ItemEtiquetaDTOImpl.fromJson;

  @override
  int? get codItem;
  set codItem(int? value);
  @override
  String? get idEtiquetaContem;
  set idEtiquetaContem(String? value);
  @override
  String? get idEtiquetaItemContem;
  set idEtiquetaItemContem(String? value);
  @override
  @JsonKey(ignore: true)
  _$$ItemEtiquetaDTOImplCopyWith<_$ItemEtiquetaDTOImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
