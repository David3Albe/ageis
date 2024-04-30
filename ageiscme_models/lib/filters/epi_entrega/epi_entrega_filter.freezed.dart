// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'epi_entrega_filter.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

EpiEntregaFilter _$EpiEntregaFilterFromJson(Map<String, dynamic> json) {
  return _EpiEntregaFilter.fromJson(json);
}

/// @nodoc
mixin _$EpiEntregaFilter {
  int? get cod => throw _privateConstructorUsedError;
  set cod(int? value) => throw _privateConstructorUsedError;
  bool? get carregarUsuario => throw _privateConstructorUsedError;
  set carregarUsuario(bool? value) => throw _privateConstructorUsedError;
  int? get numeroRegistros => throw _privateConstructorUsedError;
  set numeroRegistros(int? value) => throw _privateConstructorUsedError;
  String? get nomeContem => throw _privateConstructorUsedError;
  set nomeContem(String? value) => throw _privateConstructorUsedError;
  @JsonKey(name: 'tStamp')
  String? get tStamp => throw _privateConstructorUsedError;
  @JsonKey(name: 'tStamp')
  set tStamp(String? value) => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $EpiEntregaFilterCopyWith<EpiEntregaFilter> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $EpiEntregaFilterCopyWith<$Res> {
  factory $EpiEntregaFilterCopyWith(
          EpiEntregaFilter value, $Res Function(EpiEntregaFilter) then) =
      _$EpiEntregaFilterCopyWithImpl<$Res, EpiEntregaFilter>;
  @useResult
  $Res call(
      {int? cod,
      bool? carregarUsuario,
      int? numeroRegistros,
      String? nomeContem,
      @JsonKey(name: 'tStamp') String? tStamp});
}

/// @nodoc
class _$EpiEntregaFilterCopyWithImpl<$Res, $Val extends EpiEntregaFilter>
    implements $EpiEntregaFilterCopyWith<$Res> {
  _$EpiEntregaFilterCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? cod = freezed,
    Object? carregarUsuario = freezed,
    Object? numeroRegistros = freezed,
    Object? nomeContem = freezed,
    Object? tStamp = freezed,
  }) {
    return _then(_value.copyWith(
      cod: freezed == cod
          ? _value.cod
          : cod // ignore: cast_nullable_to_non_nullable
              as int?,
      carregarUsuario: freezed == carregarUsuario
          ? _value.carregarUsuario
          : carregarUsuario // ignore: cast_nullable_to_non_nullable
              as bool?,
      numeroRegistros: freezed == numeroRegistros
          ? _value.numeroRegistros
          : numeroRegistros // ignore: cast_nullable_to_non_nullable
              as int?,
      nomeContem: freezed == nomeContem
          ? _value.nomeContem
          : nomeContem // ignore: cast_nullable_to_non_nullable
              as String?,
      tStamp: freezed == tStamp
          ? _value.tStamp
          : tStamp // ignore: cast_nullable_to_non_nullable
              as String?,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$EpiEntregaFilterImplCopyWith<$Res>
    implements $EpiEntregaFilterCopyWith<$Res> {
  factory _$$EpiEntregaFilterImplCopyWith(_$EpiEntregaFilterImpl value,
          $Res Function(_$EpiEntregaFilterImpl) then) =
      __$$EpiEntregaFilterImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {int? cod,
      bool? carregarUsuario,
      int? numeroRegistros,
      String? nomeContem,
      @JsonKey(name: 'tStamp') String? tStamp});
}

/// @nodoc
class __$$EpiEntregaFilterImplCopyWithImpl<$Res>
    extends _$EpiEntregaFilterCopyWithImpl<$Res, _$EpiEntregaFilterImpl>
    implements _$$EpiEntregaFilterImplCopyWith<$Res> {
  __$$EpiEntregaFilterImplCopyWithImpl(_$EpiEntregaFilterImpl _value,
      $Res Function(_$EpiEntregaFilterImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? cod = freezed,
    Object? carregarUsuario = freezed,
    Object? numeroRegistros = freezed,
    Object? nomeContem = freezed,
    Object? tStamp = freezed,
  }) {
    return _then(_$EpiEntregaFilterImpl(
      cod: freezed == cod
          ? _value.cod
          : cod // ignore: cast_nullable_to_non_nullable
              as int?,
      carregarUsuario: freezed == carregarUsuario
          ? _value.carregarUsuario
          : carregarUsuario // ignore: cast_nullable_to_non_nullable
              as bool?,
      numeroRegistros: freezed == numeroRegistros
          ? _value.numeroRegistros
          : numeroRegistros // ignore: cast_nullable_to_non_nullable
              as int?,
      nomeContem: freezed == nomeContem
          ? _value.nomeContem
          : nomeContem // ignore: cast_nullable_to_non_nullable
              as String?,
      tStamp: freezed == tStamp
          ? _value.tStamp
          : tStamp // ignore: cast_nullable_to_non_nullable
              as String?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$EpiEntregaFilterImpl implements _EpiEntregaFilter {
  _$EpiEntregaFilterImpl(
      {this.cod,
      this.carregarUsuario,
      this.numeroRegistros,
      this.nomeContem,
      @JsonKey(name: 'tStamp') this.tStamp});

  factory _$EpiEntregaFilterImpl.fromJson(Map<String, dynamic> json) =>
      _$$EpiEntregaFilterImplFromJson(json);

  @override
  int? cod;
  @override
  bool? carregarUsuario;
  @override
  int? numeroRegistros;
  @override
  String? nomeContem;
  @override
  @JsonKey(name: 'tStamp')
  String? tStamp;

  @override
  String toString() {
    return 'EpiEntregaFilter(cod: $cod, carregarUsuario: $carregarUsuario, numeroRegistros: $numeroRegistros, nomeContem: $nomeContem, tStamp: $tStamp)';
  }

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$EpiEntregaFilterImplCopyWith<_$EpiEntregaFilterImpl> get copyWith =>
      __$$EpiEntregaFilterImplCopyWithImpl<_$EpiEntregaFilterImpl>(
          this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$EpiEntregaFilterImplToJson(
      this,
    );
  }
}

abstract class _EpiEntregaFilter implements EpiEntregaFilter {
  factory _EpiEntregaFilter(
      {int? cod,
      bool? carregarUsuario,
      int? numeroRegistros,
      String? nomeContem,
      @JsonKey(name: 'tStamp') String? tStamp}) = _$EpiEntregaFilterImpl;

  factory _EpiEntregaFilter.fromJson(Map<String, dynamic> json) =
      _$EpiEntregaFilterImpl.fromJson;

  @override
  int? get cod;
  set cod(int? value);
  @override
  bool? get carregarUsuario;
  set carregarUsuario(bool? value);
  @override
  int? get numeroRegistros;
  set numeroRegistros(int? value);
  @override
  String? get nomeContem;
  set nomeContem(String? value);
  @override
  @JsonKey(name: 'tStamp')
  String? get tStamp;
  @JsonKey(name: 'tStamp')
  set tStamp(String? value);
  @override
  @JsonKey(ignore: true)
  _$$EpiEntregaFilterImplCopyWith<_$EpiEntregaFilterImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
