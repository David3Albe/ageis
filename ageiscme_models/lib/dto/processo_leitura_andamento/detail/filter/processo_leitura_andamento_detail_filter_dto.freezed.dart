// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'processo_leitura_andamento_detail_filter_dto.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

ProcessoLeituraAndamentoDetailFilterDTO
    _$ProcessoLeituraAndamentoDetailFilterDTOFromJson(
        Map<String, dynamic> json) {
  return _ProcessoLeituraAndamentoDetailFilterDTO.fromJson(json);
}

/// @nodoc
mixin _$ProcessoLeituraAndamentoDetailFilterDTO {
  int get cod => throw _privateConstructorUsedError;
  set cod(int value) => throw _privateConstructorUsedError;
  int get codUsuario => throw _privateConstructorUsedError;
  set codUsuario(int value) => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $ProcessoLeituraAndamentoDetailFilterDTOCopyWith<
          ProcessoLeituraAndamentoDetailFilterDTO>
      get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $ProcessoLeituraAndamentoDetailFilterDTOCopyWith<$Res> {
  factory $ProcessoLeituraAndamentoDetailFilterDTOCopyWith(
          ProcessoLeituraAndamentoDetailFilterDTO value,
          $Res Function(ProcessoLeituraAndamentoDetailFilterDTO) then) =
      _$ProcessoLeituraAndamentoDetailFilterDTOCopyWithImpl<$Res,
          ProcessoLeituraAndamentoDetailFilterDTO>;
  @useResult
  $Res call({int cod, int codUsuario});
}

/// @nodoc
class _$ProcessoLeituraAndamentoDetailFilterDTOCopyWithImpl<$Res,
        $Val extends ProcessoLeituraAndamentoDetailFilterDTO>
    implements $ProcessoLeituraAndamentoDetailFilterDTOCopyWith<$Res> {
  _$ProcessoLeituraAndamentoDetailFilterDTOCopyWithImpl(
      this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? cod = null,
    Object? codUsuario = null,
  }) {
    return _then(_value.copyWith(
      cod: null == cod
          ? _value.cod
          : cod // ignore: cast_nullable_to_non_nullable
              as int,
      codUsuario: null == codUsuario
          ? _value.codUsuario
          : codUsuario // ignore: cast_nullable_to_non_nullable
              as int,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$ProcessoLeituraAndamentoDetailFilterDTOImplCopyWith<$Res>
    implements $ProcessoLeituraAndamentoDetailFilterDTOCopyWith<$Res> {
  factory _$$ProcessoLeituraAndamentoDetailFilterDTOImplCopyWith(
          _$ProcessoLeituraAndamentoDetailFilterDTOImpl value,
          $Res Function(_$ProcessoLeituraAndamentoDetailFilterDTOImpl) then) =
      __$$ProcessoLeituraAndamentoDetailFilterDTOImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({int cod, int codUsuario});
}

/// @nodoc
class __$$ProcessoLeituraAndamentoDetailFilterDTOImplCopyWithImpl<$Res>
    extends _$ProcessoLeituraAndamentoDetailFilterDTOCopyWithImpl<$Res,
        _$ProcessoLeituraAndamentoDetailFilterDTOImpl>
    implements _$$ProcessoLeituraAndamentoDetailFilterDTOImplCopyWith<$Res> {
  __$$ProcessoLeituraAndamentoDetailFilterDTOImplCopyWithImpl(
      _$ProcessoLeituraAndamentoDetailFilterDTOImpl _value,
      $Res Function(_$ProcessoLeituraAndamentoDetailFilterDTOImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? cod = null,
    Object? codUsuario = null,
  }) {
    return _then(_$ProcessoLeituraAndamentoDetailFilterDTOImpl(
      cod: null == cod
          ? _value.cod
          : cod // ignore: cast_nullable_to_non_nullable
              as int,
      codUsuario: null == codUsuario
          ? _value.codUsuario
          : codUsuario // ignore: cast_nullable_to_non_nullable
              as int,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$ProcessoLeituraAndamentoDetailFilterDTOImpl
    with DiagnosticableTreeMixin
    implements _ProcessoLeituraAndamentoDetailFilterDTO {
  _$ProcessoLeituraAndamentoDetailFilterDTOImpl(
      {required this.cod, required this.codUsuario});

  factory _$ProcessoLeituraAndamentoDetailFilterDTOImpl.fromJson(
          Map<String, dynamic> json) =>
      _$$ProcessoLeituraAndamentoDetailFilterDTOImplFromJson(json);

  @override
  int cod;
  @override
  int codUsuario;

  @override
  String toString({DiagnosticLevel minLevel = DiagnosticLevel.info}) {
    return 'ProcessoLeituraAndamentoDetailFilterDTO(cod: $cod, codUsuario: $codUsuario)';
  }

  @override
  void debugFillProperties(DiagnosticPropertiesBuilder properties) {
    super.debugFillProperties(properties);
    properties
      ..add(DiagnosticsProperty(
          'type', 'ProcessoLeituraAndamentoDetailFilterDTO'))
      ..add(DiagnosticsProperty('cod', cod))
      ..add(DiagnosticsProperty('codUsuario', codUsuario));
  }

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$ProcessoLeituraAndamentoDetailFilterDTOImplCopyWith<
          _$ProcessoLeituraAndamentoDetailFilterDTOImpl>
      get copyWith =>
          __$$ProcessoLeituraAndamentoDetailFilterDTOImplCopyWithImpl<
              _$ProcessoLeituraAndamentoDetailFilterDTOImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$ProcessoLeituraAndamentoDetailFilterDTOImplToJson(
      this,
    );
  }
}

abstract class _ProcessoLeituraAndamentoDetailFilterDTO
    implements ProcessoLeituraAndamentoDetailFilterDTO {
  factory _ProcessoLeituraAndamentoDetailFilterDTO(
      {required int cod,
      required int codUsuario}) = _$ProcessoLeituraAndamentoDetailFilterDTOImpl;

  factory _ProcessoLeituraAndamentoDetailFilterDTO.fromJson(
          Map<String, dynamic> json) =
      _$ProcessoLeituraAndamentoDetailFilterDTOImpl.fromJson;

  @override
  int get cod;
  set cod(int value);
  @override
  int get codUsuario;
  set codUsuario(int value);
  @override
  @JsonKey(ignore: true)
  _$$ProcessoLeituraAndamentoDetailFilterDTOImplCopyWith<
          _$ProcessoLeituraAndamentoDetailFilterDTOImpl>
      get copyWith => throw _privateConstructorUsedError;
}
