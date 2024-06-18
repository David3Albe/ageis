// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'treinamento_registro_model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

TreinamentoRegistroModel _$TreinamentoRegistroModelFromJson(
    Map<String, dynamic> json) {
  return _TreinamentoRegistroModel.fromJson(json);
}

/// @nodoc
mixin _$TreinamentoRegistroModel {
  int? get cod => throw _privateConstructorUsedError;
  set cod(int? value) => throw _privateConstructorUsedError;
  String? get nome => throw _privateConstructorUsedError;
  set nome(String? value) => throw _privateConstructorUsedError;
  String? get descricao => throw _privateConstructorUsedError;
  set descricao(String? value) => throw _privateConstructorUsedError;
  String? get observacao => throw _privateConstructorUsedError;
  set observacao(String? value) => throw _privateConstructorUsedError;
  DateTime? get data => throw _privateConstructorUsedError;
  set data(DateTime? value) => throw _privateConstructorUsedError;
  String? get entidade => throw _privateConstructorUsedError;
  set entidade(String? value) => throw _privateConstructorUsedError;
  double? get cargaHoraria => throw _privateConstructorUsedError;
  set cargaHoraria(double? value) => throw _privateConstructorUsedError;
  int? get codInstituicao => throw _privateConstructorUsedError;
  set codInstituicao(int? value) => throw _privateConstructorUsedError;
  String? get doc => throw _privateConstructorUsedError;
  set doc(String? value) => throw _privateConstructorUsedError;
  String? get docNome => throw _privateConstructorUsedError;
  set docNome(String? value) => throw _privateConstructorUsedError;
  DateTime? get ultimaAlteracao => throw _privateConstructorUsedError;
  set ultimaAlteracao(DateTime? value) => throw _privateConstructorUsedError;
  @JsonKey(name: 'tStamp')
  String? get tstamp => throw _privateConstructorUsedError;
  @JsonKey(name: 'tStamp')
  set tstamp(String? value) => throw _privateConstructorUsedError;
  List<TreinamentoUsuarioModel>? get usuariosTreinamentos =>
      throw _privateConstructorUsedError;
  set usuariosTreinamentos(List<TreinamentoUsuarioModel>? value) =>
      throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $TreinamentoRegistroModelCopyWith<TreinamentoRegistroModel> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $TreinamentoRegistroModelCopyWith<$Res> {
  factory $TreinamentoRegistroModelCopyWith(TreinamentoRegistroModel value,
          $Res Function(TreinamentoRegistroModel) then) =
      _$TreinamentoRegistroModelCopyWithImpl<$Res, TreinamentoRegistroModel>;
  @useResult
  $Res call(
      {int? cod,
      String? nome,
      String? descricao,
      String? observacao,
      DateTime? data,
      String? entidade,
      double? cargaHoraria,
      int? codInstituicao,
      String? doc,
      String? docNome,
      DateTime? ultimaAlteracao,
      @JsonKey(name: 'tStamp') String? tstamp,
      List<TreinamentoUsuarioModel>? usuariosTreinamentos});
}

/// @nodoc
class _$TreinamentoRegistroModelCopyWithImpl<$Res,
        $Val extends TreinamentoRegistroModel>
    implements $TreinamentoRegistroModelCopyWith<$Res> {
  _$TreinamentoRegistroModelCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? cod = freezed,
    Object? nome = freezed,
    Object? descricao = freezed,
    Object? observacao = freezed,
    Object? data = freezed,
    Object? entidade = freezed,
    Object? cargaHoraria = freezed,
    Object? codInstituicao = freezed,
    Object? doc = freezed,
    Object? docNome = freezed,
    Object? ultimaAlteracao = freezed,
    Object? tstamp = freezed,
    Object? usuariosTreinamentos = freezed,
  }) {
    return _then(_value.copyWith(
      cod: freezed == cod
          ? _value.cod
          : cod // ignore: cast_nullable_to_non_nullable
              as int?,
      nome: freezed == nome
          ? _value.nome
          : nome // ignore: cast_nullable_to_non_nullable
              as String?,
      descricao: freezed == descricao
          ? _value.descricao
          : descricao // ignore: cast_nullable_to_non_nullable
              as String?,
      observacao: freezed == observacao
          ? _value.observacao
          : observacao // ignore: cast_nullable_to_non_nullable
              as String?,
      data: freezed == data
          ? _value.data
          : data // ignore: cast_nullable_to_non_nullable
              as DateTime?,
      entidade: freezed == entidade
          ? _value.entidade
          : entidade // ignore: cast_nullable_to_non_nullable
              as String?,
      cargaHoraria: freezed == cargaHoraria
          ? _value.cargaHoraria
          : cargaHoraria // ignore: cast_nullable_to_non_nullable
              as double?,
      codInstituicao: freezed == codInstituicao
          ? _value.codInstituicao
          : codInstituicao // ignore: cast_nullable_to_non_nullable
              as int?,
      doc: freezed == doc
          ? _value.doc
          : doc // ignore: cast_nullable_to_non_nullable
              as String?,
      docNome: freezed == docNome
          ? _value.docNome
          : docNome // ignore: cast_nullable_to_non_nullable
              as String?,
      ultimaAlteracao: freezed == ultimaAlteracao
          ? _value.ultimaAlteracao
          : ultimaAlteracao // ignore: cast_nullable_to_non_nullable
              as DateTime?,
      tstamp: freezed == tstamp
          ? _value.tstamp
          : tstamp // ignore: cast_nullable_to_non_nullable
              as String?,
      usuariosTreinamentos: freezed == usuariosTreinamentos
          ? _value.usuariosTreinamentos
          : usuariosTreinamentos // ignore: cast_nullable_to_non_nullable
              as List<TreinamentoUsuarioModel>?,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$TreinamentoRegistroModelImplCopyWith<$Res>
    implements $TreinamentoRegistroModelCopyWith<$Res> {
  factory _$$TreinamentoRegistroModelImplCopyWith(
          _$TreinamentoRegistroModelImpl value,
          $Res Function(_$TreinamentoRegistroModelImpl) then) =
      __$$TreinamentoRegistroModelImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {int? cod,
      String? nome,
      String? descricao,
      String? observacao,
      DateTime? data,
      String? entidade,
      double? cargaHoraria,
      int? codInstituicao,
      String? doc,
      String? docNome,
      DateTime? ultimaAlteracao,
      @JsonKey(name: 'tStamp') String? tstamp,
      List<TreinamentoUsuarioModel>? usuariosTreinamentos});
}

/// @nodoc
class __$$TreinamentoRegistroModelImplCopyWithImpl<$Res>
    extends _$TreinamentoRegistroModelCopyWithImpl<$Res,
        _$TreinamentoRegistroModelImpl>
    implements _$$TreinamentoRegistroModelImplCopyWith<$Res> {
  __$$TreinamentoRegistroModelImplCopyWithImpl(
      _$TreinamentoRegistroModelImpl _value,
      $Res Function(_$TreinamentoRegistroModelImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? cod = freezed,
    Object? nome = freezed,
    Object? descricao = freezed,
    Object? observacao = freezed,
    Object? data = freezed,
    Object? entidade = freezed,
    Object? cargaHoraria = freezed,
    Object? codInstituicao = freezed,
    Object? doc = freezed,
    Object? docNome = freezed,
    Object? ultimaAlteracao = freezed,
    Object? tstamp = freezed,
    Object? usuariosTreinamentos = freezed,
  }) {
    return _then(_$TreinamentoRegistroModelImpl(
      cod: freezed == cod
          ? _value.cod
          : cod // ignore: cast_nullable_to_non_nullable
              as int?,
      nome: freezed == nome
          ? _value.nome
          : nome // ignore: cast_nullable_to_non_nullable
              as String?,
      descricao: freezed == descricao
          ? _value.descricao
          : descricao // ignore: cast_nullable_to_non_nullable
              as String?,
      observacao: freezed == observacao
          ? _value.observacao
          : observacao // ignore: cast_nullable_to_non_nullable
              as String?,
      data: freezed == data
          ? _value.data
          : data // ignore: cast_nullable_to_non_nullable
              as DateTime?,
      entidade: freezed == entidade
          ? _value.entidade
          : entidade // ignore: cast_nullable_to_non_nullable
              as String?,
      cargaHoraria: freezed == cargaHoraria
          ? _value.cargaHoraria
          : cargaHoraria // ignore: cast_nullable_to_non_nullable
              as double?,
      codInstituicao: freezed == codInstituicao
          ? _value.codInstituicao
          : codInstituicao // ignore: cast_nullable_to_non_nullable
              as int?,
      doc: freezed == doc
          ? _value.doc
          : doc // ignore: cast_nullable_to_non_nullable
              as String?,
      docNome: freezed == docNome
          ? _value.docNome
          : docNome // ignore: cast_nullable_to_non_nullable
              as String?,
      ultimaAlteracao: freezed == ultimaAlteracao
          ? _value.ultimaAlteracao
          : ultimaAlteracao // ignore: cast_nullable_to_non_nullable
              as DateTime?,
      tstamp: freezed == tstamp
          ? _value.tstamp
          : tstamp // ignore: cast_nullable_to_non_nullable
              as String?,
      usuariosTreinamentos: freezed == usuariosTreinamentos
          ? _value.usuariosTreinamentos
          : usuariosTreinamentos // ignore: cast_nullable_to_non_nullable
              as List<TreinamentoUsuarioModel>?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$TreinamentoRegistroModelImpl
    with DiagnosticableTreeMixin
    implements _TreinamentoRegistroModel {
  _$TreinamentoRegistroModelImpl(
      {required this.cod,
      required this.nome,
      required this.descricao,
      required this.observacao,
      required this.data,
      required this.entidade,
      required this.cargaHoraria,
      required this.codInstituicao,
      required this.doc,
      required this.docNome,
      required this.ultimaAlteracao,
      @JsonKey(name: 'tStamp') required this.tstamp,
      required this.usuariosTreinamentos});

  factory _$TreinamentoRegistroModelImpl.fromJson(Map<String, dynamic> json) =>
      _$$TreinamentoRegistroModelImplFromJson(json);

  @override
  int? cod;
  @override
  String? nome;
  @override
  String? descricao;
  @override
  String? observacao;
  @override
  DateTime? data;
  @override
  String? entidade;
  @override
  double? cargaHoraria;
  @override
  int? codInstituicao;
  @override
  String? doc;
  @override
  String? docNome;
  @override
  DateTime? ultimaAlteracao;
  @override
  @JsonKey(name: 'tStamp')
  String? tstamp;
  @override
  List<TreinamentoUsuarioModel>? usuariosTreinamentos;

  @override
  String toString({DiagnosticLevel minLevel = DiagnosticLevel.info}) {
    return 'TreinamentoRegistroModel(cod: $cod, nome: $nome, descricao: $descricao, observacao: $observacao, data: $data, entidade: $entidade, cargaHoraria: $cargaHoraria, codInstituicao: $codInstituicao, doc: $doc, docNome: $docNome, ultimaAlteracao: $ultimaAlteracao, tstamp: $tstamp, usuariosTreinamentos: $usuariosTreinamentos)';
  }

  @override
  void debugFillProperties(DiagnosticPropertiesBuilder properties) {
    super.debugFillProperties(properties);
    properties
      ..add(DiagnosticsProperty('type', 'TreinamentoRegistroModel'))
      ..add(DiagnosticsProperty('cod', cod))
      ..add(DiagnosticsProperty('nome', nome))
      ..add(DiagnosticsProperty('descricao', descricao))
      ..add(DiagnosticsProperty('observacao', observacao))
      ..add(DiagnosticsProperty('data', data))
      ..add(DiagnosticsProperty('entidade', entidade))
      ..add(DiagnosticsProperty('cargaHoraria', cargaHoraria))
      ..add(DiagnosticsProperty('codInstituicao', codInstituicao))
      ..add(DiagnosticsProperty('doc', doc))
      ..add(DiagnosticsProperty('docNome', docNome))
      ..add(DiagnosticsProperty('ultimaAlteracao', ultimaAlteracao))
      ..add(DiagnosticsProperty('tstamp', tstamp))
      ..add(DiagnosticsProperty('usuariosTreinamentos', usuariosTreinamentos));
  }

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$TreinamentoRegistroModelImplCopyWith<_$TreinamentoRegistroModelImpl>
      get copyWith => __$$TreinamentoRegistroModelImplCopyWithImpl<
          _$TreinamentoRegistroModelImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$TreinamentoRegistroModelImplToJson(
      this,
    );
  }
}

abstract class _TreinamentoRegistroModel implements TreinamentoRegistroModel {
  factory _TreinamentoRegistroModel(
          {required int? cod,
          required String? nome,
          required String? descricao,
          required String? observacao,
          required DateTime? data,
          required String? entidade,
          required double? cargaHoraria,
          required int? codInstituicao,
          required String? doc,
          required String? docNome,
          required DateTime? ultimaAlteracao,
          @JsonKey(name: 'tStamp') required String? tstamp,
          required List<TreinamentoUsuarioModel>? usuariosTreinamentos}) =
      _$TreinamentoRegistroModelImpl;

  factory _TreinamentoRegistroModel.fromJson(Map<String, dynamic> json) =
      _$TreinamentoRegistroModelImpl.fromJson;

  @override
  int? get cod;
  set cod(int? value);
  @override
  String? get nome;
  set nome(String? value);
  @override
  String? get descricao;
  set descricao(String? value);
  @override
  String? get observacao;
  set observacao(String? value);
  @override
  DateTime? get data;
  set data(DateTime? value);
  @override
  String? get entidade;
  set entidade(String? value);
  @override
  double? get cargaHoraria;
  set cargaHoraria(double? value);
  @override
  int? get codInstituicao;
  set codInstituicao(int? value);
  @override
  String? get doc;
  set doc(String? value);
  @override
  String? get docNome;
  set docNome(String? value);
  @override
  DateTime? get ultimaAlteracao;
  set ultimaAlteracao(DateTime? value);
  @override
  @JsonKey(name: 'tStamp')
  String? get tstamp;
  @JsonKey(name: 'tStamp')
  set tstamp(String? value);
  @override
  List<TreinamentoUsuarioModel>? get usuariosTreinamentos;
  set usuariosTreinamentos(List<TreinamentoUsuarioModel>? value);
  @override
  @JsonKey(ignore: true)
  _$$TreinamentoRegistroModelImplCopyWith<_$TreinamentoRegistroModelImpl>
      get copyWith => throw _privateConstructorUsedError;
}
