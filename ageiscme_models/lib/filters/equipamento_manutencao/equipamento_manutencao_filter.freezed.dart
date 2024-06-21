// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'equipamento_manutencao_filter.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

EquipamentoManutencaoFilter _$EquipamentoManutencaoFilterFromJson(
    Map<String, dynamic> json) {
  return _EquipamentoManutencaoFilter.fromJson(json);
}

/// @nodoc
mixin _$EquipamentoManutencaoFilter {
  int? get cod => throw _privateConstructorUsedError;
  set cod(int? value) => throw _privateConstructorUsedError;
  int? get numeroRegistros => throw _privateConstructorUsedError;
  set numeroRegistros(int? value) => throw _privateConstructorUsedError;
  int? get codEquipamento => throw _privateConstructorUsedError;
  set codEquipamento(int? value) => throw _privateConstructorUsedError;
  int? get codTipoServico => throw _privateConstructorUsedError;
  set codTipoServico(int? value) => throw _privateConstructorUsedError;
  bool? get ordenarDataInicioDecrescente => throw _privateConstructorUsedError;
  set ordenarDataInicioDecrescente(bool? value) =>
      throw _privateConstructorUsedError;
  @JsonKey(name: 'tStamp')
  String? get tStamp => throw _privateConstructorUsedError;
  @JsonKey(name: 'tStamp')
  set tStamp(String? value) => throw _privateConstructorUsedError;
  @JsonKey(includeToJson: false, includeFromJson: false)
  EquipamentoDropDownSearchResponseDTO? get equipamento =>
      throw _privateConstructorUsedError;
  @JsonKey(includeToJson: false, includeFromJson: false)
  set equipamento(EquipamentoDropDownSearchResponseDTO? value) =>
      throw _privateConstructorUsedError;
  @JsonKey(includeToJson: false, includeFromJson: false)
  ServicoTipoDropDownSearchResponseDTO? get servicoTipo =>
      throw _privateConstructorUsedError;
  @JsonKey(includeToJson: false, includeFromJson: false)
  set servicoTipo(ServicoTipoDropDownSearchResponseDTO? value) =>
      throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $EquipamentoManutencaoFilterCopyWith<EquipamentoManutencaoFilter>
      get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $EquipamentoManutencaoFilterCopyWith<$Res> {
  factory $EquipamentoManutencaoFilterCopyWith(
          EquipamentoManutencaoFilter value,
          $Res Function(EquipamentoManutencaoFilter) then) =
      _$EquipamentoManutencaoFilterCopyWithImpl<$Res,
          EquipamentoManutencaoFilter>;
  @useResult
  $Res call(
      {int? cod,
      int? numeroRegistros,
      int? codEquipamento,
      int? codTipoServico,
      bool? ordenarDataInicioDecrescente,
      @JsonKey(name: 'tStamp') String? tStamp,
      @JsonKey(includeToJson: false, includeFromJson: false)
      EquipamentoDropDownSearchResponseDTO? equipamento,
      @JsonKey(includeToJson: false, includeFromJson: false)
      ServicoTipoDropDownSearchResponseDTO? servicoTipo});

  $EquipamentoDropDownSearchResponseDTOCopyWith<$Res>? get equipamento;
  $ServicoTipoDropDownSearchResponseDTOCopyWith<$Res>? get servicoTipo;
}

/// @nodoc
class _$EquipamentoManutencaoFilterCopyWithImpl<$Res,
        $Val extends EquipamentoManutencaoFilter>
    implements $EquipamentoManutencaoFilterCopyWith<$Res> {
  _$EquipamentoManutencaoFilterCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? cod = freezed,
    Object? numeroRegistros = freezed,
    Object? codEquipamento = freezed,
    Object? codTipoServico = freezed,
    Object? ordenarDataInicioDecrescente = freezed,
    Object? tStamp = freezed,
    Object? equipamento = freezed,
    Object? servicoTipo = freezed,
  }) {
    return _then(_value.copyWith(
      cod: freezed == cod
          ? _value.cod
          : cod // ignore: cast_nullable_to_non_nullable
              as int?,
      numeroRegistros: freezed == numeroRegistros
          ? _value.numeroRegistros
          : numeroRegistros // ignore: cast_nullable_to_non_nullable
              as int?,
      codEquipamento: freezed == codEquipamento
          ? _value.codEquipamento
          : codEquipamento // ignore: cast_nullable_to_non_nullable
              as int?,
      codTipoServico: freezed == codTipoServico
          ? _value.codTipoServico
          : codTipoServico // ignore: cast_nullable_to_non_nullable
              as int?,
      ordenarDataInicioDecrescente: freezed == ordenarDataInicioDecrescente
          ? _value.ordenarDataInicioDecrescente
          : ordenarDataInicioDecrescente // ignore: cast_nullable_to_non_nullable
              as bool?,
      tStamp: freezed == tStamp
          ? _value.tStamp
          : tStamp // ignore: cast_nullable_to_non_nullable
              as String?,
      equipamento: freezed == equipamento
          ? _value.equipamento
          : equipamento // ignore: cast_nullable_to_non_nullable
              as EquipamentoDropDownSearchResponseDTO?,
      servicoTipo: freezed == servicoTipo
          ? _value.servicoTipo
          : servicoTipo // ignore: cast_nullable_to_non_nullable
              as ServicoTipoDropDownSearchResponseDTO?,
    ) as $Val);
  }

  @override
  @pragma('vm:prefer-inline')
  $EquipamentoDropDownSearchResponseDTOCopyWith<$Res>? get equipamento {
    if (_value.equipamento == null) {
      return null;
    }

    return $EquipamentoDropDownSearchResponseDTOCopyWith<$Res>(
        _value.equipamento!, (value) {
      return _then(_value.copyWith(equipamento: value) as $Val);
    });
  }

  @override
  @pragma('vm:prefer-inline')
  $ServicoTipoDropDownSearchResponseDTOCopyWith<$Res>? get servicoTipo {
    if (_value.servicoTipo == null) {
      return null;
    }

    return $ServicoTipoDropDownSearchResponseDTOCopyWith<$Res>(
        _value.servicoTipo!, (value) {
      return _then(_value.copyWith(servicoTipo: value) as $Val);
    });
  }
}

