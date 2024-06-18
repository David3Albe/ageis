// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'proprietario_filter.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

ProprietarioFilter _$ProprietarioFilterFromJson(Map<String, dynamic> json) {
  return _ProprietarioFilter.fromJson(json);
}

/// @nodoc
mixin _$ProprietarioFilter {
  int? get cod => throw _privateConstructorUsedError;
  set cod(int? value) => throw _privateConstructorUsedError;
  bool? get apenasAtivos => throw _privateConstructorUsedError;
  set apenasAtivos(bool? value) => throw _privateConstructorUsedError;
  bool? get ordenarPorNomeCrescente => throw _privateConstructorUsedError;
  set ordenarPorNomeCrescente(bool? value) =>
      throw _privateConstructorUsedError;
  String? get comecaCom => throw _privateConstructorUsedError;
  set comecaCom(String? value) => throw _privateConstructorUsedError;
  @JsonKey(name: 'tStamp')
  String? get tStamp => throw _privateConstructorUsedError;
  @JsonKey(name: 'tStamp')
  set tStamp(String? value) => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $ProprietarioFilterCopyWith<ProprietarioFilter> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $ProprietarioFilterCopyWith<$Res> {
  factory $ProprietarioFilterCopyWith(
          ProprietarioFilter value, $Res Function(ProprietarioFilter) then) =
      _$ProprietarioFilterCopyWithImpl<$Res, ProprietarioFilter>;
  @useResult
  $Res call(
      {int? cod,
      bool? apenasAtivos,
      bool? ordenarPorNomeCrescente,
      String? comecaCom,
      @JsonKey(name: 'tStamp') String? tStamp});
}

/// @nodoc
class _$ProprietarioFilterCopyWithImpl<$Res, $Val extends ProprietarioFilter>
    implements $ProprietarioFilterCopyWith<$Res> {
  _$ProprietarioFilterCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? cod = freezed,
    Object? apenasAtivos = freezed,
    Object? ordenarPorNomeCrescente = freezed,
    Object? comecaCom = freezed,
    Object? tStamp = freezed,
  }) {
    return _then(_value.copyWith(
      cod: freezed == cod
          ? _value.cod
          : cod // ignore: cast_nullable_to_non_nullable
              as int?,
      apenasAtivos: freezed == apenasAtivos
          ? _value.apenasAtivos
          : apenasAtivos // ignore: cast_nullable_to_non_nullable
              as bool?,
      ordenarPorNomeCrescente: freezed == ordenarPorNomeCrescente
          ? _value.ordenarPorNomeCrescente
          : ordenarPorNomeCrescente // ignore: cast_nullable_to_non_nullable
              as bool?,
      comecaCom: freezed == comecaCom
          ? _value.comecaCom
          : comecaCom // ignore: cast_nullable_to_non_nullable
              as String?,
      tStamp: freezed == tStamp
          ? _value.tStamp
          : tStamp // ignore: cast_nullable_to_non_nullable
              as String?,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$ProprietarioFilterImplCopyWith<$Res>
    implements $ProprietarioFilterCopyWith<$Res> {
  factory _$$ProprietarioFilterImplCopyWith(_$ProprietarioFilterImpl value,
          $Res Function(_$ProprietarioFilterImpl) then) =
      __$$ProprietarioFilterImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {int? cod,
      bool? apenasAtivos,
      bool? ordenarPorNomeCrescente,
      String? comecaCom,
      @JsonKey(name: 'tStamp') String? tStamp});
}

/// @nodoc
class __$$ProprietarioFilterImplCopyWithImpl<$Res>
    extends _$ProprietarioFilterCopyWithImpl<$Res, _$ProprietarioFilterImpl>
    implements _$$ProprietarioFilterImplCopyWith<$Res> {
  __$$ProprietarioFilterImplCopyWithImpl(_$ProprietarioFilterImpl _value,
      $Res Function(_$ProprietarioFilterImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? cod = freezed,
    Object? apenasAtivos = freezed,
    Object? ordenarPorNomeCrescente = freezed,
    Object? comecaCom = freezed,
    Object? tStamp = freezed,
  }) {
    return _then(_$ProprietarioFilterImpl(
      cod: freezed == cod
          ? _value.cod
          : cod // ignore: cast_nullable_to_non_nullable
              as int?,
      apenasAtivos: freezed == apenasAtivos
          ? _value.apenasAtivos
          : apenasAtivos // ignore: cast_nullable_to_non_nullable
              as bool?,
      ordenarPorNomeCrescente: freezed == ordenarPorNomeCrescente
          ? _value.ordenarPorNomeCrescente
          : ordenarPorNomeCrescente // ignore: cast_nullable_to_non_nullable
              as bool?,
      comecaCom: freezed == comecaCom
          ? _value.comecaCom
          : comecaCom // ignore: cast_nullable_to_non_nullable
              as String?,
      tStamp: freezed == tStamp
          ? _value.tStamp
          : tStamp // ignore: cast_nullable_to_non_nullable
              as String?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$ProprietarioFilterImpl implements _ProprietarioFilter {
  _$ProprietarioFilterImpl(
      {this.cod,
      this.apenasAtivos,
      this.ordenarPorNomeCrescente,
      this.comecaCom,
      @JsonKey(name: 'tStamp') this.tStamp});

  factory _$ProprietarioFilterImpl.fromJson(Map<String, dynamic> json) =>
      _$$ProprietarioFilterImplFromJson(json);

  @override
  int? cod;
  @override
  bool? apenasAtivos;
  @override
  bool? ordenarPorNomeCrescente;
  @override
  String? comecaCom;
  @override
  @JsonKey(name: 'tStamp')
  String? tStamp;

  @override
  String toString() {
    return 'ProprietarioFilter(cod: $cod, apenasAtivos: $apenasAtivos, ordenarPorNomeCrescente: $ordenarPorNomeCrescente, comecaCom: $comecaCom, tStamp: $tStamp)';
  }

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$ProprietarioFilterImplCopyWith<_$ProprietarioFilterImpl> get copyWith =>
      __$$ProprietarioFilterImplCopyWithImpl<_$ProprietarioFilterImpl>(
          this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$ProprietarioFilterImplToJson(
      this,
    );
  }
}

abstract class _ProprietarioFilter implements ProprietarioFilter {
  factory _ProprietarioFilter(
      {int? cod,
      bool? apenasAtivos,
      bool? ordenarPorNomeCrescente,
      String? comecaCom,
      @JsonKey(name: 'tStamp') String? tStamp}) = _$ProprietarioFilterImpl;

  factory _ProprietarioFilter.fromJson(Map<String, dynamic> json) =
      _$ProprietarioFilterImpl.fromJson;

  @override
  int? get cod;
  set cod(int? value);
  @override
  bool? get apenasAtivos;
  set apenasAtivos(bool? value);
  @override
  bool? get ordenarPorNomeCrescente;
  set ordenarPorNomeCrescente(bool? value);
  @override
  String? get comecaCom;
  set comecaCom(String? value);
  @override
  @JsonKey(name: 'tStamp')
  String? get tStamp;
  @JsonKey(name: 'tStamp')
  set tStamp(String? value);
  @override
  @JsonKey(ignore: true)
  _$$ProprietarioFilterImplCopyWith<_$ProprietarioFilterImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
