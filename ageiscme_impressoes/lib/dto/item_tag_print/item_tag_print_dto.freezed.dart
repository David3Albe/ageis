// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'item_tag_print_dto.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

ItemTagPrintDTO _$ItemTagPrintDTOFromJson(Map<String, dynamic> json) {
  return _ItemTagPrintDTO.fromJson(json);
}

/// @nodoc
mixin _$ItemTagPrintDTO {
  String get descricaoItem => throw _privateConstructorUsedError;
  set descricaoItem(String value) => throw _privateConstructorUsedError;
  String get descricaoProprietario => throw _privateConstructorUsedError;
  set descricaoProprietario(String value) => throw _privateConstructorUsedError;
  String get idEtiqueta => throw _privateConstructorUsedError;
  set idEtiqueta(String value) => throw _privateConstructorUsedError;
  String? get restricao => throw _privateConstructorUsedError;
  set restricao(String? value) => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $ItemTagPrintDTOCopyWith<ItemTagPrintDTO> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $ItemTagPrintDTOCopyWith<$Res> {
  factory $ItemTagPrintDTOCopyWith(
          ItemTagPrintDTO value, $Res Function(ItemTagPrintDTO) then) =
      _$ItemTagPrintDTOCopyWithImpl<$Res, ItemTagPrintDTO>;
  @useResult
  $Res call(
      {String descricaoItem,
      String descricaoProprietario,
      String idEtiqueta,
      String? restricao});
}

/// @nodoc
class _$ItemTagPrintDTOCopyWithImpl<$Res, $Val extends ItemTagPrintDTO>
    implements $ItemTagPrintDTOCopyWith<$Res> {
  _$ItemTagPrintDTOCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? descricaoItem = null,
    Object? descricaoProprietario = null,
    Object? idEtiqueta = null,
    Object? restricao = freezed,
  }) {
    return _then(_value.copyWith(
      descricaoItem: null == descricaoItem
          ? _value.descricaoItem
          : descricaoItem // ignore: cast_nullable_to_non_nullable
              as String,
      descricaoProprietario: null == descricaoProprietario
          ? _value.descricaoProprietario
          : descricaoProprietario // ignore: cast_nullable_to_non_nullable
              as String,
      idEtiqueta: null == idEtiqueta
          ? _value.idEtiqueta
          : idEtiqueta // ignore: cast_nullable_to_non_nullable
              as String,
      restricao: freezed == restricao
          ? _value.restricao
          : restricao // ignore: cast_nullable_to_non_nullable
              as String?,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$ItemTagPrintDTOImplCopyWith<$Res>
    implements $ItemTagPrintDTOCopyWith<$Res> {
  factory _$$ItemTagPrintDTOImplCopyWith(_$ItemTagPrintDTOImpl value,
          $Res Function(_$ItemTagPrintDTOImpl) then) =
      __$$ItemTagPrintDTOImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {String descricaoItem,
      String descricaoProprietario,
      String idEtiqueta,
      String? restricao});
}

/// @nodoc
class __$$ItemTagPrintDTOImplCopyWithImpl<$Res>
    extends _$ItemTagPrintDTOCopyWithImpl<$Res, _$ItemTagPrintDTOImpl>
    implements _$$ItemTagPrintDTOImplCopyWith<$Res> {
  __$$ItemTagPrintDTOImplCopyWithImpl(
      _$ItemTagPrintDTOImpl _value, $Res Function(_$ItemTagPrintDTOImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? descricaoItem = null,
    Object? descricaoProprietario = null,
    Object? idEtiqueta = null,
    Object? restricao = freezed,
  }) {
    return _then(_$ItemTagPrintDTOImpl(
      descricaoItem: null == descricaoItem
          ? _value.descricaoItem
          : descricaoItem // ignore: cast_nullable_to_non_nullable
              as String,
      descricaoProprietario: null == descricaoProprietario
          ? _value.descricaoProprietario
          : descricaoProprietario // ignore: cast_nullable_to_non_nullable
              as String,
      idEtiqueta: null == idEtiqueta
          ? _value.idEtiqueta
          : idEtiqueta // ignore: cast_nullable_to_non_nullable
              as String,
      restricao: freezed == restricao
          ? _value.restricao
          : restricao // ignore: cast_nullable_to_non_nullable
              as String?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$ItemTagPrintDTOImpl
    with DiagnosticableTreeMixin
    implements _ItemTagPrintDTO {
  _$ItemTagPrintDTOImpl(
      {required this.descricaoItem,
      required this.descricaoProprietario,
      required this.idEtiqueta,
      this.restricao});

  factory _$ItemTagPrintDTOImpl.fromJson(Map<String, dynamic> json) =>
      _$$ItemTagPrintDTOImplFromJson(json);

  @override
  String descricaoItem;
  @override
  String descricaoProprietario;
  @override
  String idEtiqueta;
  @override
  String? restricao;

  @override
  String toString({DiagnosticLevel minLevel = DiagnosticLevel.info}) {
    return 'ItemTagPrintDTO(descricaoItem: $descricaoItem, descricaoProprietario: $descricaoProprietario, idEtiqueta: $idEtiqueta, restricao: $restricao)';
  }

  @override
  void debugFillProperties(DiagnosticPropertiesBuilder properties) {
    super.debugFillProperties(properties);
    properties
      ..add(DiagnosticsProperty('type', 'ItemTagPrintDTO'))
      ..add(DiagnosticsProperty('descricaoItem', descricaoItem))
      ..add(DiagnosticsProperty('descricaoProprietario', descricaoProprietario))
      ..add(DiagnosticsProperty('idEtiqueta', idEtiqueta))
      ..add(DiagnosticsProperty('restricao', restricao));
  }

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$ItemTagPrintDTOImplCopyWith<_$ItemTagPrintDTOImpl> get copyWith =>
      __$$ItemTagPrintDTOImplCopyWithImpl<_$ItemTagPrintDTOImpl>(
          this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$ItemTagPrintDTOImplToJson(
      this,
    );
  }
}

abstract class _ItemTagPrintDTO implements ItemTagPrintDTO {
  factory _ItemTagPrintDTO(
      {required String descricaoItem,
      required String descricaoProprietario,
      required String idEtiqueta,
      String? restricao}) = _$ItemTagPrintDTOImpl;

  factory _ItemTagPrintDTO.fromJson(Map<String, dynamic> json) =
      _$ItemTagPrintDTOImpl.fromJson;

  @override
  String get descricaoItem;
  set descricaoItem(String value);
  @override
  String get descricaoProprietario;
  set descricaoProprietario(String value);
  @override
  String get idEtiqueta;
  set idEtiqueta(String value);
  @override
  String? get restricao;
  set restricao(String? value);
  @override
  @JsonKey(ignore: true)
  _$$ItemTagPrintDTOImplCopyWith<_$ItemTagPrintDTOImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
