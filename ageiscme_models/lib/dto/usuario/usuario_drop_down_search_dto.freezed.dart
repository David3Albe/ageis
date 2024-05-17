// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'usuario_drop_down_search_dto.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

UsuarioDropDownSearchDTO _$UsuarioDropDownSearchDTOFromJson(
    Map<String, dynamic> json) {
  return _UsuarioDropDownSearchDTO.fromJson(json);
}

/// @nodoc
mixin _$UsuarioDropDownSearchDTO {
  int get numeroRegistros => throw _privateConstructorUsedError;
  set numeroRegistros(int value) => throw _privateConstructorUsedError;
  String? get search => throw _privateConstructorUsedError;
  set search(String? value) => throw _privateConstructorUsedError;
  bool? get apenasColaboradores => throw _privateConstructorUsedError;
  set apenasColaboradores(bool? value) => throw _privateConstructorUsedError;
  bool? get apenasAtivos => throw _privateConstructorUsedError;
  set apenasAtivos(bool? value) => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $UsuarioDropDownSearchDTOCopyWith<UsuarioDropDownSearchDTO> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $UsuarioDropDownSearchDTOCopyWith<$Res> {
  factory $UsuarioDropDownSearchDTOCopyWith(UsuarioDropDownSearchDTO value,
          $Res Function(UsuarioDropDownSearchDTO) then) =
      _$UsuarioDropDownSearchDTOCopyWithImpl<$Res, UsuarioDropDownSearchDTO>;
  @useResult
  $Res call(
      {int numeroRegistros,
      String? search,
      bool? apenasColaboradores,
      bool? apenasAtivos});
}

/// @nodoc
class _$UsuarioDropDownSearchDTOCopyWithImpl<$Res,
        $Val extends UsuarioDropDownSearchDTO>
    implements $UsuarioDropDownSearchDTOCopyWith<$Res> {
  _$UsuarioDropDownSearchDTOCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? numeroRegistros = null,
    Object? search = freezed,
    Object? apenasColaboradores = freezed,
    Object? apenasAtivos = freezed,
  }) {
    return _then(_value.copyWith(
      numeroRegistros: null == numeroRegistros
          ? _value.numeroRegistros
          : numeroRegistros // ignore: cast_nullable_to_non_nullable
              as int,
      search: freezed == search
          ? _value.search
          : search // ignore: cast_nullable_to_non_nullable
              as String?,
      apenasColaboradores: freezed == apenasColaboradores
          ? _value.apenasColaboradores
          : apenasColaboradores // ignore: cast_nullable_to_non_nullable
              as bool?,
      apenasAtivos: freezed == apenasAtivos
          ? _value.apenasAtivos
          : apenasAtivos // ignore: cast_nullable_to_non_nullable
              as bool?,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$UsuarioDropDownSearchDTOImplCopyWith<$Res>
    implements $UsuarioDropDownSearchDTOCopyWith<$Res> {
  factory _$$UsuarioDropDownSearchDTOImplCopyWith(
          _$UsuarioDropDownSearchDTOImpl value,
          $Res Function(_$UsuarioDropDownSearchDTOImpl) then) =
      __$$UsuarioDropDownSearchDTOImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {int numeroRegistros,
      String? search,
      bool? apenasColaboradores,
      bool? apenasAtivos});
}

/// @nodoc
class __$$UsuarioDropDownSearchDTOImplCopyWithImpl<$Res>
    extends _$UsuarioDropDownSearchDTOCopyWithImpl<$Res,
        _$UsuarioDropDownSearchDTOImpl>
    implements _$$UsuarioDropDownSearchDTOImplCopyWith<$Res> {
  __$$UsuarioDropDownSearchDTOImplCopyWithImpl(
      _$UsuarioDropDownSearchDTOImpl _value,
      $Res Function(_$UsuarioDropDownSearchDTOImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? numeroRegistros = null,
    Object? search = freezed,
    Object? apenasColaboradores = freezed,
    Object? apenasAtivos = freezed,
  }) {
    return _then(_$UsuarioDropDownSearchDTOImpl(
      numeroRegistros: null == numeroRegistros
          ? _value.numeroRegistros
          : numeroRegistros // ignore: cast_nullable_to_non_nullable
              as int,
      search: freezed == search
          ? _value.search
          : search // ignore: cast_nullable_to_non_nullable
              as String?,
      apenasColaboradores: freezed == apenasColaboradores
          ? _value.apenasColaboradores
          : apenasColaboradores // ignore: cast_nullable_to_non_nullable
              as bool?,
      apenasAtivos: freezed == apenasAtivos
          ? _value.apenasAtivos
          : apenasAtivos // ignore: cast_nullable_to_non_nullable
              as bool?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$UsuarioDropDownSearchDTOImpl implements _UsuarioDropDownSearchDTO {
  _$UsuarioDropDownSearchDTOImpl(
      {required this.numeroRegistros,
      this.search,
      this.apenasColaboradores,
      this.apenasAtivos});

  factory _$UsuarioDropDownSearchDTOImpl.fromJson(Map<String, dynamic> json) =>
      _$$UsuarioDropDownSearchDTOImplFromJson(json);

  @override
  int numeroRegistros;
  @override
  String? search;
  @override
  bool? apenasColaboradores;
  @override
  bool? apenasAtivos;

  @override
  String toString() {
    return 'UsuarioDropDownSearchDTO(numeroRegistros: $numeroRegistros, search: $search, apenasColaboradores: $apenasColaboradores, apenasAtivos: $apenasAtivos)';
  }

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$UsuarioDropDownSearchDTOImplCopyWith<_$UsuarioDropDownSearchDTOImpl>
      get copyWith => __$$UsuarioDropDownSearchDTOImplCopyWithImpl<
          _$UsuarioDropDownSearchDTOImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$UsuarioDropDownSearchDTOImplToJson(
      this,
    );
  }
}

abstract class _UsuarioDropDownSearchDTO implements UsuarioDropDownSearchDTO {
  factory _UsuarioDropDownSearchDTO(
      {required int numeroRegistros,
      String? search,
      bool? apenasColaboradores,
      bool? apenasAtivos}) = _$UsuarioDropDownSearchDTOImpl;

  factory _UsuarioDropDownSearchDTO.fromJson(Map<String, dynamic> json) =
      _$UsuarioDropDownSearchDTOImpl.fromJson;

  @override
  int get numeroRegistros;
  set numeroRegistros(int value);
  @override
  String? get search;
  set search(String? value);
  @override
  bool? get apenasColaboradores;
  set apenasColaboradores(bool? value);
  @override
  bool? get apenasAtivos;
  set apenasAtivos(bool? value);
  @override
  @JsonKey(ignore: true)
  _$$UsuarioDropDownSearchDTOImplCopyWith<_$UsuarioDropDownSearchDTOImpl>
      get copyWith => throw _privateConstructorUsedError;
}
