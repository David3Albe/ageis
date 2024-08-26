// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'parametro_sistema_update_indicadores_dto.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

ParametroSistemaUpdateIndicadoresDTO
    _$ParametroSistemaUpdateIndicadoresDTOFromJson(Map<String, dynamic> json) {
  return _ParametroSistemaUpdateIndicadoresDTO.fromJson(json);
}

/// @nodoc
mixin _$ParametroSistemaUpdateIndicadoresDTO {
  int get cod => throw _privateConstructorUsedError;
  set cod(int value) => throw _privateConstructorUsedError;
  int get qtdeIndicadores => throw _privateConstructorUsedError;
  set qtdeIndicadores(int value) => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $ParametroSistemaUpdateIndicadoresDTOCopyWith<
          ParametroSistemaUpdateIndicadoresDTO>
      get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $ParametroSistemaUpdateIndicadoresDTOCopyWith<$Res> {
  factory $ParametroSistemaUpdateIndicadoresDTOCopyWith(
          ParametroSistemaUpdateIndicadoresDTO value,
          $Res Function(ParametroSistemaUpdateIndicadoresDTO) then) =
      _$ParametroSistemaUpdateIndicadoresDTOCopyWithImpl<$Res,
          ParametroSistemaUpdateIndicadoresDTO>;
  @useResult
  $Res call({int cod, int qtdeIndicadores});
}

/// @nodoc
class _$ParametroSistemaUpdateIndicadoresDTOCopyWithImpl<$Res,
        $Val extends ParametroSistemaUpdateIndicadoresDTO>
    implements $ParametroSistemaUpdateIndicadoresDTOCopyWith<$Res> {
  _$ParametroSistemaUpdateIndicadoresDTOCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? cod = null,
    Object? qtdeIndicadores = null,
  }) {
    return _then(_value.copyWith(
      cod: null == cod
          ? _value.cod
          : cod // ignore: cast_nullable_to_non_nullable
              as int,
      qtdeIndicadores: null == qtdeIndicadores
          ? _value.qtdeIndicadores
          : qtdeIndicadores // ignore: cast_nullable_to_non_nullable
              as int,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$ParametroSistemaUpdateIndicadoresDTOImplCopyWith<$Res>
    implements $ParametroSistemaUpdateIndicadoresDTOCopyWith<$Res> {
  factory _$$ParametroSistemaUpdateIndicadoresDTOImplCopyWith(
          _$ParametroSistemaUpdateIndicadoresDTOImpl value,
          $Res Function(_$ParametroSistemaUpdateIndicadoresDTOImpl) then) =
      __$$ParametroSistemaUpdateIndicadoresDTOImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({int cod, int qtdeIndicadores});
}

/// @nodoc
class __$$ParametroSistemaUpdateIndicadoresDTOImplCopyWithImpl<$Res>
    extends _$ParametroSistemaUpdateIndicadoresDTOCopyWithImpl<$Res,
        _$ParametroSistemaUpdateIndicadoresDTOImpl>
    implements _$$ParametroSistemaUpdateIndicadoresDTOImplCopyWith<$Res> {
  __$$ParametroSistemaUpdateIndicadoresDTOImplCopyWithImpl(
      _$ParametroSistemaUpdateIndicadoresDTOImpl _value,
      $Res Function(_$ParametroSistemaUpdateIndicadoresDTOImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? cod = null,
    Object? qtdeIndicadores = null,
  }) {
    return _then(_$ParametroSistemaUpdateIndicadoresDTOImpl(
      cod: null == cod
          ? _value.cod
          : cod // ignore: cast_nullable_to_non_nullable
              as int,
      qtdeIndicadores: null == qtdeIndicadores
          ? _value.qtdeIndicadores
          : qtdeIndicadores // ignore: cast_nullable_to_non_nullable
              as int,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$ParametroSistemaUpdateIndicadoresDTOImpl
    implements _ParametroSistemaUpdateIndicadoresDTO {
  _$ParametroSistemaUpdateIndicadoresDTOImpl(
      {required this.cod, required this.qtdeIndicadores});

  factory _$ParametroSistemaUpdateIndicadoresDTOImpl.fromJson(
          Map<String, dynamic> json) =>
      _$$ParametroSistemaUpdateIndicadoresDTOImplFromJson(json);

  @override
  int cod;
  @override
  int qtdeIndicadores;

  @override
  String toString() {
    return 'ParametroSistemaUpdateIndicadoresDTO(cod: $cod, qtdeIndicadores: $qtdeIndicadores)';
  }

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$ParametroSistemaUpdateIndicadoresDTOImplCopyWith<
          _$ParametroSistemaUpdateIndicadoresDTOImpl>
      get copyWith => __$$ParametroSistemaUpdateIndicadoresDTOImplCopyWithImpl<
          _$ParametroSistemaUpdateIndicadoresDTOImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$ParametroSistemaUpdateIndicadoresDTOImplToJson(
      this,
    );
  }
}

abstract class _ParametroSistemaUpdateIndicadoresDTO
    implements ParametroSistemaUpdateIndicadoresDTO {
  factory _ParametroSistemaUpdateIndicadoresDTO(
          {required int cod, required int qtdeIndicadores}) =
      _$ParametroSistemaUpdateIndicadoresDTOImpl;

  factory _ParametroSistemaUpdateIndicadoresDTO.fromJson(
          Map<String, dynamic> json) =
      _$ParametroSistemaUpdateIndicadoresDTOImpl.fromJson;

  @override
  int get cod;
  set cod(int value);
  @override
  int get qtdeIndicadores;
  set qtdeIndicadores(int value);
  @override
  @JsonKey(ignore: true)
  _$$ParametroSistemaUpdateIndicadoresDTOImplCopyWith<
          _$ParametroSistemaUpdateIndicadoresDTOImpl>
      get copyWith => throw _privateConstructorUsedError;
}
