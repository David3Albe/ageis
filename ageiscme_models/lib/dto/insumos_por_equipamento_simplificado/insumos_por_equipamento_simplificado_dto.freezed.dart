// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'insumos_por_equipamento_simplificado_dto.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

InsumosPorEquipamentoSimplificadoDTO
    _$InsumosPorEquipamentoSimplificadoDTOFromJson(Map<String, dynamic> json) {
  return _InsumosPorEquipamentoSimplificadoDTO.fromJson(json);
}

/// @nodoc
mixin _$InsumosPorEquipamentoSimplificadoDTO {
  bool? get apenasInsumosComSaldo => throw _privateConstructorUsedError;
  set apenasInsumosComSaldo(bool? value) => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $InsumosPorEquipamentoSimplificadoDTOCopyWith<
          InsumosPorEquipamentoSimplificadoDTO>
      get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $InsumosPorEquipamentoSimplificadoDTOCopyWith<$Res> {
  factory $InsumosPorEquipamentoSimplificadoDTOCopyWith(
          InsumosPorEquipamentoSimplificadoDTO value,
          $Res Function(InsumosPorEquipamentoSimplificadoDTO) then) =
      _$InsumosPorEquipamentoSimplificadoDTOCopyWithImpl<$Res,
          InsumosPorEquipamentoSimplificadoDTO>;
  @useResult
  $Res call({bool? apenasInsumosComSaldo});
}

/// @nodoc
class _$InsumosPorEquipamentoSimplificadoDTOCopyWithImpl<$Res,
        $Val extends InsumosPorEquipamentoSimplificadoDTO>
    implements $InsumosPorEquipamentoSimplificadoDTOCopyWith<$Res> {
  _$InsumosPorEquipamentoSimplificadoDTOCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? apenasInsumosComSaldo = freezed,
  }) {
    return _then(_value.copyWith(
      apenasInsumosComSaldo: freezed == apenasInsumosComSaldo
          ? _value.apenasInsumosComSaldo
          : apenasInsumosComSaldo // ignore: cast_nullable_to_non_nullable
              as bool?,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$InsumosPorEquipamentoSimplificadoDTOImplCopyWith<$Res>
    implements $InsumosPorEquipamentoSimplificadoDTOCopyWith<$Res> {
  factory _$$InsumosPorEquipamentoSimplificadoDTOImplCopyWith(
          _$InsumosPorEquipamentoSimplificadoDTOImpl value,
          $Res Function(_$InsumosPorEquipamentoSimplificadoDTOImpl) then) =
      __$$InsumosPorEquipamentoSimplificadoDTOImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({bool? apenasInsumosComSaldo});
}

/// @nodoc
class __$$InsumosPorEquipamentoSimplificadoDTOImplCopyWithImpl<$Res>
    extends _$InsumosPorEquipamentoSimplificadoDTOCopyWithImpl<$Res,
        _$InsumosPorEquipamentoSimplificadoDTOImpl>
    implements _$$InsumosPorEquipamentoSimplificadoDTOImplCopyWith<$Res> {
  __$$InsumosPorEquipamentoSimplificadoDTOImplCopyWithImpl(
      _$InsumosPorEquipamentoSimplificadoDTOImpl _value,
      $Res Function(_$InsumosPorEquipamentoSimplificadoDTOImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? apenasInsumosComSaldo = freezed,
  }) {
    return _then(_$InsumosPorEquipamentoSimplificadoDTOImpl(
      apenasInsumosComSaldo: freezed == apenasInsumosComSaldo
          ? _value.apenasInsumosComSaldo
          : apenasInsumosComSaldo // ignore: cast_nullable_to_non_nullable
              as bool?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$InsumosPorEquipamentoSimplificadoDTOImpl
    extends _InsumosPorEquipamentoSimplificadoDTO with DiagnosticableTreeMixin {
  _$InsumosPorEquipamentoSimplificadoDTOImpl({this.apenasInsumosComSaldo})
      : super._();

  factory _$InsumosPorEquipamentoSimplificadoDTOImpl.fromJson(
          Map<String, dynamic> json) =>
      _$$InsumosPorEquipamentoSimplificadoDTOImplFromJson(json);

  @override
  bool? apenasInsumosComSaldo;

  @override
  String toString({DiagnosticLevel minLevel = DiagnosticLevel.info}) {
    return 'InsumosPorEquipamentoSimplificadoDTO(apenasInsumosComSaldo: $apenasInsumosComSaldo)';
  }

  @override
  void debugFillProperties(DiagnosticPropertiesBuilder properties) {
    super.debugFillProperties(properties);
    properties
      ..add(DiagnosticsProperty('type', 'InsumosPorEquipamentoSimplificadoDTO'))
      ..add(
          DiagnosticsProperty('apenasInsumosComSaldo', apenasInsumosComSaldo));
  }

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$InsumosPorEquipamentoSimplificadoDTOImplCopyWith<
          _$InsumosPorEquipamentoSimplificadoDTOImpl>
      get copyWith => __$$InsumosPorEquipamentoSimplificadoDTOImplCopyWithImpl<
          _$InsumosPorEquipamentoSimplificadoDTOImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$InsumosPorEquipamentoSimplificadoDTOImplToJson(
      this,
    );
  }
}

abstract class _InsumosPorEquipamentoSimplificadoDTO
    extends InsumosPorEquipamentoSimplificadoDTO {
  factory _InsumosPorEquipamentoSimplificadoDTO({bool? apenasInsumosComSaldo}) =
      _$InsumosPorEquipamentoSimplificadoDTOImpl;
  _InsumosPorEquipamentoSimplificadoDTO._() : super._();

  factory _InsumosPorEquipamentoSimplificadoDTO.fromJson(
          Map<String, dynamic> json) =
      _$InsumosPorEquipamentoSimplificadoDTOImpl.fromJson;

  @override
  bool? get apenasInsumosComSaldo;
  set apenasInsumosComSaldo(bool? value);
  @override
  @JsonKey(ignore: true)
  _$$InsumosPorEquipamentoSimplificadoDTOImplCopyWith<
          _$InsumosPorEquipamentoSimplificadoDTOImpl>
      get copyWith => throw _privateConstructorUsedError;
}
