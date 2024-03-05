// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'direito_filter.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

DireitoFilter _$DireitoFilterFromJson(Map<String, dynamic> json) {
  return _DireitoFilter.fromJson(json);
}

/// @nodoc
mixin _$DireitoFilter {
  int? get cod => throw _privateConstructorUsedError;
  set cod(int? value) => throw _privateConstructorUsedError;
  bool? get ordenarPorNomeCrescente => throw _privateConstructorUsedError;
  set ordenarPorNomeCrescente(bool? value) =>
      throw _privateConstructorUsedError;
  @JsonKey(name: 'tStamp')
  String? get tStamp => throw _privateConstructorUsedError;
  @JsonKey(name: 'tStamp')
  set tStamp(String? value) => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $DireitoFilterCopyWith<DireitoFilter> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $DireitoFilterCopyWith<$Res> {
  factory $DireitoFilterCopyWith(
          DireitoFilter value, $Res Function(DireitoFilter) then) =
      _$DireitoFilterCopyWithImpl<$Res, DireitoFilter>;
  @useResult
  $Res call(
      {int? cod,
      bool? ordenarPorNomeCrescente,
      @JsonKey(name: 'tStamp') String? tStamp});
}

/// @nodoc
class _$DireitoFilterCopyWithImpl<$Res, $Val extends DireitoFilter>
    implements $DireitoFilterCopyWith<$Res> {
  _$DireitoFilterCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? cod = freezed,
    Object? ordenarPorNomeCrescente = freezed,
    Object? tStamp = freezed,
  }) {
    return _then(_value.copyWith(
      cod: freezed == cod
          ? _value.cod
          : cod // ignore: cast_nullable_to_non_nullable
              as int?,
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
abstract class _$$DireitoFilterImplCopyWith<$Res>
    implements $DireitoFilterCopyWith<$Res> {
  factory _$$DireitoFilterImplCopyWith(
          _$DireitoFilterImpl value, $Res Function(_$DireitoFilterImpl) then) =
      __$$DireitoFilterImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {int? cod,
      bool? ordenarPorNomeCrescente,
      @JsonKey(name: 'tStamp') String? tStamp});
}

/// @nodoc
class __$$DireitoFilterImplCopyWithImpl<$Res>
    extends _$DireitoFilterCopyWithImpl<$Res, _$DireitoFilterImpl>
    implements _$$DireitoFilterImplCopyWith<$Res> {
  __$$DireitoFilterImplCopyWithImpl(
      _$DireitoFilterImpl _value, $Res Function(_$DireitoFilterImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? cod = freezed,
    Object? ordenarPorNomeCrescente = freezed,
    Object? tStamp = freezed,
  }) {
    return _then(_$DireitoFilterImpl(
      cod: freezed == cod
          ? _value.cod
          : cod // ignore: cast_nullable_to_non_nullable
              as int?,
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
class _$DireitoFilterImpl implements _DireitoFilter {
  _$DireitoFilterImpl(
      {this.cod,
      this.ordenarPorNomeCrescente,
      @JsonKey(name: 'tStamp') this.tStamp});

  factory _$DireitoFilterImpl.fromJson(Map<String, dynamic> json) =>
      _$$DireitoFilterImplFromJson(json);

  @override
  int? cod;
  @override
  bool? ordenarPorNomeCrescente;
  @override
  @JsonKey(name: 'tStamp')
  String? tStamp;

  @override
  String toString() {
    return 'DireitoFilter(cod: $cod, ordenarPorNomeCrescente: $ordenarPorNomeCrescente, tStamp: $tStamp)';
  }

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$DireitoFilterImplCopyWith<_$DireitoFilterImpl> get copyWith =>
      __$$DireitoFilterImplCopyWithImpl<_$DireitoFilterImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$DireitoFilterImplToJson(
      this,
    );
  }
}

abstract class _DireitoFilter implements DireitoFilter {
  factory _DireitoFilter(
      {int? cod,
      bool? ordenarPorNomeCrescente,
      @JsonKey(name: 'tStamp') String? tStamp}) = _$DireitoFilterImpl;

  factory _DireitoFilter.fromJson(Map<String, dynamic> json) =
      _$DireitoFilterImpl.fromJson;

  @override
  int? get cod;
  set cod(int? value);
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
  _$$DireitoFilterImplCopyWith<_$DireitoFilterImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