/// @nodoc
abstract class _$$EquipamentoManutencaoFilterImplCopyWith<$Res>
    implements $EquipamentoManutencaoFilterCopyWith<$Res> {
  factory _$$EquipamentoManutencaoFilterImplCopyWith(
          _$EquipamentoManutencaoFilterImpl value,
          $Res Function(_$EquipamentoManutencaoFilterImpl) then) =
      __$$EquipamentoManutencaoFilterImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {int? cod,
      int? numeroRegistros,
      int? codEquipamento,
      int? codTipoServico,
      bool? ordenarDataInicioDecrescente,
      @JsonKey(name: 'tStamp') String? tStamp,
      @JsonKey(includeToJson: false, includeFromJson: false)
      EquipamentoDropDownSearchResponseDTO? equipamento,
      @JsonKey(includeToJson: false, includeFromJson: false)
      ServicoTipoDropDownSearchResponseDTO? servicoTipo});

  @override
  $EquipamentoDropDownSearchResponseDTOCopyWith<$Res>? get equipamento;
  @override
  $ServicoTipoDropDownSearchResponseDTOCopyWith<$Res>? get servicoTipo;
}

/// @nodoc
class __$$EquipamentoManutencaoFilterImplCopyWithImpl<$Res>
    extends _$EquipamentoManutencaoFilterCopyWithImpl<$Res,
        _$EquipamentoManutencaoFilterImpl>
    implements _$$EquipamentoManutencaoFilterImplCopyWith<$Res> {
  __$$EquipamentoManutencaoFilterImplCopyWithImpl(
      _$EquipamentoManutencaoFilterImpl _value,
      $Res Function(_$EquipamentoManutencaoFilterImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? cod = freezed,
    Object? numeroRegistros = freezed,
    Object? codEquipamento = freezed,
    Object? codTipoServico = freezed,
    Object? ordenarDataInicioDecrescente = freezed,
    Object? tStamp = freezed,
    Object? equipamento = freezed,
    Object? servicoTipo = freezed,
  }) {
    return _then(_$EquipamentoManutencaoFilterImpl(
      cod: freezed == cod
          ? _value.cod
          : cod // ignore: cast_nullable_to_non_nullable
              as int?,
      numeroRegistros: freezed == numeroRegistros
          ? _value.numeroRegistros
          : numeroRegistros // ignore: cast_nullable_to_non_nullable
              as int?,
      codEquipamento: freezed == codEquipamento
          ? _value.codEquipamento
          : codEquipamento // ignore: cast_nullable_to_non_nullable
              as int?,
      codTipoServico: freezed == codTipoServico
          ? _value.codTipoServico
          : codTipoServico // ignore: cast_nullable_to_non_nullable
              as int?,
      ordenarDataInicioDecrescente: freezed == ordenarDataInicioDecrescente
          ? _value.ordenarDataInicioDecrescente
          : ordenarDataInicioDecrescente // ignore: cast_nullable_to_non_nullable
              as bool?,
      tStamp: freezed == tStamp
          ? _value.tStamp
          : tStamp // ignore: cast_nullable_to_non_nullable
              as String?,
      equipamento: freezed == equipamento
          ? _value.equipamento
          : equipamento // ignore: cast_nullable_to_non_nullable
              as EquipamentoDropDownSearchResponseDTO?,
      servicoTipo: freezed == servicoTipo
          ? _value.servicoTipo
          : servicoTipo // ignore: cast_nullable_to_non_nullable
              as ServicoTipoDropDownSearchResponseDTO?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$EquipamentoManutencaoFilterImpl
    implements _EquipamentoManutencaoFilter {
  _$EquipamentoManutencaoFilterImpl(
      {this.cod,
      this.numeroRegistros,
      this.codEquipamento,
      this.codTipoServico,
      this.ordenarDataInicioDecrescente,
      @JsonKey(name: 'tStamp') this.tStamp,
      @JsonKey(includeToJson: false, includeFromJson: false) this.equipamento,
      @JsonKey(includeToJson: false, includeFromJson: false) this.servicoTipo});

  factory _$EquipamentoManutencaoFilterImpl.fromJson(
          Map<String, dynamic> json) =>
      _$$EquipamentoManutencaoFilterImplFromJson(json);

  @override
  int? cod;
  @override
  int? numeroRegistros;
  @override
  int? codEquipamento;
  @override
  int? codTipoServico;
  @override
  bool? ordenarDataInicioDecrescente;
  @override
  @JsonKey(name: 'tStamp')
  String? tStamp;
  @override
  @JsonKey(includeToJson: false, includeFromJson: false)
  EquipamentoDropDownSearchResponseDTO? equipamento;
  @override
  @JsonKey(includeToJson: false, includeFromJson: false)
  ServicoTipoDropDownSearchResponseDTO? servicoTipo;

  @override
  String toString() {
    return 'EquipamentoManutencaoFilter(cod: $cod, numeroRegistros: $numeroRegistros, codEquipamento: $codEquipamento, codTipoServico: $codTipoServico, ordenarDataInicioDecrescente: $ordenarDataInicioDecrescente, tStamp: $tStamp, equipamento: $equipamento, servicoTipo: $servicoTipo)';
  }

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$EquipamentoManutencaoFilterImplCopyWith<_$EquipamentoManutencaoFilterImpl>
      get copyWith => __$$EquipamentoManutencaoFilterImplCopyWithImpl<
          _$EquipamentoManutencaoFilterImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$EquipamentoManutencaoFilterImplToJson(
      this,
    );
  }
}

abstract class _EquipamentoManutencaoFilter
    implements EquipamentoManutencaoFilter {
  factory _EquipamentoManutencaoFilter(
          {int? cod,
          int? numeroRegistros,
          int? codEquipamento,
          int? codTipoServico,
          bool? ordenarDataInicioDecrescente,
          @JsonKey(name: 'tStamp') String? tStamp,
          @JsonKey(includeToJson: false, includeFromJson: false)
          EquipamentoDropDownSearchResponseDTO? equipamento,
          @JsonKey(includeToJson: false, includeFromJson: false)
          ServicoTipoDropDownSearchResponseDTO? servicoTipo}) =
      _$EquipamentoManutencaoFilterImpl;

  factory _EquipamentoManutencaoFilter.fromJson(Map<String, dynamic> json) =
      _$EquipamentoManutencaoFilterImpl.fromJson;

  @override
  int? get cod;
  set cod(int? value);
  @override
  int? get numeroRegistros;
  set numeroRegistros(int? value);
  @override
  int? get codEquipamento;
  set codEquipamento(int? value);
  @override
  int? get codTipoServico;
  set codTipoServico(int? value);
  @override
  bool? get ordenarDataInicioDecrescente;
  set ordenarDataInicioDecrescente(bool? value);
  @override
  @JsonKey(name: 'tStamp')
  String? get tStamp;
  @JsonKey(name: 'tStamp')
  set tStamp(String? value);
  @override
  @JsonKey(includeToJson: false, includeFromJson: false)
  EquipamentoDropDownSearchResponseDTO? get equipamento;
  @JsonKey(includeToJson: false, includeFromJson: false)
  set equipamento(EquipamentoDropDownSearchResponseDTO? value);
  @override
  @JsonKey(includeToJson: false, includeFromJson: false)
  ServicoTipoDropDownSearchResponseDTO? get servicoTipo;
  @JsonKey(includeToJson: false, includeFromJson: false)
  set servicoTipo(ServicoTipoDropDownSearchResponseDTO? value);
  @override
  @JsonKey(ignore: true)
  _$$EquipamentoManutencaoFilterImplCopyWith<_$EquipamentoManutencaoFilterImpl>
      get copyWith => throw _privateConstructorUsedError;
}
