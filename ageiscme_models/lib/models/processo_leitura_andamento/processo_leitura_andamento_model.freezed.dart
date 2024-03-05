// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'processo_leitura_andamento_model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

ProcessoLeituraAndamentoModel _$ProcessoLeituraAndamentoModelFromJson(
    Map<String, dynamic> json) {
  return _ProcessoLeituraAndamentoModel.fromJson(json);
}

/// @nodoc
mixin _$ProcessoLeituraAndamentoModel {
  int? get cod => throw _privateConstructorUsedError;
  set cod(int? value) => throw _privateConstructorUsedError;
  int? get codUsuario => throw _privateConstructorUsedError;
  set codUsuario(int? value) => throw _privateConstructorUsedError;
  DateTime? get dataHora => throw _privateConstructorUsedError;
  set dataHora(DateTime? value) => throw _privateConstructorUsedError;
  String? get dados => throw _privateConstructorUsedError;
  set dados(String? value) => throw _privateConstructorUsedError;
  String? get maquina => throw _privateConstructorUsedError;
  set maquina(String? value) => throw _privateConstructorUsedError;
  UsuarioModel? get usuario => throw _privateConstructorUsedError;
  set usuario(UsuarioModel? value) => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $ProcessoLeituraAndamentoModelCopyWith<ProcessoLeituraAndamentoModel>
      get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $ProcessoLeituraAndamentoModelCopyWith<$Res> {
  factory $ProcessoLeituraAndamentoModelCopyWith(
          ProcessoLeituraAndamentoModel value,
          $Res Function(ProcessoLeituraAndamentoModel) then) =
      _$ProcessoLeituraAndamentoModelCopyWithImpl<$Res,
          ProcessoLeituraAndamentoModel>;
  @useResult
  $Res call(
      {int? cod,
      int? codUsuario,
      DateTime? dataHora,
      String? dados,
      String? maquina,
      UsuarioModel? usuario});

  $UsuarioModelCopyWith<$Res>? get usuario;
}

/// @nodoc
class _$ProcessoLeituraAndamentoModelCopyWithImpl<$Res,
        $Val extends ProcessoLeituraAndamentoModel>
    implements $ProcessoLeituraAndamentoModelCopyWith<$Res> {
  _$ProcessoLeituraAndamentoModelCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? cod = freezed,
    Object? codUsuario = freezed,
    Object? dataHora = freezed,
    Object? dados = freezed,
    Object? maquina = freezed,
    Object? usuario = freezed,
  }) {
    return _then(_value.copyWith(
      cod: freezed == cod
          ? _value.cod
          : cod // ignore: cast_nullable_to_non_nullable
              as int?,
      codUsuario: freezed == codUsuario
          ? _value.codUsuario
          : codUsuario // ignore: cast_nullable_to_non_nullable
              as int?,
      dataHora: freezed == dataHora
          ? _value.dataHora
          : dataHora // ignore: cast_nullable_to_non_nullable
              as DateTime?,
      dados: freezed == dados
          ? _value.dados
          : dados // ignore: cast_nullable_to_non_nullable
              as String?,
      maquina: freezed == maquina
          ? _value.maquina
          : maquina // ignore: cast_nullable_to_non_nullable
              as String?,
      usuario: freezed == usuario
          ? _value.usuario
          : usuario // ignore: cast_nullable_to_non_nullable
              as UsuarioModel?,
    ) as $Val);
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
abstract class _$$ProcessoLeituraAndamentoModelImplCopyWith<$Res>
    implements $ProcessoLeituraAndamentoModelCopyWith<$Res> {
  factory _$$ProcessoLeituraAndamentoModelImplCopyWith(
          _$ProcessoLeituraAndamentoModelImpl value,
          $Res Function(_$ProcessoLeituraAndamentoModelImpl) then) =
      __$$ProcessoLeituraAndamentoModelImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {int? cod,
      int? codUsuario,
      DateTime? dataHora,
      String? dados,
      String? maquina,
      UsuarioModel? usuario});

  @override
  $UsuarioModelCopyWith<$Res>? get usuario;
}

