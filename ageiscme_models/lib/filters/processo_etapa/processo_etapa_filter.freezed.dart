// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'processo_etapa_filter.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

ProcessoEtapaFilter _$ProcessoEtapaFilterFromJson(Map<String, dynamic> json) {
  return _ProcessoEtapaFilter.fromJson(json);
}

/// @nodoc
mixin _$ProcessoEtapaFilter {
  int? get codigo => throw _privateConstructorUsedError;
  set codigo(int? value) => throw _privateConstructorUsedError;
  bool? get apenasAtivos => throw _privateConstructorUsedError;
  set apenasAtivos(bool? value) => throw _privateConstructorUsedError;
  bool? get ordenarPorNomeCrescente => throw _privateConstructorUsedError;
  set ordenarPorNomeCrescente(bool? value) =>
      throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $ProcessoEtapaFilterCopyWith<ProcessoEtapaFilter> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $ProcessoEtapaFilterCopyWith<$Res> {
  factory $ProcessoEtapaFilterCopyWith(
          ProcessoEtapaFilter value, $Res Function(ProcessoEtapaFilter) then) =
      _$ProcessoEtapaFilterCopyWithImpl<$Res, ProcessoEtapaFilter>;
  @useResult
  $Res call({int? codigo, bool? apenasAtivos, bool? ordenarPorNomeCrescente});
}

/// @nodoc
class _$ProcessoEtapaFilterCopyWithImpl<$Res, $Val extends ProcessoEtapaFilter>
    implements $ProcessoEtapaFilterCopyWith<$Res> {
  _$ProcessoEtapaFilterCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? codigo = freezed,
    Object? apenasAtivos = freezed,
    Object? ordenarPorNomeCrescente = freezed,
  }) {
    return _then(_value.copyWith(
      codigo: freezed == codigo
          ? _value.codigo
          : codigo // ignore: cast_nullable_to_non_nullable
              as int?,
      apenasAtivos: freezed == apenasAtivos
          ? _value.apenasAtivos
          : apenasAtivos // ignore: cast_nullable_to_non_nullable
              as bool?,
      ordenarPorNomeCrescente: freezed == ordenarPorNomeCrescente
          ? _value.ordenarPorNomeCrescente
          : ordenarPorNomeCrescente // ignore: cast_nullable_to_non_nullable
              as bool?,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$ProcessoEtapaFilterImplCopyWith<$Res>
    implements $ProcessoEtapaFilterCopyWith<$Res> {
  factory _$$ProcessoEtapaFilterImplCopyWith(_$ProcessoEtapaFilterImpl value,
          $Res Function(_$ProcessoEtapaFilterImpl) then) =
      __$$ProcessoEtapaFilterImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({int? codigo, bool? apenasAtivos, bool? ordenarPorNomeCrescente});
}

/// @nodoc
class __$$ProcessoEtapaFilterImplCopyWithImpl<$Res>
    extends _$ProcessoEtapaFilterCopyWithImpl<$Res, _$ProcessoEtapaFilterImpl>
    implements _$$ProcessoEtapaFilterImplCopyWith<$Res> {
  __$$ProcessoEtapaFilterImplCopyWithImpl(_$ProcessoEtapaFilterImpl _value,
      $Res Function(_$ProcessoEtapaFilterImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? codigo = freezed,
    Object? apenasAtivos = freezed,
    Object? ordenarPorNomeCrescente = freezed,
  }) {
    return _then(_$ProcessoEtapaFilterImpl(
      codigo: freezed == codigo
          ? _value.codigo
          : codigo // ignore: cast_nullable_to_non_nullable
              as int?,
      apenasAtivos: freezed == apenasAtivos
          ? _value.apenasAtivos
          : apenasAtivos // ignore: cast_nullable_to_non_nullable
              as bool?,
      ordenarPorNomeCrescente: freezed == ordenarPorNomeCrescente
          ? _value.ordenarPorNomeCrescente
          : ordenarPorNomeCrescente // ignore: cast_nullable_to_non_nullable
              as bool?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$ProcessoEtapaFilterImpl implements _ProcessoEtapaFilter {
  _$ProcessoEtapaFilterImpl(
      {this.codigo, this.apenasAtivos, this.ordenarPorNomeCrescente});

  factory _$ProcessoEtapaFilterImpl.fromJson(Map<String, dynamic> json) =>
      _$$ProcessoEtapaFilterImplFromJson(json);

  @override
  int? codigo;
  @override
  bool? apenasAtivos;
  @override
  bool? ordenarPorNomeCrescente;

  @override
  String toString() {
    return 'ProcessoEtapaFilter(codigo: $codigo, apenasAtivos: $apenasAtivos, ordenarPorNomeCrescente: $ordenarPorNomeCrescente)';
  }

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$ProcessoEtapaFilterImplCopyWith<_$ProcessoEtapaFilterImpl> get copyWith =>
      __$$ProcessoEtapaFilterImplCopyWithImpl<_$ProcessoEtapaFilterImpl>(
          this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$ProcessoEtapaFilterImplToJson(
      this,
    );
  }
}

abstract class _ProcessoEtapaFilter implements ProcessoEtapaFilter {
  factory _ProcessoEtapaFilter(
      {int? codigo,
      bool? apenasAtivos,
      bool? ordenarPorNomeCrescente}) = _$ProcessoEtapaFilterImpl;

  factory _ProcessoEtapaFilter.fromJson(Map<String, dynamic> json) =
      _$ProcessoEtapaFilterImpl.fromJson;

  @override
  int? get codigo;
  set codigo(int? value);
  @override
  bool? get apenasAtivos;
  set apenasAtivos(bool? value);
  @override
  bool? get ordenarPorNomeCrescente;
  set ordenarPorNomeCrescente(bool? value);
  @override
  @JsonKey(ignore: true)
  _$$ProcessoEtapaFilterImplCopyWith<_$ProcessoEtapaFilterImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
