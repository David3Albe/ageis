// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'consulta_manutencao_model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

ConsultaManutencaoModel _$ConsultaManutencaoModelFromJson(
    Map<String, dynamic> json) {
  return _ConsultaManutencaoModel.fromJson(json);
}

/// @nodoc
mixin _$ConsultaManutencaoModel {
  int? get cod => throw _privateConstructorUsedError;
  set cod(int? value) => throw _privateConstructorUsedError;
  DateTime? get dataInicio => throw _privateConstructorUsedError;
  set dataInicio(DateTime? value) => throw _privateConstructorUsedError;
  String? get descricao => throw _privateConstructorUsedError;
  set descricao(String? value) => throw _privateConstructorUsedError;
  double? get qtde => throw _privateConstructorUsedError;
  set qtde(double? value) => throw _privateConstructorUsedError;
  double? get valor => throw _privateConstructorUsedError;
  set valor(double? value) => throw _privateConstructorUsedError;
  String? get serie => throw _privateConstructorUsedError;
  set serie(String? value) => throw _privateConstructorUsedError;
  DateTime? get garantia => throw _privateConstructorUsedError;
  set garantia(DateTime? value) => throw _privateConstructorUsedError;
  DateTime? get dataTermino => throw _privateConstructorUsedError;
  set dataTermino(DateTime? value) => throw _privateConstructorUsedError;
  DateTime? get dataParada => throw _privateConstructorUsedError;
  set dataParada(DateTime? value) => throw _privateConstructorUsedError;
  DateTime? get dataRegistro => throw _privateConstructorUsedError;
  set dataRegistro(DateTime? value) => throw _privateConstructorUsedError;
  String? get numNF => throw _privateConstructorUsedError;
  set numNF(String? value) => throw _privateConstructorUsedError;
  String? get problema => throw _privateConstructorUsedError;
  set problema(String? value) => throw _privateConstructorUsedError;
  String? get resultado => throw _privateConstructorUsedError;
  set resultado(String? value) => throw _privateConstructorUsedError;
  String? get peca => throw _privateConstructorUsedError;
  set peca(String? value) => throw _privateConstructorUsedError;
  EquipamentoModel? get equipamento => throw _privateConstructorUsedError;
  set equipamento(EquipamentoModel? value) =>
      throw _privateConstructorUsedError;
  ServicoTipoModel? get servicoTipo => throw _privateConstructorUsedError;
  set servicoTipo(ServicoTipoModel? value) =>
      throw _privateConstructorUsedError;
  UsuarioModel? get usuario => throw _privateConstructorUsedError;
  set usuario(UsuarioModel? value) => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $ConsultaManutencaoModelCopyWith<ConsultaManutencaoModel> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $ConsultaManutencaoModelCopyWith<$Res> {
  factory $ConsultaManutencaoModelCopyWith(ConsultaManutencaoModel value,
          $Res Function(ConsultaManutencaoModel) then) =
      _$ConsultaManutencaoModelCopyWithImpl<$Res, ConsultaManutencaoModel>;
  @useResult
  $Res call(
      {int? cod,
      DateTime? dataInicio,
      String? descricao,
      double? qtde,
      double? valor,
      String? serie,
      DateTime? garantia,
      DateTime? dataTermino,
      DateTime? dataParada,
      DateTime? dataRegistro,
      String? numNF,
      String? problema,
      String? resultado,
      String? peca,
      EquipamentoModel? equipamento,
      ServicoTipoModel? servicoTipo,
      UsuarioModel? usuario});

  $EquipamentoModelCopyWith<$Res>? get equipamento;
  $ServicoTipoModelCopyWith<$Res>? get servicoTipo;
  $UsuarioModelCopyWith<$Res>? get usuario;
}

/// @nodoc
class _$ConsultaManutencaoModelCopyWithImpl<$Res,
        $Val extends ConsultaManutencaoModel>
    implements $ConsultaManutencaoModelCopyWith<$Res> {
  _$ConsultaManutencaoModelCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? cod = freezed,
    Object? dataInicio = freezed,
    Object? descricao = freezed,
    Object? qtde = freezed,
    Object? valor = freezed,
    Object? serie = freezed,
    Object? garantia = freezed,
    Object? dataTermino = freezed,
    Object? dataParada = freezed,
    Object? dataRegistro = freezed,
    Object? numNF = freezed,
    Object? problema = freezed,
    Object? resultado = freezed,
    Object? peca = freezed,
    Object? equipamento = freezed,
    Object? servicoTipo = freezed,
    Object? usuario = freezed,
  }) {
    return _then(_value.copyWith(
      cod: freezed == cod
          ? _value.cod
          : cod // ignore: cast_nullable_to_non_nullable
              as int?,
      dataInicio: freezed == dataInicio
          ? _value.dataInicio
          : dataInicio // ignore: cast_nullable_to_non_nullable
              as DateTime?,
      descricao: freezed == descricao
          ? _value.descricao
          : descricao // ignore: cast_nullable_to_non_nullable
              as String?,
      qtde: freezed == qtde
          ? _value.qtde
          : qtde // ignore: cast_nullable_to_non_nullable
              as double?,
      valor: freezed == valor
          ? _value.valor
          : valor // ignore: cast_nullable_to_non_nullable
              as double?,
      serie: freezed == serie
          ? _value.serie
          : serie // ignore: cast_nullable_to_non_nullable
              as String?,
      garantia: freezed == garantia
          ? _value.garantia
          : garantia // ignore: cast_nullable_to_non_nullable
              as DateTime?,
      dataTermino: freezed == dataTermino
          ? _value.dataTermino
          : dataTermino // ignore: cast_nullable_to_non_nullable
              as DateTime?,
      dataParada: freezed == dataParada
          ? _value.dataParada
          : dataParada // ignore: cast_nullable_to_non_nullable
              as DateTime?,
      dataRegistro: freezed == dataRegistro
          ? _value.dataRegistro
          : dataRegistro // ignore: cast_nullable_to_non_nullable
              as DateTime?,
      numNF: freezed == numNF
          ? _value.numNF
          : numNF // ignore: cast_nullable_to_non_nullable
              as String?,
      problema: freezed == problema
          ? _value.problema
          : problema // ignore: cast_nullable_to_non_nullable
              as String?,
      resultado: freezed == resultado
          ? _value.resultado
          : resultado // ignore: cast_nullable_to_non_nullable
              as String?,
      peca: freezed == peca
          ? _value.peca
          : peca // ignore: cast_nullable_to_non_nullable
              as String?,
      equipamento: freezed == equipamento
          ? _value.equipamento
          : equipamento // ignore: cast_nullable_to_non_nullable
              as EquipamentoModel?,
      servicoTipo: freezed == servicoTipo
          ? _value.servicoTipo
          : servicoTipo // ignore: cast_nullable_to_non_nullable
              as ServicoTipoModel?,
      usuario: freezed == usuario
          ? _value.usuario
          : usuario // ignore: cast_nullable_to_non_nullable
              as UsuarioModel?,
    ) as $Val);
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
  $ServicoTipoModelCopyWith<$Res>? get servicoTipo {
    if (_value.servicoTipo == null) {
      return null;
    }

    return $ServicoTipoModelCopyWith<$Res>(_value.servicoTipo!, (value) {
      return _then(_value.copyWith(servicoTipo: value) as $Val);
    });
  }

  @override
  @pragma('vm:prefer-inline')
  $UsuarioModelCopyWith<$Res>? get usuario {
    if (_value.usuario == null) {
      return null;
    }

    return $UsuarioModelCopyWith<$Res>(_value.usuario!, (value) {
      return _then(_value.copyWith(usuario: value) as $Val);
    });
  }
}

