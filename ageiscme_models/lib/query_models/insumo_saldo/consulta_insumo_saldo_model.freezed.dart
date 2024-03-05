// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'consulta_insumo_saldo_model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

ConsultaInsumoSaldoModel _$ConsultaInsumoSaldoModelFromJson(
    Map<String, dynamic> json) {
  return _ConsultaInsumoSaldoModel.fromJson(json);
}

/// @nodoc
mixin _$ConsultaInsumoSaldoModel {
  int? get codDeposito => throw _privateConstructorUsedError;
  set codDeposito(int? value) => throw _privateConstructorUsedError;
  int? get codInsumo => throw _privateConstructorUsedError;
  set codInsumo(int? value) => throw _privateConstructorUsedError;
  String? get lote => throw _privateConstructorUsedError;
  set lote(String? value) => throw _privateConstructorUsedError;
  double? get qtdeDisponivel => throw _privateConstructorUsedError;
  set qtdeDisponivel(double? value) => throw _privateConstructorUsedError;
  String? get status => throw _privateConstructorUsedError;
  set status(String? value) => throw _privateConstructorUsedError;
  DateTime? get dataFabricacao => throw _privateConstructorUsedError;
  set dataFabricacao(DateTime? value) => throw _privateConstructorUsedError;
  DateTime? get dataValidade => throw _privateConstructorUsedError;
  set dataValidade(DateTime? value) => throw _privateConstructorUsedError;
  DateTime? get dataValidadePosAtivacao => throw _privateConstructorUsedError;
  set dataValidadePosAtivacao(DateTime? value) =>
      throw _privateConstructorUsedError;
  DepositoInsumoModel? get depositoInsumo => throw _privateConstructorUsedError;
  set depositoInsumo(DepositoInsumoModel? value) =>
      throw _privateConstructorUsedError;
  InsumoModel? get insumo => throw _privateConstructorUsedError;
  set insumo(InsumoModel? value) => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $ConsultaInsumoSaldoModelCopyWith<ConsultaInsumoSaldoModel> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $ConsultaInsumoSaldoModelCopyWith<$Res> {
  factory $ConsultaInsumoSaldoModelCopyWith(ConsultaInsumoSaldoModel value,
          $Res Function(ConsultaInsumoSaldoModel) then) =
      _$ConsultaInsumoSaldoModelCopyWithImpl<$Res, ConsultaInsumoSaldoModel>;
  @useResult
  $Res call(
      {int? codDeposito,
      int? codInsumo,
      String? lote,
      double? qtdeDisponivel,
      String? status,
      DateTime? dataFabricacao,
      DateTime? dataValidade,
      DateTime? dataValidadePosAtivacao,
      DepositoInsumoModel? depositoInsumo,
      InsumoModel? insumo});

  $DepositoInsumoModelCopyWith<$Res>? get depositoInsumo;
  $InsumoModelCopyWith<$Res>? get insumo;
}

/// @nodoc
class _$ConsultaInsumoSaldoModelCopyWithImpl<$Res,
        $Val extends ConsultaInsumoSaldoModel>
    implements $ConsultaInsumoSaldoModelCopyWith<$Res> {
  _$ConsultaInsumoSaldoModelCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? codDeposito = freezed,
    Object? codInsumo = freezed,
    Object? lote = freezed,
    Object? qtdeDisponivel = freezed,
    Object? status = freezed,
    Object? dataFabricacao = freezed,
    Object? dataValidade = freezed,
    Object? dataValidadePosAtivacao = freezed,
    Object? depositoInsumo = freezed,
    Object? insumo = freezed,
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
      lote: freezed == lote
          ? _value.lote
          : lote // ignore: cast_nullable_to_non_nullable
              as String?,
      qtdeDisponivel: freezed == qtdeDisponivel
          ? _value.qtdeDisponivel
          : qtdeDisponivel // ignore: cast_nullable_to_non_nullable
              as double?,
      status: freezed == status
          ? _value.status
          : status // ignore: cast_nullable_to_non_nullable
              as String?,
      dataFabricacao: freezed == dataFabricacao
          ? _value.dataFabricacao
          : dataFabricacao // ignore: cast_nullable_to_non_nullable
              as DateTime?,
      dataValidade: freezed == dataValidade
          ? _value.dataValidade
          : dataValidade // ignore: cast_nullable_to_non_nullable
              as DateTime?,
      dataValidadePosAtivacao: freezed == dataValidadePosAtivacao
          ? _value.dataValidadePosAtivacao
          : dataValidadePosAtivacao // ignore: cast_nullable_to_non_nullable
              as DateTime?,
      depositoInsumo: freezed == depositoInsumo
          ? _value.depositoInsumo
          : depositoInsumo // ignore: cast_nullable_to_non_nullable
              as DepositoInsumoModel?,
      insumo: freezed == insumo
          ? _value.insumo
          : insumo // ignore: cast_nullable_to_non_nullable
              as InsumoModel?,
    ) as $Val);
  }

  @override
  @pragma('vm:prefer-inline')
  $DepositoInsumoModelCopyWith<$Res>? get depositoInsumo {
    if (_value.depositoInsumo == null) {
      return null;
    }

    return $DepositoInsumoModelCopyWith<$Res>(_value.depositoInsumo!, (value) {
      return _then(_value.copyWith(depositoInsumo: value) as $Val);
    });
  }

  @override
  @pragma('vm:prefer-inline')
  $InsumoModelCopyWith<$Res>? get insumo {
    if (_value.insumo == null) {
      return null;
    }

    return $InsumoModelCopyWith<$Res>(_value.insumo!, (value) {
      return _then(_value.copyWith(insumo: value) as $Val);
    });
  }
}

