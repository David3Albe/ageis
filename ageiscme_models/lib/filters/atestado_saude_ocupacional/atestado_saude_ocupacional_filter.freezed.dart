// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'atestado_saude_ocupacional_filter.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

AtestadoSaudeOcupacionalFilter _$AtestadoSaudeOcupacionalFilterFromJson(
    Map<String, dynamic> json) {
  return _AtestadoSaudeOcupacionalFilter.fromJson(json);
}

/// @nodoc
mixin _$AtestadoSaudeOcupacionalFilter {
  int? get cod => throw _privateConstructorUsedError;
  set cod(int? value) => throw _privateConstructorUsedError;
  bool? get carregarUsuario => throw _privateConstructorUsedError;
  set carregarUsuario(bool? value) => throw _privateConstructorUsedError;
  @JsonKey(name: 'tStamp')
  String? get tStamp => throw _privateConstructorUsedError;
  @JsonKey(name: 'tStamp')
  set tStamp(String? value) => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $AtestadoSaudeOcupacionalFilterCopyWith<AtestadoSaudeOcupacionalFilter>
      get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $AtestadoSaudeOcupacionalFilterCopyWith<$Res> {
  factory $AtestadoSaudeOcupacionalFilterCopyWith(
          AtestadoSaudeOcupacionalFilter value,
          $Res Function(AtestadoSaudeOcupacionalFilter) then) =
      _$AtestadoSaudeOcupacionalFilterCopyWithImpl<$Res,
          AtestadoSaudeOcupacionalFilter>;
  @useResult
  $Res call(
      {int? cod,
      bool? carregarUsuario,
      @JsonKey(name: 'tStamp') String? tStamp});
}

/// @nodoc
class _$AtestadoSaudeOcupacionalFilterCopyWithImpl<$Res,
        $Val extends AtestadoSaudeOcupacionalFilter>
    implements $AtestadoSaudeOcupacionalFilterCopyWith<$Res> {
  _$AtestadoSaudeOcupacionalFilterCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? cod = freezed,
    Object? carregarUsuario = freezed,
    Object? tStamp = freezed,
  }) {
    return _then(_value.copyWith(
      cod: freezed == cod
          ? _value.cod
          : cod // ignore: cast_nullable_to_non_nullable
              as int?,
      carregarUsuario: freezed == carregarUsuario
          ? _value.carregarUsuario
          : carregarUsuario // ignore: cast_nullable_to_non_nullable
              as bool?,
      tStamp: freezed == tStamp
          ? _value.tStamp
          : tStamp // ignore: cast_nullable_to_non_nullable
              as String?,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$AtestadoSaudeOcupacionalFilterImplCopyWith<$Res>
    implements $AtestadoSaudeOcupacionalFilterCopyWith<$Res> {
  factory _$$AtestadoSaudeOcupacionalFilterImplCopyWith(
          _$AtestadoSaudeOcupacionalFilterImpl value,
          $Res Function(_$AtestadoSaudeOcupacionalFilterImpl) then) =
      __$$AtestadoSaudeOcupacionalFilterImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {int? cod,
      bool? carregarUsuario,
      @JsonKey(name: 'tStamp') String? tStamp});
}

/// @nodoc
class __$$AtestadoSaudeOcupacionalFilterImplCopyWithImpl<$Res>
    extends _$AtestadoSaudeOcupacionalFilterCopyWithImpl<$Res,
        _$AtestadoSaudeOcupacionalFilterImpl>
    implements _$$AtestadoSaudeOcupacionalFilterImplCopyWith<$Res> {
  __$$AtestadoSaudeOcupacionalFilterImplCopyWithImpl(
      _$AtestadoSaudeOcupacionalFilterImpl _value,
      $Res Function(_$AtestadoSaudeOcupacionalFilterImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? cod = freezed,
    Object? carregarUsuario = freezed,
    Object? tStamp = freezed,
  }) {
    return _then(_$AtestadoSaudeOcupacionalFilterImpl(
      cod: freezed == cod
          ? _value.cod
          : cod // ignore: cast_nullable_to_non_nullable
              as int?,
      carregarUsuario: freezed == carregarUsuario
          ? _value.carregarUsuario
          : carregarUsuario // ignore: cast_nullable_to_non_nullable
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
class _$AtestadoSaudeOcupacionalFilterImpl
    with DiagnosticableTreeMixin
    implements _AtestadoSaudeOcupacionalFilter {
  _$AtestadoSaudeOcupacionalFilterImpl(
      {this.cod, this.carregarUsuario, @JsonKey(name: 'tStamp') this.tStamp});

  factory _$AtestadoSaudeOcupacionalFilterImpl.fromJson(
          Map<String, dynamic> json) =>
      _$$AtestadoSaudeOcupacionalFilterImplFromJson(json);

  @override
  int? cod;
  @override
  bool? carregarUsuario;
  @override
  @JsonKey(name: 'tStamp')
  String? tStamp;

  @override
  String toString({DiagnosticLevel minLevel = DiagnosticLevel.info}) {
    return 'AtestadoSaudeOcupacionalFilter(cod: $cod, carregarUsuario: $carregarUsuario, tStamp: $tStamp)';
  }

  @override
  void debugFillProperties(DiagnosticPropertiesBuilder properties) {
    super.debugFillProperties(properties);
    properties
      ..add(DiagnosticsProperty('type', 'AtestadoSaudeOcupacionalFilter'))
      ..add(DiagnosticsProperty('cod', cod))
      ..add(DiagnosticsProperty('carregarUsuario', carregarUsuario))
      ..add(DiagnosticsProperty('tStamp', tStamp));
  }

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$AtestadoSaudeOcupacionalFilterImplCopyWith<
          _$AtestadoSaudeOcupacionalFilterImpl>
      get copyWith => __$$AtestadoSaudeOcupacionalFilterImplCopyWithImpl<
          _$AtestadoSaudeOcupacionalFilterImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$AtestadoSaudeOcupacionalFilterImplToJson(
      this,
    );
  }
}

abstract class _AtestadoSaudeOcupacionalFilter
    implements AtestadoSaudeOcupacionalFilter {
  factory _AtestadoSaudeOcupacionalFilter(
          {int? cod,
          bool? carregarUsuario,
          @JsonKey(name: 'tStamp') String? tStamp}) =
      _$AtestadoSaudeOcupacionalFilterImpl;

  factory _AtestadoSaudeOcupacionalFilter.fromJson(Map<String, dynamic> json) =
      _$AtestadoSaudeOcupacionalFilterImpl.fromJson;

  @override
  int? get cod;
  set cod(int? value);
  @override
  bool? get carregarUsuario;
  set carregarUsuario(bool? value);
  @override
  @JsonKey(name: 'tStamp')
  String? get tStamp;
  @JsonKey(name: 'tStamp')
  set tStamp(String? value);
  @override
  @JsonKey(ignore: true)
  _$$AtestadoSaudeOcupacionalFilterImplCopyWith<
          _$AtestadoSaudeOcupacionalFilterImpl>
      get copyWith => throw _privateConstructorUsedError;
}
