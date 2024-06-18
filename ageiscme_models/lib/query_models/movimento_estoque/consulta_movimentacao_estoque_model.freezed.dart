// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'consulta_movimentacao_estoque_model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

ConsultaMovimentacaoEstoqueModel _$ConsultaMovimentacaoEstoqueModelFromJson(
    Map<String, dynamic> json) {
  return _ConsultaMovimentacaoEstoqueModel.fromJson(json);
}

/// @nodoc
mixin _$ConsultaMovimentacaoEstoqueModel {
  int? get cod => throw _privateConstructorUsedError;
  set cod(int? value) => throw _privateConstructorUsedError;
  DateTime? get dataHora => throw _privateConstructorUsedError;
  set dataHora(DateTime? value) => throw _privateConstructorUsedError;
  String? get lote => throw _privateConstructorUsedError;
  set lote(String? value) => throw _privateConstructorUsedError;
  double? get quantidade => throw _privateConstructorUsedError;
  set quantidade(double? value) => throw _privateConstructorUsedError;
  double? get precoCusto3Albe => throw _privateConstructorUsedError;
  set precoCusto3Albe(double? value) => throw _privateConstructorUsedError;
  String? get flagEntradaSaida => throw _privateConstructorUsedError;
  set flagEntradaSaida(String? value) => throw _privateConstructorUsedError;
  InsumoModel? get insumo => throw _privateConstructorUsedError;
  set insumo(InsumoModel? value) => throw _privateConstructorUsedError;
  EquipamentoModel? get equipamento => throw _privateConstructorUsedError;
  set equipamento(EquipamentoModel? value) =>
      throw _privateConstructorUsedError;
  DestinoResiduoModel? get destinoResiduo => throw _privateConstructorUsedError;
  set destinoResiduo(DestinoResiduoModel? value) =>
      throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $ConsultaMovimentacaoEstoqueModelCopyWith<ConsultaMovimentacaoEstoqueModel>
      get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $ConsultaMovimentacaoEstoqueModelCopyWith<$Res> {
  factory $ConsultaMovimentacaoEstoqueModelCopyWith(
          ConsultaMovimentacaoEstoqueModel value,
          $Res Function(ConsultaMovimentacaoEstoqueModel) then) =
      _$ConsultaMovimentacaoEstoqueModelCopyWithImpl<$Res,
          ConsultaMovimentacaoEstoqueModel>;
  @useResult
  $Res call(
      {int? cod,
      DateTime? dataHora,
      String? lote,
      double? quantidade,
      double? precoCusto3Albe,
      String? flagEntradaSaida,
      InsumoModel? insumo,
      EquipamentoModel? equipamento,
      DestinoResiduoModel? destinoResiduo});

  $InsumoModelCopyWith<$Res>? get insumo;
  $EquipamentoModelCopyWith<$Res>? get equipamento;
  $DestinoResiduoModelCopyWith<$Res>? get destinoResiduo;
}

/// @nodoc
class _$ConsultaMovimentacaoEstoqueModelCopyWithImpl<$Res,
        $Val extends ConsultaMovimentacaoEstoqueModel>
    implements $ConsultaMovimentacaoEstoqueModelCopyWith<$Res> {
  _$ConsultaMovimentacaoEstoqueModelCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? cod = freezed,
    Object? dataHora = freezed,
    Object? lote = freezed,
    Object? quantidade = freezed,
    Object? precoCusto3Albe = freezed,
    Object? flagEntradaSaida = freezed,
    Object? insumo = freezed,
    Object? equipamento = freezed,
    Object? destinoResiduo = freezed,
  }) {
    return _then(_value.copyWith(
      cod: freezed == cod
          ? _value.cod
          : cod // ignore: cast_nullable_to_non_nullable
              as int?,
      dataHora: freezed == dataHora
          ? _value.dataHora
          : dataHora // ignore: cast_nullable_to_non_nullable
              as DateTime?,
      lote: freezed == lote
          ? _value.lote
          : lote // ignore: cast_nullable_to_non_nullable
              as String?,
      quantidade: freezed == quantidade
          ? _value.quantidade
          : quantidade // ignore: cast_nullable_to_non_nullable
              as double?,
      precoCusto3Albe: freezed == precoCusto3Albe
          ? _value.precoCusto3Albe
          : precoCusto3Albe // ignore: cast_nullable_to_non_nullable
              as double?,
      flagEntradaSaida: freezed == flagEntradaSaida
          ? _value.flagEntradaSaida
          : flagEntradaSaida // ignore: cast_nullable_to_non_nullable
              as String?,
      insumo: freezed == insumo
          ? _value.insumo
          : insumo // ignore: cast_nullable_to_non_nullable
              as InsumoModel?,
      equipamento: freezed == equipamento
          ? _value.equipamento
          : equipamento // ignore: cast_nullable_to_non_nullable
              as EquipamentoModel?,
      destinoResiduo: freezed == destinoResiduo
          ? _value.destinoResiduo
          : destinoResiduo // ignore: cast_nullable_to_non_nullable
              as DestinoResiduoModel?,
    ) as $Val);
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

  @override
  @pragma('vm:prefer-inline')
  $EquipamentoModelCopyWith<$Res>? get equipamento {
    if (_value.equipamento == null) {
      return null;
    }

    return $EquipamentoModelCopyWith<$Res>(_value.equipamento!, (value) {
      return _then(_value.copyWith(equipamento: value) as $Val);
    });
  }

  @override
  @pragma('vm:prefer-inline')
  $DestinoResiduoModelCopyWith<$Res>? get destinoResiduo {
    if (_value.destinoResiduo == null) {
      return null;
    }

    return $DestinoResiduoModelCopyWith<$Res>(_value.destinoResiduo!, (value) {
      return _then(_value.copyWith(destinoResiduo: value) as $Val);
    });
  }
}