/// @nodoc
abstract class _$$ConsultaInsumoSaldoModelImplCopyWith<$Res>
    implements $ConsultaInsumoSaldoModelCopyWith<$Res> {
  factory _$$ConsultaInsumoSaldoModelImplCopyWith(
          _$ConsultaInsumoSaldoModelImpl value,
          $Res Function(_$ConsultaInsumoSaldoModelImpl) then) =
      __$$ConsultaInsumoSaldoModelImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {int? codDeposito,
      int? codInsumo,
      String? lote,
      double? qtdeDisponivel,
      String? status,
      DateTime? dataFabricacao,
      DateTime? dataValidade,
      DateTime? dataValidadePosAtivacao,
      DepositoInsumoModel? depositoInsumo,
      InsumoModel? insumo});

  @override
  $DepositoInsumoModelCopyWith<$Res>? get depositoInsumo;
  @override
  $InsumoModelCopyWith<$Res>? get insumo;
}

/// @nodoc
class __$$ConsultaInsumoSaldoModelImplCopyWithImpl<$Res>
    extends _$ConsultaInsumoSaldoModelCopyWithImpl<$Res,
        _$ConsultaInsumoSaldoModelImpl>
    implements _$$ConsultaInsumoSaldoModelImplCopyWith<$Res> {
  __$$ConsultaInsumoSaldoModelImplCopyWithImpl(
      _$ConsultaInsumoSaldoModelImpl _value,
      $Res Function(_$ConsultaInsumoSaldoModelImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? codDeposito = freezed,
    Object? codInsumo = freezed,
    Object? lote = freezed,
    Object? qtdeDisponivel = freezed,
    Object? status = freezed,
    Object? dataFabricacao = freezed,
    Object? dataValidade = freezed,
    Object? dataValidadePosAtivacao = freezed,
    Object? depositoInsumo = freezed,
    Object? insumo = freezed,
  }) {
    return _then(_$ConsultaInsumoSaldoModelImpl(
      codDeposito: freezed == codDeposito
          ? _value.codDeposito
          : codDeposito // ignore: cast_nullable_to_non_nullable
              as int?,
      codInsumo: freezed == codInsumo
          ? _value.codInsumo
          : codInsumo // ignore: cast_nullable_to_non_nullable
              as int?,
      lote: freezed == lote
          ? _value.lote
          : lote // ignore: cast_nullable_to_non_nullable
              as String?,
      qtdeDisponivel: freezed == qtdeDisponivel
          ? _value.qtdeDisponivel
          : qtdeDisponivel // ignore: cast_nullable_to_non_nullable
              as double?,
      status: freezed == status
          ? _value.status
          : status // ignore: cast_nullable_to_non_nullable
              as String?,
      dataFabricacao: freezed == dataFabricacao
          ? _value.dataFabricacao
          : dataFabricacao // ignore: cast_nullable_to_non_nullable
              as DateTime?,
      dataValidade: freezed == dataValidade
          ? _value.dataValidade
          : dataValidade // ignore: cast_nullable_to_non_nullable
              as DateTime?,
      dataValidadePosAtivacao: freezed == dataValidadePosAtivacao
          ? _value.dataValidadePosAtivacao
          : dataValidadePosAtivacao // ignore: cast_nullable_to_non_nullable
              as DateTime?,
      depositoInsumo: freezed == depositoInsumo
          ? _value.depositoInsumo
          : depositoInsumo // ignore: cast_nullable_to_non_nullable
              as DepositoInsumoModel?,
      insumo: freezed == insumo
          ? _value.insumo
          : insumo // ignore: cast_nullable_to_non_nullable
              as InsumoModel?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$ConsultaInsumoSaldoModelImpl extends _ConsultaInsumoSaldoModel {
  _$ConsultaInsumoSaldoModelImpl(
      {required this.codDeposito,
      required this.codInsumo,
      required this.lote,
      required this.qtdeDisponivel,
      required this.status,
      required this.dataFabricacao,
      required this.dataValidade,
      required this.dataValidadePosAtivacao,
      required this.depositoInsumo,
      required this.insumo})
      : super._();

  factory _$ConsultaInsumoSaldoModelImpl.fromJson(Map<String, dynamic> json) =>
      _$$ConsultaInsumoSaldoModelImplFromJson(json);

  @override
  int? codDeposito;
  @override
  int? codInsumo;
  @override
  String? lote;
  @override
  double? qtdeDisponivel;
  @override
  String? status;
  @override
  DateTime? dataFabricacao;
  @override
  DateTime? dataValidade;
  @override
  DateTime? dataValidadePosAtivacao;
  @override
  DepositoInsumoModel? depositoInsumo;
  @override
  InsumoModel? insumo;

  @override
  String toString() {
    return 'ConsultaInsumoSaldoModel(codDeposito: $codDeposito, codInsumo: $codInsumo, lote: $lote, qtdeDisponivel: $qtdeDisponivel, status: $status, dataFabricacao: $dataFabricacao, dataValidade: $dataValidade, dataValidadePosAtivacao: $dataValidadePosAtivacao, depositoInsumo: $depositoInsumo, insumo: $insumo)';
  }

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$ConsultaInsumoSaldoModelImplCopyWith<_$ConsultaInsumoSaldoModelImpl>
      get copyWith => __$$ConsultaInsumoSaldoModelImplCopyWithImpl<
          _$ConsultaInsumoSaldoModelImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$ConsultaInsumoSaldoModelImplToJson(
      this,
    );
  }
}

abstract class _ConsultaInsumoSaldoModel extends ConsultaInsumoSaldoModel {
  factory _ConsultaInsumoSaldoModel(
      {required int? codDeposito,
      required int? codInsumo,
      required String? lote,
      required double? qtdeDisponivel,
      required String? status,
      required DateTime? dataFabricacao,
      required DateTime? dataValidade,
      required DateTime? dataValidadePosAtivacao,
      required DepositoInsumoModel? depositoInsumo,
      required InsumoModel? insumo}) = _$ConsultaInsumoSaldoModelImpl;
  _ConsultaInsumoSaldoModel._() : super._();

  factory _ConsultaInsumoSaldoModel.fromJson(Map<String, dynamic> json) =
      _$ConsultaInsumoSaldoModelImpl.fromJson;

  @override
  int? get codDeposito;
  set codDeposito(int? value);
  @override
  int? get codInsumo;
  set codInsumo(int? value);
  @override
  String? get lote;
  set lote(String? value);
  @override
  double? get qtdeDisponivel;
  set qtdeDisponivel(double? value);
  @override
  String? get status;
  set status(String? value);
  @override
  DateTime? get dataFabricacao;
  set dataFabricacao(DateTime? value);
  @override
  DateTime? get dataValidade;
  set dataValidade(DateTime? value);
  @override
  DateTime? get dataValidadePosAtivacao;
  set dataValidadePosAtivacao(DateTime? value);
  @override
  DepositoInsumoModel? get depositoInsumo;
  set depositoInsumo(DepositoInsumoModel? value);
  @override
  InsumoModel? get insumo;
  set insumo(InsumoModel? value);
  @override
  @JsonKey(ignore: true)
  _$$ConsultaInsumoSaldoModelImplCopyWith<_$ConsultaInsumoSaldoModelImpl>
      get copyWith => throw _privateConstructorUsedError;
}
