// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'alterar_senha_dto.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

AlterarSenhaDTO _$AlterarSenhaDTOFromJson(Map<String, dynamic> json) {
  return _AlterarSenhaDTO.fromJson(json);
}

/// @nodoc
mixin _$AlterarSenhaDTO {
  int get codUsuario => throw _privateConstructorUsedError;
  set codUsuario(int value) => throw _privateConstructorUsedError;
  String get senhaAntiga => throw _privateConstructorUsedError;
  set senhaAntiga(String value) => throw _privateConstructorUsedError;
  String get senhaNova => throw _privateConstructorUsedError;
  set senhaNova(String value) => throw _privateConstructorUsedError;
  String get confirmacaoSenhaNova => throw _privateConstructorUsedError;
  set confirmacaoSenhaNova(String value) => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $AlterarSenhaDTOCopyWith<AlterarSenhaDTO> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $AlterarSenhaDTOCopyWith<$Res> {
  factory $AlterarSenhaDTOCopyWith(
          AlterarSenhaDTO value, $Res Function(AlterarSenhaDTO) then) =
      _$AlterarSenhaDTOCopyWithImpl<$Res, AlterarSenhaDTO>;
  @useResult
  $Res call(
      {int codUsuario,
      String senhaAntiga,
      String senhaNova,
      String confirmacaoSenhaNova});
}

/// @nodoc
class _$AlterarSenhaDTOCopyWithImpl<$Res, $Val extends AlterarSenhaDTO>
    implements $AlterarSenhaDTOCopyWith<$Res> {
  _$AlterarSenhaDTOCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? codUsuario = null,
    Object? senhaAntiga = null,
    Object? senhaNova = null,
    Object? confirmacaoSenhaNova = null,
  }) {
    return _then(_value.copyWith(
      codUsuario: null == codUsuario
          ? _value.codUsuario
          : codUsuario // ignore: cast_nullable_to_non_nullable
              as int,
      senhaAntiga: null == senhaAntiga
          ? _value.senhaAntiga
          : senhaAntiga // ignore: cast_nullable_to_non_nullable
              as String,
      senhaNova: null == senhaNova
          ? _value.senhaNova
          : senhaNova // ignore: cast_nullable_to_non_nullable
              as String,
      confirmacaoSenhaNova: null == confirmacaoSenhaNova
          ? _value.confirmacaoSenhaNova
          : confirmacaoSenhaNova // ignore: cast_nullable_to_non_nullable
              as String,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$AlterarSenhaDTOImplCopyWith<$Res>
    implements $AlterarSenhaDTOCopyWith<$Res> {
  factory _$$AlterarSenhaDTOImplCopyWith(_$AlterarSenhaDTOImpl value,
          $Res Function(_$AlterarSenhaDTOImpl) then) =
      __$$AlterarSenhaDTOImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {int codUsuario,
      String senhaAntiga,
      String senhaNova,
      String confirmacaoSenhaNova});
}

/// @nodoc
class __$$AlterarSenhaDTOImplCopyWithImpl<$Res>
    extends _$AlterarSenhaDTOCopyWithImpl<$Res, _$AlterarSenhaDTOImpl>
    implements _$$AlterarSenhaDTOImplCopyWith<$Res> {
  __$$AlterarSenhaDTOImplCopyWithImpl(
      _$AlterarSenhaDTOImpl _value, $Res Function(_$AlterarSenhaDTOImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? codUsuario = null,
    Object? senhaAntiga = null,
    Object? senhaNova = null,
    Object? confirmacaoSenhaNova = null,
  }) {
    return _then(_$AlterarSenhaDTOImpl(
      codUsuario: null == codUsuario
          ? _value.codUsuario
          : codUsuario // ignore: cast_nullable_to_non_nullable
              as int,
      senhaAntiga: null == senhaAntiga
          ? _value.senhaAntiga
          : senhaAntiga // ignore: cast_nullable_to_non_nullable
              as String,
      senhaNova: null == senhaNova
          ? _value.senhaNova
          : senhaNova // ignore: cast_nullable_to_non_nullable
              as String,
      confirmacaoSenhaNova: null == confirmacaoSenhaNova
          ? _value.confirmacaoSenhaNova
          : confirmacaoSenhaNova // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$AlterarSenhaDTOImpl
    with DiagnosticableTreeMixin
    implements _AlterarSenhaDTO {
  _$AlterarSenhaDTOImpl(
      {required this.codUsuario,
      required this.senhaAntiga,
      required this.senhaNova,
      required this.confirmacaoSenhaNova});

  factory _$AlterarSenhaDTOImpl.fromJson(Map<String, dynamic> json) =>
      _$$AlterarSenhaDTOImplFromJson(json);

  @override
  int codUsuario;
  @override
  String senhaAntiga;
  @override
  String senhaNova;
  @override
  String confirmacaoSenhaNova;

  @override
  String toString({DiagnosticLevel minLevel = DiagnosticLevel.info}) {
    return 'AlterarSenhaDTO(codUsuario: $codUsuario, senhaAntiga: $senhaAntiga, senhaNova: $senhaNova, confirmacaoSenhaNova: $confirmacaoSenhaNova)';
  }

  @override
  void debugFillProperties(DiagnosticPropertiesBuilder properties) {
    super.debugFillProperties(properties);
    properties
      ..add(DiagnosticsProperty('type', 'AlterarSenhaDTO'))
      ..add(DiagnosticsProperty('codUsuario', codUsuario))
      ..add(DiagnosticsProperty('senhaAntiga', senhaAntiga))
      ..add(DiagnosticsProperty('senhaNova', senhaNova))
      ..add(DiagnosticsProperty('confirmacaoSenhaNova', confirmacaoSenhaNova));
  }

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$AlterarSenhaDTOImplCopyWith<_$AlterarSenhaDTOImpl> get copyWith =>
      __$$AlterarSenhaDTOImplCopyWithImpl<_$AlterarSenhaDTOImpl>(
          this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$AlterarSenhaDTOImplToJson(
      this,
    );
  }
}

abstract class _AlterarSenhaDTO implements AlterarSenhaDTO {
  factory _AlterarSenhaDTO(
      {required int codUsuario,
      required String senhaAntiga,
      required String senhaNova,
      required String confirmacaoSenhaNova}) = _$AlterarSenhaDTOImpl;

  factory _AlterarSenhaDTO.fromJson(Map<String, dynamic> json) =
      _$AlterarSenhaDTOImpl.fromJson;

  @override
  int get codUsuario;
  set codUsuario(int value);
  @override
  String get senhaAntiga;
  set senhaAntiga(String value);
  @override
  String get senhaNova;
  set senhaNova(String value);
  @override
  String get confirmacaoSenhaNova;
  set confirmacaoSenhaNova(String value);
  @override
  @JsonKey(ignore: true)
  _$$AlterarSenhaDTOImplCopyWith<_$AlterarSenhaDTOImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
