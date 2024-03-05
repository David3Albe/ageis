// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'equipamento_manutencao_filter.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

EquipamentoManutencaoFilter _$EquipamentoManutencaoFilterFromJson(
    Map<String, dynamic> json) {
  return _EquipamentoManutencaoFilter.fromJson(json);
}

/// @nodoc
mixin _$EquipamentoManutencaoFilter {
  int? get cod => throw _privateConstructorUsedError;
  set cod(int? value) => throw _privateConstructorUsedError;
  @JsonKey(name: 'tStamp')
  String? get tStamp => throw _privateConstructorUsedError;
  @JsonKey(name: 'tStamp')
  set tStamp(String? value) => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $EquipamentoManutencaoFilterCopyWith<EquipamentoManutencaoFilter>
      get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $EquipamentoManutencaoFilterCopyWith<$Res> {
  factory $EquipamentoManutencaoFilterCopyWith(
          EquipamentoManutencaoFilter value,
          $Res Function(EquipamentoManutencaoFilter) then) =
      _$EquipamentoManutencaoFilterCopyWithImpl<$Res,
          EquipamentoManutencaoFilter>;
  @useResult
  $Res call({int? cod, @JsonKey(name: 'tStamp') String? tStamp});
}

/// @nodoc
class _$EquipamentoManutencaoFilterCopyWithImpl<$Res,
        $Val extends EquipamentoManutencaoFilter>
    implements $EquipamentoManutencaoFilterCopyWith<$Res> {
  _$EquipamentoManutencaoFilterCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? cod = freezed,
    Object? tStamp = freezed,
  }) {
    return _then(_value.copyWith(
      cod: freezed == cod
          ? _value.cod
          : cod // ignore: cast_nullable_to_non_nullable
              as int?,
      tStamp: freezed == tStamp
          ? _value.tStamp
          : tStamp // ignore: cast_nullable_to_non_nullable
              as String?,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$EquipamentoManutencaoFilterImplCopyWith<$Res>
    implements $EquipamentoManutencaoFilterCopyWith<$Res> {
  factory _$$EquipamentoManutencaoFilterImplCopyWith(
          _$EquipamentoManutencaoFilterImpl value,
          $Res Function(_$EquipamentoManutencaoFilterImpl) then) =
      __$$EquipamentoManutencaoFilterImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({int? cod, @JsonKey(name: 'tStamp') String? tStamp});
}

/// @nodoc
class __$$EquipamentoManutencaoFilterImplCopyWithImpl<$Res>
    extends _$EquipamentoManutencaoFilterCopyWithImpl<$Res,
        _$EquipamentoManutencaoFilterImpl>
    implements _$$EquipamentoManutencaoFilterImplCopyWith<$Res> {
  __$$EquipamentoManutencaoFilterImplCopyWithImpl(
      _$EquipamentoManutencaoFilterImpl _value,
      $Res Function(_$EquipamentoManutencaoFilterImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? cod = freezed,
    Object? tStamp = freezed,
  }) {
    return _then(_$EquipamentoManutencaoFilterImpl(
      cod: freezed == cod
          ? _value.cod
          : cod // ignore: cast_nullable_to_non_nullable
              as int?,
      tStamp: freezed == tStamp
          ? _value.tStamp
          : tStamp // ignore: cast_nullable_to_non_nullable
              as String?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$EquipamentoManutencaoFilterImpl
    implements _EquipamentoManutencaoFilter {
  _$EquipamentoManutencaoFilterImpl(
      {this.cod, @JsonKey(name: 'tStamp') this.tStamp});

  factory _$EquipamentoManutencaoFilterImpl.fromJson(
          Map<String, dynamic> json) =>
      _$$EquipamentoManutencaoFilterImplFromJson(json);

  @override
  int? cod;
  @override
  @JsonKey(name: 'tStamp')
  String? tStamp;

  @override
  String toString() {
    return 'EquipamentoManutencaoFilter(cod: $cod, tStamp: $tStamp)';
  }

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$EquipamentoManutencaoFilterImplCopyWith<_$EquipamentoManutencaoFilterImpl>
      get copyWith => __$$EquipamentoManutencaoFilterImplCopyWithImpl<
          _$EquipamentoManutencaoFilterImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$EquipamentoManutencaoFilterImplToJson(
      this,
    );
  }
}

abstract class _EquipamentoManutencaoFilter
    implements EquipamentoManutencaoFilter {
  factory _EquipamentoManutencaoFilter(
          {int? cod, @JsonKey(name: 'tStamp') String? tStamp}) =
      _$EquipamentoManutencaoFilterImpl;

  factory _EquipamentoManutencaoFilter.fromJson(Map<String, dynamic> json) =
      _$EquipamentoManutencaoFilterImpl.fromJson;

  @override
  int? get cod;
  set cod(int? value);
  @override
  @JsonKey(name: 'tStamp')
  String? get tStamp;
  @JsonKey(name: 'tStamp')
  set tStamp(String? value);
  @override
  @JsonKey(ignore: true)
  _$$EquipamentoManutencaoFilterImplCopyWith<_$EquipamentoManutencaoFilterImpl>
      get copyWith => throw _privateConstructorUsedError;
}
