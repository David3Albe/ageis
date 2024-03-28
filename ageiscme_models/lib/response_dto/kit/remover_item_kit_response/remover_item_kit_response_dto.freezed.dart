// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'remover_item_kit_response_dto.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

RemoverItemKitResponseDTO _$RemoverItemKitResponseDTOFromJson(
    Map<String, dynamic> json) {
  return _RemoverItemKitResponseDTO.fromJson(json);
}

/// @nodoc
mixin _$RemoverItemKitResponseDTO {
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $RemoverItemKitResponseDTOCopyWith<$Res> {
  factory $RemoverItemKitResponseDTOCopyWith(RemoverItemKitResponseDTO value,
          $Res Function(RemoverItemKitResponseDTO) then) =
      _$RemoverItemKitResponseDTOCopyWithImpl<$Res, RemoverItemKitResponseDTO>;
}

/// @nodoc
class _$RemoverItemKitResponseDTOCopyWithImpl<$Res,
        $Val extends RemoverItemKitResponseDTO>
    implements $RemoverItemKitResponseDTOCopyWith<$Res> {
  _$RemoverItemKitResponseDTOCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;
}

/// @nodoc
abstract class _$$RemoverItemKitResponseDTOImplCopyWith<$Res> {
  factory _$$RemoverItemKitResponseDTOImplCopyWith(
          _$RemoverItemKitResponseDTOImpl value,
          $Res Function(_$RemoverItemKitResponseDTOImpl) then) =
      __$$RemoverItemKitResponseDTOImplCopyWithImpl<$Res>;
}

/// @nodoc
class __$$RemoverItemKitResponseDTOImplCopyWithImpl<$Res>
    extends _$RemoverItemKitResponseDTOCopyWithImpl<$Res,
        _$RemoverItemKitResponseDTOImpl>
    implements _$$RemoverItemKitResponseDTOImplCopyWith<$Res> {
  __$$RemoverItemKitResponseDTOImplCopyWithImpl(
      _$RemoverItemKitResponseDTOImpl _value,
      $Res Function(_$RemoverItemKitResponseDTOImpl) _then)
      : super(_value, _then);
}

/// @nodoc
@JsonSerializable()
class _$RemoverItemKitResponseDTOImpl
    with DiagnosticableTreeMixin
    implements _RemoverItemKitResponseDTO {
  _$RemoverItemKitResponseDTOImpl();

  factory _$RemoverItemKitResponseDTOImpl.fromJson(Map<String, dynamic> json) =>
      _$$RemoverItemKitResponseDTOImplFromJson(json);

  @override
  String toString({DiagnosticLevel minLevel = DiagnosticLevel.info}) {
    return 'RemoverItemKitResponseDTO()';
  }

  @override
  void debugFillProperties(DiagnosticPropertiesBuilder properties) {
    super.debugFillProperties(properties);
    properties.add(DiagnosticsProperty('type', 'RemoverItemKitResponseDTO'));
  }

  @override
  Map<String, dynamic> toJson() {
    return _$$RemoverItemKitResponseDTOImplToJson(
      this,
    );
  }
}

abstract class _RemoverItemKitResponseDTO implements RemoverItemKitResponseDTO {
  factory _RemoverItemKitResponseDTO() = _$RemoverItemKitResponseDTOImpl;

  factory _RemoverItemKitResponseDTO.fromJson(Map<String, dynamic> json) =
      _$RemoverItemKitResponseDTOImpl.fromJson;
}
