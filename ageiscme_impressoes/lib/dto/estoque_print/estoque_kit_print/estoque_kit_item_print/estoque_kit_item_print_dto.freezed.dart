// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'estoque_kit_item_print_dto.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

EstoqueKitItemPrintDTO _$EstoqueKitItemPrintDTOFromJson(
    Map<String, dynamic> json) {
  return _EstoqueKitItemPrintDTO.fromJson(json);
}

/// @nodoc
mixin _$EstoqueKitItemPrintDTO {
  String get codBarra => throw _privateConstructorUsedError;
  set codBarra(String value) => throw _privateConstructorUsedError;
  String get nome => throw _privateConstructorUsedError;
  set nome(String value) => throw _privateConstructorUsedError;
  bool get riscado => throw _privateConstructorUsedError;
  set riscado(bool value) => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $EstoqueKitItemPrintDTOCopyWith<EstoqueKitItemPrintDTO> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $EstoqueKitItemPrintDTOCopyWith<$Res> {
  factory $EstoqueKitItemPrintDTOCopyWith(EstoqueKitItemPrintDTO value,
          $Res Function(EstoqueKitItemPrintDTO) then) =
      _$EstoqueKitItemPrintDTOCopyWithImpl<$Res, EstoqueKitItemPrintDTO>;
  @useResult
  $Res call({String codBarra, String nome, bool riscado});
}

/// @nodoc
class _$EstoqueKitItemPrintDTOCopyWithImpl<$Res,
        $Val extends EstoqueKitItemPrintDTO>
    implements $EstoqueKitItemPrintDTOCopyWith<$Res> {
  _$EstoqueKitItemPrintDTOCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? codBarra = null,
    Object? nome = null,
    Object? riscado = null,
  }) {
    return _then(_value.copyWith(
      codBarra: null == codBarra
          ? _value.codBarra
          : codBarra // ignore: cast_nullable_to_non_nullable
              as String,
      nome: null == nome
          ? _value.nome
          : nome // ignore: cast_nullable_to_non_nullable
              as String,
      riscado: null == riscado
          ? _value.riscado
          : riscado // ignore: cast_nullable_to_non_nullable
              as bool,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$EstoqueKitItemPrintDTOImplCopyWith<$Res>
    implements $EstoqueKitItemPrintDTOCopyWith<$Res> {
  factory _$$EstoqueKitItemPrintDTOImplCopyWith(
          _$EstoqueKitItemPrintDTOImpl value,
          $Res Function(_$EstoqueKitItemPrintDTOImpl) then) =
      __$$EstoqueKitItemPrintDTOImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({String codBarra, String nome, bool riscado});
}

/// @nodoc
class __$$EstoqueKitItemPrintDTOImplCopyWithImpl<$Res>
    extends _$EstoqueKitItemPrintDTOCopyWithImpl<$Res,
        _$EstoqueKitItemPrintDTOImpl>
    implements _$$EstoqueKitItemPrintDTOImplCopyWith<$Res> {
  __$$EstoqueKitItemPrintDTOImplCopyWithImpl(
      _$EstoqueKitItemPrintDTOImpl _value,
      $Res Function(_$EstoqueKitItemPrintDTOImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? codBarra = null,
    Object? nome = null,
    Object? riscado = null,
  }) {
    return _then(_$EstoqueKitItemPrintDTOImpl(
      codBarra: null == codBarra
          ? _value.codBarra
          : codBarra // ignore: cast_nullable_to_non_nullable
              as String,
      nome: null == nome
          ? _value.nome
          : nome // ignore: cast_nullable_to_non_nullable
              as String,
      riscado: null == riscado
          ? _value.riscado
          : riscado // ignore: cast_nullable_to_non_nullable
              as bool,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$EstoqueKitItemPrintDTOImpl
    with DiagnosticableTreeMixin
    implements _EstoqueKitItemPrintDTO {
  _$EstoqueKitItemPrintDTOImpl(
      {required this.codBarra, required this.nome, required this.riscado});

  factory _$EstoqueKitItemPrintDTOImpl.fromJson(Map<String, dynamic> json) =>
      _$$EstoqueKitItemPrintDTOImplFromJson(json);

  @override
  String codBarra;
  @override
  String nome;
  @override
  bool riscado;

  @override
  String toString({DiagnosticLevel minLevel = DiagnosticLevel.info}) {
    return 'EstoqueKitItemPrintDTO(codBarra: $codBarra, nome: $nome, riscado: $riscado)';
  }

  @override
  void debugFillProperties(DiagnosticPropertiesBuilder properties) {
    super.debugFillProperties(properties);
    properties
      ..add(DiagnosticsProperty('type', 'EstoqueKitItemPrintDTO'))
      ..add(DiagnosticsProperty('codBarra', codBarra))
      ..add(DiagnosticsProperty('nome', nome))
      ..add(DiagnosticsProperty('riscado', riscado));
  }

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$EstoqueKitItemPrintDTOImplCopyWith<_$EstoqueKitItemPrintDTOImpl>
      get copyWith => __$$EstoqueKitItemPrintDTOImplCopyWithImpl<
          _$EstoqueKitItemPrintDTOImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$EstoqueKitItemPrintDTOImplToJson(
      this,
    );
  }
}

abstract class _EstoqueKitItemPrintDTO implements EstoqueKitItemPrintDTO {
  factory _EstoqueKitItemPrintDTO(
      {required String codBarra,
      required String nome,
      required bool riscado}) = _$EstoqueKitItemPrintDTOImpl;

  factory _EstoqueKitItemPrintDTO.fromJson(Map<String, dynamic> json) =
      _$EstoqueKitItemPrintDTOImpl.fromJson;

  @override
  String get codBarra;
  set codBarra(String value);
  @override
  String get nome;
  set nome(String value);
  @override
  bool get riscado;
  set riscado(bool value);
  @override
  @JsonKey(ignore: true)
  _$$EstoqueKitItemPrintDTOImplCopyWith<_$EstoqueKitItemPrintDTOImpl>
      get copyWith => throw _privateConstructorUsedError;
}
