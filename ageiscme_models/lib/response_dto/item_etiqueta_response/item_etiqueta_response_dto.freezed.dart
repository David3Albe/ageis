// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'item_etiqueta_response_dto.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

ItemEtiquetaResponseDTO _$ItemEtiquetaResponseDTOFromJson(
    Map<String, dynamic> json) {
  return _ItemEtiquetaResponseDTO.fromJson(json);
}

/// @nodoc
mixin _$ItemEtiquetaResponseDTO {
  List<ItemEtiquetaItemResponseDTO> get itens =>
      throw _privateConstructorUsedError;
  set itens(List<ItemEtiquetaItemResponseDTO> value) =>
      throw _privateConstructorUsedError;
  Map<int, ItemEtiquetaUsuarioResponseDTO> get usuarios =>
      throw _privateConstructorUsedError;
  set usuarios(Map<int, ItemEtiquetaUsuarioResponseDTO> value) =>
      throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $ItemEtiquetaResponseDTOCopyWith<ItemEtiquetaResponseDTO> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $ItemEtiquetaResponseDTOCopyWith<$Res> {
  factory $ItemEtiquetaResponseDTOCopyWith(ItemEtiquetaResponseDTO value,
          $Res Function(ItemEtiquetaResponseDTO) then) =
      _$ItemEtiquetaResponseDTOCopyWithImpl<$Res, ItemEtiquetaResponseDTO>;
  @useResult
  $Res call(
      {List<ItemEtiquetaItemResponseDTO> itens,
      Map<int, ItemEtiquetaUsuarioResponseDTO> usuarios});
}

/// @nodoc
class _$ItemEtiquetaResponseDTOCopyWithImpl<$Res,
        $Val extends ItemEtiquetaResponseDTO>
    implements $ItemEtiquetaResponseDTOCopyWith<$Res> {
  _$ItemEtiquetaResponseDTOCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? itens = null,
    Object? usuarios = null,
  }) {
    return _then(_value.copyWith(
      itens: null == itens
          ? _value.itens
          : itens // ignore: cast_nullable_to_non_nullable
              as List<ItemEtiquetaItemResponseDTO>,
      usuarios: null == usuarios
          ? _value.usuarios
          : usuarios // ignore: cast_nullable_to_non_nullable
              as Map<int, ItemEtiquetaUsuarioResponseDTO>,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$ItemEtiquetaResponseDTOImplCopyWith<$Res>
    implements $ItemEtiquetaResponseDTOCopyWith<$Res> {
  factory _$$ItemEtiquetaResponseDTOImplCopyWith(
          _$ItemEtiquetaResponseDTOImpl value,
          $Res Function(_$ItemEtiquetaResponseDTOImpl) then) =
      __$$ItemEtiquetaResponseDTOImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {List<ItemEtiquetaItemResponseDTO> itens,
      Map<int, ItemEtiquetaUsuarioResponseDTO> usuarios});
}

/// @nodoc
class __$$ItemEtiquetaResponseDTOImplCopyWithImpl<$Res>
    extends _$ItemEtiquetaResponseDTOCopyWithImpl<$Res,
        _$ItemEtiquetaResponseDTOImpl>
    implements _$$ItemEtiquetaResponseDTOImplCopyWith<$Res> {
  __$$ItemEtiquetaResponseDTOImplCopyWithImpl(
      _$ItemEtiquetaResponseDTOImpl _value,
      $Res Function(_$ItemEtiquetaResponseDTOImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? itens = null,
    Object? usuarios = null,
  }) {
    return _then(_$ItemEtiquetaResponseDTOImpl(
      itens: null == itens
          ? _value.itens
          : itens // ignore: cast_nullable_to_non_nullable
              as List<ItemEtiquetaItemResponseDTO>,
      usuarios: null == usuarios
          ? _value.usuarios
          : usuarios // ignore: cast_nullable_to_non_nullable
              as Map<int, ItemEtiquetaUsuarioResponseDTO>,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$ItemEtiquetaResponseDTOImpl
    with DiagnosticableTreeMixin
    implements _ItemEtiquetaResponseDTO {
  _$ItemEtiquetaResponseDTOImpl({required this.itens, required this.usuarios});

  factory _$ItemEtiquetaResponseDTOImpl.fromJson(Map<String, dynamic> json) =>
      _$$ItemEtiquetaResponseDTOImplFromJson(json);

  @override
  List<ItemEtiquetaItemResponseDTO> itens;
  @override
  Map<int, ItemEtiquetaUsuarioResponseDTO> usuarios;

  @override
  String toString({DiagnosticLevel minLevel = DiagnosticLevel.info}) {
    return 'ItemEtiquetaResponseDTO(itens: $itens, usuarios: $usuarios)';
  }

  @override
  void debugFillProperties(DiagnosticPropertiesBuilder properties) {
    super.debugFillProperties(properties);
    properties
      ..add(DiagnosticsProperty('type', 'ItemEtiquetaResponseDTO'))
      ..add(DiagnosticsProperty('itens', itens))
      ..add(DiagnosticsProperty('usuarios', usuarios));
  }

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$ItemEtiquetaResponseDTOImplCopyWith<_$ItemEtiquetaResponseDTOImpl>
      get copyWith => __$$ItemEtiquetaResponseDTOImplCopyWithImpl<
          _$ItemEtiquetaResponseDTOImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$ItemEtiquetaResponseDTOImplToJson(
      this,
    );
  }
}

abstract class _ItemEtiquetaResponseDTO implements ItemEtiquetaResponseDTO {
  factory _ItemEtiquetaResponseDTO(
          {required List<ItemEtiquetaItemResponseDTO> itens,
          required Map<int, ItemEtiquetaUsuarioResponseDTO> usuarios}) =
      _$ItemEtiquetaResponseDTOImpl;

  factory _ItemEtiquetaResponseDTO.fromJson(Map<String, dynamic> json) =
      _$ItemEtiquetaResponseDTOImpl.fromJson;

  @override
  List<ItemEtiquetaItemResponseDTO> get itens;
  set itens(List<ItemEtiquetaItemResponseDTO> value);
  @override
  Map<int, ItemEtiquetaUsuarioResponseDTO> get usuarios;
  set usuarios(Map<int, ItemEtiquetaUsuarioResponseDTO> value);
  @override
  @JsonKey(ignore: true)
  _$$ItemEtiquetaResponseDTOImplCopyWith<_$ItemEtiquetaResponseDTOImpl>
      get copyWith => throw _privateConstructorUsedError;
}
