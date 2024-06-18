// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'documento_model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

DocumentoModel _$DocumentoModelFromJson(Map<String, dynamic> json) {
  return _DocumentoModel.fromJson(json);
}

/// @nodoc
mixin _$DocumentoModel {
  int? get cod => throw _privateConstructorUsedError;
  set cod(int? value) => throw _privateConstructorUsedError;
  String? get descricao => throw _privateConstructorUsedError;
  set descricao(String? value) => throw _privateConstructorUsedError;
  String? get observacao => throw _privateConstructorUsedError;
  set observacao(String? value) => throw _privateConstructorUsedError;
  String? get usuario => throw _privateConstructorUsedError;
  set usuario(String? value) => throw _privateConstructorUsedError;
  String? get documento => throw _privateConstructorUsedError;
  set documento(String? value) => throw _privateConstructorUsedError;
  String? get nomeDocumento => throw _privateConstructorUsedError;
  set nomeDocumento(String? value) => throw _privateConstructorUsedError;
  int? get codTipo => throw _privateConstructorUsedError;
  set codTipo(int? value) => throw _privateConstructorUsedError;
  DateTime? get validade => throw _privateConstructorUsedError;
  set validade(DateTime? value) => throw _privateConstructorUsedError;
  bool? get controlarValidade => throw _privateConstructorUsedError;
  set controlarValidade(bool? value) => throw _privateConstructorUsedError;
  DateTime? get ultimaAlteracao => throw _privateConstructorUsedError;
  set ultimaAlteracao(DateTime? value) => throw _privateConstructorUsedError;
  TipoDocumentoModel? get tipoDocumento => throw _privateConstructorUsedError;
  set tipoDocumento(TipoDocumentoModel? value) =>
      throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $DocumentoModelCopyWith<DocumentoModel> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $DocumentoModelCopyWith<$Res> {
  factory $DocumentoModelCopyWith(
          DocumentoModel value, $Res Function(DocumentoModel) then) =
      _$DocumentoModelCopyWithImpl<$Res, DocumentoModel>;
  @useResult
  $Res call(
      {int? cod,
      String? descricao,
      String? observacao,
      String? usuario,
      String? documento,
      String? nomeDocumento,
      int? codTipo,
      DateTime? validade,
      bool? controlarValidade,
      DateTime? ultimaAlteracao,
      TipoDocumentoModel? tipoDocumento});

  $TipoDocumentoModelCopyWith<$Res>? get tipoDocumento;
}

/// @nodoc
class _$DocumentoModelCopyWithImpl<$Res, $Val extends DocumentoModel>
    implements $DocumentoModelCopyWith<$Res> {
  _$DocumentoModelCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? cod = freezed,
    Object? descricao = freezed,
    Object? observacao = freezed,
    Object? usuario = freezed,
    Object? documento = freezed,
    Object? nomeDocumento = freezed,
    Object? codTipo = freezed,
    Object? validade = freezed,
    Object? controlarValidade = freezed,
    Object? ultimaAlteracao = freezed,
    Object? tipoDocumento = freezed,
  }) {
    return _then(_value.copyWith(
      cod: freezed == cod
          ? _value.cod
          : cod // ignore: cast_nullable_to_non_nullable
              as int?,
      descricao: freezed == descricao
          ? _value.descricao
          : descricao // ignore: cast_nullable_to_non_nullable
              as String?,
      observacao: freezed == observacao
          ? _value.observacao
          : observacao // ignore: cast_nullable_to_non_nullable
              as String?,
      usuario: freezed == usuario
          ? _value.usuario
          : usuario // ignore: cast_nullable_to_non_nullable
              as String?,
      documento: freezed == documento
          ? _value.documento
          : documento // ignore: cast_nullable_to_non_nullable
              as String?,
      nomeDocumento: freezed == nomeDocumento
          ? _value.nomeDocumento
          : nomeDocumento // ignore: cast_nullable_to_non_nullable
              as String?,
      codTipo: freezed == codTipo
          ? _value.codTipo
          : codTipo // ignore: cast_nullable_to_non_nullable
              as int?,
      validade: freezed == validade
          ? _value.validade
          : validade // ignore: cast_nullable_to_non_nullable
              as DateTime?,
      controlarValidade: freezed == controlarValidade
          ? _value.controlarValidade
          : controlarValidade // ignore: cast_nullable_to_non_nullable
              as bool?,
      ultimaAlteracao: freezed == ultimaAlteracao
          ? _value.ultimaAlteracao
          : ultimaAlteracao // ignore: cast_nullable_to_non_nullable
              as DateTime?,
      tipoDocumento: freezed == tipoDocumento
          ? _value.tipoDocumento
          : tipoDocumento // ignore: cast_nullable_to_non_nullable
              as TipoDocumentoModel?,
    ) as $Val);
  }

  @override
  @pragma('vm:prefer-inline')
  $TipoDocumentoModelCopyWith<$Res>? get tipoDocumento {
    if (_value.tipoDocumento == null) {
      return null;
    }

    return $TipoDocumentoModelCopyWith<$Res>(_value.tipoDocumento!, (value) {
      return _then(_value.copyWith(tipoDocumento: value) as $Val);
    });
  }
}

