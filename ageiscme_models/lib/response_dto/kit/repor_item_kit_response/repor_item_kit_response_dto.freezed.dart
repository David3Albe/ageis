// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'repor_item_kit_response_dto.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

ReporItemKitResponseDTO _$ReporItemKitResponseDTOFromJson(
    Map<String, dynamic> json) {
  return _ReporItemKitResponseDTO.fromJson(json);
}

/// @nodoc
mixin _$ReporItemKitResponseDTO {
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $ReporItemKitResponseDTOCopyWith<$Res> {
  factory $ReporItemKitResponseDTOCopyWith(ReporItemKitResponseDTO value,
          $Res Function(ReporItemKitResponseDTO) then) =
      _$ReporItemKitResponseDTOCopyWithImpl<$Res, ReporItemKitResponseDTO>;
}

/// @nodoc
class _$ReporItemKitResponseDTOCopyWithImpl<$Res,
        $Val extends ReporItemKitResponseDTO>
    implements $ReporItemKitResponseDTOCopyWith<$Res> {
  _$ReporItemKitResponseDTOCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;
}

/// @nodoc
abstract class _$$ReporItemKitResponseDTOImplCopyWith<$Res> {
  factory _$$ReporItemKitResponseDTOImplCopyWith(
          _$ReporItemKitResponseDTOImpl value,
          $Res Function(_$ReporItemKitResponseDTOImpl) then) =
      __$$ReporItemKitResponseDTOImplCopyWithImpl<$Res>;
}

/// @nodoc
class __$$ReporItemKitResponseDTOImplCopyWithImpl<$Res>
    extends _$ReporItemKitResponseDTOCopyWithImpl<$Res,
        _$ReporItemKitResponseDTOImpl>
    implements _$$ReporItemKitResponseDTOImplCopyWith<$Res> {
  __$$ReporItemKitResponseDTOImplCopyWithImpl(
      _$ReporItemKitResponseDTOImpl _value,
      $Res Function(_$ReporItemKitResponseDTOImpl) _then)
      : super(_value, _then);
}

/// @nodoc
@JsonSerializable()
class _$ReporItemKitResponseDTOImpl
    with DiagnosticableTreeMixin
    implements _ReporItemKitResponseDTO {
  _$ReporItemKitResponseDTOImpl();

  factory _$ReporItemKitResponseDTOImpl.fromJson(Map<String, dynamic> json) =>
      _$$ReporItemKitResponseDTOImplFromJson(json);

  @override
  String toString({DiagnosticLevel minLevel = DiagnosticLevel.info}) {
    return 'ReporItemKitResponseDTO()';
  }

  @override
  void debugFillProperties(DiagnosticPropertiesBuilder properties) {
    super.debugFillProperties(properties);
    properties.add(DiagnosticsProperty('type', 'ReporItemKitResponseDTO'));
  }

  @override
  Map<String, dynamic> toJson() {
    return _$$ReporItemKitResponseDTOImplToJson(
      this,
    );
  }
}

abstract class _ReporItemKitResponseDTO implements ReporItemKitResponseDTO {
  factory _ReporItemKitResponseDTO() = _$ReporItemKitResponseDTOImpl;

  factory _ReporItemKitResponseDTO.fromJson(Map<String, dynamic> json) =
      _$ReporItemKitResponseDTOImpl.fromJson;
}
