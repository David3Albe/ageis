// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'equipamento_insumo_response_dto.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

EquipamentoInsumoResponseDTO _$EquipamentoInsumoResponseDTOFromJson(
    Map<String, dynamic> json) {
  return _EquipamentoInsumoResponseDTO.fromJson(json);
}

/// @nodoc
mixin _$EquipamentoInsumoResponseDTO {
  List<EquipamentoInsumoConsumoResponseDTO> get consumos =>
      throw _privateConstructorUsedError;
  set consumos(List<EquipamentoInsumoConsumoResponseDTO> value) =>
      throw _privateConstructorUsedError;
  List<EquipamentoInsumoInsumoResponseDTO> get insumos =>
      throw _privateConstructorUsedError;
  set insumos(List<EquipamentoInsumoInsumoResponseDTO> value) =>
      throw _privateConstructorUsedError;
  List<EquipamentoInsumoEquipamentoResponseDTO> get equipamentos =>
      throw _privateConstructorUsedError;
  set equipamentos(List<EquipamentoInsumoEquipamentoResponseDTO> value) =>
      throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $EquipamentoInsumoResponseDTOCopyWith<EquipamentoInsumoResponseDTO>
      get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $EquipamentoInsumoResponseDTOCopyWith<$Res> {
  factory $EquipamentoInsumoResponseDTOCopyWith(
          EquipamentoInsumoResponseDTO value,
          $Res Function(EquipamentoInsumoResponseDTO) then) =
      _$EquipamentoInsumoResponseDTOCopyWithImpl<$Res,
          EquipamentoInsumoResponseDTO>;
  @useResult
  $Res call(
      {List<EquipamentoInsumoConsumoResponseDTO> consumos,
      List<EquipamentoInsumoInsumoResponseDTO> insumos,
      List<EquipamentoInsumoEquipamentoResponseDTO> equipamentos});
}

/// @nodoc
class _$EquipamentoInsumoResponseDTOCopyWithImpl<$Res,
        $Val extends EquipamentoInsumoResponseDTO>
    implements $EquipamentoInsumoResponseDTOCopyWith<$Res> {
  _$EquipamentoInsumoResponseDTOCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? consumos = null,
    Object? insumos = null,
    Object? equipamentos = null,
  }) {
    return _then(_value.copyWith(
      consumos: null == consumos
          ? _value.consumos
          : consumos // ignore: cast_nullable_to_non_nullable
              as List<EquipamentoInsumoConsumoResponseDTO>,
      insumos: null == insumos
          ? _value.insumos
          : insumos // ignore: cast_nullable_to_non_nullable
              as List<EquipamentoInsumoInsumoResponseDTO>,
      equipamentos: null == equipamentos
          ? _value.equipamentos
          : equipamentos // ignore: cast_nullable_to_non_nullable
              as List<EquipamentoInsumoEquipamentoResponseDTO>,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$EquipamentoInsumoResponseDTOImplCopyWith<$Res>
    implements $EquipamentoInsumoResponseDTOCopyWith<$Res> {
  factory _$$EquipamentoInsumoResponseDTOImplCopyWith(
          _$EquipamentoInsumoResponseDTOImpl value,
          $Res Function(_$EquipamentoInsumoResponseDTOImpl) then) =
      __$$EquipamentoInsumoResponseDTOImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {List<EquipamentoInsumoConsumoResponseDTO> consumos,
      List<EquipamentoInsumoInsumoResponseDTO> insumos,
      List<EquipamentoInsumoEquipamentoResponseDTO> equipamentos});
}

/// @nodoc
class __$$EquipamentoInsumoResponseDTOImplCopyWithImpl<$Res>
    extends _$EquipamentoInsumoResponseDTOCopyWithImpl<$Res,
        _$EquipamentoInsumoResponseDTOImpl>
    implements _$$EquipamentoInsumoResponseDTOImplCopyWith<$Res> {
  __$$EquipamentoInsumoResponseDTOImplCopyWithImpl(
      _$EquipamentoInsumoResponseDTOImpl _value,
      $Res Function(_$EquipamentoInsumoResponseDTOImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? consumos = null,
    Object? insumos = null,
    Object? equipamentos = null,
  }) {
    return _then(_$EquipamentoInsumoResponseDTOImpl(
      consumos: null == consumos
          ? _value.consumos
          : consumos // ignore: cast_nullable_to_non_nullable
              as List<EquipamentoInsumoConsumoResponseDTO>,
      insumos: null == insumos
          ? _value.insumos
          : insumos // ignore: cast_nullable_to_non_nullable
              as List<EquipamentoInsumoInsumoResponseDTO>,
      equipamentos: null == equipamentos
          ? _value.equipamentos
          : equipamentos // ignore: cast_nullable_to_non_nullable
              as List<EquipamentoInsumoEquipamentoResponseDTO>,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$EquipamentoInsumoResponseDTOImpl extends _EquipamentoInsumoResponseDTO
    with DiagnosticableTreeMixin {
  _$EquipamentoInsumoResponseDTOImpl(
      {required this.consumos,
      required this.insumos,
      required this.equipamentos})
      : super._();

  factory _$EquipamentoInsumoResponseDTOImpl.fromJson(
          Map<String, dynamic> json) =>
      _$$EquipamentoInsumoResponseDTOImplFromJson(json);

  @override
  List<EquipamentoInsumoConsumoResponseDTO> consumos;
  @override
  List<EquipamentoInsumoInsumoResponseDTO> insumos;
  @override
  List<EquipamentoInsumoEquipamentoResponseDTO> equipamentos;

  @override
  String toString({DiagnosticLevel minLevel = DiagnosticLevel.info}) {
    return 'EquipamentoInsumoResponseDTO(consumos: $consumos, insumos: $insumos, equipamentos: $equipamentos)';
  }

  @override
  void debugFillProperties(DiagnosticPropertiesBuilder properties) {
    super.debugFillProperties(properties);
    properties
      ..add(DiagnosticsProperty('type', 'EquipamentoInsumoResponseDTO'))
      ..add(DiagnosticsProperty('consumos', consumos))
      ..add(DiagnosticsProperty('insumos', insumos))
      ..add(DiagnosticsProperty('equipamentos', equipamentos));
  }

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$EquipamentoInsumoResponseDTOImplCopyWith<
          _$EquipamentoInsumoResponseDTOImpl>
      get copyWith => __$$EquipamentoInsumoResponseDTOImplCopyWithImpl<
          _$EquipamentoInsumoResponseDTOImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$EquipamentoInsumoResponseDTOImplToJson(
      this,
    );
  }
}

abstract class _EquipamentoInsumoResponseDTO
    extends EquipamentoInsumoResponseDTO {
  factory _EquipamentoInsumoResponseDTO(
      {required List<EquipamentoInsumoConsumoResponseDTO> consumos,
      required List<EquipamentoInsumoInsumoResponseDTO> insumos,
      required List<EquipamentoInsumoEquipamentoResponseDTO>
          equipamentos}) = _$EquipamentoInsumoResponseDTOImpl;
  _EquipamentoInsumoResponseDTO._() : super._();

  factory _EquipamentoInsumoResponseDTO.fromJson(Map<String, dynamic> json) =
      _$EquipamentoInsumoResponseDTOImpl.fromJson;

  @override
  List<EquipamentoInsumoConsumoResponseDTO> get consumos;
  set consumos(List<EquipamentoInsumoConsumoResponseDTO> value);
  @override
  List<EquipamentoInsumoInsumoResponseDTO> get insumos;
  set insumos(List<EquipamentoInsumoInsumoResponseDTO> value);
  @override
  List<EquipamentoInsumoEquipamentoResponseDTO> get equipamentos;
  set equipamentos(List<EquipamentoInsumoEquipamentoResponseDTO> value);
  @override
  @JsonKey(ignore: true)
  _$$EquipamentoInsumoResponseDTOImplCopyWith<
          _$EquipamentoInsumoResponseDTOImpl>
      get copyWith => throw _privateConstructorUsedError;
}
