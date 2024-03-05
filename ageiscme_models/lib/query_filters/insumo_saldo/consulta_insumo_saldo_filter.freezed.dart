// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'consulta_insumo_saldo_filter.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

ConsultaInsumoSaldoFilter _$ConsultaInsumoSaldoFilterFromJson(
    Map<String, dynamic> json) {
  return _ConsultaInsumoSaldoFilter.fromJson(json);
}

/// @nodoc
mixin _$ConsultaInsumoSaldoFilter {
  int? get codInsumo => throw _privateConstructorUsedError;
  set codInsumo(int? value) => throw _privateConstructorUsedError;
  int? get codDeposito => throw _privateConstructorUsedError;
  set codDeposito(int? value) => throw _privateConstructorUsedError;
  bool? get semSaldo => throw _privateConstructorUsedError;
  set semSaldo(bool? value) => throw _privateConstructorUsedError;
  String? get situacao => throw _privateConstructorUsedError;
  set situacao(String? value) => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $ConsultaInsumoSaldoFilterCopyWith<ConsultaInsumoSaldoFilter> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $ConsultaInsumoSaldoFilterCopyWith<$Res> {
  factory $ConsultaInsumoSaldoFilterCopyWith(ConsultaInsumoSaldoFilter value,
          $Res Function(ConsultaInsumoSaldoFilter) then) =
      _$ConsultaInsumoSaldoFilterCopyWithImpl<$Res, ConsultaInsumoSaldoFilter>;
  @useResult
  $Res call(
      {int? codInsumo, int? codDeposito, bool? semSaldo, String? situacao});
}

/// @nodoc
class _$ConsultaInsumoSaldoFilterCopyWithImpl<$Res,
        $Val extends ConsultaInsumoSaldoFilter>
    implements $ConsultaInsumoSaldoFilterCopyWith<$Res> {
  _$ConsultaInsumoSaldoFilterCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? codInsumo = freezed,
    Object? codDeposito = freezed,
    Object? semSaldo = freezed,
    Object? situacao = freezed,
  }) {
    return _then(_value.copyWith(
      codInsumo: freezed == codInsumo
          ? _value.codInsumo
          : codInsumo // ignore: cast_nullable_to_non_nullable
              as int?,
      codDeposito: freezed == codDeposito
          ? _value.codDeposito
          : codDeposito // ignore: cast_nullable_to_non_nullable
              as int?,
      semSaldo: freezed == semSaldo
          ? _value.semSaldo
          : semSaldo // ignore: cast_nullable_to_non_nullable
              as bool?,
      situacao: freezed == situacao
          ? _value.situacao
          : situacao // ignore: cast_nullable_to_non_nullable
              as String?,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$ConsultaInsumoSaldoFilterImplCopyWith<$Res>
    implements $ConsultaInsumoSaldoFilterCopyWith<$Res> {
  factory _$$ConsultaInsumoSaldoFilterImplCopyWith(
          _$ConsultaInsumoSaldoFilterImpl value,
          $Res Function(_$ConsultaInsumoSaldoFilterImpl) then) =
      __$$ConsultaInsumoSaldoFilterImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {int? codInsumo, int? codDeposito, bool? semSaldo, String? situacao});
}

/// @nodoc
class __$$ConsultaInsumoSaldoFilterImplCopyWithImpl<$Res>
    extends _$ConsultaInsumoSaldoFilterCopyWithImpl<$Res,
        _$ConsultaInsumoSaldoFilterImpl>
    implements _$$ConsultaInsumoSaldoFilterImplCopyWith<$Res> {
  __$$ConsultaInsumoSaldoFilterImplCopyWithImpl(
      _$ConsultaInsumoSaldoFilterImpl _value,
      $Res Function(_$ConsultaInsumoSaldoFilterImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? codInsumo = freezed,
    Object? codDeposito = freezed,
    Object? semSaldo = freezed,
    Object? situacao = freezed,
  }) {
    return _then(_$ConsultaInsumoSaldoFilterImpl(
      codInsumo: freezed == codInsumo
          ? _value.codInsumo
          : codInsumo // ignore: cast_nullable_to_non_nullable
              as int?,
      codDeposito: freezed == codDeposito
          ? _value.codDeposito
          : codDeposito // ignore: cast_nullable_to_non_nullable
              as int?,
      semSaldo: freezed == semSaldo
          ? _value.semSaldo
          : semSaldo // ignore: cast_nullable_to_non_nullable
              as bool?,
      situacao: freezed == situacao
          ? _value.situacao
          : situacao // ignore: cast_nullable_to_non_nullable
              as String?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$ConsultaInsumoSaldoFilterImpl extends _ConsultaInsumoSaldoFilter {
  _$ConsultaInsumoSaldoFilterImpl(
      {required this.codInsumo,
      required this.codDeposito,
      required this.semSaldo,
      required this.situacao})
      : super._();

  factory _$ConsultaInsumoSaldoFilterImpl.fromJson(Map<String, dynamic> json) =>
      _$$ConsultaInsumoSaldoFilterImplFromJson(json);

  @override
  int? codInsumo;
  @override
  int? codDeposito;
  @override
  bool? semSaldo;
  @override
  String? situacao;

  @override
  String toString() {
    return 'ConsultaInsumoSaldoFilter(codInsumo: $codInsumo, codDeposito: $codDeposito, semSaldo: $semSaldo, situacao: $situacao)';
  }

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$ConsultaInsumoSaldoFilterImplCopyWith<_$ConsultaInsumoSaldoFilterImpl>
      get copyWith => __$$ConsultaInsumoSaldoFilterImplCopyWithImpl<
          _$ConsultaInsumoSaldoFilterImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$ConsultaInsumoSaldoFilterImplToJson(
      this,
    );
  }
}

abstract class _ConsultaInsumoSaldoFilter extends ConsultaInsumoSaldoFilter {
  factory _ConsultaInsumoSaldoFilter(
      {required int? codInsumo,
      required int? codDeposito,
      required bool? semSaldo,
      required String? situacao}) = _$ConsultaInsumoSaldoFilterImpl;
  _ConsultaInsumoSaldoFilter._() : super._();

  factory _ConsultaInsumoSaldoFilter.fromJson(Map<String, dynamic> json) =
      _$ConsultaInsumoSaldoFilterImpl.fromJson;

  @override
  int? get codInsumo;
  set codInsumo(int? value);
  @override
  int? get codDeposito;
  set codDeposito(int? value);
  @override
  bool? get semSaldo;
  set semSaldo(bool? value);
  @override
  String? get situacao;
  set situacao(String? value);
  @override
  @JsonKey(ignore: true)
  _$$ConsultaInsumoSaldoFilterImplCopyWith<_$ConsultaInsumoSaldoFilterImpl>
      get copyWith => throw _privateConstructorUsedError;
}
