// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'item_rotulado_response_dto.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

ItemRotuladoResponseDTO _$ItemRotuladoResponseDTOFromJson(
    Map<String, dynamic> json) {
  return _ItemRotuladoResponseDTO.fromJson(json);
}

/// @nodoc
mixin _$ItemRotuladoResponseDTO {
  List<ItemRotuladoItemResponseDTO> get itens =>
      throw _privateConstructorUsedError;
  set itens(List<ItemRotuladoItemResponseDTO> value) =>
      throw _privateConstructorUsedError;
  Map<int, ItemRotuladoProprietarioResponseDTO> get proprietarios =>
      throw _privateConstructorUsedError;
  set proprietarios(Map<int, ItemRotuladoProprietarioResponseDTO> value) =>
      throw _privateConstructorUsedError;
  Map<int, ItemRotuladoTiposProcessoNormalResponseDTO>
      get tiposProcessoNormal => throw _privateConstructorUsedError;
  set tiposProcessoNormal(
          Map<int, ItemRotuladoTiposProcessoNormalResponseDTO> value) =>
      throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $ItemRotuladoResponseDTOCopyWith<ItemRotuladoResponseDTO> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $ItemRotuladoResponseDTOCopyWith<$Res> {
  factory $ItemRotuladoResponseDTOCopyWith(ItemRotuladoResponseDTO value,
          $Res Function(ItemRotuladoResponseDTO) then) =
      _$ItemRotuladoResponseDTOCopyWithImpl<$Res, ItemRotuladoResponseDTO>;
  @useResult
  $Res call(
      {List<ItemRotuladoItemResponseDTO> itens,
      Map<int, ItemRotuladoProprietarioResponseDTO> proprietarios,
      Map<int, ItemRotuladoTiposProcessoNormalResponseDTO>
          tiposProcessoNormal});
}

/// @nodoc
class _$ItemRotuladoResponseDTOCopyWithImpl<$Res,
        $Val extends ItemRotuladoResponseDTO>
    implements $ItemRotuladoResponseDTOCopyWith<$Res> {
  _$ItemRotuladoResponseDTOCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? itens = null,
    Object? proprietarios = null,
    Object? tiposProcessoNormal = null,
  }) {
    return _then(_value.copyWith(
      itens: null == itens
          ? _value.itens
          : itens // ignore: cast_nullable_to_non_nullable
              as List<ItemRotuladoItemResponseDTO>,
      proprietarios: null == proprietarios
          ? _value.proprietarios
          : proprietarios // ignore: cast_nullable_to_non_nullable
              as Map<int, ItemRotuladoProprietarioResponseDTO>,
      tiposProcessoNormal: null == tiposProcessoNormal
          ? _value.tiposProcessoNormal
          : tiposProcessoNormal // ignore: cast_nullable_to_non_nullable
              as Map<int, ItemRotuladoTiposProcessoNormalResponseDTO>,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$ItemRotuladoResponseDTOImplCopyWith<$Res>
    implements $ItemRotuladoResponseDTOCopyWith<$Res> {
  factory _$$ItemRotuladoResponseDTOImplCopyWith(
          _$ItemRotuladoResponseDTOImpl value,
          $Res Function(_$ItemRotuladoResponseDTOImpl) then) =
      __$$ItemRotuladoResponseDTOImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {List<ItemRotuladoItemResponseDTO> itens,
      Map<int, ItemRotuladoProprietarioResponseDTO> proprietarios,
      Map<int, ItemRotuladoTiposProcessoNormalResponseDTO>
          tiposProcessoNormal});
}

/// @nodoc
class __$$ItemRotuladoResponseDTOImplCopyWithImpl<$Res>
    extends _$ItemRotuladoResponseDTOCopyWithImpl<$Res,
        _$ItemRotuladoResponseDTOImpl>
    implements _$$ItemRotuladoResponseDTOImplCopyWith<$Res> {
  __$$ItemRotuladoResponseDTOImplCopyWithImpl(
      _$ItemRotuladoResponseDTOImpl _value,
      $Res Function(_$ItemRotuladoResponseDTOImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? itens = null,
    Object? proprietarios = null,
    Object? tiposProcessoNormal = null,
  }) {
    return _then(_$ItemRotuladoResponseDTOImpl(
      itens: null == itens
          ? _value.itens
          : itens // ignore: cast_nullable_to_non_nullable
              as List<ItemRotuladoItemResponseDTO>,
      proprietarios: null == proprietarios
          ? _value.proprietarios
          : proprietarios // ignore: cast_nullable_to_non_nullable
              as Map<int, ItemRotuladoProprietarioResponseDTO>,
      tiposProcessoNormal: null == tiposProcessoNormal
          ? _value.tiposProcessoNormal
          : tiposProcessoNormal // ignore: cast_nullable_to_non_nullable
              as Map<int, ItemRotuladoTiposProcessoNormalResponseDTO>,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$ItemRotuladoResponseDTOImpl
    with DiagnosticableTreeMixin
    implements _ItemRotuladoResponseDTO {
  _$ItemRotuladoResponseDTOImpl(
      {required this.itens,
      required this.proprietarios,
      required this.tiposProcessoNormal});

  factory _$ItemRotuladoResponseDTOImpl.fromJson(Map<String, dynamic> json) =>
      _$$ItemRotuladoResponseDTOImplFromJson(json);

  @override
  List<ItemRotuladoItemResponseDTO> itens;
  @override
  Map<int, ItemRotuladoProprietarioResponseDTO> proprietarios;
  @override
  Map<int, ItemRotuladoTiposProcessoNormalResponseDTO> tiposProcessoNormal;

  @override
  String toString({DiagnosticLevel minLevel = DiagnosticLevel.info}) {
    return 'ItemRotuladoResponseDTO(itens: $itens, proprietarios: $proprietarios, tiposProcessoNormal: $tiposProcessoNormal)';
  }

  @override
  void debugFillProperties(DiagnosticPropertiesBuilder properties) {
    super.debugFillProperties(properties);
    properties
      ..add(DiagnosticsProperty('type', 'ItemRotuladoResponseDTO'))
      ..add(DiagnosticsProperty('itens', itens))
      ..add(DiagnosticsProperty('proprietarios', proprietarios))
      ..add(DiagnosticsProperty('tiposProcessoNormal', tiposProcessoNormal));
  }

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$ItemRotuladoResponseDTOImplCopyWith<_$ItemRotuladoResponseDTOImpl>
      get copyWith => __$$ItemRotuladoResponseDTOImplCopyWithImpl<
          _$ItemRotuladoResponseDTOImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$ItemRotuladoResponseDTOImplToJson(
      this,
    );
  }
}

abstract class _ItemRotuladoResponseDTO implements ItemRotuladoResponseDTO {
  factory _ItemRotuladoResponseDTO(
      {required List<ItemRotuladoItemResponseDTO> itens,
      required Map<int, ItemRotuladoProprietarioResponseDTO> proprietarios,
      required Map<int, ItemRotuladoTiposProcessoNormalResponseDTO>
          tiposProcessoNormal}) = _$ItemRotuladoResponseDTOImpl;

  factory _ItemRotuladoResponseDTO.fromJson(Map<String, dynamic> json) =
      _$ItemRotuladoResponseDTOImpl.fromJson;

  @override
  List<ItemRotuladoItemResponseDTO> get itens;
  set itens(List<ItemRotuladoItemResponseDTO> value);
  @override
  Map<int, ItemRotuladoProprietarioResponseDTO> get proprietarios;
  set proprietarios(Map<int, ItemRotuladoProprietarioResponseDTO> value);
  @override
  Map<int, ItemRotuladoTiposProcessoNormalResponseDTO> get tiposProcessoNormal;
  set tiposProcessoNormal(
      Map<int, ItemRotuladoTiposProcessoNormalResponseDTO> value);
  @override
  @JsonKey(ignore: true)
  _$$ItemRotuladoResponseDTOImplCopyWith<_$ItemRotuladoResponseDTOImpl>
      get copyWith => throw _privateConstructorUsedError;
}