/// @nodoc
abstract class _$$DocumentoModelImplCopyWith<$Res>
    implements $DocumentoModelCopyWith<$Res> {
  factory _$$DocumentoModelImplCopyWith(_$DocumentoModelImpl value,
          $Res Function(_$DocumentoModelImpl) then) =
      __$$DocumentoModelImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {int? cod,
      String? descricao,
      String? observacao,
      String? usuario,
      String? documento,
      String? nomeDocumento,
      int? codTipo,
      DateTime? validade,
      bool? controlarValidade,
      DateTime? ultimaAlteracao,
      TipoDocumentoModel? tipoDocumento});

  @override
  $TipoDocumentoModelCopyWith<$Res>? get tipoDocumento;
}

/// @nodoc
class __$$DocumentoModelImplCopyWithImpl<$Res>
    extends _$DocumentoModelCopyWithImpl<$Res, _$DocumentoModelImpl>
    implements _$$DocumentoModelImplCopyWith<$Res> {
  __$$DocumentoModelImplCopyWithImpl(
      _$DocumentoModelImpl _value, $Res Function(_$DocumentoModelImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? cod = freezed,
    Object? descricao = freezed,
    Object? observacao = freezed,
    Object? usuario = freezed,
    Object? documento = freezed,
    Object? nomeDocumento = freezed,
    Object? codTipo = freezed,
    Object? validade = freezed,
    Object? controlarValidade = freezed,
    Object? ultimaAlteracao = freezed,
    Object? tipoDocumento = freezed,
  }) {
    return _then(_$DocumentoModelImpl(
      cod: freezed == cod
          ? _value.cod
          : cod // ignore: cast_nullable_to_non_nullable
              as int?,
      descricao: freezed == descricao
          ? _value.descricao
          : descricao // ignore: cast_nullable_to_non_nullable
              as String?,
      observacao: freezed == observacao
          ? _value.observacao
          : observacao // ignore: cast_nullable_to_non_nullable
              as String?,
      usuario: freezed == usuario
          ? _value.usuario
          : usuario // ignore: cast_nullable_to_non_nullable
              as String?,
      documento: freezed == documento
          ? _value.documento
          : documento // ignore: cast_nullable_to_non_nullable
              as String?,
      nomeDocumento: freezed == nomeDocumento
          ? _value.nomeDocumento
          : nomeDocumento // ignore: cast_nullable_to_non_nullable
              as String?,
      codTipo: freezed == codTipo
          ? _value.codTipo
          : codTipo // ignore: cast_nullable_to_non_nullable
              as int?,
      validade: freezed == validade
          ? _value.validade
          : validade // ignore: cast_nullable_to_non_nullable
              as DateTime?,
      controlarValidade: freezed == controlarValidade
          ? _value.controlarValidade
          : controlarValidade // ignore: cast_nullable_to_non_nullable
              as bool?,
      ultimaAlteracao: freezed == ultimaAlteracao
          ? _value.ultimaAlteracao
          : ultimaAlteracao // ignore: cast_nullable_to_non_nullable
              as DateTime?,
      tipoDocumento: freezed == tipoDocumento
          ? _value.tipoDocumento
          : tipoDocumento // ignore: cast_nullable_to_non_nullable
              as TipoDocumentoModel?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$DocumentoModelImpl extends _DocumentoModel
    with DiagnosticableTreeMixin {
  _$DocumentoModelImpl(
      {required this.cod,
      required this.descricao,
      required this.observacao,
      required this.usuario,
      required this.documento,
      required this.nomeDocumento,
      required this.codTipo,
      required this.validade,
      required this.controlarValidade,
      required this.ultimaAlteracao,
      required this.tipoDocumento})
      : super._();

  factory _$DocumentoModelImpl.fromJson(Map<String, dynamic> json) =>
      _$$DocumentoModelImplFromJson(json);

  @override
  int? cod;
  @override
  String? descricao;
  @override
  String? observacao;
  @override
  String? usuario;
  @override
  String? documento;
  @override
  String? nomeDocumento;
  @override
  int? codTipo;
  @override
  DateTime? validade;
  @override
  bool? controlarValidade;
  @override
  DateTime? ultimaAlteracao;
  @override
  TipoDocumentoModel? tipoDocumento;

  @override
  String toString({DiagnosticLevel minLevel = DiagnosticLevel.info}) {
    return 'DocumentoModel(cod: $cod, descricao: $descricao, observacao: $observacao, usuario: $usuario, documento: $documento, nomeDocumento: $nomeDocumento, codTipo: $codTipo, validade: $validade, controlarValidade: $controlarValidade, ultimaAlteracao: $ultimaAlteracao, tipoDocumento: $tipoDocumento)';
  }

  @override
  void debugFillProperties(DiagnosticPropertiesBuilder properties) {
    super.debugFillProperties(properties);
    properties
      ..add(DiagnosticsProperty('type', 'DocumentoModel'))
      ..add(DiagnosticsProperty('cod', cod))
      ..add(DiagnosticsProperty('descricao', descricao))
      ..add(DiagnosticsProperty('observacao', observacao))
      ..add(DiagnosticsProperty('usuario', usuario))
      ..add(DiagnosticsProperty('documento', documento))
      ..add(DiagnosticsProperty('nomeDocumento', nomeDocumento))
      ..add(DiagnosticsProperty('codTipo', codTipo))
      ..add(DiagnosticsProperty('validade', validade))
      ..add(DiagnosticsProperty('controlarValidade', controlarValidade))
      ..add(DiagnosticsProperty('ultimaAlteracao', ultimaAlteracao))
      ..add(DiagnosticsProperty('tipoDocumento', tipoDocumento));
  }

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$DocumentoModelImplCopyWith<_$DocumentoModelImpl> get copyWith =>
      __$$DocumentoModelImplCopyWithImpl<_$DocumentoModelImpl>(
          this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$DocumentoModelImplToJson(
      this,
    );
  }
}

abstract class _DocumentoModel extends DocumentoModel {
  factory _DocumentoModel(
      {required int? cod,
      required String? descricao,
      required String? observacao,
      required String? usuario,
      required String? documento,
      required String? nomeDocumento,
      required int? codTipo,
      required DateTime? validade,
      required bool? controlarValidade,
      required DateTime? ultimaAlteracao,
      required TipoDocumentoModel? tipoDocumento}) = _$DocumentoModelImpl;
  _DocumentoModel._() : super._();

  factory _DocumentoModel.fromJson(Map<String, dynamic> json) =
      _$DocumentoModelImpl.fromJson;

  @override
  int? get cod;
  set cod(int? value);
  @override
  String? get descricao;
  set descricao(String? value);
  @override
  String? get observacao;
  set observacao(String? value);
  @override
  String? get usuario;
  set usuario(String? value);
  @override
  String? get documento;
  set documento(String? value);
  @override
  String? get nomeDocumento;
  set nomeDocumento(String? value);
  @override
  int? get codTipo;
  set codTipo(int? value);
  @override
  DateTime? get validade;
  set validade(DateTime? value);
  @override
  bool? get controlarValidade;
  set controlarValidade(bool? value);
  @override
  DateTime? get ultimaAlteracao;
  set ultimaAlteracao(DateTime? value);
  @override
  TipoDocumentoModel? get tipoDocumento;
  set tipoDocumento(TipoDocumentoModel? value);
  @override
  @JsonKey(ignore: true)
  _$$DocumentoModelImplCopyWith<_$DocumentoModelImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
