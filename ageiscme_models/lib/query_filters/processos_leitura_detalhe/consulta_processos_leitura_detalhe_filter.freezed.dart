// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'consulta_processos_leitura_detalhe_filter.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

ConsultaProcessosLeituraDetalheFilter
    _$ConsultaProcessosLeituraDetalheFilterFromJson(Map<String, dynamic> json) {
  return _ConsultaProcessosLeituraDetalheFilter.fromJson(json);
}

/// @nodoc
mixin _$ConsultaProcessosLeituraDetalheFilter {
  int? get codLeitura => throw _privateConstructorUsedError;
  set codLeitura(int? value) => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $ConsultaProcessosLeituraDetalheFilterCopyWith<
          ConsultaProcessosLeituraDetalheFilter>
      get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $ConsultaProcessosLeituraDetalheFilterCopyWith<$Res> {
  factory $ConsultaProcessosLeituraDetalheFilterCopyWith(
          ConsultaProcessosLeituraDetalheFilter value,
          $Res Function(ConsultaProcessosLeituraDetalheFilter) then) =
      _$ConsultaProcessosLeituraDetalheFilterCopyWithImpl<$Res,
          ConsultaProcessosLeituraDetalheFilter>;
  @useResult
  $Res call({int? codLeitura});
}

/// @nodoc
class _$ConsultaProcessosLeituraDetalheFilterCopyWithImpl<$Res,
        $Val extends ConsultaProcessosLeituraDetalheFilter>
    implements $ConsultaProcessosLeituraDetalheFilterCopyWith<$Res> {
  _$ConsultaProcessosLeituraDetalheFilterCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? codLeitura = freezed,
  }) {
    return _then(_value.copyWith(
      codLeitura: freezed == codLeitura
          ? _value.codLeitura
          : codLeitura // ignore: cast_nullable_to_non_nullable
              as int?,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$ConsultaProcessosLeituraDetalheFilterImplCopyWith<$Res>
    implements $ConsultaProcessosLeituraDetalheFilterCopyWith<$Res> {
  factory _$$ConsultaProcessosLeituraDetalheFilterImplCopyWith(
          _$ConsultaProcessosLeituraDetalheFilterImpl value,
          $Res Function(_$ConsultaProcessosLeituraDetalheFilterImpl) then) =
      __$$ConsultaProcessosLeituraDetalheFilterImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({int? codLeitura});
}

/// @nodoc
class __$$ConsultaProcessosLeituraDetalheFilterImplCopyWithImpl<$Res>
    extends _$ConsultaProcessosLeituraDetalheFilterCopyWithImpl<$Res,
        _$ConsultaProcessosLeituraDetalheFilterImpl>
    implements _$$ConsultaProcessosLeituraDetalheFilterImplCopyWith<$Res> {
  __$$ConsultaProcessosLeituraDetalheFilterImplCopyWithImpl(
      _$ConsultaProcessosLeituraDetalheFilterImpl _value,
      $Res Function(_$ConsultaProcessosLeituraDetalheFilterImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? codLeitura = freezed,
  }) {
    return _then(_$ConsultaProcessosLeituraDetalheFilterImpl(
      codLeitura: freezed == codLeitura
          ? _value.codLeitura
          : codLeitura // ignore: cast_nullable_to_non_nullable
              as int?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$ConsultaProcessosLeituraDetalheFilterImpl
    extends _ConsultaProcessosLeituraDetalheFilter {
  _$ConsultaProcessosLeituraDetalheFilterImpl({required this.codLeitura})
      : super._();

  factory _$ConsultaProcessosLeituraDetalheFilterImpl.fromJson(
          Map<String, dynamic> json) =>
      _$$ConsultaProcessosLeituraDetalheFilterImplFromJson(json);

  @override
  int? codLeitura;

  @override
  String toString() {
    return 'ConsultaProcessosLeituraDetalheFilter(codLeitura: $codLeitura)';
  }

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$ConsultaProcessosLeituraDetalheFilterImplCopyWith<
          _$ConsultaProcessosLeituraDetalheFilterImpl>
      get copyWith => __$$ConsultaProcessosLeituraDetalheFilterImplCopyWithImpl<
          _$ConsultaProcessosLeituraDetalheFilterImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$ConsultaProcessosLeituraDetalheFilterImplToJson(
      this,
    );
  }
}

abstract class _ConsultaProcessosLeituraDetalheFilter
    extends ConsultaProcessosLeituraDetalheFilter {
  factory _ConsultaProcessosLeituraDetalheFilter({required int? codLeitura}) =
      _$ConsultaProcessosLeituraDetalheFilterImpl;
  _ConsultaProcessosLeituraDetalheFilter._() : super._();

  factory _ConsultaProcessosLeituraDetalheFilter.fromJson(
          Map<String, dynamic> json) =
      _$ConsultaProcessosLeituraDetalheFilterImpl.fromJson;

  @override
  int? get codLeitura;
  set codLeitura(int? value);
  @override
  @JsonKey(ignore: true)
  _$$ConsultaProcessosLeituraDetalheFilterImplCopyWith<
          _$ConsultaProcessosLeituraDetalheFilterImpl>
      get copyWith => throw _privateConstructorUsedError;
}