/// @nodoc
class __$$ProcessoLeituraAndamentoModelImplCopyWithImpl<$Res>
    extends _$ProcessoLeituraAndamentoModelCopyWithImpl<$Res,
        _$ProcessoLeituraAndamentoModelImpl>
    implements _$$ProcessoLeituraAndamentoModelImplCopyWith<$Res> {
  __$$ProcessoLeituraAndamentoModelImplCopyWithImpl(
      _$ProcessoLeituraAndamentoModelImpl _value,
      $Res Function(_$ProcessoLeituraAndamentoModelImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? cod = freezed,
    Object? codUsuario = freezed,
    Object? dataHora = freezed,
    Object? dados = freezed,
    Object? maquina = freezed,
    Object? usuario = freezed,
  }) {
    return _then(_$ProcessoLeituraAndamentoModelImpl(
      cod: freezed == cod
          ? _value.cod
          : cod // ignore: cast_nullable_to_non_nullable
              as int?,
      codUsuario: freezed == codUsuario
          ? _value.codUsuario
          : codUsuario // ignore: cast_nullable_to_non_nullable
              as int?,
      dataHora: freezed == dataHora
          ? _value.dataHora
          : dataHora // ignore: cast_nullable_to_non_nullable
              as DateTime?,
      dados: freezed == dados
          ? _value.dados
          : dados // ignore: cast_nullable_to_non_nullable
              as String?,
      maquina: freezed == maquina
          ? _value.maquina
          : maquina // ignore: cast_nullable_to_non_nullable
              as String?,
      usuario: freezed == usuario
          ? _value.usuario
          : usuario // ignore: cast_nullable_to_non_nullable
              as UsuarioModel?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$ProcessoLeituraAndamentoModelImpl extends _ProcessoLeituraAndamentoModel
    with DiagnosticableTreeMixin {
  _$ProcessoLeituraAndamentoModelImpl(
      {required this.cod,
      required this.codUsuario,
      required this.dataHora,
      required this.dados,
      required this.maquina,
      required this.usuario})
      : super._();

  factory _$ProcessoLeituraAndamentoModelImpl.fromJson(
          Map<String, dynamic> json) =>
      _$$ProcessoLeituraAndamentoModelImplFromJson(json);

  @override
  int? cod;
  @override
  int? codUsuario;
  @override
  DateTime? dataHora;
  @override
  String? dados;
  @override
  String? maquina;
  @override
  UsuarioModel? usuario;

  @override
  String toString({DiagnosticLevel minLevel = DiagnosticLevel.info}) {
    return 'ProcessoLeituraAndamentoModel(cod: $cod, codUsuario: $codUsuario, dataHora: $dataHora, dados: $dados, maquina: $maquina, usuario: $usuario)';
  }

  @override
  void debugFillProperties(DiagnosticPropertiesBuilder properties) {
    super.debugFillProperties(properties);
    properties
      ..add(DiagnosticsProperty('type', 'ProcessoLeituraAndamentoModel'))
      ..add(DiagnosticsProperty('cod', cod))
      ..add(DiagnosticsProperty('codUsuario', codUsuario))
      ..add(DiagnosticsProperty('dataHora', dataHora))
      ..add(DiagnosticsProperty('dados', dados))
      ..add(DiagnosticsProperty('maquina', maquina))
      ..add(DiagnosticsProperty('usuario', usuario));
  }

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$ProcessoLeituraAndamentoModelImplCopyWith<
          _$ProcessoLeituraAndamentoModelImpl>
      get copyWith => __$$ProcessoLeituraAndamentoModelImplCopyWithImpl<
          _$ProcessoLeituraAndamentoModelImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$ProcessoLeituraAndamentoModelImplToJson(
      this,
    );
  }
}

abstract class _ProcessoLeituraAndamentoModel
    extends ProcessoLeituraAndamentoModel {
  factory _ProcessoLeituraAndamentoModel(
      {required int? cod,
      required int? codUsuario,
      required DateTime? dataHora,
      required String? dados,
      required String? maquina,
      required UsuarioModel? usuario}) = _$ProcessoLeituraAndamentoModelImpl;
  _ProcessoLeituraAndamentoModel._() : super._();

  factory _ProcessoLeituraAndamentoModel.fromJson(Map<String, dynamic> json) =
      _$ProcessoLeituraAndamentoModelImpl.fromJson;

  @override
  int? get cod;
  set cod(int? value);
  @override
  int? get codUsuario;
  set codUsuario(int? value);
  @override
  DateTime? get dataHora;
  set dataHora(DateTime? value);
  @override
  String? get dados;
  set dados(String? value);
  @override
  String? get maquina;
  set maquina(String? value);
  @override
  UsuarioModel? get usuario;
  set usuario(UsuarioModel? value);
  @override
  @JsonKey(ignore: true)
  _$$ProcessoLeituraAndamentoModelImplCopyWith<
          _$ProcessoLeituraAndamentoModelImpl>
      get copyWith => throw _privateConstructorUsedError;
}
