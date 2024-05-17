// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'consulta_kit_inventario_filter.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

ConsultaKitInventarioFilter _$ConsultaKitInventarioFilterFromJson(
    Map<String, dynamic> json) {
  return _ConsultaKitInventarioFilter.fromJson(json);
}

/// @nodoc
mixin _$ConsultaKitInventarioFilter {
  int? get codKitDescritor => throw _privateConstructorUsedError;
  set codKitDescritor(int? value) => throw _privateConstructorUsedError;
  KitDescritorDropDownSearchResponseDTO? get kitDescritor =>
      throw _privateConstructorUsedError;
  set kitDescritor(KitDescritorDropDownSearchResponseDTO? value) =>
      throw _privateConstructorUsedError;
  String? get codSituacao => throw _privateConstructorUsedError;
  set codSituacao(String? value) => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $ConsultaKitInventarioFilterCopyWith<ConsultaKitInventarioFilter>
      get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $ConsultaKitInventarioFilterCopyWith<$Res> {
  factory $ConsultaKitInventarioFilterCopyWith(
          ConsultaKitInventarioFilter value,
          $Res Function(ConsultaKitInventarioFilter) then) =
      _$ConsultaKitInventarioFilterCopyWithImpl<$Res,
          ConsultaKitInventarioFilter>;
  @useResult
  $Res call(
      {int? codKitDescritor,
      KitDescritorDropDownSearchResponseDTO? kitDescritor,
      String? codSituacao});

  $KitDescritorDropDownSearchResponseDTOCopyWith<$Res>? get kitDescritor;
}

/// @nodoc
class _$ConsultaKitInventarioFilterCopyWithImpl<$Res,
        $Val extends ConsultaKitInventarioFilter>
    implements $ConsultaKitInventarioFilterCopyWith<$Res> {
  _$ConsultaKitInventarioFilterCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? codKitDescritor = freezed,
    Object? kitDescritor = freezed,
    Object? codSituacao = freezed,
  }) {
    return _then(_value.copyWith(
      codKitDescritor: freezed == codKitDescritor
          ? _value.codKitDescritor
          : codKitDescritor // ignore: cast_nullable_to_non_nullable
              as int?,
      kitDescritor: freezed == kitDescritor
          ? _value.kitDescritor
          : kitDescritor // ignore: cast_nullable_to_non_nullable
              as KitDescritorDropDownSearchResponseDTO?,
      codSituacao: freezed == codSituacao
          ? _value.codSituacao
          : codSituacao // ignore: cast_nullable_to_non_nullable
              as String?,
    ) as $Val);
  }

  @override
  @pragma('vm:prefer-inline')
  $KitDescritorDropDownSearchResponseDTOCopyWith<$Res>? get kitDescritor {
    if (_value.kitDescritor == null) {
      return null;
    }

    return $KitDescritorDropDownSearchResponseDTOCopyWith<$Res>(
        _value.kitDescritor!, (value) {
      return _then(_value.copyWith(kitDescritor: value) as $Val);
    });
  }
}

/// @nodoc
abstract class _$$ConsultaKitInventarioFilterImplCopyWith<$Res>
    implements $ConsultaKitInventarioFilterCopyWith<$Res> {
  factory _$$ConsultaKitInventarioFilterImplCopyWith(
          _$ConsultaKitInventarioFilterImpl value,
          $Res Function(_$ConsultaKitInventarioFilterImpl) then) =
      __$$ConsultaKitInventarioFilterImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {int? codKitDescritor,
      KitDescritorDropDownSearchResponseDTO? kitDescritor,
      String? codSituacao});

  @override
  $KitDescritorDropDownSearchResponseDTOCopyWith<$Res>? get kitDescritor;
}

/// @nodoc
class __$$ConsultaKitInventarioFilterImplCopyWithImpl<$Res>
    extends _$ConsultaKitInventarioFilterCopyWithImpl<$Res,
        _$ConsultaKitInventarioFilterImpl>
    implements _$$ConsultaKitInventarioFilterImplCopyWith<$Res> {
  __$$ConsultaKitInventarioFilterImplCopyWithImpl(
      _$ConsultaKitInventarioFilterImpl _value,
      $Res Function(_$ConsultaKitInventarioFilterImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? codKitDescritor = freezed,
    Object? kitDescritor = freezed,
    Object? codSituacao = freezed,
  }) {
    return _then(_$ConsultaKitInventarioFilterImpl(
      codKitDescritor: freezed == codKitDescritor
          ? _value.codKitDescritor
          : codKitDescritor // ignore: cast_nullable_to_non_nullable
              as int?,
      kitDescritor: freezed == kitDescritor
          ? _value.kitDescritor
          : kitDescritor // ignore: cast_nullable_to_non_nullable
              as KitDescritorDropDownSearchResponseDTO?,
      codSituacao: freezed == codSituacao
          ? _value.codSituacao
          : codSituacao // ignore: cast_nullable_to_non_nullable
              as String?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$ConsultaKitInventarioFilterImpl extends _ConsultaKitInventarioFilter {
  _$ConsultaKitInventarioFilterImpl(
      {required this.codKitDescritor,
      required this.kitDescritor,
      required this.codSituacao})
      : super._();

  factory _$ConsultaKitInventarioFilterImpl.fromJson(
          Map<String, dynamic> json) =>
      _$$ConsultaKitInventarioFilterImplFromJson(json);

  @override
  int? codKitDescritor;
  @override
  KitDescritorDropDownSearchResponseDTO? kitDescritor;
  @override
  String? codSituacao;

  @override
  String toString() {
    return 'ConsultaKitInventarioFilter(codKitDescritor: $codKitDescritor, kitDescritor: $kitDescritor, codSituacao: $codSituacao)';
  }

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$ConsultaKitInventarioFilterImplCopyWith<_$ConsultaKitInventarioFilterImpl>
      get copyWith => __$$ConsultaKitInventarioFilterImplCopyWithImpl<
          _$ConsultaKitInventarioFilterImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$ConsultaKitInventarioFilterImplToJson(
      this,
    );
  }
}

abstract class _ConsultaKitInventarioFilter
    extends ConsultaKitInventarioFilter {
  factory _ConsultaKitInventarioFilter(
      {required int? codKitDescritor,
      required KitDescritorDropDownSearchResponseDTO? kitDescritor,
      required String? codSituacao}) = _$ConsultaKitInventarioFilterImpl;
  _ConsultaKitInventarioFilter._() : super._();

  factory _ConsultaKitInventarioFilter.fromJson(Map<String, dynamic> json) =
      _$ConsultaKitInventarioFilterImpl.fromJson;

  @override
  int? get codKitDescritor;
  set codKitDescritor(int? value);
  @override
  KitDescritorDropDownSearchResponseDTO? get kitDescritor;
  set kitDescritor(KitDescritorDropDownSearchResponseDTO? value);
  @override
  String? get codSituacao;
  set codSituacao(String? value);
  @override
  @JsonKey(ignore: true)
  _$$ConsultaKitInventarioFilterImplCopyWith<_$ConsultaKitInventarioFilterImpl>
      get copyWith => throw _privateConstructorUsedError;
}
