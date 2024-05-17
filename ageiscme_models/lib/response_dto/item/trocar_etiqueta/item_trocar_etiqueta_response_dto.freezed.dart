// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'item_trocar_etiqueta_response_dto.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

ItemTrocarEtiquetaResponseDTO _$ItemTrocarEtiquetaResponseDTOFromJson(
    Map<String, dynamic> json) {
  return _ItemTrocarEtiquetaResponseDTO.fromJson(json);
}

/// @nodoc
mixin _$ItemTrocarEtiquetaResponseDTO {
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $ItemTrocarEtiquetaResponseDTOCopyWith<$Res> {
  factory $ItemTrocarEtiquetaResponseDTOCopyWith(
          ItemTrocarEtiquetaResponseDTO value,
          $Res Function(ItemTrocarEtiquetaResponseDTO) then) =
      _$ItemTrocarEtiquetaResponseDTOCopyWithImpl<$Res,
          ItemTrocarEtiquetaResponseDTO>;
}

/// @nodoc
class _$ItemTrocarEtiquetaResponseDTOCopyWithImpl<$Res,
        $Val extends ItemTrocarEtiquetaResponseDTO>
    implements $ItemTrocarEtiquetaResponseDTOCopyWith<$Res> {
  _$ItemTrocarEtiquetaResponseDTOCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;
}

/// @nodoc
abstract class _$$ItemTrocarEtiquetaResponseDTOImplCopyWith<$Res> {
  factory _$$ItemTrocarEtiquetaResponseDTOImplCopyWith(
          _$ItemTrocarEtiquetaResponseDTOImpl value,
          $Res Function(_$ItemTrocarEtiquetaResponseDTOImpl) then) =
      __$$ItemTrocarEtiquetaResponseDTOImplCopyWithImpl<$Res>;
}

/// @nodoc
class __$$ItemTrocarEtiquetaResponseDTOImplCopyWithImpl<$Res>
    extends _$ItemTrocarEtiquetaResponseDTOCopyWithImpl<$Res,
        _$ItemTrocarEtiquetaResponseDTOImpl>
    implements _$$ItemTrocarEtiquetaResponseDTOImplCopyWith<$Res> {
  __$$ItemTrocarEtiquetaResponseDTOImplCopyWithImpl(
      _$ItemTrocarEtiquetaResponseDTOImpl _value,
      $Res Function(_$ItemTrocarEtiquetaResponseDTOImpl) _then)
      : super(_value, _then);
}

/// @nodoc
@JsonSerializable()
class _$ItemTrocarEtiquetaResponseDTOImpl
    with DiagnosticableTreeMixin
    implements _ItemTrocarEtiquetaResponseDTO {
  _$ItemTrocarEtiquetaResponseDTOImpl();

  factory _$ItemTrocarEtiquetaResponseDTOImpl.fromJson(
          Map<String, dynamic> json) =>
      _$$ItemTrocarEtiquetaResponseDTOImplFromJson(json);

  @override
  String toString({DiagnosticLevel minLevel = DiagnosticLevel.info}) {
    return 'ItemTrocarEtiquetaResponseDTO()';
  }

  @override
  void debugFillProperties(DiagnosticPropertiesBuilder properties) {
    super.debugFillProperties(properties);
    properties
        .add(DiagnosticsProperty('type', 'ItemTrocarEtiquetaResponseDTO'));
  }

  @override
  Map<String, dynamic> toJson() {
    return _$$ItemTrocarEtiquetaResponseDTOImplToJson(
      this,
    );
  }
}

abstract class _ItemTrocarEtiquetaResponseDTO
    implements ItemTrocarEtiquetaResponseDTO {
  factory _ItemTrocarEtiquetaResponseDTO() =
      _$ItemTrocarEtiquetaResponseDTOImpl;

  factory _ItemTrocarEtiquetaResponseDTO.fromJson(Map<String, dynamic> json) =
      _$ItemTrocarEtiquetaResponseDTOImpl.fromJson;
}
