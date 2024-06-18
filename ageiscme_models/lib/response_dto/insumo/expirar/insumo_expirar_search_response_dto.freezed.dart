// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'insumo_expirar_search_response_dto.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

InsumoExpirarSearchResponseDTO _$InsumoExpirarSearchResponseDTOFromJson(
    Map<String, dynamic> json) {
  return _InsumoExpirarSearchResponseDTO.fromJson(json);
}

/// @nodoc
mixin _$InsumoExpirarSearchResponseDTO {
  int? get codInsumo => throw _privateConstructorUsedError;
  set codInsumo(int? value) => throw _privateConstructorUsedError;
  String get nome => throw _privateConstructorUsedError;
  set nome(String value) => throw _privateConstructorUsedError;
  String? get lote => throw _privateConstructorUsedError;
  set lote(String? value) => throw _privateConstructorUsedError;
  DateTime? get dataValidade => throw _privateConstructorUsedError;
  set dataValidade(DateTime? value) => throw _privateConstructorUsedError;
  double? get quantidade => throw _privateConstructorUsedError;
  set quantidade(double? value) => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $InsumoExpirarSearchResponseDTOCopyWith<InsumoExpirarSearchResponseDTO>
      get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $InsumoExpirarSearchResponseDTOCopyWith<$Res> {
  factory $InsumoExpirarSearchResponseDTOCopyWith(
          InsumoExpirarSearchResponseDTO value,
          $Res Function(InsumoExpirarSearchResponseDTO) then) =
      _$InsumoExpirarSearchResponseDTOCopyWithImpl<$Res,
          InsumoExpirarSearchResponseDTO>;
  @useResult
  $Res call(
      {int? codInsumo,
      String nome,
      String? lote,
      DateTime? dataValidade,
      double? quantidade});
}

/// @nodoc
class _$InsumoExpirarSearchResponseDTOCopyWithImpl<$Res,
        $Val extends InsumoExpirarSearchResponseDTO>
    implements $InsumoExpirarSearchResponseDTOCopyWith<$Res> {
  _$InsumoExpirarSearchResponseDTOCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? codInsumo = freezed,
    Object? nome = null,
    Object? lote = freezed,
    Object? dataValidade = freezed,
    Object? quantidade = freezed,
  }) {
    return _then(_value.copyWith(
      codInsumo: freezed == codInsumo
          ? _value.codInsumo
          : codInsumo // ignore: cast_nullable_to_non_nullable
              as int?,
      nome: null == nome
          ? _value.nome
          : nome // ignore: cast_nullable_to_non_nullable
              as String,
      lote: freezed == lote
          ? _value.lote
          : lote // ignore: cast_nullable_to_non_nullable
              as String?,
      dataValidade: freezed == dataValidade
          ? _value.dataValidade
          : dataValidade // ignore: cast_nullable_to_non_nullable
              as DateTime?,
      quantidade: freezed == quantidade
          ? _value.quantidade
          : quantidade // ignore: cast_nullable_to_non_nullable
              as double?,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$InsumoExpirarSearchResponseDTOImplCopyWith<$Res>
    implements $InsumoExpirarSearchResponseDTOCopyWith<$Res> {
  factory _$$InsumoExpirarSearchResponseDTOImplCopyWith(
          _$InsumoExpirarSearchResponseDTOImpl value,
          $Res Function(_$InsumoExpirarSearchResponseDTOImpl) then) =
      __$$InsumoExpirarSearchResponseDTOImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {int? codInsumo,
      String nome,
      String? lote,
      DateTime? dataValidade,
      double? quantidade});
}

/// @nodoc
class __$$InsumoExpirarSearchResponseDTOImplCopyWithImpl<$Res>
    extends _$InsumoExpirarSearchResponseDTOCopyWithImpl<$Res,
        _$InsumoExpirarSearchResponseDTOImpl>
    implements _$$InsumoExpirarSearchResponseDTOImplCopyWith<$Res> {
  __$$InsumoExpirarSearchResponseDTOImplCopyWithImpl(
      _$InsumoExpirarSearchResponseDTOImpl _value,
      $Res Function(_$InsumoExpirarSearchResponseDTOImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? codInsumo = freezed,
    Object? nome = null,
    Object? lote = freezed,
    Object? dataValidade = freezed,
    Object? quantidade = freezed,
  }) {
    return _then(_$InsumoExpirarSearchResponseDTOImpl(
      codInsumo: freezed == codInsumo
          ? _value.codInsumo
          : codInsumo // ignore: cast_nullable_to_non_nullable
              as int?,
      nome: null == nome
          ? _value.nome
          : nome // ignore: cast_nullable_to_non_nullable
              as String,
      lote: freezed == lote
          ? _value.lote
          : lote // ignore: cast_nullable_to_non_nullable
              as String?,
      dataValidade: freezed == dataValidade
          ? _value.dataValidade
          : dataValidade // ignore: cast_nullable_to_non_nullable
              as DateTime?,
      quantidade: freezed == quantidade
          ? _value.quantidade
          : quantidade // ignore: cast_nullable_to_non_nullable
              as double?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$InsumoExpirarSearchResponseDTOImpl
    extends _InsumoExpirarSearchResponseDTO with DiagnosticableTreeMixin {
  _$InsumoExpirarSearchResponseDTOImpl(
      {this.codInsumo,
      required this.nome,
      this.lote,
      this.dataValidade,
      this.quantidade})
      : super._();

  factory _$InsumoExpirarSearchResponseDTOImpl.fromJson(
          Map<String, dynamic> json) =>
      _$$InsumoExpirarSearchResponseDTOImplFromJson(json);

  @override
  int? codInsumo;
  @override
  String nome;
  @override
  String? lote;
  @override
  DateTime? dataValidade;
  @override
  double? quantidade;

  @override
  String toString({DiagnosticLevel minLevel = DiagnosticLevel.info}) {
    return 'InsumoExpirarSearchResponseDTO(codInsumo: $codInsumo, nome: $nome, lote: $lote, dataValidade: $dataValidade, quantidade: $quantidade)';
  }

  @override
  void debugFillProperties(DiagnosticPropertiesBuilder properties) {
    super.debugFillProperties(properties);
    properties
      ..add(DiagnosticsProperty('type', 'InsumoExpirarSearchResponseDTO'))
      ..add(DiagnosticsProperty('codInsumo', codInsumo))
      ..add(DiagnosticsProperty('nome', nome))
      ..add(DiagnosticsProperty('lote', lote))
      ..add(DiagnosticsProperty('dataValidade', dataValidade))
      ..add(DiagnosticsProperty('quantidade', quantidade));
  }

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$InsumoExpirarSearchResponseDTOImplCopyWith<
          _$InsumoExpirarSearchResponseDTOImpl>
      get copyWith => __$$InsumoExpirarSearchResponseDTOImplCopyWithImpl<
          _$InsumoExpirarSearchResponseDTOImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$InsumoExpirarSearchResponseDTOImplToJson(
      this,
    );
  }
}

abstract class _InsumoExpirarSearchResponseDTO
    extends InsumoExpirarSearchResponseDTO {
  factory _InsumoExpirarSearchResponseDTO(
      {int? codInsumo,
      required String nome,
      String? lote,
      DateTime? dataValidade,
      double? quantidade}) = _$InsumoExpirarSearchResponseDTOImpl;
  _InsumoExpirarSearchResponseDTO._() : super._();

  factory _InsumoExpirarSearchResponseDTO.fromJson(Map<String, dynamic> json) =
      _$InsumoExpirarSearchResponseDTOImpl.fromJson;

  @override
  int? get codInsumo;
  set codInsumo(int? value);
  @override
  String get nome;
  set nome(String value);
  @override
  String? get lote;
  set lote(String? value);
  @override
  DateTime? get dataValidade;
  set dataValidade(DateTime? value);
  @override
  double? get quantidade;
  set quantidade(double? value);
  @override
  @JsonKey(ignore: true)
  _$$InsumoExpirarSearchResponseDTOImplCopyWith<
          _$InsumoExpirarSearchResponseDTOImpl>
      get copyWith => throw _privateConstructorUsedError;
}
