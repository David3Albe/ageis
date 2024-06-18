// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'kit_cor_filter.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

KitCorFilter _$KitCorFilterFromJson(Map<String, dynamic> json) {
  return _KitCorFilter.fromJson(json);
}

/// @nodoc
mixin _$KitCorFilter {
  int? get cod => throw _privateConstructorUsedError;
  set cod(int? value) => throw _privateConstructorUsedError;
  bool? get apenasAtivos => throw _privateConstructorUsedError;
  set apenasAtivos(bool? value) => throw _privateConstructorUsedError;
  bool? get ordernarPorNomeCrescente => throw _privateConstructorUsedError;
  set ordernarPorNomeCrescente(bool? value) =>
      throw _privateConstructorUsedError;
  @JsonKey(name: 'tStamp')
  String? get tStamp => throw _privateConstructorUsedError;
  @JsonKey(name: 'tStamp')
  set tStamp(String? value) => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $KitCorFilterCopyWith<KitCorFilter> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $KitCorFilterCopyWith<$Res> {
  factory $KitCorFilterCopyWith(
          KitCorFilter value, $Res Function(KitCorFilter) then) =
      _$KitCorFilterCopyWithImpl<$Res, KitCorFilter>;
  @useResult
  $Res call(
      {int? cod,
      bool? apenasAtivos,
      bool? ordernarPorNomeCrescente,
      @JsonKey(name: 'tStamp') String? tStamp});
}

/// @nodoc
class _$KitCorFilterCopyWithImpl<$Res, $Val extends KitCorFilter>
    implements $KitCorFilterCopyWith<$Res> {
  _$KitCorFilterCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? cod = freezed,
    Object? apenasAtivos = freezed,
    Object? ordernarPorNomeCrescente = freezed,
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
      ordernarPorNomeCrescente: freezed == ordernarPorNomeCrescente
          ? _value.ordernarPorNomeCrescente
          : ordernarPorNomeCrescente // ignore: cast_nullable_to_non_nullable
              as bool?,
      tStamp: freezed == tStamp
          ? _value.tStamp
          : tStamp // ignore: cast_nullable_to_non_nullable
              as String?,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$KitCorFilterImplCopyWith<$Res>
    implements $KitCorFilterCopyWith<$Res> {
  factory _$$KitCorFilterImplCopyWith(
          _$KitCorFilterImpl value, $Res Function(_$KitCorFilterImpl) then) =
      __$$KitCorFilterImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {int? cod,
      bool? apenasAtivos,
      bool? ordernarPorNomeCrescente,
      @JsonKey(name: 'tStamp') String? tStamp});
}

/// @nodoc
class __$$KitCorFilterImplCopyWithImpl<$Res>
    extends _$KitCorFilterCopyWithImpl<$Res, _$KitCorFilterImpl>
    implements _$$KitCorFilterImplCopyWith<$Res> {
  __$$KitCorFilterImplCopyWithImpl(
      _$KitCorFilterImpl _value, $Res Function(_$KitCorFilterImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? cod = freezed,
    Object? apenasAtivos = freezed,
    Object? ordernarPorNomeCrescente = freezed,
    Object? tStamp = freezed,
  }) {
    return _then(_$KitCorFilterImpl(
      cod: freezed == cod
          ? _value.cod
          : cod // ignore: cast_nullable_to_non_nullable
              as int?,
      apenasAtivos: freezed == apenasAtivos
          ? _value.apenasAtivos
          : apenasAtivos // ignore: cast_nullable_to_non_nullable
              as bool?,
      ordernarPorNomeCrescente: freezed == ordernarPorNomeCrescente
          ? _value.ordernarPorNomeCrescente
          : ordernarPorNomeCrescente // ignore: cast_nullable_to_non_nullable
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
class _$KitCorFilterImpl implements _KitCorFilter {
  _$KitCorFilterImpl(
      {this.cod,
      this.apenasAtivos,
      this.ordernarPorNomeCrescente,
      @JsonKey(name: 'tStamp') this.tStamp});

  factory _$KitCorFilterImpl.fromJson(Map<String, dynamic> json) =>
      _$$KitCorFilterImplFromJson(json);

  @override
  int? cod;
  @override
  bool? apenasAtivos;
  @override
  bool? ordernarPorNomeCrescente;
  @override
  @JsonKey(name: 'tStamp')
  String? tStamp;

  @override
  String toString() {
    return 'KitCorFilter(cod: $cod, apenasAtivos: $apenasAtivos, ordernarPorNomeCrescente: $ordernarPorNomeCrescente, tStamp: $tStamp)';
  }

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$KitCorFilterImplCopyWith<_$KitCorFilterImpl> get copyWith =>
      __$$KitCorFilterImplCopyWithImpl<_$KitCorFilterImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$KitCorFilterImplToJson(
      this,
    );
  }
}

abstract class _KitCorFilter implements KitCorFilter {
  factory _KitCorFilter(
      {int? cod,
      bool? apenasAtivos,
      bool? ordernarPorNomeCrescente,
      @JsonKey(name: 'tStamp') String? tStamp}) = _$KitCorFilterImpl;

  factory _KitCorFilter.fromJson(Map<String, dynamic> json) =
      _$KitCorFilterImpl.fromJson;

  @override
  int? get cod;
  set cod(int? value);
  @override
  bool? get apenasAtivos;
  set apenasAtivos(bool? value);
  @override
  bool? get ordernarPorNomeCrescente;
  set ordernarPorNomeCrescente(bool? value);
  @override
  @JsonKey(name: 'tStamp')
  String? get tStamp;
  @JsonKey(name: 'tStamp')
  set tStamp(String? value);
  @override
  @JsonKey(ignore: true)
  _$$KitCorFilterImplCopyWith<_$KitCorFilterImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
