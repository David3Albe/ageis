// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'historico_search_dto.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

HistoricoSearchDTO _$HistoricoSearchDTOFromJson(Map<String, dynamic> json) {
  return _HistoricoSearchDTO.fromJson(json);
}

/// @nodoc
mixin _$HistoricoSearchDTO {
  String get termo => throw _privateConstructorUsedError;
  set termo(String value) => throw _privateConstructorUsedError;
  int get numeroRegistros => throw _privateConstructorUsedError;
  set numeroRegistros(int value) => throw _privateConstructorUsedError;
  int get pk => throw _privateConstructorUsedError;
  set pk(int value) => throw _privateConstructorUsedError;
  int? get codUsuario => throw _privateConstructorUsedError;
  set codUsuario(int? value) => throw _privateConstructorUsedError;
  UsuarioModel? get usuario => throw _privateConstructorUsedError;
  set usuario(UsuarioModel? value) => throw _privateConstructorUsedError;
  DateTime? get dataInicial => throw _privateConstructorUsedError;
  set dataInicial(DateTime? value) => throw _privateConstructorUsedError;
  DateTime? get dataFinal => throw _privateConstructorUsedError;
  set dataFinal(DateTime? value) => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $HistoricoSearchDTOCopyWith<HistoricoSearchDTO> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $HistoricoSearchDTOCopyWith<$Res> {
  factory $HistoricoSearchDTOCopyWith(
          HistoricoSearchDTO value, $Res Function(HistoricoSearchDTO) then) =
      _$HistoricoSearchDTOCopyWithImpl<$Res, HistoricoSearchDTO>;
  @useResult
  $Res call(
      {String termo,
      int numeroRegistros,
      int pk,
      int? codUsuario,
      UsuarioModel? usuario,
      DateTime? dataInicial,
      DateTime? dataFinal});

  $UsuarioModelCopyWith<$Res>? get usuario;
}

/// @nodoc
class _$HistoricoSearchDTOCopyWithImpl<$Res, $Val extends HistoricoSearchDTO>
    implements $HistoricoSearchDTOCopyWith<$Res> {
  _$HistoricoSearchDTOCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? termo = null,
    Object? numeroRegistros = null,
    Object? pk = null,
    Object? codUsuario = freezed,
    Object? usuario = freezed,
    Object? dataInicial = freezed,
    Object? dataFinal = freezed,
  }) {
    return _then(_value.copyWith(
      termo: null == termo
          ? _value.termo
          : termo // ignore: cast_nullable_to_non_nullable
              as String,
      numeroRegistros: null == numeroRegistros
          ? _value.numeroRegistros
          : numeroRegistros // ignore: cast_nullable_to_non_nullable
              as int,
      pk: null == pk
          ? _value.pk
          : pk // ignore: cast_nullable_to_non_nullable
              as int,
      codUsuario: freezed == codUsuario
          ? _value.codUsuario
          : codUsuario // ignore: cast_nullable_to_non_nullable
              as int?,
      usuario: freezed == usuario
          ? _value.usuario
          : usuario // ignore: cast_nullable_to_non_nullable
              as UsuarioModel?,
      dataInicial: freezed == dataInicial
          ? _value.dataInicial
          : dataInicial // ignore: cast_nullable_to_non_nullable
              as DateTime?,
      dataFinal: freezed == dataFinal
          ? _value.dataFinal
          : dataFinal // ignore: cast_nullable_to_non_nullable
              as DateTime?,
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
abstract class _$$HistoricoSearchDTOImplCopyWith<$Res>
    implements $HistoricoSearchDTOCopyWith<$Res> {
  factory _$$HistoricoSearchDTOImplCopyWith(_$HistoricoSearchDTOImpl value,
          $Res Function(_$HistoricoSearchDTOImpl) then) =
      __$$HistoricoSearchDTOImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {String termo,
      int numeroRegistros,
      int pk,
      int? codUsuario,
      UsuarioModel? usuario,
      DateTime? dataInicial,
      DateTime? dataFinal});

  @override
  $UsuarioModelCopyWith<$Res>? get usuario;
}

/// @nodoc
class __$$HistoricoSearchDTOImplCopyWithImpl<$Res>
    extends _$HistoricoSearchDTOCopyWithImpl<$Res, _$HistoricoSearchDTOImpl>
    implements _$$HistoricoSearchDTOImplCopyWith<$Res> {
  __$$HistoricoSearchDTOImplCopyWithImpl(_$HistoricoSearchDTOImpl _value,
      $Res Function(_$HistoricoSearchDTOImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? termo = null,
    Object? numeroRegistros = null,
    Object? pk = null,
    Object? codUsuario = freezed,
    Object? usuario = freezed,
    Object? dataInicial = freezed,
    Object? dataFinal = freezed,
  }) {
    return _then(_$HistoricoSearchDTOImpl(
      termo: null == termo
          ? _value.termo
          : termo // ignore: cast_nullable_to_non_nullable
              as String,
      numeroRegistros: null == numeroRegistros
          ? _value.numeroRegistros
          : numeroRegistros // ignore: cast_nullable_to_non_nullable
              as int,
      pk: null == pk
          ? _value.pk
          : pk // ignore: cast_nullable_to_non_nullable
              as int,
      codUsuario: freezed == codUsuario
          ? _value.codUsuario
          : codUsuario // ignore: cast_nullable_to_non_nullable
              as int?,
      usuario: freezed == usuario
          ? _value.usuario
          : usuario // ignore: cast_nullable_to_non_nullable
              as UsuarioModel?,
      dataInicial: freezed == dataInicial
          ? _value.dataInicial
          : dataInicial // ignore: cast_nullable_to_non_nullable
              as DateTime?,
      dataFinal: freezed == dataFinal
          ? _value.dataFinal
          : dataFinal // ignore: cast_nullable_to_non_nullable
              as DateTime?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$HistoricoSearchDTOImpl implements _HistoricoSearchDTO {
  _$HistoricoSearchDTOImpl(
      {required this.termo,
      required this.numeroRegistros,
      required this.pk,
      this.codUsuario,
      this.usuario,
      this.dataInicial,
      this.dataFinal});

  factory _$HistoricoSearchDTOImpl.fromJson(Map<String, dynamic> json) =>
      _$$HistoricoSearchDTOImplFromJson(json);

  @override
  String termo;
  @override
  int numeroRegistros;
  @override
  int pk;
  @override
  int? codUsuario;
  @override
  UsuarioModel? usuario;
  @override
  DateTime? dataInicial;
  @override
  DateTime? dataFinal;

  @override
  String toString() {
    return 'HistoricoSearchDTO(termo: $termo, numeroRegistros: $numeroRegistros, pk: $pk, codUsuario: $codUsuario, usuario: $usuario, dataInicial: $dataInicial, dataFinal: $dataFinal)';
  }

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$HistoricoSearchDTOImplCopyWith<_$HistoricoSearchDTOImpl> get copyWith =>
      __$$HistoricoSearchDTOImplCopyWithImpl<_$HistoricoSearchDTOImpl>(
          this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$HistoricoSearchDTOImplToJson(
      this,
    );
  }
}

abstract class _HistoricoSearchDTO implements HistoricoSearchDTO {
  factory _HistoricoSearchDTO(
      {required String termo,
      required int numeroRegistros,
      required int pk,
      int? codUsuario,
      UsuarioModel? usuario,
      DateTime? dataInicial,
      DateTime? dataFinal}) = _$HistoricoSearchDTOImpl;

  factory _HistoricoSearchDTO.fromJson(Map<String, dynamic> json) =
      _$HistoricoSearchDTOImpl.fromJson;

  @override
  String get termo;
  set termo(String value);
  @override
  int get numeroRegistros;
  set numeroRegistros(int value);
  @override
  int get pk;
  set pk(int value);
  @override
  int? get codUsuario;
  set codUsuario(int? value);
  @override
  UsuarioModel? get usuario;
  set usuario(UsuarioModel? value);
  @override
  DateTime? get dataInicial;
  set dataInicial(DateTime? value);
  @override
  DateTime? get dataFinal;
  set dataFinal(DateTime? value);
  @override
  @JsonKey(ignore: true)
  _$$HistoricoSearchDTOImplCopyWith<_$HistoricoSearchDTOImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
