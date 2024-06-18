// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'insumo_filter.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

InsumoFilter _$InsumoFilterFromJson(Map<String, dynamic> json) {
  return _InsumoFilter.fromJson(json);
}

/// @nodoc
mixin _$InsumoFilter {
  List<int>? get codigos => throw _privateConstructorUsedError;
  set codigos(List<int>? value) => throw _privateConstructorUsedError;
  bool? get apenasAtivos => throw _privateConstructorUsedError;
  set apenasAtivos(bool? value) => throw _privateConstructorUsedError;
  bool? get ordenarPorNomeAsc => throw _privateConstructorUsedError;
  set ordenarPorNomeAsc(bool? value) => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $InsumoFilterCopyWith<InsumoFilter> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $InsumoFilterCopyWith<$Res> {
  factory $InsumoFilterCopyWith(
          InsumoFilter value, $Res Function(InsumoFilter) then) =
      _$InsumoFilterCopyWithImpl<$Res, InsumoFilter>;
  @useResult
  $Res call({List<int>? codigos, bool? apenasAtivos, bool? ordenarPorNomeAsc});
}

/// @nodoc
class _$InsumoFilterCopyWithImpl<$Res, $Val extends InsumoFilter>
    implements $InsumoFilterCopyWith<$Res> {
  _$InsumoFilterCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? codigos = freezed,
    Object? apenasAtivos = freezed,
    Object? ordenarPorNomeAsc = freezed,
  }) {
    return _then(_value.copyWith(
      codigos: freezed == codigos
          ? _value.codigos
          : codigos // ignore: cast_nullable_to_non_nullable
              as List<int>?,
      apenasAtivos: freezed == apenasAtivos
          ? _value.apenasAtivos
          : apenasAtivos // ignore: cast_nullable_to_non_nullable
              as bool?,
      ordenarPorNomeAsc: freezed == ordenarPorNomeAsc
          ? _value.ordenarPorNomeAsc
          : ordenarPorNomeAsc // ignore: cast_nullable_to_non_nullable
              as bool?,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$InsumoFilterImplCopyWith<$Res>
    implements $InsumoFilterCopyWith<$Res> {
  factory _$$InsumoFilterImplCopyWith(
          _$InsumoFilterImpl value, $Res Function(_$InsumoFilterImpl) then) =
      __$$InsumoFilterImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({List<int>? codigos, bool? apenasAtivos, bool? ordenarPorNomeAsc});
}

/// @nodoc
class __$$InsumoFilterImplCopyWithImpl<$Res>
    extends _$InsumoFilterCopyWithImpl<$Res, _$InsumoFilterImpl>
    implements _$$InsumoFilterImplCopyWith<$Res> {
  __$$InsumoFilterImplCopyWithImpl(
      _$InsumoFilterImpl _value, $Res Function(_$InsumoFilterImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? codigos = freezed,
    Object? apenasAtivos = freezed,
    Object? ordenarPorNomeAsc = freezed,
  }) {
    return _then(_$InsumoFilterImpl(
      codigos: freezed == codigos
          ? _value.codigos
          : codigos // ignore: cast_nullable_to_non_nullable
              as List<int>?,
      apenasAtivos: freezed == apenasAtivos
          ? _value.apenasAtivos
          : apenasAtivos // ignore: cast_nullable_to_non_nullable
              as bool?,
      ordenarPorNomeAsc: freezed == ordenarPorNomeAsc
          ? _value.ordenarPorNomeAsc
          : ordenarPorNomeAsc // ignore: cast_nullable_to_non_nullable
              as bool?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$InsumoFilterImpl implements _InsumoFilter {
  _$InsumoFilterImpl({this.codigos, this.apenasAtivos, this.ordenarPorNomeAsc});

  factory _$InsumoFilterImpl.fromJson(Map<String, dynamic> json) =>
      _$$InsumoFilterImplFromJson(json);

  @override
  List<int>? codigos;
  @override
  bool? apenasAtivos;
  @override
  bool? ordenarPorNomeAsc;

  @override
  String toString() {
    return 'InsumoFilter(codigos: $codigos, apenasAtivos: $apenasAtivos, ordenarPorNomeAsc: $ordenarPorNomeAsc)';
  }

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$InsumoFilterImplCopyWith<_$InsumoFilterImpl> get copyWith =>
      __$$InsumoFilterImplCopyWithImpl<_$InsumoFilterImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$InsumoFilterImplToJson(
      this,
    );
  }
}

abstract class _InsumoFilter implements InsumoFilter {
  factory _InsumoFilter(
      {List<int>? codigos,
      bool? apenasAtivos,
      bool? ordenarPorNomeAsc}) = _$InsumoFilterImpl;

  factory _InsumoFilter.fromJson(Map<String, dynamic> json) =
      _$InsumoFilterImpl.fromJson;

  @override
  List<int>? get codigos;
  set codigos(List<int>? value);
  @override
  bool? get apenasAtivos;
  set apenasAtivos(bool? value);
  @override
  bool? get ordenarPorNomeAsc;
  set ordenarPorNomeAsc(bool? value);
  @override
  @JsonKey(ignore: true)
  _$$InsumoFilterImplCopyWith<_$InsumoFilterImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
