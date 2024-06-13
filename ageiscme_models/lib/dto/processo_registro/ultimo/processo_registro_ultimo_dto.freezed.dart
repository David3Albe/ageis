// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'processo_registro_ultimo_dto.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

ProcessoRegistroUltimoDTO _$ProcessoRegistroUltimoDTOFromJson(
    Map<String, dynamic> json) {
  return _ProcessoRegistroUltimoDTO.fromJson(json);
}

/// @nodoc
mixin _$ProcessoRegistroUltimoDTO {
  int? get codItem => throw _privateConstructorUsedError;
  set codItem(int? value) => throw _privateConstructorUsedError;
  int? get codEtapa => throw _privateConstructorUsedError;
  set codEtapa(int? value) => throw _privateConstructorUsedError;
  bool? get incluirEstoque => throw _privateConstructorUsedError;
  set incluirEstoque(bool? value) => throw _privateConstructorUsedError;
  bool? get carregarEtapa => throw _privateConstructorUsedError;
  set carregarEtapa(bool? value) => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $ProcessoRegistroUltimoDTOCopyWith<ProcessoRegistroUltimoDTO> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $ProcessoRegistroUltimoDTOCopyWith<$Res> {
  factory $ProcessoRegistroUltimoDTOCopyWith(ProcessoRegistroUltimoDTO value,
          $Res Function(ProcessoRegistroUltimoDTO) then) =
      _$ProcessoRegistroUltimoDTOCopyWithImpl<$Res, ProcessoRegistroUltimoDTO>;
  @useResult
  $Res call(
      {int? codItem, int? codEtapa, bool? incluirEstoque, bool? carregarEtapa});
}

/// @nodoc
class _$ProcessoRegistroUltimoDTOCopyWithImpl<$Res,
        $Val extends ProcessoRegistroUltimoDTO>
    implements $ProcessoRegistroUltimoDTOCopyWith<$Res> {
  _$ProcessoRegistroUltimoDTOCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? codItem = freezed,
    Object? codEtapa = freezed,
    Object? incluirEstoque = freezed,
    Object? carregarEtapa = freezed,
  }) {
    return _then(_value.copyWith(
      codItem: freezed == codItem
          ? _value.codItem
          : codItem // ignore: cast_nullable_to_non_nullable
              as int?,
      codEtapa: freezed == codEtapa
          ? _value.codEtapa
          : codEtapa // ignore: cast_nullable_to_non_nullable
              as int?,
      incluirEstoque: freezed == incluirEstoque
          ? _value.incluirEstoque
          : incluirEstoque // ignore: cast_nullable_to_non_nullable
              as bool?,
      carregarEtapa: freezed == carregarEtapa
          ? _value.carregarEtapa
          : carregarEtapa // ignore: cast_nullable_to_non_nullable
              as bool?,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$ProcessoRegistroUltimoDTOImplCopyWith<$Res>
    implements $ProcessoRegistroUltimoDTOCopyWith<$Res> {
  factory _$$ProcessoRegistroUltimoDTOImplCopyWith(
          _$ProcessoRegistroUltimoDTOImpl value,
          $Res Function(_$ProcessoRegistroUltimoDTOImpl) then) =
      __$$ProcessoRegistroUltimoDTOImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {int? codItem, int? codEtapa, bool? incluirEstoque, bool? carregarEtapa});
}

/// @nodoc
class __$$ProcessoRegistroUltimoDTOImplCopyWithImpl<$Res>
    extends _$ProcessoRegistroUltimoDTOCopyWithImpl<$Res,
        _$ProcessoRegistroUltimoDTOImpl>
    implements _$$ProcessoRegistroUltimoDTOImplCopyWith<$Res> {
  __$$ProcessoRegistroUltimoDTOImplCopyWithImpl(
      _$ProcessoRegistroUltimoDTOImpl _value,
      $Res Function(_$ProcessoRegistroUltimoDTOImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? codItem = freezed,
    Object? codEtapa = freezed,
    Object? incluirEstoque = freezed,
    Object? carregarEtapa = freezed,
  }) {
    return _then(_$ProcessoRegistroUltimoDTOImpl(
      codItem: freezed == codItem
          ? _value.codItem
          : codItem // ignore: cast_nullable_to_non_nullable
              as int?,
      codEtapa: freezed == codEtapa
          ? _value.codEtapa
          : codEtapa // ignore: cast_nullable_to_non_nullable
              as int?,
      incluirEstoque: freezed == incluirEstoque
          ? _value.incluirEstoque
          : incluirEstoque // ignore: cast_nullable_to_non_nullable
              as bool?,
      carregarEtapa: freezed == carregarEtapa
          ? _value.carregarEtapa
          : carregarEtapa // ignore: cast_nullable_to_non_nullable
              as bool?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$ProcessoRegistroUltimoDTOImpl
    with DiagnosticableTreeMixin
    implements _ProcessoRegistroUltimoDTO {
  _$ProcessoRegistroUltimoDTOImpl(
      {this.codItem, this.codEtapa, this.incluirEstoque, this.carregarEtapa});

  factory _$ProcessoRegistroUltimoDTOImpl.fromJson(Map<String, dynamic> json) =>
      _$$ProcessoRegistroUltimoDTOImplFromJson(json);

  @override
  int? codItem;
  @override
  int? codEtapa;
  @override
  bool? incluirEstoque;
  @override
  bool? carregarEtapa;

  @override
  String toString({DiagnosticLevel minLevel = DiagnosticLevel.info}) {
    return 'ProcessoRegistroUltimoDTO(codItem: $codItem, codEtapa: $codEtapa, incluirEstoque: $incluirEstoque, carregarEtapa: $carregarEtapa)';
  }

  @override
  void debugFillProperties(DiagnosticPropertiesBuilder properties) {
    super.debugFillProperties(properties);
    properties
      ..add(DiagnosticsProperty('type', 'ProcessoRegistroUltimoDTO'))
      ..add(DiagnosticsProperty('codItem', codItem))
      ..add(DiagnosticsProperty('codEtapa', codEtapa))
      ..add(DiagnosticsProperty('incluirEstoque', incluirEstoque))
      ..add(DiagnosticsProperty('carregarEtapa', carregarEtapa));
  }

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$ProcessoRegistroUltimoDTOImplCopyWith<_$ProcessoRegistroUltimoDTOImpl>
      get copyWith => __$$ProcessoRegistroUltimoDTOImplCopyWithImpl<
          _$ProcessoRegistroUltimoDTOImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$ProcessoRegistroUltimoDTOImplToJson(
      this,
    );
  }
}

abstract class _ProcessoRegistroUltimoDTO implements ProcessoRegistroUltimoDTO {
  factory _ProcessoRegistroUltimoDTO(
      {int? codItem,
      int? codEtapa,
      bool? incluirEstoque,
      bool? carregarEtapa}) = _$ProcessoRegistroUltimoDTOImpl;

  factory _ProcessoRegistroUltimoDTO.fromJson(Map<String, dynamic> json) =
      _$ProcessoRegistroUltimoDTOImpl.fromJson;

  @override
  int? get codItem;
  set codItem(int? value);
  @override
  int? get codEtapa;
  set codEtapa(int? value);
  @override
  bool? get incluirEstoque;
  set incluirEstoque(bool? value);
  @override
  bool? get carregarEtapa;
  set carregarEtapa(bool? value);
  @override
  @JsonKey(ignore: true)
  _$$ProcessoRegistroUltimoDTOImplCopyWith<_$ProcessoRegistroUltimoDTOImpl>
      get copyWith => throw _privateConstructorUsedError;
}
