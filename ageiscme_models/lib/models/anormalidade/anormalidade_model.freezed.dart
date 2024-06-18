// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'anormalidade_model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

AnormalidadeModel _$AnormalidadeModelFromJson(Map<String, dynamic> json) {
  return _AnormalidadeModel.fromJson(json);
}

/// @nodoc
mixin _$AnormalidadeModel {
  int get cod => throw _privateConstructorUsedError;
  set cod(int value) => throw _privateConstructorUsedError;
  String get descricao => throw _privateConstructorUsedError;
  set descricao(String value) => throw _privateConstructorUsedError;
  int get codUsuario => throw _privateConstructorUsedError;
  set codUsuario(int value) => throw _privateConstructorUsedError;
  int get codAnormalidadeTipo => throw _privateConstructorUsedError;
  set codAnormalidadeTipo(int value) => throw _privateConstructorUsedError;
  DateTime get dataHora => throw _privateConstructorUsedError;
  set dataHora(DateTime value) => throw _privateConstructorUsedError;
  int? get codInstituicao => throw _privateConstructorUsedError;
  set codInstituicao(int? value) => throw _privateConstructorUsedError;
  DateTime? get ultimaAlteracao => throw _privateConstructorUsedError;
  set ultimaAlteracao(DateTime? value) => throw _privateConstructorUsedError;
  String? get tstamp => throw _privateConstructorUsedError;
  set tstamp(String? value) => throw _privateConstructorUsedError;
  int? get codItem => throw _privateConstructorUsedError;
  set codItem(int? value) => throw _privateConstructorUsedError;
  int? get codRegistroProcesso => throw _privateConstructorUsedError;
  set codRegistroProcesso(int? value) => throw _privateConstructorUsedError;
  int? get codUsuarioLiberacao => throw _privateConstructorUsedError;
  set codUsuarioLiberacao(int? value) => throw _privateConstructorUsedError;
  String? get observacaoLiberacao => throw _privateConstructorUsedError;
  set observacaoLiberacao(String? value) => throw _privateConstructorUsedError;
  DateTime? get dataLiberacao => throw _privateConstructorUsedError;
  set dataLiberacao(DateTime? value) => throw _privateConstructorUsedError;
  int? get codProcessoEtapa => throw _privateConstructorUsedError;
  set codProcessoEtapa(int? value) => throw _privateConstructorUsedError;
  ProcessoRegistroModel? get processoRegistro =>
      throw _privateConstructorUsedError;
  set processoRegistro(ProcessoRegistroModel? value) =>
      throw _privateConstructorUsedError;
  ItemModel? get item => throw _privateConstructorUsedError;
  set item(ItemModel? value) => throw _privateConstructorUsedError;
  ProcessoEtapaModel? get etapa => throw _privateConstructorUsedError;
  set etapa(ProcessoEtapaModel? value) => throw _privateConstructorUsedError;
  AnormalidadeTipoModel? get anormalidadeTipo =>
      throw _privateConstructorUsedError;
  set anormalidadeTipo(AnormalidadeTipoModel? value) =>
      throw _privateConstructorUsedError;
  UsuarioModel? get usuario => throw _privateConstructorUsedError;
  set usuario(UsuarioModel? value) => throw _privateConstructorUsedError;
  UsuarioModel? get usuarioLiberacao => throw _privateConstructorUsedError;
  set usuarioLiberacao(UsuarioModel? value) =>
      throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $AnormalidadeModelCopyWith<AnormalidadeModel> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $AnormalidadeModelCopyWith<$Res> {
  factory $AnormalidadeModelCopyWith(
          AnormalidadeModel value, $Res Function(AnormalidadeModel) then) =
      _$AnormalidadeModelCopyWithImpl<$Res, AnormalidadeModel>;
  @useResult
  $Res call(
      {int cod,
      String descricao,
      int codUsuario,
      int codAnormalidadeTipo,
      DateTime dataHora,
      int? codInstituicao,
      DateTime? ultimaAlteracao,
      String? tstamp,
      int? codItem,
      int? codRegistroProcesso,
      int? codUsuarioLiberacao,
      String? observacaoLiberacao,
      DateTime? dataLiberacao,
      int? codProcessoEtapa,
      ProcessoRegistroModel? processoRegistro,
      ItemModel? item,
      ProcessoEtapaModel? etapa,
      AnormalidadeTipoModel? anormalidadeTipo,
      UsuarioModel? usuario,
      UsuarioModel? usuarioLiberacao});

  $ProcessoRegistroModelCopyWith<$Res>? get processoRegistro;
  $ItemModelCopyWith<$Res>? get item;
  $ProcessoEtapaModelCopyWith<$Res>? get etapa;
  $AnormalidadeTipoModelCopyWith<$Res>? get anormalidadeTipo;
  $UsuarioModelCopyWith<$Res>? get usuario;
  $UsuarioModelCopyWith<$Res>? get usuarioLiberacao;
}

/// @nodoc
class _$AnormalidadeModelCopyWithImpl<$Res, $Val extends AnormalidadeModel>
    implements $AnormalidadeModelCopyWith<$Res> {
  _$AnormalidadeModelCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? cod = null,
    Object? descricao = null,
    Object? codUsuario = null,
    Object? codAnormalidadeTipo = null,
    Object? dataHora = null,
    Object? codInstituicao = freezed,
    Object? ultimaAlteracao = freezed,
    Object? tstamp = freezed,
    Object? codItem = freezed,
    Object? codRegistroProcesso = freezed,
    Object? codUsuarioLiberacao = freezed,
    Object? observacaoLiberacao = freezed,
    Object? dataLiberacao = freezed,
    Object? codProcessoEtapa = freezed,
    Object? processoRegistro = freezed,
    Object? item = freezed,
    Object? etapa = freezed,
    Object? anormalidadeTipo = freezed,
    Object? usuario = freezed,
    Object? usuarioLiberacao = freezed,
  }) {
    return _then(_value.copyWith(
      cod: null == cod
          ? _value.cod
          : cod // ignore: cast_nullable_to_non_nullable
              as int,
      descricao: null == descricao
          ? _value.descricao
          : descricao // ignore: cast_nullable_to_non_nullable
              as String,
      codUsuario: null == codUsuario
          ? _value.codUsuario
          : codUsuario // ignore: cast_nullable_to_non_nullable
              as int,
      codAnormalidadeTipo: null == codAnormalidadeTipo
          ? _value.codAnormalidadeTipo
          : codAnormalidadeTipo // ignore: cast_nullable_to_non_nullable
              as int,
      dataHora: null == dataHora
          ? _value.dataHora
          : dataHora // ignore: cast_nullable_to_non_nullable
              as DateTime,
      codInstituicao: freezed == codInstituicao
          ? _value.codInstituicao
          : codInstituicao // ignore: cast_nullable_to_non_nullable
              as int?,
      ultimaAlteracao: freezed == ultimaAlteracao
          ? _value.ultimaAlteracao
          : ultimaAlteracao // ignore: cast_nullable_to_non_nullable
              as DateTime?,
      tstamp: freezed == tstamp
          ? _value.tstamp
          : tstamp // ignore: cast_nullable_to_non_nullable
              as String?,
      codItem: freezed == codItem
          ? _value.codItem
          : codItem // ignore: cast_nullable_to_non_nullable
              as int?,
      codRegistroProcesso: freezed == codRegistroProcesso
          ? _value.codRegistroProcesso
          : codRegistroProcesso // ignore: cast_nullable_to_non_nullable
              as int?,
      codUsuarioLiberacao: freezed == codUsuarioLiberacao
          ? _value.codUsuarioLiberacao
          : codUsuarioLiberacao // ignore: cast_nullable_to_non_nullable
              as int?,
      observacaoLiberacao: freezed == observacaoLiberacao
          ? _value.observacaoLiberacao
          : observacaoLiberacao // ignore: cast_nullable_to_non_nullable
              as String?,
      dataLiberacao: freezed == dataLiberacao
          ? _value.dataLiberacao
          : dataLiberacao // ignore: cast_nullable_to_non_nullable
              as DateTime?,
      codProcessoEtapa: freezed == codProcessoEtapa
          ? _value.codProcessoEtapa
          : codProcessoEtapa // ignore: cast_nullable_to_non_nullable
              as int?,
      processoRegistro: freezed == processoRegistro
          ? _value.processoRegistro
          : processoRegistro // ignore: cast_nullable_to_non_nullable
              as ProcessoRegistroModel?,
      item: freezed == item
          ? _value.item
          : item // ignore: cast_nullable_to_non_nullable
              as ItemModel?,
      etapa: freezed == etapa
          ? _value.etapa
          : etapa // ignore: cast_nullable_to_non_nullable
              as ProcessoEtapaModel?,
      anormalidadeTipo: freezed == anormalidadeTipo
          ? _value.anormalidadeTipo
          : anormalidadeTipo // ignore: cast_nullable_to_non_nullable
              as AnormalidadeTipoModel?,
      usuario: freezed == usuario
          ? _value.usuario
          : usuario // ignore: cast_nullable_to_non_nullable
              as UsuarioModel?,
      usuarioLiberacao: freezed == usuarioLiberacao
          ? _value.usuarioLiberacao
          : usuarioLiberacao // ignore: cast_nullable_to_non_nullable
              as UsuarioModel?,
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
  $ItemModelCopyWith<$Res>? get item {
    if (_value.item == null) {
      return null;
    }

    return $ItemModelCopyWith<$Res>(_value.item!, (value) {
      return _then(_value.copyWith(item: value) as $Val);
    });
  }

  @override
  @pragma('vm:prefer-inline')
  $ProcessoEtapaModelCopyWith<$Res>? get etapa {
    if (_value.etapa == null) {
      return null;
    }

    return $ProcessoEtapaModelCopyWith<$Res>(_value.etapa!, (value) {
      return _then(_value.copyWith(etapa: value) as $Val);
    });
  }

  @override
  @pragma('vm:prefer-inline')
  $AnormalidadeTipoModelCopyWith<$Res>? get anormalidadeTipo {
    if (_value.anormalidadeTipo == null) {
      return null;
    }

    return $AnormalidadeTipoModelCopyWith<$Res>(_value.anormalidadeTipo!,
        (value) {
      return _then(_value.copyWith(anormalidadeTipo: value) as $Val);
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
  $UsuarioModelCopyWith<$Res>? get usuarioLiberacao {
    if (_value.usuarioLiberacao == null) {
      return null;
    }

    return $UsuarioModelCopyWith<$Res>(_value.usuarioLiberacao!, (value) {
      return _then(_value.copyWith(usuarioLiberacao: value) as $Val);
    });
  }
}

/// @nodoc
abstract class _$$AnormalidadeModelImplCopyWith<$Res>
    implements $AnormalidadeModelCopyWith<$Res> {
  factory _$$AnormalidadeModelImplCopyWith(_$AnormalidadeModelImpl value,
          $Res Function(_$AnormalidadeModelImpl) then) =
      __$$AnormalidadeModelImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {int cod,
      String descricao,
      int codUsuario,
      int codAnormalidadeTipo,
      DateTime dataHora,
      int? codInstituicao,
      DateTime? ultimaAlteracao,
      String? tstamp,
      int? codItem,
      int? codRegistroProcesso,
      int? codUsuarioLiberacao,
      String? observacaoLiberacao,
      DateTime? dataLiberacao,
      int? codProcessoEtapa,
      ProcessoRegistroModel? processoRegistro,
      ItemModel? item,
      ProcessoEtapaModel? etapa,
      AnormalidadeTipoModel? anormalidadeTipo,
      UsuarioModel? usuario,
      UsuarioModel? usuarioLiberacao});

  @override
  $ProcessoRegistroModelCopyWith<$Res>? get processoRegistro;
  @override
  $ItemModelCopyWith<$Res>? get item;
  @override
  $ProcessoEtapaModelCopyWith<$Res>? get etapa;
  @override
  $AnormalidadeTipoModelCopyWith<$Res>? get anormalidadeTipo;
  @override
  $UsuarioModelCopyWith<$Res>? get usuario;
  @override
  $UsuarioModelCopyWith<$Res>? get usuarioLiberacao;
}

/// @nodoc
class __$$AnormalidadeModelImplCopyWithImpl<$Res>
    extends _$AnormalidadeModelCopyWithImpl<$Res, _$AnormalidadeModelImpl>
    implements _$$AnormalidadeModelImplCopyWith<$Res> {
  __$$AnormalidadeModelImplCopyWithImpl(_$AnormalidadeModelImpl _value,
      $Res Function(_$AnormalidadeModelImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? cod = null,
    Object? descricao = null,
    Object? codUsuario = null,
    Object? codAnormalidadeTipo = null,
    Object? dataHora = null,
    Object? codInstituicao = freezed,
    Object? ultimaAlteracao = freezed,
    Object? tstamp = freezed,
    Object? codItem = freezed,
    Object? codRegistroProcesso = freezed,
    Object? codUsuarioLiberacao = freezed,
    Object? observacaoLiberacao = freezed,
    Object? dataLiberacao = freezed,
    Object? codProcessoEtapa = freezed,
    Object? processoRegistro = freezed,
    Object? item = freezed,
    Object? etapa = freezed,
    Object? anormalidadeTipo = freezed,
    Object? usuario = freezed,
    Object? usuarioLiberacao = freezed,
  }) {
    return _then(_$AnormalidadeModelImpl(
      cod: null == cod
          ? _value.cod
          : cod // ignore: cast_nullable_to_non_nullable
              as int,
      descricao: null == descricao
          ? _value.descricao
          : descricao // ignore: cast_nullable_to_non_nullable
              as String,
      codUsuario: null == codUsuario
          ? _value.codUsuario
          : codUsuario // ignore: cast_nullable_to_non_nullable
              as int,
      codAnormalidadeTipo: null == codAnormalidadeTipo
          ? _value.codAnormalidadeTipo
          : codAnormalidadeTipo // ignore: cast_nullable_to_non_nullable
              as int,
      dataHora: null == dataHora
          ? _value.dataHora
          : dataHora // ignore: cast_nullable_to_non_nullable
              as DateTime,
      codInstituicao: freezed == codInstituicao
          ? _value.codInstituicao
          : codInstituicao // ignore: cast_nullable_to_non_nullable
              as int?,
      ultimaAlteracao: freezed == ultimaAlteracao
          ? _value.ultimaAlteracao
          : ultimaAlteracao // ignore: cast_nullable_to_non_nullable
              as DateTime?,
      tstamp: freezed == tstamp
          ? _value.tstamp
          : tstamp // ignore: cast_nullable_to_non_nullable
              as String?,
      codItem: freezed == codItem
          ? _value.codItem
          : codItem // ignore: cast_nullable_to_non_nullable
              as int?,
      codRegistroProcesso: freezed == codRegistroProcesso
          ? _value.codRegistroProcesso
          : codRegistroProcesso // ignore: cast_nullable_to_non_nullable
              as int?,
      codUsuarioLiberacao: freezed == codUsuarioLiberacao
          ? _value.codUsuarioLiberacao
          : codUsuarioLiberacao // ignore: cast_nullable_to_non_nullable
              as int?,
      observacaoLiberacao: freezed == observacaoLiberacao
          ? _value.observacaoLiberacao
          : observacaoLiberacao // ignore: cast_nullable_to_non_nullable
              as String?,
      dataLiberacao: freezed == dataLiberacao
          ? _value.dataLiberacao
          : dataLiberacao // ignore: cast_nullable_to_non_nullable
              as DateTime?,
      codProcessoEtapa: freezed == codProcessoEtapa
          ? _value.codProcessoEtapa
          : codProcessoEtapa // ignore: cast_nullable_to_non_nullable
              as int?,
      processoRegistro: freezed == processoRegistro
          ? _value.processoRegistro
          : processoRegistro // ignore: cast_nullable_to_non_nullable
              as ProcessoRegistroModel?,
      item: freezed == item
          ? _value.item
          : item // ignore: cast_nullable_to_non_nullable
              as ItemModel?,
      etapa: freezed == etapa
          ? _value.etapa
          : etapa // ignore: cast_nullable_to_non_nullable
              as ProcessoEtapaModel?,
      anormalidadeTipo: freezed == anormalidadeTipo
          ? _value.anormalidadeTipo
          : anormalidadeTipo // ignore: cast_nullable_to_non_nullable
              as AnormalidadeTipoModel?,
      usuario: freezed == usuario
          ? _value.usuario
          : usuario // ignore: cast_nullable_to_non_nullable
              as UsuarioModel?,
      usuarioLiberacao: freezed == usuarioLiberacao
          ? _value.usuarioLiberacao
          : usuarioLiberacao // ignore: cast_nullable_to_non_nullable
              as UsuarioModel?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$AnormalidadeModelImpl extends _AnormalidadeModel
    with DiagnosticableTreeMixin {
  _$AnormalidadeModelImpl(
      {required this.cod,
      required this.descricao,
      required this.codUsuario,
      required this.codAnormalidadeTipo,
      required this.dataHora,
      this.codInstituicao,
      this.ultimaAlteracao,
      this.tstamp,
      this.codItem,
      this.codRegistroProcesso,
      this.codUsuarioLiberacao,
      this.observacaoLiberacao,
      this.dataLiberacao,
      this.codProcessoEtapa,
      this.processoRegistro,
      this.item,
      this.etapa,
      this.anormalidadeTipo,
      this.usuario,
      this.usuarioLiberacao})
      : super._();

  factory _$AnormalidadeModelImpl.fromJson(Map<String, dynamic> json) =>
      _$$AnormalidadeModelImplFromJson(json);

  @override
  int cod;
  @override
  String descricao;
  @override
  int codUsuario;
  @override
  int codAnormalidadeTipo;
  @override
  DateTime dataHora;
  @override
  int? codInstituicao;
  @override
  DateTime? ultimaAlteracao;
  @override
  String? tstamp;
  @override
  int? codItem;
  @override
  int? codRegistroProcesso;
  @override
  int? codUsuarioLiberacao;
  @override
  String? observacaoLiberacao;
  @override
  DateTime? dataLiberacao;
  @override
  int? codProcessoEtapa;
  @override
  ProcessoRegistroModel? processoRegistro;
  @override
  ItemModel? item;
  @override
  ProcessoEtapaModel? etapa;
  @override
  AnormalidadeTipoModel? anormalidadeTipo;
  @override
  UsuarioModel? usuario;
  @override
  UsuarioModel? usuarioLiberacao;

  @override
  String toString({DiagnosticLevel minLevel = DiagnosticLevel.info}) {
    return 'AnormalidadeModel(cod: $cod, descricao: $descricao, codUsuario: $codUsuario, codAnormalidadeTipo: $codAnormalidadeTipo, dataHora: $dataHora, codInstituicao: $codInstituicao, ultimaAlteracao: $ultimaAlteracao, tstamp: $tstamp, codItem: $codItem, codRegistroProcesso: $codRegistroProcesso, codUsuarioLiberacao: $codUsuarioLiberacao, observacaoLiberacao: $observacaoLiberacao, dataLiberacao: $dataLiberacao, codProcessoEtapa: $codProcessoEtapa, processoRegistro: $processoRegistro, item: $item, etapa: $etapa, anormalidadeTipo: $anormalidadeTipo, usuario: $usuario, usuarioLiberacao: $usuarioLiberacao)';
  }

  @override
  void debugFillProperties(DiagnosticPropertiesBuilder properties) {
    super.debugFillProperties(properties);
    properties
      ..add(DiagnosticsProperty('type', 'AnormalidadeModel'))
      ..add(DiagnosticsProperty('cod', cod))
      ..add(DiagnosticsProperty('descricao', descricao))
      ..add(DiagnosticsProperty('codUsuario', codUsuario))
      ..add(DiagnosticsProperty('codAnormalidadeTipo', codAnormalidadeTipo))
      ..add(DiagnosticsProperty('dataHora', dataHora))
      ..add(DiagnosticsProperty('codInstituicao', codInstituicao))
      ..add(DiagnosticsProperty('ultimaAlteracao', ultimaAlteracao))
      ..add(DiagnosticsProperty('tstamp', tstamp))
      ..add(DiagnosticsProperty('codItem', codItem))
      ..add(DiagnosticsProperty('codRegistroProcesso', codRegistroProcesso))
      ..add(DiagnosticsProperty('codUsuarioLiberacao', codUsuarioLiberacao))
      ..add(DiagnosticsProperty('observacaoLiberacao', observacaoLiberacao))
      ..add(DiagnosticsProperty('dataLiberacao', dataLiberacao))
      ..add(DiagnosticsProperty('codProcessoEtapa', codProcessoEtapa))
      ..add(DiagnosticsProperty('processoRegistro', processoRegistro))
      ..add(DiagnosticsProperty('item', item))
      ..add(DiagnosticsProperty('etapa', etapa))
      ..add(DiagnosticsProperty('anormalidadeTipo', anormalidadeTipo))
      ..add(DiagnosticsProperty('usuario', usuario))
      ..add(DiagnosticsProperty('usuarioLiberacao', usuarioLiberacao));
  }

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$AnormalidadeModelImplCopyWith<_$AnormalidadeModelImpl> get copyWith =>
      __$$AnormalidadeModelImplCopyWithImpl<_$AnormalidadeModelImpl>(
          this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$AnormalidadeModelImplToJson(
      this,
    );
  }
}

abstract class _AnormalidadeModel extends AnormalidadeModel {
  factory _AnormalidadeModel(
      {required int cod,
      required String descricao,
      required int codUsuario,
      required int codAnormalidadeTipo,
      required DateTime dataHora,
      int? codInstituicao,
      DateTime? ultimaAlteracao,
      String? tstamp,
      int? codItem,
      int? codRegistroProcesso,
      int? codUsuarioLiberacao,
      String? observacaoLiberacao,
      DateTime? dataLiberacao,
      int? codProcessoEtapa,
      ProcessoRegistroModel? processoRegistro,
      ItemModel? item,
      ProcessoEtapaModel? etapa,
      AnormalidadeTipoModel? anormalidadeTipo,
      UsuarioModel? usuario,
      UsuarioModel? usuarioLiberacao}) = _$AnormalidadeModelImpl;
  _AnormalidadeModel._() : super._();

  factory _AnormalidadeModel.fromJson(Map<String, dynamic> json) =
      _$AnormalidadeModelImpl.fromJson;

  @override
  int get cod;
  set cod(int value);
  @override
  String get descricao;
  set descricao(String value);
  @override
  int get codUsuario;
  set codUsuario(int value);
  @override
  int get codAnormalidadeTipo;
  set codAnormalidadeTipo(int value);
  @override
  DateTime get dataHora;
  set dataHora(DateTime value);
  @override
  int? get codInstituicao;
  set codInstituicao(int? value);
  @override
  DateTime? get ultimaAlteracao;
  set ultimaAlteracao(DateTime? value);
  @override
  String? get tstamp;
  set tstamp(String? value);
  @override
  int? get codItem;
  set codItem(int? value);
  @override
  int? get codRegistroProcesso;
  set codRegistroProcesso(int? value);
  @override
  int? get codUsuarioLiberacao;
  set codUsuarioLiberacao(int? value);
  @override
  String? get observacaoLiberacao;
  set observacaoLiberacao(String? value);
  @override
  DateTime? get dataLiberacao;
  set dataLiberacao(DateTime? value);
  @override
  int? get codProcessoEtapa;
  set codProcessoEtapa(int? value);
  @override
  ProcessoRegistroModel? get processoRegistro;
  set processoRegistro(ProcessoRegistroModel? value);
  @override
  ItemModel? get item;
  set item(ItemModel? value);
  @override
  ProcessoEtapaModel? get etapa;
  set etapa(ProcessoEtapaModel? value);
  @override
  AnormalidadeTipoModel? get anormalidadeTipo;
  set anormalidadeTipo(AnormalidadeTipoModel? value);
  @override
  UsuarioModel? get usuario;
  set usuario(UsuarioModel? value);
  @override
  UsuarioModel? get usuarioLiberacao;
  set usuarioLiberacao(UsuarioModel? value);
  @override
  @JsonKey(ignore: true)
  _$$AnormalidadeModelImplCopyWith<_$AnormalidadeModelImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
