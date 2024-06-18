// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'registros_expirar_remover_dto.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

RegistrosExpirarRemoverDTO _$RegistrosExpirarRemoverDTOFromJson(
    Map<String, dynamic> json) {
  return _RegistrosExpirarRemoverDTO.fromJson(json);
}

/// @nodoc
mixin _$RegistrosExpirarRemoverDTO {
  int get codUsuario => throw _privateConstructorUsedError;
  set codUsuario(int value) => throw _privateConstructorUsedError;
  List<RegistrosExpirarRemoverRegistroDTO> get registros =>
      throw _privateConstructorUsedError;
  set registros(List<RegistrosExpirarRemoverRegistroDTO> value) =>
      throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $RegistrosExpirarRemoverDTOCopyWith<RegistrosExpirarRemoverDTO>
      get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $RegistrosExpirarRemoverDTOCopyWith<$Res> {
  factory $RegistrosExpirarRemoverDTOCopyWith(RegistrosExpirarRemoverDTO value,
          $Res Function(RegistrosExpirarRemoverDTO) then) =
      _$RegistrosExpirarRemoverDTOCopyWithImpl<$Res,
          RegistrosExpirarRemoverDTO>;
  @useResult
  $Res call(
      {int codUsuario, List<RegistrosExpirarRemoverRegistroDTO> registros});
}

/// @nodoc
class _$RegistrosExpirarRemoverDTOCopyWithImpl<$Res,
        $Val extends RegistrosExpirarRemoverDTO>
    implements $RegistrosExpirarRemoverDTOCopyWith<$Res> {
  _$RegistrosExpirarRemoverDTOCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? codUsuario = null,
    Object? registros = null,
  }) {
    return _then(_value.copyWith(
      codUsuario: null == codUsuario
          ? _value.codUsuario
          : codUsuario // ignore: cast_nullable_to_non_nullable
              as int,
      registros: null == registros
          ? _value.registros
          : registros // ignore: cast_nullable_to_non_nullable
              as List<RegistrosExpirarRemoverRegistroDTO>,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$RegistrosExpirarRemoverDTOImplCopyWith<$Res>
    implements $RegistrosExpirarRemoverDTOCopyWith<$Res> {
  factory _$$RegistrosExpirarRemoverDTOImplCopyWith(
          _$RegistrosExpirarRemoverDTOImpl value,
          $Res Function(_$RegistrosExpirarRemoverDTOImpl) then) =
      __$$RegistrosExpirarRemoverDTOImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {int codUsuario, List<RegistrosExpirarRemoverRegistroDTO> registros});
}

/// @nodoc
class __$$RegistrosExpirarRemoverDTOImplCopyWithImpl<$Res>
    extends _$RegistrosExpirarRemoverDTOCopyWithImpl<$Res,
        _$RegistrosExpirarRemoverDTOImpl>
    implements _$$RegistrosExpirarRemoverDTOImplCopyWith<$Res> {
  __$$RegistrosExpirarRemoverDTOImplCopyWithImpl(
      _$RegistrosExpirarRemoverDTOImpl _value,
      $Res Function(_$RegistrosExpirarRemoverDTOImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? codUsuario = null,
    Object? registros = null,
  }) {
    return _then(_$RegistrosExpirarRemoverDTOImpl(
      codUsuario: null == codUsuario
          ? _value.codUsuario
          : codUsuario // ignore: cast_nullable_to_non_nullable
              as int,
      registros: null == registros
          ? _value.registros
          : registros // ignore: cast_nullable_to_non_nullable
              as List<RegistrosExpirarRemoverRegistroDTO>,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$RegistrosExpirarRemoverDTOImpl implements _RegistrosExpirarRemoverDTO {
  _$RegistrosExpirarRemoverDTOImpl(
      {required this.codUsuario, required this.registros});

  factory _$RegistrosExpirarRemoverDTOImpl.fromJson(
          Map<String, dynamic> json) =>
      _$$RegistrosExpirarRemoverDTOImplFromJson(json);

  @override
  int codUsuario;
  @override
  List<RegistrosExpirarRemoverRegistroDTO> registros;

  @override
  String toString() {
    return 'RegistrosExpirarRemoverDTO(codUsuario: $codUsuario, registros: $registros)';
  }

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$RegistrosExpirarRemoverDTOImplCopyWith<_$RegistrosExpirarRemoverDTOImpl>
      get copyWith => __$$RegistrosExpirarRemoverDTOImplCopyWithImpl<
          _$RegistrosExpirarRemoverDTOImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$RegistrosExpirarRemoverDTOImplToJson(
      this,
    );
  }
}

abstract class _RegistrosExpirarRemoverDTO
    implements RegistrosExpirarRemoverDTO {
  factory _RegistrosExpirarRemoverDTO(
          {required int codUsuario,
          required List<RegistrosExpirarRemoverRegistroDTO> registros}) =
      _$RegistrosExpirarRemoverDTOImpl;

  factory _RegistrosExpirarRemoverDTO.fromJson(Map<String, dynamic> json) =
      _$RegistrosExpirarRemoverDTOImpl.fromJson;

  @override
  int get codUsuario;
  set codUsuario(int value);
  @override
  List<RegistrosExpirarRemoverRegistroDTO> get registros;
  set registros(List<RegistrosExpirarRemoverRegistroDTO> value);
  @override
  @JsonKey(ignore: true)
  _$$RegistrosExpirarRemoverDTOImplCopyWith<_$RegistrosExpirarRemoverDTOImpl>
      get copyWith => throw _privateConstructorUsedError;
}
