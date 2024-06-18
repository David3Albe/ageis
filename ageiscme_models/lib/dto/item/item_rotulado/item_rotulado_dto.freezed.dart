// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'item_rotulado_dto.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

ItemRotuladoDTO _$ItemRotuladoDTOFromJson(Map<String, dynamic> json) {
  return _ItemRotuladoDTO.fromJson(json);
}

/// @nodoc
mixin _$ItemRotuladoDTO {
  bool? get ordenarPeloTipoProcesso => throw _privateConstructorUsedError;
  set ordenarPeloTipoProcesso(bool? value) =>
      throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $ItemRotuladoDTOCopyWith<ItemRotuladoDTO> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $ItemRotuladoDTOCopyWith<$Res> {
  factory $ItemRotuladoDTOCopyWith(
          ItemRotuladoDTO value, $Res Function(ItemRotuladoDTO) then) =
      _$ItemRotuladoDTOCopyWithImpl<$Res, ItemRotuladoDTO>;
  @useResult
  $Res call({bool? ordenarPeloTipoProcesso});
}

/// @nodoc
class _$ItemRotuladoDTOCopyWithImpl<$Res, $Val extends ItemRotuladoDTO>
    implements $ItemRotuladoDTOCopyWith<$Res> {
  _$ItemRotuladoDTOCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? ordenarPeloTipoProcesso = freezed,
  }) {
    return _then(_value.copyWith(
      ordenarPeloTipoProcesso: freezed == ordenarPeloTipoProcesso
          ? _value.ordenarPeloTipoProcesso
          : ordenarPeloTipoProcesso // ignore: cast_nullable_to_non_nullable
              as bool?,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$ItemRotuladoDTOImplCopyWith<$Res>
    implements $ItemRotuladoDTOCopyWith<$Res> {
  factory _$$ItemRotuladoDTOImplCopyWith(_$ItemRotuladoDTOImpl value,
          $Res Function(_$ItemRotuladoDTOImpl) then) =
      __$$ItemRotuladoDTOImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({bool? ordenarPeloTipoProcesso});
}

/// @nodoc
class __$$ItemRotuladoDTOImplCopyWithImpl<$Res>
    extends _$ItemRotuladoDTOCopyWithImpl<$Res, _$ItemRotuladoDTOImpl>
    implements _$$ItemRotuladoDTOImplCopyWith<$Res> {
  __$$ItemRotuladoDTOImplCopyWithImpl(
      _$ItemRotuladoDTOImpl _value, $Res Function(_$ItemRotuladoDTOImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? ordenarPeloTipoProcesso = freezed,
  }) {
    return _then(_$ItemRotuladoDTOImpl(
      ordenarPeloTipoProcesso: freezed == ordenarPeloTipoProcesso
          ? _value.ordenarPeloTipoProcesso
          : ordenarPeloTipoProcesso // ignore: cast_nullable_to_non_nullable
              as bool?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$ItemRotuladoDTOImpl implements _ItemRotuladoDTO {
  _$ItemRotuladoDTOImpl({this.ordenarPeloTipoProcesso});

  factory _$ItemRotuladoDTOImpl.fromJson(Map<String, dynamic> json) =>
      _$$ItemRotuladoDTOImplFromJson(json);

  @override
  bool? ordenarPeloTipoProcesso;

  @override
  String toString() {
    return 'ItemRotuladoDTO(ordenarPeloTipoProcesso: $ordenarPeloTipoProcesso)';
  }

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$ItemRotuladoDTOImplCopyWith<_$ItemRotuladoDTOImpl> get copyWith =>
      __$$ItemRotuladoDTOImplCopyWithImpl<_$ItemRotuladoDTOImpl>(
          this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$ItemRotuladoDTOImplToJson(
      this,
    );
  }
}

abstract class _ItemRotuladoDTO implements ItemRotuladoDTO {
  factory _ItemRotuladoDTO({bool? ordenarPeloTipoProcesso}) =
      _$ItemRotuladoDTOImpl;

  factory _ItemRotuladoDTO.fromJson(Map<String, dynamic> json) =
      _$ItemRotuladoDTOImpl.fromJson;

  @override
  bool? get ordenarPeloTipoProcesso;
  set ordenarPeloTipoProcesso(bool? value);
  @override
  @JsonKey(ignore: true)
  _$$ItemRotuladoDTOImplCopyWith<_$ItemRotuladoDTOImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
