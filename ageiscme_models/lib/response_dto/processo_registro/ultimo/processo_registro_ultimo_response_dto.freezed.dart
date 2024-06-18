// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'processo_registro_ultimo_response_dto.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

ProcessoRegistroUltimoResponseDTO _$ProcessoRegistroUltimoResponseDTOFromJson(
    Map<String, dynamic> json) {
  return _ProcessoRegistroUltimoResponseDTO.fromJson(json);
}

/// @nodoc
mixin _$ProcessoRegistroUltimoResponseDTO {
  int? get cod => throw _privateConstructorUsedError;
  set cod(int? value) => throw _privateConstructorUsedError;
  DateTime? get dataHoraInicio => throw _privateConstructorUsedError;
  set dataHoraInicio(DateTime? value) => throw _privateConstructorUsedError;
  DateTime? get dataHoraTermino => throw _privateConstructorUsedError;
  set dataHoraTermino(DateTime? value) => throw _privateConstructorUsedError;
  String? get nomeEtapa => throw _privateConstructorUsedError;
  set nomeEtapa(String? value) => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $ProcessoRegistroUltimoResponseDTOCopyWith<ProcessoRegistroUltimoResponseDTO>
      get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $ProcessoRegistroUltimoResponseDTOCopyWith<$Res> {
  factory $ProcessoRegistroUltimoResponseDTOCopyWith(
          ProcessoRegistroUltimoResponseDTO value,
          $Res Function(ProcessoRegistroUltimoResponseDTO) then) =
      _$ProcessoRegistroUltimoResponseDTOCopyWithImpl<$Res,
          ProcessoRegistroUltimoResponseDTO>;
  @useResult
  $Res call(
      {int? cod,
      DateTime? dataHoraInicio,
      DateTime? dataHoraTermino,
      String? nomeEtapa});
}

/// @nodoc
class _$ProcessoRegistroUltimoResponseDTOCopyWithImpl<$Res,
        $Val extends ProcessoRegistroUltimoResponseDTO>
    implements $ProcessoRegistroUltimoResponseDTOCopyWith<$Res> {
  _$ProcessoRegistroUltimoResponseDTOCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? cod = freezed,
    Object? dataHoraInicio = freezed,
    Object? dataHoraTermino = freezed,
    Object? nomeEtapa = freezed,
  }) {
    return _then(_value.copyWith(
      cod: freezed == cod
          ? _value.cod
          : cod // ignore: cast_nullable_to_non_nullable
              as int?,
      dataHoraInicio: freezed == dataHoraInicio
          ? _value.dataHoraInicio
          : dataHoraInicio // ignore: cast_nullable_to_non_nullable
              as DateTime?,
      dataHoraTermino: freezed == dataHoraTermino
          ? _value.dataHoraTermino
          : dataHoraTermino // ignore: cast_nullable_to_non_nullable
              as DateTime?,
      nomeEtapa: freezed == nomeEtapa
          ? _value.nomeEtapa
          : nomeEtapa // ignore: cast_nullable_to_non_nullable
              as String?,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$ProcessoRegistroUltimoResponseDTOImplCopyWith<$Res>
    implements $ProcessoRegistroUltimoResponseDTOCopyWith<$Res> {
  factory _$$ProcessoRegistroUltimoResponseDTOImplCopyWith(
          _$ProcessoRegistroUltimoResponseDTOImpl value,
          $Res Function(_$ProcessoRegistroUltimoResponseDTOImpl) then) =
      __$$ProcessoRegistroUltimoResponseDTOImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {int? cod,
      DateTime? dataHoraInicio,
      DateTime? dataHoraTermino,
      String? nomeEtapa});
}

/// @nodoc
class __$$ProcessoRegistroUltimoResponseDTOImplCopyWithImpl<$Res>
    extends _$ProcessoRegistroUltimoResponseDTOCopyWithImpl<$Res,
        _$ProcessoRegistroUltimoResponseDTOImpl>
    implements _$$ProcessoRegistroUltimoResponseDTOImplCopyWith<$Res> {
  __$$ProcessoRegistroUltimoResponseDTOImplCopyWithImpl(
      _$ProcessoRegistroUltimoResponseDTOImpl _value,
      $Res Function(_$ProcessoRegistroUltimoResponseDTOImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? cod = freezed,
    Object? dataHoraInicio = freezed,
    Object? dataHoraTermino = freezed,
    Object? nomeEtapa = freezed,
  }) {
    return _then(_$ProcessoRegistroUltimoResponseDTOImpl(
      cod: freezed == cod
          ? _value.cod
          : cod // ignore: cast_nullable_to_non_nullable
              as int?,
      dataHoraInicio: freezed == dataHoraInicio
          ? _value.dataHoraInicio
          : dataHoraInicio // ignore: cast_nullable_to_non_nullable
              as DateTime?,
      dataHoraTermino: freezed == dataHoraTermino
          ? _value.dataHoraTermino
          : dataHoraTermino // ignore: cast_nullable_to_non_nullable
              as DateTime?,
      nomeEtapa: freezed == nomeEtapa
          ? _value.nomeEtapa
          : nomeEtapa // ignore: cast_nullable_to_non_nullable
              as String?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$ProcessoRegistroUltimoResponseDTOImpl
    with DiagnosticableTreeMixin
    implements _ProcessoRegistroUltimoResponseDTO {
  _$ProcessoRegistroUltimoResponseDTOImpl(
      {this.cod, this.dataHoraInicio, this.dataHoraTermino, this.nomeEtapa});

  factory _$ProcessoRegistroUltimoResponseDTOImpl.fromJson(
          Map<String, dynamic> json) =>
      _$$ProcessoRegistroUltimoResponseDTOImplFromJson(json);

  @override
  int? cod;
  @override
  DateTime? dataHoraInicio;
  @override
  DateTime? dataHoraTermino;
  @override
  String? nomeEtapa;

  @override
  String toString({DiagnosticLevel minLevel = DiagnosticLevel.info}) {
    return 'ProcessoRegistroUltimoResponseDTO(cod: $cod, dataHoraInicio: $dataHoraInicio, dataHoraTermino: $dataHoraTermino, nomeEtapa: $nomeEtapa)';
  }

  @override
  void debugFillProperties(DiagnosticPropertiesBuilder properties) {
    super.debugFillProperties(properties);
    properties
      ..add(DiagnosticsProperty('type', 'ProcessoRegistroUltimoResponseDTO'))
      ..add(DiagnosticsProperty('cod', cod))
      ..add(DiagnosticsProperty('dataHoraInicio', dataHoraInicio))
      ..add(DiagnosticsProperty('dataHoraTermino', dataHoraTermino))
      ..add(DiagnosticsProperty('nomeEtapa', nomeEtapa));
  }

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$ProcessoRegistroUltimoResponseDTOImplCopyWith<
          _$ProcessoRegistroUltimoResponseDTOImpl>
      get copyWith => __$$ProcessoRegistroUltimoResponseDTOImplCopyWithImpl<
          _$ProcessoRegistroUltimoResponseDTOImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$ProcessoRegistroUltimoResponseDTOImplToJson(
      this,
    );
  }
}

abstract class _ProcessoRegistroUltimoResponseDTO
    implements ProcessoRegistroUltimoResponseDTO {
  factory _ProcessoRegistroUltimoResponseDTO(
      {int? cod,
      DateTime? dataHoraInicio,
      DateTime? dataHoraTermino,
      String? nomeEtapa}) = _$ProcessoRegistroUltimoResponseDTOImpl;

  factory _ProcessoRegistroUltimoResponseDTO.fromJson(
          Map<String, dynamic> json) =
      _$ProcessoRegistroUltimoResponseDTOImpl.fromJson;

  @override
  int? get cod;
  set cod(int? value);
  @override
  DateTime? get dataHoraInicio;
  set dataHoraInicio(DateTime? value);
  @override
  DateTime? get dataHoraTermino;
  set dataHoraTermino(DateTime? value);
  @override
  String? get nomeEtapa;
  set nomeEtapa(String? value);
  @override
  @JsonKey(ignore: true)
  _$$ProcessoRegistroUltimoResponseDTOImplCopyWith<
          _$ProcessoRegistroUltimoResponseDTOImpl>
      get copyWith => throw _privateConstructorUsedError;
}