/// @nodoc
abstract class _$$ConsultaManutencaoModelImplCopyWith<$Res>
    implements $ConsultaManutencaoModelCopyWith<$Res> {
  factory _$$ConsultaManutencaoModelImplCopyWith(
          _$ConsultaManutencaoModelImpl value,
          $Res Function(_$ConsultaManutencaoModelImpl) then) =
      __$$ConsultaManutencaoModelImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {int? cod,
      DateTime? dataInicio,
      String? descricao,
      double? qtde,
      double? valor,
      String? serie,
      DateTime? garantia,
      DateTime? dataTermino,
      DateTime? dataParada,
      DateTime? dataRegistro,
      String? numNF,
      String? problema,
      String? resultado,
      String? peca,
      EquipamentoModel? equipamento,
      ServicoTipoModel? servicoTipo,
      UsuarioModel? usuario});

  @override
  $EquipamentoModelCopyWith<$Res>? get equipamento;
  @override
  $ServicoTipoModelCopyWith<$Res>? get servicoTipo;
  @override
  $UsuarioModelCopyWith<$Res>? get usuario;
}

/// @nodoc
class __$$ConsultaManutencaoModelImplCopyWithImpl<$Res>
    extends _$ConsultaManutencaoModelCopyWithImpl<$Res,
        _$ConsultaManutencaoModelImpl>
    implements _$$ConsultaManutencaoModelImplCopyWith<$Res> {
  __$$ConsultaManutencaoModelImplCopyWithImpl(
      _$ConsultaManutencaoModelImpl _value,
      $Res Function(_$ConsultaManutencaoModelImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? cod = freezed,
    Object? dataInicio = freezed,
    Object? descricao = freezed,
    Object? qtde = freezed,
    Object? valor = freezed,
    Object? serie = freezed,
    Object? garantia = freezed,
    Object? dataTermino = freezed,
    Object? dataParada = freezed,
    Object? dataRegistro = freezed,
    Object? numNF = freezed,
    Object? problema = freezed,
    Object? resultado = freezed,
    Object? peca = freezed,
    Object? equipamento = freezed,
    Object? servicoTipo = freezed,
    Object? usuario = freezed,
  }) {
    return _then(_$ConsultaManutencaoModelImpl(
      cod: freezed == cod
          ? _value.cod
          : cod // ignore: cast_nullable_to_non_nullable
              as int?,
      dataInicio: freezed == dataInicio
          ? _value.dataInicio
          : dataInicio // ignore: cast_nullable_to_non_nullable
              as DateTime?,
      descricao: freezed == descricao
          ? _value.descricao
          : descricao // ignore: cast_nullable_to_non_nullable
              as String?,
      qtde: freezed == qtde
          ? _value.qtde
          : qtde // ignore: cast_nullable_to_non_nullable
              as double?,
      valor: freezed == valor
          ? _value.valor
          : valor // ignore: cast_nullable_to_non_nullable
              as double?,
      serie: freezed == serie
          ? _value.serie
          : serie // ignore: cast_nullable_to_non_nullable
              as String?,
      garantia: freezed == garantia
          ? _value.garantia
          : garantia // ignore: cast_nullable_to_non_nullable
              as DateTime?,
      dataTermino: freezed == dataTermino
          ? _value.dataTermino
          : dataTermino // ignore: cast_nullable_to_non_nullable
              as DateTime?,
      dataParada: freezed == dataParada
          ? _value.dataParada
          : dataParada // ignore: cast_nullable_to_non_nullable
              as DateTime?,
      dataRegistro: freezed == dataRegistro
          ? _value.dataRegistro
          : dataRegistro // ignore: cast_nullable_to_non_nullable
              as DateTime?,
      numNF: freezed == numNF
          ? _value.numNF
          : numNF // ignore: cast_nullable_to_non_nullable
              as String?,
      problema: freezed == problema
          ? _value.problema
          : problema // ignore: cast_nullable_to_non_nullable
              as String?,
      resultado: freezed == resultado
          ? _value.resultado
          : resultado // ignore: cast_nullable_to_non_nullable
              as String?,
      peca: freezed == peca
          ? _value.peca
          : peca // ignore: cast_nullable_to_non_nullable
              as String?,
      equipamento: freezed == equipamento
          ? _value.equipamento
          : equipamento // ignore: cast_nullable_to_non_nullable
              as EquipamentoModel?,
      servicoTipo: freezed == servicoTipo
          ? _value.servicoTipo
          : servicoTipo // ignore: cast_nullable_to_non_nullable
              as ServicoTipoModel?,
      usuario: freezed == usuario
          ? _value.usuario
          : usuario // ignore: cast_nullable_to_non_nullable
              as UsuarioModel?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$ConsultaManutencaoModelImpl extends _ConsultaManutencaoModel {
  _$ConsultaManutencaoModelImpl(
      {required this.cod,
      required this.dataInicio,
      required this.descricao,
      required this.qtde,
      required this.valor,
      required this.serie,
      required this.garantia,
      required this.dataTermino,
      required this.dataParada,
      required this.dataRegistro,
      required this.numNF,
      required this.problema,
      required this.resultado,
      required this.peca,
      required this.equipamento,
      required this.servicoTipo,
      required this.usuario})
      : super._();

  factory _$ConsultaManutencaoModelImpl.fromJson(Map<String, dynamic> json) =>
      _$$ConsultaManutencaoModelImplFromJson(json);

  @override
  int? cod;
  @override
  DateTime? dataInicio;
  @override
  String? descricao;
  @override
  double? qtde;
  @override
  double? valor;
  @override
  String? serie;
  @override
  DateTime? garantia;
  @override
  DateTime? dataTermino;
  @override
  DateTime? dataParada;
  @override
  DateTime? dataRegistro;
  @override
  String? numNF;
  @override
  String? problema;
  @override
  String? resultado;
  @override
  String? peca;
  @override
  EquipamentoModel? equipamento;
  @override
  ServicoTipoModel? servicoTipo;
  @override
  UsuarioModel? usuario;

  @override
  String toString() {
    return 'ConsultaManutencaoModel(cod: $cod, dataInicio: $dataInicio, descricao: $descricao, qtde: $qtde, valor: $valor, serie: $serie, garantia: $garantia, dataTermino: $dataTermino, dataParada: $dataParada, dataRegistro: $dataRegistro, numNF: $numNF, problema: $problema, resultado: $resultado, peca: $peca, equipamento: $equipamento, servicoTipo: $servicoTipo, usuario: $usuario)';
  }

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$ConsultaManutencaoModelImplCopyWith<_$ConsultaManutencaoModelImpl>
      get copyWith => __$$ConsultaManutencaoModelImplCopyWithImpl<
          _$ConsultaManutencaoModelImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$ConsultaManutencaoModelImplToJson(
      this,
    );
  }
}

abstract class _ConsultaManutencaoModel extends ConsultaManutencaoModel {
  factory _ConsultaManutencaoModel(
      {required int? cod,
      required DateTime? dataInicio,
      required String? descricao,
      required double? qtde,
      required double? valor,
      required String? serie,
      required DateTime? garantia,
      required DateTime? dataTermino,
      required DateTime? dataParada,
      required DateTime? dataRegistro,
      required String? numNF,
      required String? problema,
      required String? resultado,
      required String? peca,
      required EquipamentoModel? equipamento,
      required ServicoTipoModel? servicoTipo,
      required UsuarioModel? usuario}) = _$ConsultaManutencaoModelImpl;
  _ConsultaManutencaoModel._() : super._();

  factory _ConsultaManutencaoModel.fromJson(Map<String, dynamic> json) =
      _$ConsultaManutencaoModelImpl.fromJson;

  @override
  int? get cod;
  set cod(int? value);
  @override
  DateTime? get dataInicio;
  set dataInicio(DateTime? value);
  @override
  String? get descricao;
  set descricao(String? value);
  @override
  double? get qtde;
  set qtde(double? value);
  @override
  double? get valor;
  set valor(double? value);
  @override
  String? get serie;
  set serie(String? value);
  @override
  DateTime? get garantia;
  set garantia(DateTime? value);
  @override
  DateTime? get dataTermino;
  set dataTermino(DateTime? value);
  @override
  DateTime? get dataParada;
  set dataParada(DateTime? value);
  @override
  DateTime? get dataRegistro;
  set dataRegistro(DateTime? value);
  @override
  String? get numNF;
  set numNF(String? value);
  @override
  String? get problema;
  set problema(String? value);
  @override
  String? get resultado;
  set resultado(String? value);
  @override
  String? get peca;
  set peca(String? value);
  @override
  EquipamentoModel? get equipamento;
  set equipamento(EquipamentoModel? value);
  @override
  ServicoTipoModel? get servicoTipo;
  set servicoTipo(ServicoTipoModel? value);
  @override
  UsuarioModel? get usuario;
  set usuario(UsuarioModel? value);
  @override
  @JsonKey(ignore: true)
  _$$ConsultaManutencaoModelImplCopyWith<_$ConsultaManutencaoModelImpl>
      get copyWith => throw _privateConstructorUsedError;
}
