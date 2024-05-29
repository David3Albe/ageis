// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'alterar_senha_padrao_dto.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

AlterarSenhaPadraoDTO _$AlterarSenhaPadraoDTOFromJson(
    Map<String, dynamic> json) {
  return _AlterarSenhaPadraoDTO.fromJson(json);
}

/// @nodoc
mixin _$AlterarSenhaPadraoDTO {
  int get codUsuario => throw _privateConstructorUsedError;
  set codUsuario(int value) => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $AlterarSenhaPadraoDTOCopyWith<AlterarSenhaPadraoDTO> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $AlterarSenhaPadraoDTOCopyWith<$Res> {
  factory $AlterarSenhaPadraoDTOCopyWith(AlterarSenhaPadraoDTO value,
          $Res Function(AlterarSenhaPadraoDTO) then) =
      _$AlterarSenhaPadraoDTOCopyWithImpl<$Res, AlterarSenhaPadraoDTO>;
  @useResult
  $Res call({int codUsuario});
}

/// @nodoc
class _$AlterarSenhaPadraoDTOCopyWithImpl<$Res,
        $Val extends AlterarSenhaPadraoDTO>
    implements $AlterarSenhaPadraoDTOCopyWith<$Res> {
  _$AlterarSenhaPadraoDTOCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? codUsuario = null,
  }) {
    return _then(_value.copyWith(
      codUsuario: null == codUsuario
          ? _value.codUsuario
          : codUsuario // ignore: cast_nullable_to_non_nullable
              as int,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$AlterarSenhaPadraoDTOImplCopyWith<$Res>
    implements $AlterarSenhaPadraoDTOCopyWith<$Res> {
  factory _$$AlterarSenhaPadraoDTOImplCopyWith(
          _$AlterarSenhaPadraoDTOImpl value,
          $Res Function(_$AlterarSenhaPadraoDTOImpl) then) =
      __$$AlterarSenhaPadraoDTOImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({int codUsuario});
}

/// @nodoc
class __$$AlterarSenhaPadraoDTOImplCopyWithImpl<$Res>
    extends _$AlterarSenhaPadraoDTOCopyWithImpl<$Res,
        _$AlterarSenhaPadraoDTOImpl>
    implements _$$AlterarSenhaPadraoDTOImplCopyWith<$Res> {
  __$$AlterarSenhaPadraoDTOImplCopyWithImpl(_$AlterarSenhaPadraoDTOImpl _value,
      $Res Function(_$AlterarSenhaPadraoDTOImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? codUsuario = null,
  }) {
    return _then(_$AlterarSenhaPadraoDTOImpl(
      codUsuario: null == codUsuario
          ? _value.codUsuario
          : codUsuario // ignore: cast_nullable_to_non_nullable
              as int,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$AlterarSenhaPadraoDTOImpl
    with DiagnosticableTreeMixin
    implements _AlterarSenhaPadraoDTO {
  _$AlterarSenhaPadraoDTOImpl({required this.codUsuario});

  factory _$AlterarSenhaPadraoDTOImpl.fromJson(Map<String, dynamic> json) =>
      _$$AlterarSenhaPadraoDTOImplFromJson(json);

  @override
  int codUsuario;

  @override
  String toString({DiagnosticLevel minLevel = DiagnosticLevel.info}) {
    return 'AlterarSenhaPadraoDTO(codUsuario: $codUsuario)';
  }

  @override
  void debugFillProperties(DiagnosticPropertiesBuilder properties) {
    super.debugFillProperties(properties);
    properties
      ..add(DiagnosticsProperty('type', 'AlterarSenhaPadraoDTO'))
      ..add(DiagnosticsProperty('codUsuario', codUsuario));
  }

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$AlterarSenhaPadraoDTOImplCopyWith<_$AlterarSenhaPadraoDTOImpl>
      get copyWith => __$$AlterarSenhaPadraoDTOImplCopyWithImpl<
          _$AlterarSenhaPadraoDTOImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$AlterarSenhaPadraoDTOImplToJson(
      this,
    );
  }
}

abstract class _AlterarSenhaPadraoDTO implements AlterarSenhaPadraoDTO {
  factory _AlterarSenhaPadraoDTO({required int codUsuario}) =
      _$AlterarSenhaPadraoDTOImpl;

  factory _AlterarSenhaPadraoDTO.fromJson(Map<String, dynamic> json) =
      _$AlterarSenhaPadraoDTOImpl.fromJson;

  @override
  int get codUsuario;
  set codUsuario(int value);
  @override
  @JsonKey(ignore: true)
  _$$AlterarSenhaPadraoDTOImplCopyWith<_$AlterarSenhaPadraoDTOImpl>
      get copyWith => throw _privateConstructorUsedError;
}
