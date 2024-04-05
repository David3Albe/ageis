// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'item_etiqueta_preparo_dto.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

ItemEtiquetaPreparoDTO _$ItemEtiquetaPreparoDTOFromJson(
    Map<String, dynamic> json) {
  return _ItemEtiquetaPreparoDTO.fromJson(json);
}

/// @nodoc
mixin _$ItemEtiquetaPreparoDTO {
  int get codItem => throw _privateConstructorUsedError;
  set codItem(int value) => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $ItemEtiquetaPreparoDTOCopyWith<ItemEtiquetaPreparoDTO> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $ItemEtiquetaPreparoDTOCopyWith<$Res> {
  factory $ItemEtiquetaPreparoDTOCopyWith(ItemEtiquetaPreparoDTO value,
          $Res Function(ItemEtiquetaPreparoDTO) then) =
      _$ItemEtiquetaPreparoDTOCopyWithImpl<$Res, ItemEtiquetaPreparoDTO>;
  @useResult
  $Res call({int codItem});
}

/// @nodoc
class _$ItemEtiquetaPreparoDTOCopyWithImpl<$Res,
        $Val extends ItemEtiquetaPreparoDTO>
    implements $ItemEtiquetaPreparoDTOCopyWith<$Res> {
  _$ItemEtiquetaPreparoDTOCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? codItem = null,
  }) {
    return _then(_value.copyWith(
      codItem: null == codItem
          ? _value.codItem
          : codItem // ignore: cast_nullable_to_non_nullable
              as int,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$ItemEtiquetaPreparoDTOImplCopyWith<$Res>
    implements $ItemEtiquetaPreparoDTOCopyWith<$Res> {
  factory _$$ItemEtiquetaPreparoDTOImplCopyWith(
          _$ItemEtiquetaPreparoDTOImpl value,
          $Res Function(_$ItemEtiquetaPreparoDTOImpl) then) =
      __$$ItemEtiquetaPreparoDTOImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({int codItem});
}

/// @nodoc
class __$$ItemEtiquetaPreparoDTOImplCopyWithImpl<$Res>
    extends _$ItemEtiquetaPreparoDTOCopyWithImpl<$Res,
        _$ItemEtiquetaPreparoDTOImpl>
    implements _$$ItemEtiquetaPreparoDTOImplCopyWith<$Res> {
  __$$ItemEtiquetaPreparoDTOImplCopyWithImpl(
      _$ItemEtiquetaPreparoDTOImpl _value,
      $Res Function(_$ItemEtiquetaPreparoDTOImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? codItem = null,
  }) {
    return _then(_$ItemEtiquetaPreparoDTOImpl(
      codItem: null == codItem
          ? _value.codItem
          : codItem // ignore: cast_nullable_to_non_nullable
              as int,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$ItemEtiquetaPreparoDTOImpl implements _ItemEtiquetaPreparoDTO {
  _$ItemEtiquetaPreparoDTOImpl({required this.codItem});

  factory _$ItemEtiquetaPreparoDTOImpl.fromJson(Map<String, dynamic> json) =>
      _$$ItemEtiquetaPreparoDTOImplFromJson(json);

  @override
  int codItem;

  @override
  String toString() {
    return 'ItemEtiquetaPreparoDTO(codItem: $codItem)';
  }

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$ItemEtiquetaPreparoDTOImplCopyWith<_$ItemEtiquetaPreparoDTOImpl>
      get copyWith => __$$ItemEtiquetaPreparoDTOImplCopyWithImpl<
          _$ItemEtiquetaPreparoDTOImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$ItemEtiquetaPreparoDTOImplToJson(
      this,
    );
  }
}

abstract class _ItemEtiquetaPreparoDTO implements ItemEtiquetaPreparoDTO {
  factory _ItemEtiquetaPreparoDTO({required int codItem}) =
      _$ItemEtiquetaPreparoDTOImpl;

  factory _ItemEtiquetaPreparoDTO.fromJson(Map<String, dynamic> json) =
      _$ItemEtiquetaPreparoDTOImpl.fromJson;

  @override
  int get codItem;
  set codItem(int value);
  @override
  @JsonKey(ignore: true)
  _$$ItemEtiquetaPreparoDTOImplCopyWith<_$ItemEtiquetaPreparoDTOImpl>
      get copyWith => throw _privateConstructorUsedError;
}
