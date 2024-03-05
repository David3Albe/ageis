// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'equipamento_filter.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

EquipamentoFilter _$EquipamentoFilterFromJson(Map<String, dynamic> json) {
  return _EquipamentoFilter.fromJson(json);
}

/// @nodoc
mixin _$EquipamentoFilter {
  int? get cod => throw _privateConstructorUsedError;
  set cod(int? value) => throw _privateConstructorUsedError;
  bool? get apenasAtivos => throw _privateConstructorUsedError;
  set apenasAtivos(bool? value) => throw _privateConstructorUsedError;
  bool? get ordenarPorNomeCrescente => throw _privateConstructorUsedError;
  set ordenarPorNomeCrescente(bool? value) =>
      throw _privateConstructorUsedError;
  bool? get incluirTipoServicos => throw _privateConstructorUsedError;
  set incluirTipoServicos(bool? value) => throw _privateConstructorUsedError;
  @JsonKey(name: 'tStamp')
  String? get tStamp => throw _privateConstructorUsedError;
  @JsonKey(name: 'tStamp')
  set tStamp(String? value) => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $EquipamentoFilterCopyWith<EquipamentoFilter> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $EquipamentoFilterCopyWith<$Res> {
  factory $EquipamentoFilterCopyWith(
          EquipamentoFilter value, $Res Function(EquipamentoFilter) then) =
      _$EquipamentoFilterCopyWithImpl<$Res, EquipamentoFilter>;
  @useResult
  $Res call(
      {int? cod,
      bool? apenasAtivos,
      bool? ordenarPorNomeCrescente,
      bool? incluirTipoServicos,
      @JsonKey(name: 'tStamp') String? tStamp});
}

/// @nodoc
class _$EquipamentoFilterCopyWithImpl<$Res, $Val extends EquipamentoFilter>
    implements $EquipamentoFilterCopyWith<$Res> {
  _$EquipamentoFilterCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? cod = freezed,
    Object? apenasAtivos = freezed,
    Object? ordenarPorNomeCrescente = freezed,
    Object? incluirTipoServicos = freezed,
    Object? tStamp = freezed,
  }) {
    return _then(_value.copyWith(
      cod: freezed == cod
          ? _value.cod
          : cod // ignore: cast_nullable_to_non_nullable
              as int?,
      apenasAtivos: freezed == apenasAtivos
          ? _value.apenasAtivos
          : apenasAtivos // ignore: cast_nullable_to_non_nullable
              as bool?,
      ordenarPorNomeCrescente: freezed == ordenarPorNomeCrescente
          ? _value.ordenarPorNomeCrescente
          : ordenarPorNomeCrescente // ignore: cast_nullable_to_non_nullable
              as bool?,
      incluirTipoServicos: freezed == incluirTipoServicos
          ? _value.incluirTipoServicos
          : incluirTipoServicos // ignore: cast_nullable_to_non_nullable
              as bool?,
      tStamp: freezed == tStamp
          ? _value.tStamp
          : tStamp // ignore: cast_nullable_to_non_nullable
              as String?,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$EquipamentoFilterImplCopyWith<$Res>
    implements $EquipamentoFilterCopyWith<$Res> {
  factory _$$EquipamentoFilterImplCopyWith(_$EquipamentoFilterImpl value,
          $Res Function(_$EquipamentoFilterImpl) then) =
      __$$EquipamentoFilterImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {int? cod,
      bool? apenasAtivos,
      bool? ordenarPorNomeCrescente,
      bool? incluirTipoServicos,
      @JsonKey(name: 'tStamp') String? tStamp});
}

/// @nodoc
class __$$EquipamentoFilterImplCopyWithImpl<$Res>
    extends _$EquipamentoFilterCopyWithImpl<$Res, _$EquipamentoFilterImpl>
    implements _$$EquipamentoFilterImplCopyWith<$Res> {
  __$$EquipamentoFilterImplCopyWithImpl(_$EquipamentoFilterImpl _value,
      $Res Function(_$EquipamentoFilterImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? cod = freezed,
    Object? apenasAtivos = freezed,
    Object? ordenarPorNomeCrescente = freezed,
    Object? incluirTipoServicos = freezed,
    Object? tStamp = freezed,
  }) {
    return _then(_$EquipamentoFilterImpl(
      cod: freezed == cod
          ? _value.cod
          : cod // ignore: cast_nullable_to_non_nullable
              as int?,
      apenasAtivos: freezed == apenasAtivos
          ? _value.apenasAtivos
          : apenasAtivos // ignore: cast_nullable_to_non_nullable
              as bool?,
      ordenarPorNomeCrescente: freezed == ordenarPorNomeCrescente
          ? _value.ordenarPorNomeCrescente
          : ordenarPorNomeCrescente // ignore: cast_nullable_to_non_nullable
              as bool?,
      incluirTipoServicos: freezed == incluirTipoServicos
          ? _value.incluirTipoServicos
          : incluirTipoServicos // ignore: cast_nullable_to_non_nullable
              as bool?,
      tStamp: freezed == tStamp
          ? _value.tStamp
          : tStamp // ignore: cast_nullable_to_non_nullable
              as String?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$EquipamentoFilterImpl implements _EquipamentoFilter {
  _$EquipamentoFilterImpl(
      {this.cod,
      this.apenasAtivos,
      this.ordenarPorNomeCrescente,
      this.incluirTipoServicos,
      @JsonKey(name: 'tStamp') this.tStamp});

  factory _$EquipamentoFilterImpl.fromJson(Map<String, dynamic> json) =>
      _$$EquipamentoFilterImplFromJson(json);

  @override
  int? cod;
  @override
  bool? apenasAtivos;
  @override
  bool? ordenarPorNomeCrescente;
  @override
  bool? incluirTipoServicos;
  @override
  @JsonKey(name: 'tStamp')
  String? tStamp;

  @override
  String toString() {
    return 'EquipamentoFilter(cod: $cod, apenasAtivos: $apenasAtivos, ordenarPorNomeCrescente: $ordenarPorNomeCrescente, incluirTipoServicos: $incluirTipoServicos, tStamp: $tStamp)';
  }

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$EquipamentoFilterImplCopyWith<_$EquipamentoFilterImpl> get copyWith =>
      __$$EquipamentoFilterImplCopyWithImpl<_$EquipamentoFilterImpl>(
          this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$EquipamentoFilterImplToJson(
      this,
    );
  }
}

abstract class _EquipamentoFilter implements EquipamentoFilter {
  factory _EquipamentoFilter(
      {int? cod,
      bool? apenasAtivos,
      bool? ordenarPorNomeCrescente,
      bool? incluirTipoServicos,
      @JsonKey(name: 'tStamp') String? tStamp}) = _$EquipamentoFilterImpl;

  factory _EquipamentoFilter.fromJson(Map<String, dynamic> json) =
      _$EquipamentoFilterImpl.fromJson;

  @override
  int? get cod;
  set cod(int? value);
  @override
  bool? get apenasAtivos;
  set apenasAtivos(bool? value);
  @override
  bool? get ordenarPorNomeCrescente;
  set ordenarPorNomeCrescente(bool? value);
  @override
  bool? get incluirTipoServicos;
  set incluirTipoServicos(bool? value);
  @override
  @JsonKey(name: 'tStamp')
  String? get tStamp;
  @JsonKey(name: 'tStamp')
  set tStamp(String? value);
  @override
  @JsonKey(ignore: true)
  _$$EquipamentoFilterImplCopyWith<_$EquipamentoFilterImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