/// @nodoc
abstract class _$$ConsultaMovimentacaoEstoqueModelImplCopyWith<$Res>
    implements $ConsultaMovimentacaoEstoqueModelCopyWith<$Res> {
  factory _$$ConsultaMovimentacaoEstoqueModelImplCopyWith(
          _$ConsultaMovimentacaoEstoqueModelImpl value,
          $Res Function(_$ConsultaMovimentacaoEstoqueModelImpl) then) =
      __$$ConsultaMovimentacaoEstoqueModelImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {int? cod,
      DateTime? dataHora,
      String? lote,
      double? quantidade,
      double? precoCusto3Albe,
      String? flagEntradaSaida,
      InsumoModel? insumo,
      EquipamentoModel? equipamento,
      DestinoResiduoModel? destinoResiduo});

  @override
  $InsumoModelCopyWith<$Res>? get insumo;
  @override
  $EquipamentoModelCopyWith<$Res>? get equipamento;
  @override
  $DestinoResiduoModelCopyWith<$Res>? get destinoResiduo;
}

/// @nodoc
class __$$ConsultaMovimentacaoEstoqueModelImplCopyWithImpl<$Res>
    extends _$ConsultaMovimentacaoEstoqueModelCopyWithImpl<$Res,
        _$ConsultaMovimentacaoEstoqueModelImpl>
    implements _$$ConsultaMovimentacaoEstoqueModelImplCopyWith<$Res> {
  __$$ConsultaMovimentacaoEstoqueModelImplCopyWithImpl(
      _$ConsultaMovimentacaoEstoqueModelImpl _value,
      $Res Function(_$ConsultaMovimentacaoEstoqueModelImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? cod = freezed,
    Object? dataHora = freezed,
    Object? lote = freezed,
    Object? quantidade = freezed,
    Object? precoCusto3Albe = freezed,
    Object? flagEntradaSaida = freezed,
    Object? insumo = freezed,
    Object? equipamento = freezed,
    Object? destinoResiduo = freezed,
  }) {
    return _then(_$ConsultaMovimentacaoEstoqueModelImpl(
      cod: freezed == cod
          ? _value.cod
          : cod // ignore: cast_nullable_to_non_nullable
              as int?,
      dataHora: freezed == dataHora
          ? _value.dataHora
          : dataHora // ignore: cast_nullable_to_non_nullable
              as DateTime?,
      lote: freezed == lote
          ? _value.lote
          : lote // ignore: cast_nullable_to_non_nullable
              as String?,
      quantidade: freezed == quantidade
          ? _value.quantidade
          : quantidade // ignore: cast_nullable_to_non_nullable
              as double?,
      precoCusto3Albe: freezed == precoCusto3Albe
          ? _value.precoCusto3Albe
          : precoCusto3Albe // ignore: cast_nullable_to_non_nullable
              as double?,
      flagEntradaSaida: freezed == flagEntradaSaida
          ? _value.flagEntradaSaida
          : flagEntradaSaida // ignore: cast_nullable_to_non_nullable
              as String?,
      insumo: freezed == insumo
          ? _value.insumo
          : insumo // ignore: cast_nullable_to_non_nullable
              as InsumoModel?,
      equipamento: freezed == equipamento
          ? _value.equipamento
          : equipamento // ignore: cast_nullable_to_non_nullable
              as EquipamentoModel?,
      destinoResiduo: freezed == destinoResiduo
          ? _value.destinoResiduo
          : destinoResiduo // ignore: cast_nullable_to_non_nullable
              as DestinoResiduoModel?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$ConsultaMovimentacaoEstoqueModelImpl
    extends _ConsultaMovimentacaoEstoqueModel {
  _$ConsultaMovimentacaoEstoqueModelImpl(
      {required this.cod,
      required this.dataHora,
      required this.lote,
      required this.quantidade,
      required this.precoCusto3Albe,
      required this.flagEntradaSaida,
      required this.insumo,
      required this.equipamento,
      required this.destinoResiduo})
      : super._();

  factory _$ConsultaMovimentacaoEstoqueModelImpl.fromJson(
          Map<String, dynamic> json) =>
      _$$ConsultaMovimentacaoEstoqueModelImplFromJson(json);

  @override
  int? cod;
  @override
  DateTime? dataHora;
  @override
  String? lote;
  @override
  double? quantidade;
  @override
  double? precoCusto3Albe;
  @override
  String? flagEntradaSaida;
  @override
  InsumoModel? insumo;
  @override
  EquipamentoModel? equipamento;
  @override
  DestinoResiduoModel? destinoResiduo;

  @override
  String toString() {
    return 'ConsultaMovimentacaoEstoqueModel(cod: $cod, dataHora: $dataHora, lote: $lote, quantidade: $quantidade, precoCusto3Albe: $precoCusto3Albe, flagEntradaSaida: $flagEntradaSaida, insumo: $insumo, equipamento: $equipamento, destinoResiduo: $destinoResiduo)';
  }

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$ConsultaMovimentacaoEstoqueModelImplCopyWith<
          _$ConsultaMovimentacaoEstoqueModelImpl>
      get copyWith => __$$ConsultaMovimentacaoEstoqueModelImplCopyWithImpl<
          _$ConsultaMovimentacaoEstoqueModelImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$ConsultaMovimentacaoEstoqueModelImplToJson(
      this,
    );
  }
}

abstract class _ConsultaMovimentacaoEstoqueModel
    extends ConsultaMovimentacaoEstoqueModel {
  factory _ConsultaMovimentacaoEstoqueModel(
          {required int? cod,
          required DateTime? dataHora,
          required String? lote,
          required double? quantidade,
          required double? precoCusto3Albe,
          required String? flagEntradaSaida,
          required InsumoModel? insumo,
          required EquipamentoModel? equipamento,
          required DestinoResiduoModel? destinoResiduo}) =
      _$ConsultaMovimentacaoEstoqueModelImpl;
  _ConsultaMovimentacaoEstoqueModel._() : super._();

  factory _ConsultaMovimentacaoEstoqueModel.fromJson(
          Map<String, dynamic> json) =
      _$ConsultaMovimentacaoEstoqueModelImpl.fromJson;

  @override
  int? get cod;
  set cod(int? value);
  @override
  DateTime? get dataHora;
  set dataHora(DateTime? value);
  @override
  String? get lote;
  set lote(String? value);
  @override
  double? get quantidade;
  set quantidade(double? value);
  @override
  double? get precoCusto3Albe;
  set precoCusto3Albe(double? value);
  @override
  String? get flagEntradaSaida;
  set flagEntradaSaida(String? value);
  @override
  InsumoModel? get insumo;
  set insumo(InsumoModel? value);
  @override
  EquipamentoModel? get equipamento;
  set equipamento(EquipamentoModel? value);
  @override
  DestinoResiduoModel? get destinoResiduo;
  set destinoResiduo(DestinoResiduoModel? value);
  @override
  @JsonKey(ignore: true)
  _$$ConsultaMovimentacaoEstoqueModelImplCopyWith<
          _$ConsultaMovimentacaoEstoqueModelImpl>
      get copyWith => throw _privateConstructorUsedError;
}
