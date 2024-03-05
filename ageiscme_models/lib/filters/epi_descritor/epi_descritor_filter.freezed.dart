// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'epi_descritor_filter.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

EpiDescritorFilter _$EpiDescritorFilterFromJson(Map<String, dynamic> json) {
  return _EpiDescritorFilter.fromJson(json);
}

/// @nodoc
mixin _$EpiDescritorFilter {
  int? get cod => throw _privateConstructorUsedError;
  set cod(int? value) => throw _privateConstructorUsedError;
  bool? get carregarTipo => throw _privateConstructorUsedError;
  set carregarTipo(bool? value) => throw _privateConstructorUsedError;
  @JsonKey(name: 'tStamp')
  String? get tStamp => throw _privateConstructorUsedError;
  @JsonKey(name: 'tStamp')
  set tStamp(String? value) => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $EpiDescritorFilterCopyWith<EpiDescritorFilter> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $EpiDescritorFilterCopyWith<$Res> {
  factory $EpiDescritorFilterCopyWith(
          EpiDescritorFilter value, $Res Function(EpiDescritorFilter) then) =
      _$EpiDescritorFilterCopyWithImpl<$Res, EpiDescritorFilter>;
  @useResult
  $Res call(
      {int? cod, bool? carregarTipo, @JsonKey(name: 'tStamp') String? tStamp});
}

/// @nodoc
class _$EpiDescritorFilterCopyWithImpl<$Res, $Val extends EpiDescritorFilter>
    implements $EpiDescritorFilterCopyWith<$Res> {
  _$EpiDescritorFilterCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? cod = freezed,
    Object? carregarTipo = freezed,
    Object? tStamp = freezed,
  }) {
    return _then(_value.copyWith(
      cod: freezed == cod
          ? _value.cod
          : cod // ignore: cast_nullable_to_non_nullable
              as int?,
      carregarTipo: freezed == carregarTipo
          ? _value.carregarTipo
          : carregarTipo // ignore: cast_nullable_to_non_nullable
              as bool?,
      tStamp: freezed == tStamp
          ? _value.tStamp
          : tStamp // ignore: cast_nullable_to_non_nullable
              as String?,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$EpiDescritorFilterImplCopyWith<$Res>
    implements $EpiDescritorFilterCopyWith<$Res> {
  factory _$$EpiDescritorFilterImplCopyWith(_$EpiDescritorFilterImpl value,
          $Res Function(_$EpiDescritorFilterImpl) then) =
      __$$EpiDescritorFilterImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {int? cod, bool? carregarTipo, @JsonKey(name: 'tStamp') String? tStamp});
}

/// @nodoc
class __$$EpiDescritorFilterImplCopyWithImpl<$Res>
    extends _$EpiDescritorFilterCopyWithImpl<$Res, _$EpiDescritorFilterImpl>
    implements _$$EpiDescritorFilterImplCopyWith<$Res> {
  __$$EpiDescritorFilterImplCopyWithImpl(_$EpiDescritorFilterImpl _value,
      $Res Function(_$EpiDescritorFilterImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? cod = freezed,
    Object? carregarTipo = freezed,
    Object? tStamp = freezed,
  }) {
    return _then(_$EpiDescritorFilterImpl(
      cod: freezed == cod
          ? _value.cod
          : cod // ignore: cast_nullable_to_non_nullable
              as int?,
      carregarTipo: freezed == carregarTipo
          ? _value.carregarTipo
          : carregarTipo // ignore: cast_nullable_to_non_nullable
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
class _$EpiDescritorFilterImpl implements _EpiDescritorFilter {
  _$EpiDescritorFilterImpl(
      {this.cod, this.carregarTipo, @JsonKey(name: 'tStamp') this.tStamp});

  factory _$EpiDescritorFilterImpl.fromJson(Map<String, dynamic> json) =>
      _$$EpiDescritorFilterImplFromJson(json);

  @override
  int? cod;
  @override
  bool? carregarTipo;
  @override
  @JsonKey(name: 'tStamp')
  String? tStamp;

  @override
  String toString() {
    return 'EpiDescritorFilter(cod: $cod, carregarTipo: $carregarTipo, tStamp: $tStamp)';
  }

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$EpiDescritorFilterImplCopyWith<_$EpiDescritorFilterImpl> get copyWith =>
      __$$EpiDescritorFilterImplCopyWithImpl<_$EpiDescritorFilterImpl>(
          this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$EpiDescritorFilterImplToJson(
      this,
    );
  }
}

abstract class _EpiDescritorFilter implements EpiDescritorFilter {
  factory _EpiDescritorFilter(
      {int? cod,
      bool? carregarTipo,
      @JsonKey(name: 'tStamp') String? tStamp}) = _$EpiDescritorFilterImpl;

  factory _EpiDescritorFilter.fromJson(Map<String, dynamic> json) =
      _$EpiDescritorFilterImpl.fromJson;

  @override
  int? get cod;
  set cod(int? value);
  @override
  bool? get carregarTipo;
  set carregarTipo(bool? value);
  @override
  @JsonKey(name: 'tStamp')
  String? get tStamp;
  @JsonKey(name: 'tStamp')
  set tStamp(String? value);
  @override
  @JsonKey(ignore: true)
  _$$EpiDescritorFilterImplCopyWith<_$EpiDescritorFilterImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
