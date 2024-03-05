// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'alterar_senha_result_dto.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

AlterarSenhaResultDTO _$AlterarSenhaResultDTOFromJson(
    Map<String, dynamic> json) {
  return _AlterarSenhaResultDTO.fromJson(json);
}

/// @nodoc
mixin _$AlterarSenhaResultDTO {
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $AlterarSenhaResultDTOCopyWith<$Res> {
  factory $AlterarSenhaResultDTOCopyWith(AlterarSenhaResultDTO value,
          $Res Function(AlterarSenhaResultDTO) then) =
      _$AlterarSenhaResultDTOCopyWithImpl<$Res, AlterarSenhaResultDTO>;
}

/// @nodoc
class _$AlterarSenhaResultDTOCopyWithImpl<$Res,
        $Val extends AlterarSenhaResultDTO>
    implements $AlterarSenhaResultDTOCopyWith<$Res> {
  _$AlterarSenhaResultDTOCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;
}

/// @nodoc
abstract class _$$AlterarSenhaResultDTOImplCopyWith<$Res> {
  factory _$$AlterarSenhaResultDTOImplCopyWith(
          _$AlterarSenhaResultDTOImpl value,
          $Res Function(_$AlterarSenhaResultDTOImpl) then) =
      __$$AlterarSenhaResultDTOImplCopyWithImpl<$Res>;
}

/// @nodoc
class __$$AlterarSenhaResultDTOImplCopyWithImpl<$Res>
    extends _$AlterarSenhaResultDTOCopyWithImpl<$Res,
        _$AlterarSenhaResultDTOImpl>
    implements _$$AlterarSenhaResultDTOImplCopyWith<$Res> {
  __$$AlterarSenhaResultDTOImplCopyWithImpl(_$AlterarSenhaResultDTOImpl _value,
      $Res Function(_$AlterarSenhaResultDTOImpl) _then)
      : super(_value, _then);
}

/// @nodoc
@JsonSerializable()
class _$AlterarSenhaResultDTOImpl
    with DiagnosticableTreeMixin
    implements _AlterarSenhaResultDTO {
  _$AlterarSenhaResultDTOImpl();

  factory _$AlterarSenhaResultDTOImpl.fromJson(Map<String, dynamic> json) =>
      _$$AlterarSenhaResultDTOImplFromJson(json);

  @override
  String toString({DiagnosticLevel minLevel = DiagnosticLevel.info}) {
    return 'AlterarSenhaResultDTO()';
  }

  @override
  void debugFillProperties(DiagnosticPropertiesBuilder properties) {
    super.debugFillProperties(properties);
    properties.add(DiagnosticsProperty('type', 'AlterarSenhaResultDTO'));
  }

  @override
  Map<String, dynamic> toJson() {
    return _$$AlterarSenhaResultDTOImplToJson(
      this,
    );
  }
}

abstract class _AlterarSenhaResultDTO implements AlterarSenhaResultDTO {
  factory _AlterarSenhaResultDTO() = _$AlterarSenhaResultDTOImpl;

  factory _AlterarSenhaResultDTO.fromJson(Map<String, dynamic> json) =
      _$AlterarSenhaResultDTOImpl.fromJson;
}
