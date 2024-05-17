// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'consulta_historico_colaborador_filter.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

ConsultaHistoricoColaboradorFilter _$ConsultaHistoricoColaboradorFilterFromJson(
    Map<String, dynamic> json) {
  return _ConsultaHistoricoColaboradorFilter.fromJson(json);
}

/// @nodoc
mixin _$ConsultaHistoricoColaboradorFilter {
  DateTime? get startDate => throw _privateConstructorUsedError;
  set startDate(DateTime? value) => throw _privateConstructorUsedError;
  DateTime? get finalDate => throw _privateConstructorUsedError;
  set finalDate(DateTime? value) => throw _privateConstructorUsedError;
  int? get codUsuario => throw _privateConstructorUsedError;
  set codUsuario(int? value) => throw _privateConstructorUsedError;
  UsuarioDropDownSearchResponseDTO? get usuario =>
      throw _privateConstructorUsedError;
  set usuario(UsuarioDropDownSearchResponseDTO? value) =>
      throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $ConsultaHistoricoColaboradorFilterCopyWith<
          ConsultaHistoricoColaboradorFilter>
      get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $ConsultaHistoricoColaboradorFilterCopyWith<$Res> {
  factory $ConsultaHistoricoColaboradorFilterCopyWith(
          ConsultaHistoricoColaboradorFilter value,
          $Res Function(ConsultaHistoricoColaboradorFilter) then) =
      _$ConsultaHistoricoColaboradorFilterCopyWithImpl<$Res,
          ConsultaHistoricoColaboradorFilter>;
  @useResult
  $Res call(
      {DateTime? startDate,
      DateTime? finalDate,
      int? codUsuario,
      UsuarioDropDownSearchResponseDTO? usuario});

  $UsuarioDropDownSearchResponseDTOCopyWith<$Res>? get usuario;
}

/// @nodoc
class _$ConsultaHistoricoColaboradorFilterCopyWithImpl<$Res,
        $Val extends ConsultaHistoricoColaboradorFilter>
    implements $ConsultaHistoricoColaboradorFilterCopyWith<$Res> {
  _$ConsultaHistoricoColaboradorFilterCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? startDate = freezed,
    Object? finalDate = freezed,
    Object? codUsuario = freezed,
    Object? usuario = freezed,
  }) {
    return _then(_value.copyWith(
      startDate: freezed == startDate
          ? _value.startDate
          : startDate // ignore: cast_nullable_to_non_nullable
              as DateTime?,
      finalDate: freezed == finalDate
          ? _value.finalDate
          : finalDate // ignore: cast_nullable_to_non_nullable
              as DateTime?,
      codUsuario: freezed == codUsuario
          ? _value.codUsuario
          : codUsuario // ignore: cast_nullable_to_non_nullable
              as int?,
      usuario: freezed == usuario
          ? _value.usuario
          : usuario // ignore: cast_nullable_to_non_nullable
              as UsuarioDropDownSearchResponseDTO?,
    ) as $Val);
  }

  @override
  @pragma('vm:prefer-inline')
  $UsuarioDropDownSearchResponseDTOCopyWith<$Res>? get usuario {
    if (_value.usuario == null) {
      return null;
    }

    return $UsuarioDropDownSearchResponseDTOCopyWith<$Res>(_value.usuario!,
        (value) {
      return _then(_value.copyWith(usuario: value) as $Val);
    });
  }
}

/// @nodoc
abstract class _$$ConsultaHistoricoColaboradorFilterImplCopyWith<$Res>
    implements $ConsultaHistoricoColaboradorFilterCopyWith<$Res> {
  factory _$$ConsultaHistoricoColaboradorFilterImplCopyWith(
          _$ConsultaHistoricoColaboradorFilterImpl value,
          $Res Function(_$ConsultaHistoricoColaboradorFilterImpl) then) =
      __$$ConsultaHistoricoColaboradorFilterImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {DateTime? startDate,
      DateTime? finalDate,
      int? codUsuario,
      UsuarioDropDownSearchResponseDTO? usuario});

  @override
  $UsuarioDropDownSearchResponseDTOCopyWith<$Res>? get usuario;
}

