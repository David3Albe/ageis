// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'insumo_teste_filter.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

InsumoTesteFilter _$InsumoTesteFilterFromJson(Map<String, dynamic> json) {
  return _InsumoTesteFilter.fromJson(json);
}

/// @nodoc
mixin _$InsumoTesteFilter {
  int? get cod => throw _privateConstructorUsedError;
  set cod(int? value) => throw _privateConstructorUsedError;
  int? get codInsumo => throw _privateConstructorUsedError;
  set codInsumo(int? value) => throw _privateConstructorUsedError;
  int? get codMovimentoInsumo => throw _privateConstructorUsedError;
  set codMovimentoInsumo(int? value) => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $InsumoTesteFilterCopyWith<InsumoTesteFilter> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $InsumoTesteFilterCopyWith<$Res> {
  factory $InsumoTesteFilterCopyWith(
          InsumoTesteFilter value, $Res Function(InsumoTesteFilter) then) =
      _$InsumoTesteFilterCopyWithImpl<$Res, InsumoTesteFilter>;
  @useResult
  $Res call({int? cod, int? codInsumo, int? codMovimentoInsumo});
}

/// @nodoc
class _$InsumoTesteFilterCopyWithImpl<$Res, $Val extends InsumoTesteFilter>
    implements $InsumoTesteFilterCopyWith<$Res> {
  _$InsumoTesteFilterCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? cod = freezed,
    Object? codInsumo = freezed,
    Object? codMovimentoInsumo = freezed,
  }) {
    return _then(_value.copyWith(
      cod: freezed == cod
          ? _value.cod
          : cod // ignore: cast_nullable_to_non_nullable
              as int?,
      codInsumo: freezed == codInsumo
          ? _value.codInsumo
          : codInsumo // ignore: cast_nullable_to_non_nullable
              as int?,
      codMovimentoInsumo: freezed == codMovimentoInsumo
          ? _value.codMovimentoInsumo
          : codMovimentoInsumo // ignore: cast_nullable_to_non_nullable
              as int?,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$InsumoTesteFilterImplCopyWith<$Res>
    implements $InsumoTesteFilterCopyWith<$Res> {
  factory _$$InsumoTesteFilterImplCopyWith(_$InsumoTesteFilterImpl value,
          $Res Function(_$InsumoTesteFilterImpl) then) =
      __$$InsumoTesteFilterImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({int? cod, int? codInsumo, int? codMovimentoInsumo});
}

/// @nodoc
class __$$InsumoTesteFilterImplCopyWithImpl<$Res>
    extends _$InsumoTesteFilterCopyWithImpl<$Res, _$InsumoTesteFilterImpl>
    implements _$$InsumoTesteFilterImplCopyWith<$Res> {
  __$$InsumoTesteFilterImplCopyWithImpl(_$InsumoTesteFilterImpl _value,
      $Res Function(_$InsumoTesteFilterImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? cod = freezed,
    Object? codInsumo = freezed,
    Object? codMovimentoInsumo = freezed,
  }) {
    return _then(_$InsumoTesteFilterImpl(
      cod: freezed == cod
          ? _value.cod
          : cod // ignore: cast_nullable_to_non_nullable
              as int?,
      codInsumo: freezed == codInsumo
          ? _value.codInsumo
          : codInsumo // ignore: cast_nullable_to_non_nullable
              as int?,
      codMovimentoInsumo: freezed == codMovimentoInsumo
          ? _value.codMovimentoInsumo
          : codMovimentoInsumo // ignore: cast_nullable_to_non_nullable
              as int?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$InsumoTesteFilterImpl
    with DiagnosticableTreeMixin
    implements _InsumoTesteFilter {
  _$InsumoTesteFilterImpl({this.cod, this.codInsumo, this.codMovimentoInsumo});

  factory _$InsumoTesteFilterImpl.fromJson(Map<String, dynamic> json) =>
      _$$InsumoTesteFilterImplFromJson(json);

  @override
  int? cod;
  @override
  int? codInsumo;
  @override
  int? codMovimentoInsumo;

  @override
  String toString({DiagnosticLevel minLevel = DiagnosticLevel.info}) {
    return 'InsumoTesteFilter(cod: $cod, codInsumo: $codInsumo, codMovimentoInsumo: $codMovimentoInsumo)';
  }

  @override
  void debugFillProperties(DiagnosticPropertiesBuilder properties) {
    super.debugFillProperties(properties);
    properties
      ..add(DiagnosticsProperty('type', 'InsumoTesteFilter'))
      ..add(DiagnosticsProperty('cod', cod))
      ..add(DiagnosticsProperty('codInsumo', codInsumo))
      ..add(DiagnosticsProperty('codMovimentoInsumo', codMovimentoInsumo));
  }

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$InsumoTesteFilterImplCopyWith<_$InsumoTesteFilterImpl> get copyWith =>
      __$$InsumoTesteFilterImplCopyWithImpl<_$InsumoTesteFilterImpl>(
          this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$InsumoTesteFilterImplToJson(
      this,
    );
  }
}

abstract class _InsumoTesteFilter implements InsumoTesteFilter {
  factory _InsumoTesteFilter(
      {int? cod,
      int? codInsumo,
      int? codMovimentoInsumo}) = _$InsumoTesteFilterImpl;

  factory _InsumoTesteFilter.fromJson(Map<String, dynamic> json) =
      _$InsumoTesteFilterImpl.fromJson;

  @override
  int? get cod;
  set cod(int? value);
  @override
  int? get codInsumo;
  set codInsumo(int? value);
  @override
  int? get codMovimentoInsumo;
  set codMovimentoInsumo(int? value);
  @override
  @JsonKey(ignore: true)
  _$$InsumoTesteFilterImplCopyWith<_$InsumoTesteFilterImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
