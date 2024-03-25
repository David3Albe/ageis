// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'estoque_item_consignado_print_dto.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

EstoqueItemConsignadoPrintDTO _$EstoqueItemConsignadoPrintDTOFromJson(
    Map<String, dynamic> json) {
  return _EstoqueItemConsignadoPrintDTO.fromJson(json);
}

/// @nodoc
mixin _$EstoqueItemConsignadoPrintDTO {
  String get cod => throw _privateConstructorUsedError;
  set cod(String value) => throw _privateConstructorUsedError;
  String get nome => throw _privateConstructorUsedError;
  set nome(String value) => throw _privateConstructorUsedError;
  int get quantidade => throw _privateConstructorUsedError;
  set quantidade(int value) => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $EstoqueItemConsignadoPrintDTOCopyWith<EstoqueItemConsignadoPrintDTO>
      get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $EstoqueItemConsignadoPrintDTOCopyWith<$Res> {
  factory $EstoqueItemConsignadoPrintDTOCopyWith(
          EstoqueItemConsignadoPrintDTO value,
          $Res Function(EstoqueItemConsignadoPrintDTO) then) =
      _$EstoqueItemConsignadoPrintDTOCopyWithImpl<$Res,
          EstoqueItemConsignadoPrintDTO>;
  @useResult
  $Res call({String cod, String nome, int quantidade});
}

/// @nodoc
class _$EstoqueItemConsignadoPrintDTOCopyWithImpl<$Res,
        $Val extends EstoqueItemConsignadoPrintDTO>
    implements $EstoqueItemConsignadoPrintDTOCopyWith<$Res> {
  _$EstoqueItemConsignadoPrintDTOCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? cod = null,
    Object? nome = null,
    Object? quantidade = null,
  }) {
    return _then(_value.copyWith(
      cod: null == cod
          ? _value.cod
          : cod // ignore: cast_nullable_to_non_nullable
              as String,
      nome: null == nome
          ? _value.nome
          : nome // ignore: cast_nullable_to_non_nullable
              as String,
      quantidade: null == quantidade
          ? _value.quantidade
          : quantidade // ignore: cast_nullable_to_non_nullable
              as int,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$EstoqueItemConsignadoPrintDTOImplCopyWith<$Res>
    implements $EstoqueItemConsignadoPrintDTOCopyWith<$Res> {
  factory _$$EstoqueItemConsignadoPrintDTOImplCopyWith(
          _$EstoqueItemConsignadoPrintDTOImpl value,
          $Res Function(_$EstoqueItemConsignadoPrintDTOImpl) then) =
      __$$EstoqueItemConsignadoPrintDTOImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({String cod, String nome, int quantidade});
}

/// @nodoc
class __$$EstoqueItemConsignadoPrintDTOImplCopyWithImpl<$Res>
    extends _$EstoqueItemConsignadoPrintDTOCopyWithImpl<$Res,
        _$EstoqueItemConsignadoPrintDTOImpl>
    implements _$$EstoqueItemConsignadoPrintDTOImplCopyWith<$Res> {
  __$$EstoqueItemConsignadoPrintDTOImplCopyWithImpl(
      _$EstoqueItemConsignadoPrintDTOImpl _value,
      $Res Function(_$EstoqueItemConsignadoPrintDTOImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? cod = null,
    Object? nome = null,
    Object? quantidade = null,
  }) {
    return _then(_$EstoqueItemConsignadoPrintDTOImpl(
      cod: null == cod
          ? _value.cod
          : cod // ignore: cast_nullable_to_non_nullable
              as String,
      nome: null == nome
          ? _value.nome
          : nome // ignore: cast_nullable_to_non_nullable
              as String,
      quantidade: null == quantidade
          ? _value.quantidade
          : quantidade // ignore: cast_nullable_to_non_nullable
              as int,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$EstoqueItemConsignadoPrintDTOImpl
    with DiagnosticableTreeMixin
    implements _EstoqueItemConsignadoPrintDTO {
  _$EstoqueItemConsignadoPrintDTOImpl(
      {required this.cod, required this.nome, required this.quantidade});

  factory _$EstoqueItemConsignadoPrintDTOImpl.fromJson(
          Map<String, dynamic> json) =>
      _$$EstoqueItemConsignadoPrintDTOImplFromJson(json);

  @override
  String cod;
  @override
  String nome;
  @override
  int quantidade;

  @override
  String toString({DiagnosticLevel minLevel = DiagnosticLevel.info}) {
    return 'EstoqueItemConsignadoPrintDTO(cod: $cod, nome: $nome, quantidade: $quantidade)';
  }

  @override
  void debugFillProperties(DiagnosticPropertiesBuilder properties) {
    super.debugFillProperties(properties);
    properties
      ..add(DiagnosticsProperty('type', 'EstoqueItemConsignadoPrintDTO'))
      ..add(DiagnosticsProperty('cod', cod))
      ..add(DiagnosticsProperty('nome', nome))
      ..add(DiagnosticsProperty('quantidade', quantidade));
  }

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$EstoqueItemConsignadoPrintDTOImplCopyWith<
          _$EstoqueItemConsignadoPrintDTOImpl>
      get copyWith => __$$EstoqueItemConsignadoPrintDTOImplCopyWithImpl<
          _$EstoqueItemConsignadoPrintDTOImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$EstoqueItemConsignadoPrintDTOImplToJson(
      this,
    );
  }
}

abstract class _EstoqueItemConsignadoPrintDTO
    implements EstoqueItemConsignadoPrintDTO {
  factory _EstoqueItemConsignadoPrintDTO(
      {required String cod,
      required String nome,
      required int quantidade}) = _$EstoqueItemConsignadoPrintDTOImpl;

  factory _EstoqueItemConsignadoPrintDTO.fromJson(Map<String, dynamic> json) =
      _$EstoqueItemConsignadoPrintDTOImpl.fromJson;

  @override
  String get cod;
  set cod(String value);
  @override
  String get nome;
  set nome(String value);
  @override
  int get quantidade;
  set quantidade(int value);
  @override
  @JsonKey(ignore: true)
  _$$EstoqueItemConsignadoPrintDTOImplCopyWith<
          _$EstoqueItemConsignadoPrintDTOImpl>
      get copyWith => throw _privateConstructorUsedError;
}
