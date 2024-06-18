// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'entrada_automatica_model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

EntradaAutomaticaModel _$EntradaAutomaticaModelFromJson(
    Map<String, dynamic> json) {
  return _EntradaAutomaticaModel.fromJson(json);
}

/// @nodoc
mixin _$EntradaAutomaticaModel {
  int? get cod => throw _privateConstructorUsedError;
  set cod(int? value) => throw _privateConstructorUsedError;
  int? get codRegistroProcesso => throw _privateConstructorUsedError;
  set codRegistroProcesso(int? value) => throw _privateConstructorUsedError;
  int? get codUsuario => throw _privateConstructorUsedError;
  set codUsuario(int? value) => throw _privateConstructorUsedError;
  int? get situacao => throw _privateConstructorUsedError;
  set situacao(int? value) => throw _privateConstructorUsedError;
  String? get observacao => throw _privateConstructorUsedError;
  set observacao(String? value) => throw _privateConstructorUsedError;
  int? get codInstituicao => throw _privateConstructorUsedError;
  set codInstituicao(int? value) => throw _privateConstructorUsedError;
  DateTime? get ultimaAlteracao => throw _privateConstructorUsedError;
  set ultimaAlteracao(DateTime? value) => throw _privateConstructorUsedError;
  DateTime? get DataHora => throw _privateConstructorUsedError;
  set DataHora(DateTime? value) => throw _privateConstructorUsedError;
  int? get codEtapa => throw _privateConstructorUsedError;
  set codEtapa(int? value) => throw _privateConstructorUsedError;
  int? get codProcessoLeitura => throw _privateConstructorUsedError;
  set codProcessoLeitura(int? value) => throw _privateConstructorUsedError;
  @JsonKey(name: 'tStamp')
  String? get tstamp => throw _privateConstructorUsedError;
  @JsonKey(name: 'tStamp')
  set tstamp(String? value) => throw _privateConstructorUsedError;
  ProcessoRegistroModel? get processoRegistro =>
      throw _privateConstructorUsedError;
  set processoRegistro(ProcessoRegistroModel? value) =>
      throw _privateConstructorUsedError;
  UsuarioModel? get usuario => throw _privateConstructorUsedError;
  set usuario(UsuarioModel? value) => throw _privateConstructorUsedError;
  ProcessoLeituraModel? get processoLeitura =>
      throw _privateConstructorUsedError;
  set processoLeitura(ProcessoLeituraModel? value) =>
      throw _privateConstructorUsedError;
  ProcessoEtapaModel? get processoEtapa => throw _privateConstructorUsedError;
  set processoEtapa(ProcessoEtapaModel? value) =>
      throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $EntradaAutomaticaModelCopyWith<EntradaAutomaticaModel> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $EntradaAutomaticaModelCopyWith<$Res> {
  factory $EntradaAutomaticaModelCopyWith(EntradaAutomaticaModel value,
          $Res Function(EntradaAutomaticaModel) then) =
      _$EntradaAutomaticaModelCopyWithImpl<$Res, EntradaAutomaticaModel>;
  @useResult
  $Res call(
      {int? cod,
      int? codRegistroProcesso,
      int? codUsuario,
      int? situacao,
      String? observacao,
      int? codInstituicao,
      DateTime? ultimaAlteracao,
      DateTime? DataHora,
      int? codEtapa,
      int? codProcessoLeitura,
      @JsonKey(name: 'tStamp') String? tstamp,
      ProcessoRegistroModel? processoRegistro,
      UsuarioModel? usuario,
      ProcessoLeituraModel? processoLeitura,
      ProcessoEtapaModel? processoEtapa});

  $ProcessoRegistroModelCopyWith<$Res>? get processoRegistro;
  $UsuarioModelCopyWith<$Res>? get usuario;
  $ProcessoLeituraModelCopyWith<$Res>? get processoLeitura;
  $ProcessoEtapaModelCopyWith<$Res>? get processoEtapa;
}

/// @nodoc
class _$EntradaAutomaticaModelCopyWithImpl<$Res,
        $Val extends EntradaAutomaticaModel>
    implements $EntradaAutomaticaModelCopyWith<$Res> {
  _$EntradaAutomaticaModelCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? cod = freezed,
    Object? codRegistroProcesso = freezed,
    Object? codUsuario = freezed,
    Object? situacao = freezed,
    Object? observacao = freezed,
    Object? codInstituicao = freezed,
    Object? ultimaAlteracao = freezed,
    Object? DataHora = freezed,
    Object? codEtapa = freezed,
    Object? codProcessoLeitura = freezed,
    Object? tstamp = freezed,
    Object? processoRegistro = freezed,
    Object? usuario = freezed,
    Object? processoLeitura = freezed,
    Object? processoEtapa = freezed,
  }) {
    return _then(_value.copyWith(
      cod: freezed == cod
          ? _value.cod
          : cod // ignore: cast_nullable_to_non_nullable
              as int?,
      codRegistroProcesso: freezed == codRegistroProcesso
          ? _value.codRegistroProcesso
          : codRegistroProcesso // ignore: cast_nullable_to_non_nullable
              as int?,
      codUsuario: freezed == codUsuario
          ? _value.codUsuario
          : codUsuario // ignore: cast_nullable_to_non_nullable
              as int?,
      situacao: freezed == situacao
          ? _value.situacao
          : situacao // ignore: cast_nullable_to_non_nullable
              as int?,
      observacao: freezed == observacao
          ? _value.observacao
          : observacao // ignore: cast_nullable_to_non_nullable
              as String?,
      codInstituicao: freezed == codInstituicao
          ? _value.codInstituicao
          : codInstituicao // ignore: cast_nullable_to_non_nullable
              as int?,
      ultimaAlteracao: freezed == ultimaAlteracao
          ? _value.ultimaAlteracao
          : ultimaAlteracao // ignore: cast_nullable_to_non_nullable
              as DateTime?,
      DataHora: freezed == DataHora
          ? _value.DataHora
          : DataHora // ignore: cast_nullable_to_non_nullable
              as DateTime?,
      codEtapa: freezed == codEtapa
          ? _value.codEtapa
          : codEtapa // ignore: cast_nullable_to_non_nullable
              as int?,
      codProcessoLeitura: freezed == codProcessoLeitura
          ? _value.codProcessoLeitura
          : codProcessoLeitura // ignore: cast_nullable_to_non_nullable
              as int?,
      tstamp: freezed == tstamp
          ? _value.tstamp
          : tstamp // ignore: cast_nullable_to_non_nullable
              as String?,
      processoRegistro: freezed == processoRegistro
          ? _value.processoRegistro
          : processoRegistro // ignore: cast_nullable_to_non_nullable
              as ProcessoRegistroModel?,
      usuario: freezed == usuario
          ? _value.usuario
          : usuario // ignore: cast_nullable_to_non_nullable
              as UsuarioModel?,
      processoLeitura: freezed == processoLeitura
          ? _value.processoLeitura
          : processoLeitura // ignore: cast_nullable_to_non_nullable
              as ProcessoLeituraModel?,
      processoEtapa: freezed == processoEtapa
          ? _value.processoEtapa
          : processoEtapa // ignore: cast_nullable_to_non_nullable
              as ProcessoEtapaModel?,
    ) as $Val);
  }

  @override
  @pragma('vm:prefer-inline')
  $ProcessoRegistroModelCopyWith<$Res>? get processoRegistro {
    if (_value.processoRegistro == null) {
      return null;
    }

    return $ProcessoRegistroModelCopyWith<$Res>(_value.processoRegistro!,
        (value) {
      return _then(_value.copyWith(processoRegistro: value) as $Val);
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

  @override
  @pragma('vm:prefer-inline')
  $ProcessoLeituraModelCopyWith<$Res>? get processoLeitura {
    if (_value.processoLeitura == null) {
      return null;
    }

    return $ProcessoLeituraModelCopyWith<$Res>(_value.processoLeitura!,
        (value) {
      return _then(_value.copyWith(processoLeitura: value) as $Val);
    });
  }

  @override
  @pragma('vm:prefer-inline')
  $ProcessoEtapaModelCopyWith<$Res>? get processoEtapa {
    if (_value.processoEtapa == null) {
      return null;
    }

    return $ProcessoEtapaModelCopyWith<$Res>(_value.processoEtapa!, (value) {
      return _then(_value.copyWith(processoEtapa: value) as $Val);
    });
  }
}

/// @nodoc
abstract class _$$EntradaAutomaticaModelImplCopyWith<$Res>
    implements $EntradaAutomaticaModelCopyWith<$Res> {
  factory _$$EntradaAutomaticaModelImplCopyWith(
          _$EntradaAutomaticaModelImpl value,
          $Res Function(_$EntradaAutomaticaModelImpl) then) =
      __$$EntradaAutomaticaModelImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {int? cod,
      int? codRegistroProcesso,
      int? codUsuario,
      int? situacao,
      String? observacao,
      int? codInstituicao,
      DateTime? ultimaAlteracao,
      DateTime? DataHora,
      int? codEtapa,
      int? codProcessoLeitura,
      @JsonKey(name: 'tStamp') String? tstamp,
      ProcessoRegistroModel? processoRegistro,
      UsuarioModel? usuario,
      ProcessoLeituraModel? processoLeitura,
      ProcessoEtapaModel? processoEtapa});

  @override
  $ProcessoRegistroModelCopyWith<$Res>? get processoRegistro;
  @override
  $UsuarioModelCopyWith<$Res>? get usuario;
  @override
  $ProcessoLeituraModelCopyWith<$Res>? get processoLeitura;
  @override
  $ProcessoEtapaModelCopyWith<$Res>? get processoEtapa;
}

/// @nodoc
class __$$EntradaAutomaticaModelImplCopyWithImpl<$Res>
    extends _$EntradaAutomaticaModelCopyWithImpl<$Res,
        _$EntradaAutomaticaModelImpl>
    implements _$$EntradaAutomaticaModelImplCopyWith<$Res> {
  __$$EntradaAutomaticaModelImplCopyWithImpl(
      _$EntradaAutomaticaModelImpl _value,
      $Res Function(_$EntradaAutomaticaModelImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? cod = freezed,
    Object? codRegistroProcesso = freezed,
    Object? codUsuario = freezed,
    Object? situacao = freezed,
    Object? observacao = freezed,
    Object? codInstituicao = freezed,
    Object? ultimaAlteracao = freezed,
    Object? DataHora = freezed,
    Object? codEtapa = freezed,
    Object? codProcessoLeitura = freezed,
    Object? tstamp = freezed,
    Object? processoRegistro = freezed,
    Object? usuario = freezed,
    Object? processoLeitura = freezed,
    Object? processoEtapa = freezed,
  }) {
    return _then(_$EntradaAutomaticaModelImpl(
      cod: freezed == cod
          ? _value.cod
          : cod // ignore: cast_nullable_to_non_nullable
              as int?,
      codRegistroProcesso: freezed == codRegistroProcesso
          ? _value.codRegistroProcesso
          : codRegistroProcesso // ignore: cast_nullable_to_non_nullable
              as int?,
      codUsuario: freezed == codUsuario
          ? _value.codUsuario
          : codUsuario // ignore: cast_nullable_to_non_nullable
              as int?,
      situacao: freezed == situacao
          ? _value.situacao
          : situacao // ignore: cast_nullable_to_non_nullable
              as int?,
      observacao: freezed == observacao
          ? _value.observacao
          : observacao // ignore: cast_nullable_to_non_nullable
              as String?,
      codInstituicao: freezed == codInstituicao
          ? _value.codInstituicao
          : codInstituicao // ignore: cast_nullable_to_non_nullable
              as int?,
      ultimaAlteracao: freezed == ultimaAlteracao
          ? _value.ultimaAlteracao
          : ultimaAlteracao // ignore: cast_nullable_to_non_nullable
              as DateTime?,
      DataHora: freezed == DataHora
          ? _value.DataHora
          : DataHora // ignore: cast_nullable_to_non_nullable
              as DateTime?,
      codEtapa: freezed == codEtapa
          ? _value.codEtapa
          : codEtapa // ignore: cast_nullable_to_non_nullable
              as int?,
      codProcessoLeitura: freezed == codProcessoLeitura
          ? _value.codProcessoLeitura
          : codProcessoLeitura // ignore: cast_nullable_to_non_nullable
              as int?,
      tstamp: freezed == tstamp
          ? _value.tstamp
          : tstamp // ignore: cast_nullable_to_non_nullable
              as String?,
      processoRegistro: freezed == processoRegistro
          ? _value.processoRegistro
          : processoRegistro // ignore: cast_nullable_to_non_nullable
              as ProcessoRegistroModel?,
      usuario: freezed == usuario
          ? _value.usuario
          : usuario // ignore: cast_nullable_to_non_nullable
              as UsuarioModel?,
      processoLeitura: freezed == processoLeitura
          ? _value.processoLeitura
          : processoLeitura // ignore: cast_nullable_to_non_nullable
              as ProcessoLeituraModel?,
      processoEtapa: freezed == processoEtapa
          ? _value.processoEtapa
          : processoEtapa // ignore: cast_nullable_to_non_nullable
              as ProcessoEtapaModel?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$EntradaAutomaticaModelImpl extends _EntradaAutomaticaModel {
  _$EntradaAutomaticaModelImpl(
      {required this.cod,
      required this.codRegistroProcesso,
      required this.codUsuario,
      required this.situacao,
      required this.observacao,
      required this.codInstituicao,
      required this.ultimaAlteracao,
      required this.DataHora,
      required this.codEtapa,
      required this.codProcessoLeitura,
      @JsonKey(name: 'tStamp') required this.tstamp,
      required this.processoRegistro,
      required this.usuario,
      required this.processoLeitura,
      required this.processoEtapa})
      : super._();

  factory _$EntradaAutomaticaModelImpl.fromJson(Map<String, dynamic> json) =>
      _$$EntradaAutomaticaModelImplFromJson(json);

  @override
  int? cod;
  @override
  int? codRegistroProcesso;
  @override
  int? codUsuario;
  @override
  int? situacao;
  @override
  String? observacao;
  @override
  int? codInstituicao;
  @override
  DateTime? ultimaAlteracao;
  @override
  DateTime? DataHora;
  @override
  int? codEtapa;
  @override
  int? codProcessoLeitura;
  @override
  @JsonKey(name: 'tStamp')
  String? tstamp;
  @override
  ProcessoRegistroModel? processoRegistro;
  @override
  UsuarioModel? usuario;
  @override
  ProcessoLeituraModel? processoLeitura;
  @override
  ProcessoEtapaModel? processoEtapa;

  @override
  String toString() {
    return 'EntradaAutomaticaModel(cod: $cod, codRegistroProcesso: $codRegistroProcesso, codUsuario: $codUsuario, situacao: $situacao, observacao: $observacao, codInstituicao: $codInstituicao, ultimaAlteracao: $ultimaAlteracao, DataHora: $DataHora, codEtapa: $codEtapa, codProcessoLeitura: $codProcessoLeitura, tstamp: $tstamp, processoRegistro: $processoRegistro, usuario: $usuario, processoLeitura: $processoLeitura, processoEtapa: $processoEtapa)';
  }

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$EntradaAutomaticaModelImplCopyWith<_$EntradaAutomaticaModelImpl>
      get copyWith => __$$EntradaAutomaticaModelImplCopyWithImpl<
          _$EntradaAutomaticaModelImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$EntradaAutomaticaModelImplToJson(
      this,
    );
  }
}

abstract class _EntradaAutomaticaModel extends EntradaAutomaticaModel {
  factory _EntradaAutomaticaModel(
          {required int? cod,
          required int? codRegistroProcesso,
          required int? codUsuario,
          required int? situacao,
          required String? observacao,
          required int? codInstituicao,
          required DateTime? ultimaAlteracao,
          required DateTime? DataHora,
          required int? codEtapa,
          required int? codProcessoLeitura,
          @JsonKey(name: 'tStamp') required String? tstamp,
          required ProcessoRegistroModel? processoRegistro,
          required UsuarioModel? usuario,
          required ProcessoLeituraModel? processoLeitura,
          required ProcessoEtapaModel? processoEtapa}) =
      _$EntradaAutomaticaModelImpl;
  _EntradaAutomaticaModel._() : super._();

  factory _EntradaAutomaticaModel.fromJson(Map<String, dynamic> json) =
      _$EntradaAutomaticaModelImpl.fromJson;

  @override
  int? get cod;
  set cod(int? value);
  @override
  int? get codRegistroProcesso;
  set codRegistroProcesso(int? value);
  @override
  int? get codUsuario;
  set codUsuario(int? value);
  @override
  int? get situacao;
  set situacao(int? value);
  @override
  String? get observacao;
  set observacao(String? value);
  @override
  int? get codInstituicao;
  set codInstituicao(int? value);
  @override
  DateTime? get ultimaAlteracao;
  set ultimaAlteracao(DateTime? value);
  @override
  DateTime? get DataHora;
  set DataHora(DateTime? value);
  @override
  int? get codEtapa;
  set codEtapa(int? value);
  @override
  int? get codProcessoLeitura;
  set codProcessoLeitura(int? value);
  @override
  @JsonKey(name: 'tStamp')
  String? get tstamp;
  @JsonKey(name: 'tStamp')
  set tstamp(String? value);
  @override
  ProcessoRegistroModel? get processoRegistro;
  set processoRegistro(ProcessoRegistroModel? value);
  @override
  UsuarioModel? get usuario;
  set usuario(UsuarioModel? value);
  @override
  ProcessoLeituraModel? get processoLeitura;
  set processoLeitura(ProcessoLeituraModel? value);
  @override
  ProcessoEtapaModel? get processoEtapa;
  set processoEtapa(ProcessoEtapaModel? value);
  @override
  @JsonKey(ignore: true)
  _$$EntradaAutomaticaModelImplCopyWith<_$EntradaAutomaticaModelImpl>
      get copyWith => throw _privateConstructorUsedError;
}
