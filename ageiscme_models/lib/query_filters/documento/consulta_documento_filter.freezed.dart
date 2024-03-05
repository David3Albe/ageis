// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'consulta_documento_filter.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

ConsultaDocumentoFilter _$ConsultaDocumentoFilterFromJson(
    Map<String, dynamic> json) {
  return _ConsultaDocumentoFilter.fromJson(json);
}

/// @nodoc
mixin _$ConsultaDocumentoFilter {
  int? get codTipo => throw _privateConstructorUsedError;
  set codTipo(int? value) => throw _privateConstructorUsedError;
  String? get descricao => throw _privateConstructorUsedError;
  set descricao(String? value) => throw _privateConstructorUsedError;
  bool? get validade => throw _privateConstructorUsedError;
  set validade(bool? value) => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $ConsultaDocumentoFilterCopyWith<ConsultaDocumentoFilter> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $ConsultaDocumentoFilterCopyWith<$Res> {
  factory $ConsultaDocumentoFilterCopyWith(ConsultaDocumentoFilter value,
          $Res Function(ConsultaDocumentoFilter) then) =
      _$ConsultaDocumentoFilterCopyWithImpl<$Res, ConsultaDocumentoFilter>;
  @useResult
  $Res call({int? codTipo, String? descricao, bool? validade});
}

/// @nodoc
class _$ConsultaDocumentoFilterCopyWithImpl<$Res,
        $Val extends ConsultaDocumentoFilter>
    implements $ConsultaDocumentoFilterCopyWith<$Res> {
  _$ConsultaDocumentoFilterCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? codTipo = freezed,
    Object? descricao = freezed,
    Object? validade = freezed,
  }) {
    return _then(_value.copyWith(
      codTipo: freezed == codTipo
          ? _value.codTipo
          : codTipo // ignore: cast_nullable_to_non_nullable
              as int?,
      descricao: freezed == descricao
          ? _value.descricao
          : descricao // ignore: cast_nullable_to_non_nullable
              as String?,
      validade: freezed == validade
          ? _value.validade
          : validade // ignore: cast_nullable_to_non_nullable
              as bool?,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$ConsultaDocumentoFilterImplCopyWith<$Res>
    implements $ConsultaDocumentoFilterCopyWith<$Res> {
  factory _$$ConsultaDocumentoFilterImplCopyWith(
          _$ConsultaDocumentoFilterImpl value,
          $Res Function(_$ConsultaDocumentoFilterImpl) then) =
      __$$ConsultaDocumentoFilterImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({int? codTipo, String? descricao, bool? validade});
}

/// @nodoc
class __$$ConsultaDocumentoFilterImplCopyWithImpl<$Res>
    extends _$ConsultaDocumentoFilterCopyWithImpl<$Res,
        _$ConsultaDocumentoFilterImpl>
    implements _$$ConsultaDocumentoFilterImplCopyWith<$Res> {
  __$$ConsultaDocumentoFilterImplCopyWithImpl(
      _$ConsultaDocumentoFilterImpl _value,
      $Res Function(_$ConsultaDocumentoFilterImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? codTipo = freezed,
    Object? descricao = freezed,
    Object? validade = freezed,
  }) {
    return _then(_$ConsultaDocumentoFilterImpl(
      codTipo: freezed == codTipo
          ? _value.codTipo
          : codTipo // ignore: cast_nullable_to_non_nullable
              as int?,
      descricao: freezed == descricao
          ? _value.descricao
          : descricao // ignore: cast_nullable_to_non_nullable
              as String?,
      validade: freezed == validade
          ? _value.validade
          : validade // ignore: cast_nullable_to_non_nullable
              as bool?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$ConsultaDocumentoFilterImpl extends _ConsultaDocumentoFilter {
  _$ConsultaDocumentoFilterImpl(
      {required this.codTipo, required this.descricao, required this.validade})
      : super._();

  factory _$ConsultaDocumentoFilterImpl.fromJson(Map<String, dynamic> json) =>
      _$$ConsultaDocumentoFilterImplFromJson(json);

  @override
  int? codTipo;
  @override
  String? descricao;
  @override
  bool? validade;

  @override
  String toString() {
    return 'ConsultaDocumentoFilter(codTipo: $codTipo, descricao: $descricao, validade: $validade)';
  }

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$ConsultaDocumentoFilterImplCopyWith<_$ConsultaDocumentoFilterImpl>
      get copyWith => __$$ConsultaDocumentoFilterImplCopyWithImpl<
          _$ConsultaDocumentoFilterImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$ConsultaDocumentoFilterImplToJson(
      this,
    );
  }
}

abstract class _ConsultaDocumentoFilter extends ConsultaDocumentoFilter {
  factory _ConsultaDocumentoFilter(
      {required int? codTipo,
      required String? descricao,
      required bool? validade}) = _$ConsultaDocumentoFilterImpl;
  _ConsultaDocumentoFilter._() : super._();

  factory _ConsultaDocumentoFilter.fromJson(Map<String, dynamic> json) =
      _$ConsultaDocumentoFilterImpl.fromJson;

  @override
  int? get codTipo;
  set codTipo(int? value);
  @override
  String? get descricao;
  set descricao(String? value);
  @override
  bool? get validade;
  set validade(bool? value);
  @override
  @JsonKey(ignore: true)
  _$$ConsultaDocumentoFilterImplCopyWith<_$ConsultaDocumentoFilterImpl>
      get copyWith => throw _privateConstructorUsedError;
}
