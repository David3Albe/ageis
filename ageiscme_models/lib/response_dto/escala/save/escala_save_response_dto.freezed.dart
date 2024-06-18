// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'escala_save_response_dto.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

EscalaSaveResponseDTO _$EscalaSaveResponseDTOFromJson(
    Map<String, dynamic> json) {
  return _EscalaSaveResponseDTO.fromJson(json);
}

/// @nodoc
mixin _$EscalaSaveResponseDTO {
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $EscalaSaveResponseDTOCopyWith<$Res> {
  factory $EscalaSaveResponseDTOCopyWith(EscalaSaveResponseDTO value,
          $Res Function(EscalaSaveResponseDTO) then) =
      _$EscalaSaveResponseDTOCopyWithImpl<$Res, EscalaSaveResponseDTO>;
}

/// @nodoc
class _$EscalaSaveResponseDTOCopyWithImpl<$Res,
        $Val extends EscalaSaveResponseDTO>
    implements $EscalaSaveResponseDTOCopyWith<$Res> {
  _$EscalaSaveResponseDTOCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;
}

/// @nodoc
abstract class _$$EscalaSaveResponseDTOImplCopyWith<$Res> {
  factory _$$EscalaSaveResponseDTOImplCopyWith(
          _$EscalaSaveResponseDTOImpl value,
          $Res Function(_$EscalaSaveResponseDTOImpl) then) =
      __$$EscalaSaveResponseDTOImplCopyWithImpl<$Res>;
}

/// @nodoc
class __$$EscalaSaveResponseDTOImplCopyWithImpl<$Res>
    extends _$EscalaSaveResponseDTOCopyWithImpl<$Res,
        _$EscalaSaveResponseDTOImpl>
    implements _$$EscalaSaveResponseDTOImplCopyWith<$Res> {
  __$$EscalaSaveResponseDTOImplCopyWithImpl(_$EscalaSaveResponseDTOImpl _value,
      $Res Function(_$EscalaSaveResponseDTOImpl) _then)
      : super(_value, _then);
}

/// @nodoc
@JsonSerializable()
class _$EscalaSaveResponseDTOImpl extends _EscalaSaveResponseDTO
    with DiagnosticableTreeMixin {
  _$EscalaSaveResponseDTOImpl() : super._();

  factory _$EscalaSaveResponseDTOImpl.fromJson(Map<String, dynamic> json) =>
      _$$EscalaSaveResponseDTOImplFromJson(json);

  @override
  String toString({DiagnosticLevel minLevel = DiagnosticLevel.info}) {
    return 'EscalaSaveResponseDTO()';
  }

  @override
  void debugFillProperties(DiagnosticPropertiesBuilder properties) {
    super.debugFillProperties(properties);
    properties.add(DiagnosticsProperty('type', 'EscalaSaveResponseDTO'));
  }

  @override
  Map<String, dynamic> toJson() {
    return _$$EscalaSaveResponseDTOImplToJson(
      this,
    );
  }
}

abstract class _EscalaSaveResponseDTO extends EscalaSaveResponseDTO {
  factory _EscalaSaveResponseDTO() = _$EscalaSaveResponseDTOImpl;
  _EscalaSaveResponseDTO._() : super._();

  factory _EscalaSaveResponseDTO.fromJson(Map<String, dynamic> json) =
      _$EscalaSaveResponseDTOImpl.fromJson;
}
