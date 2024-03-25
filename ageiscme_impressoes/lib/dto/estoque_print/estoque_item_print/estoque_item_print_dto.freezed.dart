// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'estoque_item_print_dto.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

EstoqueItemPrintDTO _$EstoqueItemPrintDTOFromJson(Map<String, dynamic> json) {
  return _EstoqueItemPrintDTO.fromJson(json);
}

/// @nodoc
mixin _$EstoqueItemPrintDTO {
  String get codBarra => throw _privateConstructorUsedError;
  set codBarra(String value) => throw _privateConstructorUsedError;
  String get nome => throw _privateConstructorUsedError;
  set nome(String value) => throw _privateConstructorUsedError;
  List<EstoqueItemConsignadoPrintDTO> get consignados =>
      throw _privateConstructorUsedError;
  set consignados(List<EstoqueItemConsignadoPrintDTO> value) =>
      throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $EstoqueItemPrintDTOCopyWith<EstoqueItemPrintDTO> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $EstoqueItemPrintDTOCopyWith<$Res> {
  factory $EstoqueItemPrintDTOCopyWith(
          EstoqueItemPrintDTO value, $Res Function(EstoqueItemPrintDTO) then) =
      _$EstoqueItemPrintDTOCopyWithImpl<$Res, EstoqueItemPrintDTO>;
  @useResult
  $Res call(
      {String codBarra,
      String nome,
      List<EstoqueItemConsignadoPrintDTO> consignados});
}

/// @nodoc
class _$EstoqueItemPrintDTOCopyWithImpl<$Res, $Val extends EstoqueItemPrintDTO>
    implements $EstoqueItemPrintDTOCopyWith<$Res> {
  _$EstoqueItemPrintDTOCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? codBarra = null,
    Object? nome = null,
    Object? consignados = null,
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
      consignados: null == consignados
          ? _value.consignados
          : consignados // ignore: cast_nullable_to_non_nullable
              as List<EstoqueItemConsignadoPrintDTO>,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$EstoqueItemPrintDTOImplCopyWith<$Res>
    implements $EstoqueItemPrintDTOCopyWith<$Res> {
  factory _$$EstoqueItemPrintDTOImplCopyWith(_$EstoqueItemPrintDTOImpl value,
          $Res Function(_$EstoqueItemPrintDTOImpl) then) =
      __$$EstoqueItemPrintDTOImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {String codBarra,
      String nome,
      List<EstoqueItemConsignadoPrintDTO> consignados});
}

/// @nodoc
class __$$EstoqueItemPrintDTOImplCopyWithImpl<$Res>
    extends _$EstoqueItemPrintDTOCopyWithImpl<$Res, _$EstoqueItemPrintDTOImpl>
    implements _$$EstoqueItemPrintDTOImplCopyWith<$Res> {
  __$$EstoqueItemPrintDTOImplCopyWithImpl(_$EstoqueItemPrintDTOImpl _value,
      $Res Function(_$EstoqueItemPrintDTOImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? codBarra = null,
    Object? nome = null,
    Object? consignados = null,
  }) {
    return _then(_$EstoqueItemPrintDTOImpl(
      codBarra: null == codBarra
          ? _value.codBarra
          : codBarra // ignore: cast_nullable_to_non_nullable
              as String,
      nome: null == nome
          ? _value.nome
          : nome // ignore: cast_nullable_to_non_nullable
              as String,
      consignados: null == consignados
          ? _value.consignados
          : consignados // ignore: cast_nullable_to_non_nullable
              as List<EstoqueItemConsignadoPrintDTO>,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$EstoqueItemPrintDTOImpl
    with DiagnosticableTreeMixin
    implements _EstoqueItemPrintDTO {
  _$EstoqueItemPrintDTOImpl(
      {required this.codBarra, required this.nome, required this.consignados});

  factory _$EstoqueItemPrintDTOImpl.fromJson(Map<String, dynamic> json) =>
      _$$EstoqueItemPrintDTOImplFromJson(json);

  @override
  String codBarra;
  @override
  String nome;
  @override
  List<EstoqueItemConsignadoPrintDTO> consignados;

  @override
  String toString({DiagnosticLevel minLevel = DiagnosticLevel.info}) {
    return 'EstoqueItemPrintDTO(codBarra: $codBarra, nome: $nome, consignados: $consignados)';
  }

  @override
  void debugFillProperties(DiagnosticPropertiesBuilder properties) {
    super.debugFillProperties(properties);
    properties
      ..add(DiagnosticsProperty('type', 'EstoqueItemPrintDTO'))
      ..add(DiagnosticsProperty('codBarra', codBarra))
      ..add(DiagnosticsProperty('nome', nome))
      ..add(DiagnosticsProperty('consignados', consignados));
  }

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$EstoqueItemPrintDTOImplCopyWith<_$EstoqueItemPrintDTOImpl> get copyWith =>
      __$$EstoqueItemPrintDTOImplCopyWithImpl<_$EstoqueItemPrintDTOImpl>(
          this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$EstoqueItemPrintDTOImplToJson(
      this,
    );
  }
}

abstract class _EstoqueItemPrintDTO implements EstoqueItemPrintDTO {
  factory _EstoqueItemPrintDTO(
          {required String codBarra,
          required String nome,
          required List<EstoqueItemConsignadoPrintDTO> consignados}) =
      _$EstoqueItemPrintDTOImpl;

  factory _EstoqueItemPrintDTO.fromJson(Map<String, dynamic> json) =
      _$EstoqueItemPrintDTOImpl.fromJson;

  @override
  String get codBarra;
  set codBarra(String value);
  @override
  String get nome;
  set nome(String value);
  @override
  List<EstoqueItemConsignadoPrintDTO> get consignados;
  set consignados(List<EstoqueItemConsignadoPrintDTO> value);
  @override
  @JsonKey(ignore: true)
  _$$EstoqueItemPrintDTOImplCopyWith<_$EstoqueItemPrintDTOImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
