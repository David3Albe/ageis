// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'estoque_kit_print_dto.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

EstoqueKitPrintDTO _$EstoqueKitPrintDTOFromJson(Map<String, dynamic> json) {
  return _EstoqueKitPrintDTO.fromJson(json);
}

/// @nodoc
mixin _$EstoqueKitPrintDTO {
  String get codBarra => throw _privateConstructorUsedError;
  set codBarra(String value) => throw _privateConstructorUsedError;
  String get nome => throw _privateConstructorUsedError;
  set nome(String value) => throw _privateConstructorUsedError;
  List<EstoqueKitItemPrintDTO> get itens => throw _privateConstructorUsedError;
  set itens(List<EstoqueKitItemPrintDTO> value) =>
      throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $EstoqueKitPrintDTOCopyWith<EstoqueKitPrintDTO> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $EstoqueKitPrintDTOCopyWith<$Res> {
  factory $EstoqueKitPrintDTOCopyWith(
          EstoqueKitPrintDTO value, $Res Function(EstoqueKitPrintDTO) then) =
      _$EstoqueKitPrintDTOCopyWithImpl<$Res, EstoqueKitPrintDTO>;
  @useResult
  $Res call({String codBarra, String nome, List<EstoqueKitItemPrintDTO> itens});
}

/// @nodoc
class _$EstoqueKitPrintDTOCopyWithImpl<$Res, $Val extends EstoqueKitPrintDTO>
    implements $EstoqueKitPrintDTOCopyWith<$Res> {
  _$EstoqueKitPrintDTOCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? codBarra = null,
    Object? nome = null,
    Object? itens = null,
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
      itens: null == itens
          ? _value.itens
          : itens // ignore: cast_nullable_to_non_nullable
              as List<EstoqueKitItemPrintDTO>,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$EstoqueKitPrintDTOImplCopyWith<$Res>
    implements $EstoqueKitPrintDTOCopyWith<$Res> {
  factory _$$EstoqueKitPrintDTOImplCopyWith(_$EstoqueKitPrintDTOImpl value,
          $Res Function(_$EstoqueKitPrintDTOImpl) then) =
      __$$EstoqueKitPrintDTOImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({String codBarra, String nome, List<EstoqueKitItemPrintDTO> itens});
}

/// @nodoc
class __$$EstoqueKitPrintDTOImplCopyWithImpl<$Res>
    extends _$EstoqueKitPrintDTOCopyWithImpl<$Res, _$EstoqueKitPrintDTOImpl>
    implements _$$EstoqueKitPrintDTOImplCopyWith<$Res> {
  __$$EstoqueKitPrintDTOImplCopyWithImpl(_$EstoqueKitPrintDTOImpl _value,
      $Res Function(_$EstoqueKitPrintDTOImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? codBarra = null,
    Object? nome = null,
    Object? itens = null,
  }) {
    return _then(_$EstoqueKitPrintDTOImpl(
      codBarra: null == codBarra
          ? _value.codBarra
          : codBarra // ignore: cast_nullable_to_non_nullable
              as String,
      nome: null == nome
          ? _value.nome
          : nome // ignore: cast_nullable_to_non_nullable
              as String,
      itens: null == itens
          ? _value.itens
          : itens // ignore: cast_nullable_to_non_nullable
              as List<EstoqueKitItemPrintDTO>,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$EstoqueKitPrintDTOImpl
    with DiagnosticableTreeMixin
    implements _EstoqueKitPrintDTO {
  _$EstoqueKitPrintDTOImpl(
      {required this.codBarra, required this.nome, required this.itens});

  factory _$EstoqueKitPrintDTOImpl.fromJson(Map<String, dynamic> json) =>
      _$$EstoqueKitPrintDTOImplFromJson(json);

  @override
  String codBarra;
  @override
  String nome;
  @override
  List<EstoqueKitItemPrintDTO> itens;

  @override
  String toString({DiagnosticLevel minLevel = DiagnosticLevel.info}) {
    return 'EstoqueKitPrintDTO(codBarra: $codBarra, nome: $nome, itens: $itens)';
  }

  @override
  void debugFillProperties(DiagnosticPropertiesBuilder properties) {
    super.debugFillProperties(properties);
    properties
      ..add(DiagnosticsProperty('type', 'EstoqueKitPrintDTO'))
      ..add(DiagnosticsProperty('codBarra', codBarra))
      ..add(DiagnosticsProperty('nome', nome))
      ..add(DiagnosticsProperty('itens', itens));
  }

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$EstoqueKitPrintDTOImplCopyWith<_$EstoqueKitPrintDTOImpl> get copyWith =>
      __$$EstoqueKitPrintDTOImplCopyWithImpl<_$EstoqueKitPrintDTOImpl>(
          this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$EstoqueKitPrintDTOImplToJson(
      this,
    );
  }
}

abstract class _EstoqueKitPrintDTO implements EstoqueKitPrintDTO {
  factory _EstoqueKitPrintDTO(
      {required String codBarra,
      required String nome,
      required List<EstoqueKitItemPrintDTO> itens}) = _$EstoqueKitPrintDTOImpl;

  factory _EstoqueKitPrintDTO.fromJson(Map<String, dynamic> json) =
      _$EstoqueKitPrintDTOImpl.fromJson;

  @override
  String get codBarra;
  set codBarra(String value);
  @override
  String get nome;
  set nome(String value);
  @override
  List<EstoqueKitItemPrintDTO> get itens;
  set itens(List<EstoqueKitItemPrintDTO> value);
  @override
  @JsonKey(ignore: true)
  _$$EstoqueKitPrintDTOImplCopyWith<_$EstoqueKitPrintDTOImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
