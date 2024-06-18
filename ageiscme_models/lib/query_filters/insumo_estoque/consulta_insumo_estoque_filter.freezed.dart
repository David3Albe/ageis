// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'consulta_insumo_estoque_filter.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

ConsultaInsumoEstoqueFilter _$ConsultaInsumoEstoqueFilterFromJson(
    Map<String, dynamic> json) {
  return _ConsultaInsumoEstoqueFilter.fromJson(json);
}

/// @nodoc
mixin _$ConsultaInsumoEstoqueFilter {
  int? get codDeposito => throw _privateConstructorUsedError;
  set codDeposito(int? value) => throw _privateConstructorUsedError;
  int? get codInsumo => throw _privateConstructorUsedError;
  set codInsumo(int? value) => throw _privateConstructorUsedError;
  bool? get estoqueAbaixoMinimo => throw _privateConstructorUsedError;
  set estoqueAbaixoMinimo(bool? value) => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $ConsultaInsumoEstoqueFilterCopyWith<ConsultaInsumoEstoqueFilter>
      get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $ConsultaInsumoEstoqueFilterCopyWith<$Res> {
  factory $ConsultaInsumoEstoqueFilterCopyWith(
          ConsultaInsumoEstoqueFilter value,
          $Res Function(ConsultaInsumoEstoqueFilter) then) =
      _$ConsultaInsumoEstoqueFilterCopyWithImpl<$Res,
          ConsultaInsumoEstoqueFilter>;
  @useResult
  $Res call({int? codDeposito, int? codInsumo, bool? estoqueAbaixoMinimo});
}

/// @nodoc
class _$ConsultaInsumoEstoqueFilterCopyWithImpl<$Res,
        $Val extends ConsultaInsumoEstoqueFilter>
    implements $ConsultaInsumoEstoqueFilterCopyWith<$Res> {
  _$ConsultaInsumoEstoqueFilterCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? codDeposito = freezed,
    Object? codInsumo = freezed,
    Object? estoqueAbaixoMinimo = freezed,
  }) {
    return _then(_value.copyWith(
      codDeposito: freezed == codDeposito
          ? _value.codDeposito
          : codDeposito // ignore: cast_nullable_to_non_nullable
              as int?,
      codInsumo: freezed == codInsumo
          ? _value.codInsumo
          : codInsumo // ignore: cast_nullable_to_non_nullable
              as int?,
      estoqueAbaixoMinimo: freezed == estoqueAbaixoMinimo
          ? _value.estoqueAbaixoMinimo
          : estoqueAbaixoMinimo // ignore: cast_nullable_to_non_nullable
              as bool?,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$ConsultaInsumoEstoqueFilterImplCopyWith<$Res>
    implements $ConsultaInsumoEstoqueFilterCopyWith<$Res> {
  factory _$$ConsultaInsumoEstoqueFilterImplCopyWith(
          _$ConsultaInsumoEstoqueFilterImpl value,
          $Res Function(_$ConsultaInsumoEstoqueFilterImpl) then) =
      __$$ConsultaInsumoEstoqueFilterImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({int? codDeposito, int? codInsumo, bool? estoqueAbaixoMinimo});
}

/// @nodoc
class __$$ConsultaInsumoEstoqueFilterImplCopyWithImpl<$Res>
    extends _$ConsultaInsumoEstoqueFilterCopyWithImpl<$Res,
        _$ConsultaInsumoEstoqueFilterImpl>
    implements _$$ConsultaInsumoEstoqueFilterImplCopyWith<$Res> {
  __$$ConsultaInsumoEstoqueFilterImplCopyWithImpl(
      _$ConsultaInsumoEstoqueFilterImpl _value,
      $Res Function(_$ConsultaInsumoEstoqueFilterImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? codDeposito = freezed,
    Object? codInsumo = freezed,
    Object? estoqueAbaixoMinimo = freezed,
  }) {
    return _then(_$ConsultaInsumoEstoqueFilterImpl(
      codDeposito: freezed == codDeposito
          ? _value.codDeposito
          : codDeposito // ignore: cast_nullable_to_non_nullable
              as int?,
      codInsumo: freezed == codInsumo
          ? _value.codInsumo
          : codInsumo // ignore: cast_nullable_to_non_nullable
              as int?,
      estoqueAbaixoMinimo: freezed == estoqueAbaixoMinimo
          ? _value.estoqueAbaixoMinimo
          : estoqueAbaixoMinimo // ignore: cast_nullable_to_non_nullable
              as bool?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$ConsultaInsumoEstoqueFilterImpl extends _ConsultaInsumoEstoqueFilter {
  _$ConsultaInsumoEstoqueFilterImpl(
      {required this.codDeposito,
      required this.codInsumo,
      required this.estoqueAbaixoMinimo})
      : super._();

  factory _$ConsultaInsumoEstoqueFilterImpl.fromJson(
          Map<String, dynamic> json) =>
      _$$ConsultaInsumoEstoqueFilterImplFromJson(json);

  @override
  int? codDeposito;
  @override
  int? codInsumo;
  @override
  bool? estoqueAbaixoMinimo;

  @override
  String toString() {
    return 'ConsultaInsumoEstoqueFilter(codDeposito: $codDeposito, codInsumo: $codInsumo, estoqueAbaixoMinimo: $estoqueAbaixoMinimo)';
  }

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$ConsultaInsumoEstoqueFilterImplCopyWith<_$ConsultaInsumoEstoqueFilterImpl>
      get copyWith => __$$ConsultaInsumoEstoqueFilterImplCopyWithImpl<
          _$ConsultaInsumoEstoqueFilterImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$ConsultaInsumoEstoqueFilterImplToJson(
      this,
    );
  }
}

abstract class _ConsultaInsumoEstoqueFilter
    extends ConsultaInsumoEstoqueFilter {
  factory _ConsultaInsumoEstoqueFilter(
      {required int? codDeposito,
      required int? codInsumo,
      required bool? estoqueAbaixoMinimo}) = _$ConsultaInsumoEstoqueFilterImpl;
  _ConsultaInsumoEstoqueFilter._() : super._();

  factory _ConsultaInsumoEstoqueFilter.fromJson(Map<String, dynamic> json) =
      _$ConsultaInsumoEstoqueFilterImpl.fromJson;

  @override
  int? get codDeposito;
  set codDeposito(int? value);
  @override
  int? get codInsumo;
  set codInsumo(int? value);
  @override
  bool? get estoqueAbaixoMinimo;
  set estoqueAbaixoMinimo(bool? value);
  @override
  @JsonKey(ignore: true)
  _$$ConsultaInsumoEstoqueFilterImplCopyWith<_$ConsultaInsumoEstoqueFilterImpl>
      get copyWith => throw _privateConstructorUsedError;
}