/// @nodoc
class __$$ConsultaHistoricoColaboradorFilterImplCopyWithImpl<$Res>
    extends _$ConsultaHistoricoColaboradorFilterCopyWithImpl<$Res,
        _$ConsultaHistoricoColaboradorFilterImpl>
    implements _$$ConsultaHistoricoColaboradorFilterImplCopyWith<$Res> {
  __$$ConsultaHistoricoColaboradorFilterImplCopyWithImpl(
      _$ConsultaHistoricoColaboradorFilterImpl _value,
      $Res Function(_$ConsultaHistoricoColaboradorFilterImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? startDate = freezed,
    Object? finalDate = freezed,
    Object? codUsuario = freezed,
    Object? usuario = freezed,
  }) {
    return _then(_$ConsultaHistoricoColaboradorFilterImpl(
      startDate: freezed == startDate
          ? _value.startDate
          : startDate // ignore: cast_nullable_to_non_nullable
              as DateTime?,
      finalDate: freezed == finalDate
          ? _value.finalDate
          : finalDate // ignore: cast_nullable_to_non_nullable
              as DateTime?,
      codUsuario: freezed == codUsuario
          ? _value.codUsuario
          : codUsuario // ignore: cast_nullable_to_non_nullable
              as int?,
      usuario: freezed == usuario
          ? _value.usuario
          : usuario // ignore: cast_nullable_to_non_nullable
              as UsuarioDropDownSearchResponseDTO?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$ConsultaHistoricoColaboradorFilterImpl
    extends _ConsultaHistoricoColaboradorFilter {
  _$ConsultaHistoricoColaboradorFilterImpl(
      {required this.startDate,
      required this.finalDate,
      required this.codUsuario,
      this.usuario})
      : super._();

  factory _$ConsultaHistoricoColaboradorFilterImpl.fromJson(
          Map<String, dynamic> json) =>
      _$$ConsultaHistoricoColaboradorFilterImplFromJson(json);

  @override
  DateTime? startDate;
  @override
  DateTime? finalDate;
  @override
  int? codUsuario;
  @override
  UsuarioDropDownSearchResponseDTO? usuario;

  @override
  String toString() {
    return 'ConsultaHistoricoColaboradorFilter(startDate: $startDate, finalDate: $finalDate, codUsuario: $codUsuario, usuario: $usuario)';
  }

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$ConsultaHistoricoColaboradorFilterImplCopyWith<
          _$ConsultaHistoricoColaboradorFilterImpl>
      get copyWith => __$$ConsultaHistoricoColaboradorFilterImplCopyWithImpl<
          _$ConsultaHistoricoColaboradorFilterImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$ConsultaHistoricoColaboradorFilterImplToJson(
      this,
    );
  }
}

abstract class _ConsultaHistoricoColaboradorFilter
    extends ConsultaHistoricoColaboradorFilter {
  factory _ConsultaHistoricoColaboradorFilter(
          {required DateTime? startDate,
          required DateTime? finalDate,
          required int? codUsuario,
          UsuarioDropDownSearchResponseDTO? usuario}) =
      _$ConsultaHistoricoColaboradorFilterImpl;
  _ConsultaHistoricoColaboradorFilter._() : super._();

  factory _ConsultaHistoricoColaboradorFilter.fromJson(
          Map<String, dynamic> json) =
      _$ConsultaHistoricoColaboradorFilterImpl.fromJson;

  @override
  DateTime? get startDate;
  set startDate(DateTime? value);
  @override
  DateTime? get finalDate;
  set finalDate(DateTime? value);
  @override
  int? get codUsuario;
  set codUsuario(int? value);
  @override
  UsuarioDropDownSearchResponseDTO? get usuario;
  set usuario(UsuarioDropDownSearchResponseDTO? value);
  @override
  @JsonKey(ignore: true)
  _$$ConsultaHistoricoColaboradorFilterImplCopyWith<
          _$ConsultaHistoricoColaboradorFilterImpl>
      get copyWith => throw _privateConstructorUsedError;
}
