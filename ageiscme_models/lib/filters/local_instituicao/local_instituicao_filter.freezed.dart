// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'local_instituicao_filter.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

LocalInstituicaoFilter _$LocalInstituicaoFilterFromJson(
    Map<String, dynamic> json) {
  return _LocalInstituicaoFilter.fromJson(json);
}

/// @nodoc
mixin _$LocalInstituicaoFilter {
  int? get cod => throw _privateConstructorUsedError;
  set cod(int? value) => throw _privateConstructorUsedError;
  int? get codInstituicao => throw _privateConstructorUsedError;
  set codInstituicao(int? value) => throw _privateConstructorUsedError;
  bool? get apenasAtivos => throw _privateConstructorUsedError;
  set apenasAtivos(bool? value) => throw _privateConstructorUsedError;
  bool? get ordenarPorNomeCrescente => throw _privateConstructorUsedError;
  set ordenarPorNomeCrescente(bool? value) =>
      throw _privateConstructorUsedError;
  @JsonKey(name: 'tStamp')
  String? get tStamp => throw _privateConstructorUsedError;
  @JsonKey(name: 'tStamp')
  set tStamp(String? value) => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $LocalInstituicaoFilterCopyWith<LocalInstituicaoFilter> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $LocalInstituicaoFilterCopyWith<$Res> {
  factory $LocalInstituicaoFilterCopyWith(LocalInstituicaoFilter value,
          $Res Function(LocalInstituicaoFilter) then) =
      _$LocalInstituicaoFilterCopyWithImpl<$Res, LocalInstituicaoFilter>;
  @useResult
  $Res call(
      {int? cod,
      int? codInstituicao,
      bool? apenasAtivos,
      bool? ordenarPorNomeCrescente,
      @JsonKey(name: 'tStamp') String? tStamp});
}

/// @nodoc
class _$LocalInstituicaoFilterCopyWithImpl<$Res,
        $Val extends LocalInstituicaoFilter>
    implements $LocalInstituicaoFilterCopyWith<$Res> {
  _$LocalInstituicaoFilterCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? cod = freezed,
    Object? codInstituicao = freezed,
    Object? apenasAtivos = freezed,
    Object? ordenarPorNomeCrescente = freezed,
    Object? tStamp = freezed,
  }) {
    return _then(_value.copyWith(
      cod: freezed == cod
          ? _value.cod
          : cod // ignore: cast_nullable_to_non_nullable
              as int?,
      codInstituicao: freezed == codInstituicao
          ? _value.codInstituicao
          : codInstituicao // ignore: cast_nullable_to_non_nullable
              as int?,
      apenasAtivos: freezed == apenasAtivos
          ? _value.apenasAtivos
          : apenasAtivos // ignore: cast_nullable_to_non_nullable
              as bool?,
      ordenarPorNomeCrescente: freezed == ordenarPorNomeCrescente
          ? _value.ordenarPorNomeCrescente
          : ordenarPorNomeCrescente // ignore: cast_nullable_to_non_nullable
              as bool?,
      tStamp: freezed == tStamp
          ? _value.tStamp
          : tStamp // ignore: cast_nullable_to_non_nullable
              as String?,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$LocalInstituicaoFilterImplCopyWith<$Res>
    implements $LocalInstituicaoFilterCopyWith<$Res> {
  factory _$$LocalInstituicaoFilterImplCopyWith(
          _$LocalInstituicaoFilterImpl value,
          $Res Function(_$LocalInstituicaoFilterImpl) then) =
      __$$LocalInstituicaoFilterImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {int? cod,
      int? codInstituicao,
      bool? apenasAtivos,
      bool? ordenarPorNomeCrescente,
      @JsonKey(name: 'tStamp') String? tStamp});
}

/// @nodoc
class __$$LocalInstituicaoFilterImplCopyWithImpl<$Res>
    extends _$LocalInstituicaoFilterCopyWithImpl<$Res,
        _$LocalInstituicaoFilterImpl>
    implements _$$LocalInstituicaoFilterImplCopyWith<$Res> {
  __$$LocalInstituicaoFilterImplCopyWithImpl(
      _$LocalInstituicaoFilterImpl _value,
      $Res Function(_$LocalInstituicaoFilterImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? cod = freezed,
    Object? codInstituicao = freezed,
    Object? apenasAtivos = freezed,
    Object? ordenarPorNomeCrescente = freezed,
    Object? tStamp = freezed,
  }) {
    return _then(_$LocalInstituicaoFilterImpl(
      cod: freezed == cod
          ? _value.cod
          : cod // ignore: cast_nullable_to_non_nullable
              as int?,
      codInstituicao: freezed == codInstituicao
          ? _value.codInstituicao
          : codInstituicao // ignore: cast_nullable_to_non_nullable
              as int?,
      apenasAtivos: freezed == apenasAtivos
          ? _value.apenasAtivos
          : apenasAtivos // ignore: cast_nullable_to_non_nullable
              as bool?,
      ordenarPorNomeCrescente: freezed == ordenarPorNomeCrescente
          ? _value.ordenarPorNomeCrescente
          : ordenarPorNomeCrescente // ignore: cast_nullable_to_non_nullable
              as bool?,
      tStamp: freezed == tStamp
          ? _value.tStamp
          : tStamp // ignore: cast_nullable_to_non_nullable
              as String?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$LocalInstituicaoFilterImpl implements _LocalInstituicaoFilter {
  _$LocalInstituicaoFilterImpl(
      {this.cod,
      this.codInstituicao,
      this.apenasAtivos,
      this.ordenarPorNomeCrescente,
      @JsonKey(name: 'tStamp') this.tStamp});

  factory _$LocalInstituicaoFilterImpl.fromJson(Map<String, dynamic> json) =>
      _$$LocalInstituicaoFilterImplFromJson(json);

  @override
  int? cod;
  @override
  int? codInstituicao;
  @override
  bool? apenasAtivos;
  @override
  bool? ordenarPorNomeCrescente;
  @override
  @JsonKey(name: 'tStamp')
  String? tStamp;

  @override
  String toString() {
    return 'LocalInstituicaoFilter(cod: $cod, codInstituicao: $codInstituicao, apenasAtivos: $apenasAtivos, ordenarPorNomeCrescente: $ordenarPorNomeCrescente, tStamp: $tStamp)';
  }

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$LocalInstituicaoFilterImplCopyWith<_$LocalInstituicaoFilterImpl>
      get copyWith => __$$LocalInstituicaoFilterImplCopyWithImpl<
          _$LocalInstituicaoFilterImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$LocalInstituicaoFilterImplToJson(
      this,
    );
  }
}

abstract class _LocalInstituicaoFilter implements LocalInstituicaoFilter {
  factory _LocalInstituicaoFilter(
      {int? cod,
      int? codInstituicao,
      bool? apenasAtivos,
      bool? ordenarPorNomeCrescente,
      @JsonKey(name: 'tStamp') String? tStamp}) = _$LocalInstituicaoFilterImpl;

  factory _LocalInstituicaoFilter.fromJson(Map<String, dynamic> json) =
      _$LocalInstituicaoFilterImpl.fromJson;

  @override
  int? get cod;
  set cod(int? value);
  @override
  int? get codInstituicao;
  set codInstituicao(int? value);
  @override
  bool? get apenasAtivos;
  set apenasAtivos(bool? value);
  @override
  bool? get ordenarPorNomeCrescente;
  set ordenarPorNomeCrescente(bool? value);
  @override
  @JsonKey(name: 'tStamp')
  String? get tStamp;
  @JsonKey(name: 'tStamp')
  set tStamp(String? value);
  @override
  @JsonKey(ignore: true)
  _$$LocalInstituicaoFilterImplCopyWith<_$LocalInstituicaoFilterImpl>
      get copyWith => throw _privateConstructorUsedError;
}
