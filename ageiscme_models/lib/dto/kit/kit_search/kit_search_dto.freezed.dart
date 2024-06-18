// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'kit_search_dto.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

KitSearchDTO _$KitSearchDTOFromJson(Map<String, dynamic> json) {
  return _KitSearchDTO.fromJson(json);
}

/// @nodoc
mixin _$KitSearchDTO {
  int? get numeroRegistros => throw _privateConstructorUsedError;
  set numeroRegistros(int? value) => throw _privateConstructorUsedError;
  String? get codBarraContem => throw _privateConstructorUsedError;
  set codBarraContem(String? value) => throw _privateConstructorUsedError;
  String? get nomeContem => throw _privateConstructorUsedError;
  set nomeContem(String? value) => throw _privateConstructorUsedError;
  bool? get ordenarCod => throw _privateConstructorUsedError;
  set ordenarCod(bool? value) => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $KitSearchDTOCopyWith<KitSearchDTO> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $KitSearchDTOCopyWith<$Res> {
  factory $KitSearchDTOCopyWith(
          KitSearchDTO value, $Res Function(KitSearchDTO) then) =
      _$KitSearchDTOCopyWithImpl<$Res, KitSearchDTO>;
  @useResult
  $Res call(
      {int? numeroRegistros,
      String? codBarraContem,
      String? nomeContem,
      bool? ordenarCod});
}

/// @nodoc
class _$KitSearchDTOCopyWithImpl<$Res, $Val extends KitSearchDTO>
    implements $KitSearchDTOCopyWith<$Res> {
  _$KitSearchDTOCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? numeroRegistros = freezed,
    Object? codBarraContem = freezed,
    Object? nomeContem = freezed,
    Object? ordenarCod = freezed,
  }) {
    return _then(_value.copyWith(
      numeroRegistros: freezed == numeroRegistros
          ? _value.numeroRegistros
          : numeroRegistros // ignore: cast_nullable_to_non_nullable
              as int?,
      codBarraContem: freezed == codBarraContem
          ? _value.codBarraContem
          : codBarraContem // ignore: cast_nullable_to_non_nullable
              as String?,
      nomeContem: freezed == nomeContem
          ? _value.nomeContem
          : nomeContem // ignore: cast_nullable_to_non_nullable
              as String?,
      ordenarCod: freezed == ordenarCod
          ? _value.ordenarCod
          : ordenarCod // ignore: cast_nullable_to_non_nullable
              as bool?,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$KitSearchDTOImplCopyWith<$Res>
    implements $KitSearchDTOCopyWith<$Res> {
  factory _$$KitSearchDTOImplCopyWith(
          _$KitSearchDTOImpl value, $Res Function(_$KitSearchDTOImpl) then) =
      __$$KitSearchDTOImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {int? numeroRegistros,
      String? codBarraContem,
      String? nomeContem,
      bool? ordenarCod});
}

/// @nodoc
class __$$KitSearchDTOImplCopyWithImpl<$Res>
    extends _$KitSearchDTOCopyWithImpl<$Res, _$KitSearchDTOImpl>
    implements _$$KitSearchDTOImplCopyWith<$Res> {
  __$$KitSearchDTOImplCopyWithImpl(
      _$KitSearchDTOImpl _value, $Res Function(_$KitSearchDTOImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? numeroRegistros = freezed,
    Object? codBarraContem = freezed,
    Object? nomeContem = freezed,
    Object? ordenarCod = freezed,
  }) {
    return _then(_$KitSearchDTOImpl(
      numeroRegistros: freezed == numeroRegistros
          ? _value.numeroRegistros
          : numeroRegistros // ignore: cast_nullable_to_non_nullable
              as int?,
      codBarraContem: freezed == codBarraContem
          ? _value.codBarraContem
          : codBarraContem // ignore: cast_nullable_to_non_nullable
              as String?,
      nomeContem: freezed == nomeContem
          ? _value.nomeContem
          : nomeContem // ignore: cast_nullable_to_non_nullable
              as String?,
      ordenarCod: freezed == ordenarCod
          ? _value.ordenarCod
          : ordenarCod // ignore: cast_nullable_to_non_nullable
              as bool?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$KitSearchDTOImpl implements _KitSearchDTO {
  _$KitSearchDTOImpl(
      {this.numeroRegistros,
      this.codBarraContem,
      this.nomeContem,
      this.ordenarCod});

  factory _$KitSearchDTOImpl.fromJson(Map<String, dynamic> json) =>
      _$$KitSearchDTOImplFromJson(json);

  @override
  int? numeroRegistros;
  @override
  String? codBarraContem;
  @override
  String? nomeContem;
  @override
  bool? ordenarCod;

  @override
  String toString() {
    return 'KitSearchDTO(numeroRegistros: $numeroRegistros, codBarraContem: $codBarraContem, nomeContem: $nomeContem, ordenarCod: $ordenarCod)';
  }

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$KitSearchDTOImplCopyWith<_$KitSearchDTOImpl> get copyWith =>
      __$$KitSearchDTOImplCopyWithImpl<_$KitSearchDTOImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$KitSearchDTOImplToJson(
      this,
    );
  }
}

abstract class _KitSearchDTO implements KitSearchDTO {
  factory _KitSearchDTO(
      {int? numeroRegistros,
      String? codBarraContem,
      String? nomeContem,
      bool? ordenarCod}) = _$KitSearchDTOImpl;

  factory _KitSearchDTO.fromJson(Map<String, dynamic> json) =
      _$KitSearchDTOImpl.fromJson;

  @override
  int? get numeroRegistros;
  set numeroRegistros(int? value);
  @override
  String? get codBarraContem;
  set codBarraContem(String? value);
  @override
  String? get nomeContem;
  set nomeContem(String? value);
  @override
  bool? get ordenarCod;
  set ordenarCod(bool? value);
  @override
  @JsonKey(ignore: true)
  _$$KitSearchDTOImplCopyWith<_$KitSearchDTOImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
