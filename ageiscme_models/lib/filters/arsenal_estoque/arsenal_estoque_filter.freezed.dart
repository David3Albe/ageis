// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'arsenal_estoque_filter.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

ArsenalEstoqueFilter _$ArsenalEstoqueFilterFromJson(Map<String, dynamic> json) {
  return _ArsenalEstoqueFilter.fromJson(json);
}

/// @nodoc
mixin _$ArsenalEstoqueFilter {
  int? get cod => throw _privateConstructorUsedError;
  set cod(int? value) => throw _privateConstructorUsedError;
  bool? get apenasAtivos => throw _privateConstructorUsedError;
  set apenasAtivos(bool? value) => throw _privateConstructorUsedError;
  bool? get ordenarPorNomeCrescente => throw _privateConstructorUsedError;
  set ordenarPorNomeCrescente(bool? value) =>
      throw _privateConstructorUsedError;
  @JsonKey(name: 'tStamp')
  String? get tStamp => throw _privateConstructorUsedError;
  @JsonKey(name: 'tStamp')
  set tStamp(String? value) => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $ArsenalEstoqueFilterCopyWith<ArsenalEstoqueFilter> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $ArsenalEstoqueFilterCopyWith<$Res> {
  factory $ArsenalEstoqueFilterCopyWith(ArsenalEstoqueFilter value,
          $Res Function(ArsenalEstoqueFilter) then) =
      _$ArsenalEstoqueFilterCopyWithImpl<$Res, ArsenalEstoqueFilter>;
  @useResult
  $Res call(
      {int? cod,
      bool? apenasAtivos,
      bool? ordenarPorNomeCrescente,
      @JsonKey(name: 'tStamp') String? tStamp});
}

/// @nodoc
class _$ArsenalEstoqueFilterCopyWithImpl<$Res,
        $Val extends ArsenalEstoqueFilter>
    implements $ArsenalEstoqueFilterCopyWith<$Res> {
  _$ArsenalEstoqueFilterCopyWithImpl(this._value, this._then);

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
      tStamp: freezed == tStamp
          ? _value.tStamp
          : tStamp // ignore: cast_nullable_to_non_nullable
              as String?,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$ArsenalEstoqueFilterImplCopyWith<$Res>
    implements $ArsenalEstoqueFilterCopyWith<$Res> {
  factory _$$ArsenalEstoqueFilterImplCopyWith(_$ArsenalEstoqueFilterImpl value,
          $Res Function(_$ArsenalEstoqueFilterImpl) then) =
      __$$ArsenalEstoqueFilterImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {int? cod,
      bool? apenasAtivos,
      bool? ordenarPorNomeCrescente,
      @JsonKey(name: 'tStamp') String? tStamp});
}

/// @nodoc
class __$$ArsenalEstoqueFilterImplCopyWithImpl<$Res>
    extends _$ArsenalEstoqueFilterCopyWithImpl<$Res, _$ArsenalEstoqueFilterImpl>
    implements _$$ArsenalEstoqueFilterImplCopyWith<$Res> {
  __$$ArsenalEstoqueFilterImplCopyWithImpl(_$ArsenalEstoqueFilterImpl _value,
      $Res Function(_$ArsenalEstoqueFilterImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? cod = freezed,
    Object? apenasAtivos = freezed,
    Object? ordenarPorNomeCrescente = freezed,
    Object? tStamp = freezed,
  }) {
    return _then(_$ArsenalEstoqueFilterImpl(
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
      tStamp: freezed == tStamp
          ? _value.tStamp
          : tStamp // ignore: cast_nullable_to_non_nullable
              as String?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$ArsenalEstoqueFilterImpl implements _ArsenalEstoqueFilter {
  _$ArsenalEstoqueFilterImpl(
      {this.cod,
      this.apenasAtivos,
      this.ordenarPorNomeCrescente,
      @JsonKey(name: 'tStamp') this.tStamp});

  factory _$ArsenalEstoqueFilterImpl.fromJson(Map<String, dynamic> json) =>
      _$$ArsenalEstoqueFilterImplFromJson(json);

  @override
  int? cod;
  @override
  bool? apenasAtivos;
  @override
  bool? ordenarPorNomeCrescente;
  @override
  @JsonKey(name: 'tStamp')
  String? tStamp;

  @override
  String toString() {
    return 'ArsenalEstoqueFilter(cod: $cod, apenasAtivos: $apenasAtivos, ordenarPorNomeCrescente: $ordenarPorNomeCrescente, tStamp: $tStamp)';
  }

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$ArsenalEstoqueFilterImplCopyWith<_$ArsenalEstoqueFilterImpl>
      get copyWith =>
          __$$ArsenalEstoqueFilterImplCopyWithImpl<_$ArsenalEstoqueFilterImpl>(
              this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$ArsenalEstoqueFilterImplToJson(
      this,
    );
  }
}

abstract class _ArsenalEstoqueFilter implements ArsenalEstoqueFilter {
  factory _ArsenalEstoqueFilter(
      {int? cod,
      bool? apenasAtivos,
      bool? ordenarPorNomeCrescente,
      @JsonKey(name: 'tStamp') String? tStamp}) = _$ArsenalEstoqueFilterImpl;

  factory _ArsenalEstoqueFilter.fromJson(Map<String, dynamic> json) =
      _$ArsenalEstoqueFilterImpl.fromJson;

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
  @JsonKey(name: 'tStamp')
  String? get tStamp;
  @JsonKey(name: 'tStamp')
  set tStamp(String? value);
  @override
  @JsonKey(ignore: true)
  _$$ArsenalEstoqueFilterImplCopyWith<_$ArsenalEstoqueFilterImpl>
      get copyWith => throw _privateConstructorUsedError;
}
