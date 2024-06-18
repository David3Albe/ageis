// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'chave_valor_dto.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

ChaveValorDTO _$ChaveValorDTOFromJson(Map<String, dynamic> json) {
  return _ChaveValorDTO.fromJson(json);
}

/// @nodoc
mixin _$ChaveValorDTO {
  String get chave => throw _privateConstructorUsedError;
  set chave(String value) => throw _privateConstructorUsedError;
  String get valor => throw _privateConstructorUsedError;
  set valor(String value) => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $ChaveValorDTOCopyWith<ChaveValorDTO> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $ChaveValorDTOCopyWith<$Res> {
  factory $ChaveValorDTOCopyWith(
          ChaveValorDTO value, $Res Function(ChaveValorDTO) then) =
      _$ChaveValorDTOCopyWithImpl<$Res, ChaveValorDTO>;
  @useResult
  $Res call({String chave, String valor});
}

/// @nodoc
class _$ChaveValorDTOCopyWithImpl<$Res, $Val extends ChaveValorDTO>
    implements $ChaveValorDTOCopyWith<$Res> {
  _$ChaveValorDTOCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? chave = null,
    Object? valor = null,
  }) {
    return _then(_value.copyWith(
      chave: null == chave
          ? _value.chave
          : chave // ignore: cast_nullable_to_non_nullable
              as String,
      valor: null == valor
          ? _value.valor
          : valor // ignore: cast_nullable_to_non_nullable
              as String,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$ChaveValorDTOImplCopyWith<$Res>
    implements $ChaveValorDTOCopyWith<$Res> {
  factory _$$ChaveValorDTOImplCopyWith(
          _$ChaveValorDTOImpl value, $Res Function(_$ChaveValorDTOImpl) then) =
      __$$ChaveValorDTOImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({String chave, String valor});
}

/// @nodoc
class __$$ChaveValorDTOImplCopyWithImpl<$Res>
    extends _$ChaveValorDTOCopyWithImpl<$Res, _$ChaveValorDTOImpl>
    implements _$$ChaveValorDTOImplCopyWith<$Res> {
  __$$ChaveValorDTOImplCopyWithImpl(
      _$ChaveValorDTOImpl _value, $Res Function(_$ChaveValorDTOImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? chave = null,
    Object? valor = null,
  }) {
    return _then(_$ChaveValorDTOImpl(
      chave: null == chave
          ? _value.chave
          : chave // ignore: cast_nullable_to_non_nullable
              as String,
      valor: null == valor
          ? _value.valor
          : valor // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$ChaveValorDTOImpl
    with DiagnosticableTreeMixin
    implements _ChaveValorDTO {
  _$ChaveValorDTOImpl({required this.chave, required this.valor});

  factory _$ChaveValorDTOImpl.fromJson(Map<String, dynamic> json) =>
      _$$ChaveValorDTOImplFromJson(json);

  @override
  String chave;
  @override
  String valor;

  @override
  String toString({DiagnosticLevel minLevel = DiagnosticLevel.info}) {
    return 'ChaveValorDTO(chave: $chave, valor: $valor)';
  }

  @override
  void debugFillProperties(DiagnosticPropertiesBuilder properties) {
    super.debugFillProperties(properties);
    properties
      ..add(DiagnosticsProperty('type', 'ChaveValorDTO'))
      ..add(DiagnosticsProperty('chave', chave))
      ..add(DiagnosticsProperty('valor', valor));
  }

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$ChaveValorDTOImplCopyWith<_$ChaveValorDTOImpl> get copyWith =>
      __$$ChaveValorDTOImplCopyWithImpl<_$ChaveValorDTOImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$ChaveValorDTOImplToJson(
      this,
    );
  }
}

abstract class _ChaveValorDTO implements ChaveValorDTO {
  factory _ChaveValorDTO({required String chave, required String valor}) =
      _$ChaveValorDTOImpl;

  factory _ChaveValorDTO.fromJson(Map<String, dynamic> json) =
      _$ChaveValorDTOImpl.fromJson;

  @override
  String get chave;
  set chave(String value);
  @override
  String get valor;
  set valor(String value);
  @override
  @JsonKey(ignore: true)
  _$$ChaveValorDTOImplCopyWith<_$ChaveValorDTOImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
