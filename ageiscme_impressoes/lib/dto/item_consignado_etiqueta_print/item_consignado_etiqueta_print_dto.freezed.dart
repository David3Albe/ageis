// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'item_consignado_etiqueta_print_dto.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

ItemConsignadoEtiquetaPrintDTO _$ItemConsignadoEtiquetaPrintDTOFromJson(
    Map<String, dynamic> json) {
  return _ItemConsignadoEtiquetaPrintDTO.fromJson(json);
}

/// @nodoc
mixin _$ItemConsignadoEtiquetaPrintDTO {
  String get idEtiqueta => throw _privateConstructorUsedError;
  set idEtiqueta(String value) => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $ItemConsignadoEtiquetaPrintDTOCopyWith<ItemConsignadoEtiquetaPrintDTO>
      get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $ItemConsignadoEtiquetaPrintDTOCopyWith<$Res> {
  factory $ItemConsignadoEtiquetaPrintDTOCopyWith(
          ItemConsignadoEtiquetaPrintDTO value,
          $Res Function(ItemConsignadoEtiquetaPrintDTO) then) =
      _$ItemConsignadoEtiquetaPrintDTOCopyWithImpl<$Res,
          ItemConsignadoEtiquetaPrintDTO>;
  @useResult
  $Res call({String idEtiqueta});
}

/// @nodoc
class _$ItemConsignadoEtiquetaPrintDTOCopyWithImpl<$Res,
        $Val extends ItemConsignadoEtiquetaPrintDTO>
    implements $ItemConsignadoEtiquetaPrintDTOCopyWith<$Res> {
  _$ItemConsignadoEtiquetaPrintDTOCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? idEtiqueta = null,
  }) {
    return _then(_value.copyWith(
      idEtiqueta: null == idEtiqueta
          ? _value.idEtiqueta
          : idEtiqueta // ignore: cast_nullable_to_non_nullable
              as String,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$ItemConsignadoEtiquetaPrintDTOImplCopyWith<$Res>
    implements $ItemConsignadoEtiquetaPrintDTOCopyWith<$Res> {
  factory _$$ItemConsignadoEtiquetaPrintDTOImplCopyWith(
          _$ItemConsignadoEtiquetaPrintDTOImpl value,
          $Res Function(_$ItemConsignadoEtiquetaPrintDTOImpl) then) =
      __$$ItemConsignadoEtiquetaPrintDTOImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({String idEtiqueta});
}

/// @nodoc
class __$$ItemConsignadoEtiquetaPrintDTOImplCopyWithImpl<$Res>
    extends _$ItemConsignadoEtiquetaPrintDTOCopyWithImpl<$Res,
        _$ItemConsignadoEtiquetaPrintDTOImpl>
    implements _$$ItemConsignadoEtiquetaPrintDTOImplCopyWith<$Res> {
  __$$ItemConsignadoEtiquetaPrintDTOImplCopyWithImpl(
      _$ItemConsignadoEtiquetaPrintDTOImpl _value,
      $Res Function(_$ItemConsignadoEtiquetaPrintDTOImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? idEtiqueta = null,
  }) {
    return _then(_$ItemConsignadoEtiquetaPrintDTOImpl(
      idEtiqueta: null == idEtiqueta
          ? _value.idEtiqueta
          : idEtiqueta // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$ItemConsignadoEtiquetaPrintDTOImpl
    with DiagnosticableTreeMixin
    implements _ItemConsignadoEtiquetaPrintDTO {
  _$ItemConsignadoEtiquetaPrintDTOImpl({required this.idEtiqueta});

  factory _$ItemConsignadoEtiquetaPrintDTOImpl.fromJson(
          Map<String, dynamic> json) =>
      _$$ItemConsignadoEtiquetaPrintDTOImplFromJson(json);

  @override
  String idEtiqueta;

  @override
  String toString({DiagnosticLevel minLevel = DiagnosticLevel.info}) {
    return 'ItemConsignadoEtiquetaPrintDTO(idEtiqueta: $idEtiqueta)';
  }

  @override
  void debugFillProperties(DiagnosticPropertiesBuilder properties) {
    super.debugFillProperties(properties);
    properties
      ..add(DiagnosticsProperty('type', 'ItemConsignadoEtiquetaPrintDTO'))
      ..add(DiagnosticsProperty('idEtiqueta', idEtiqueta));
  }

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$ItemConsignadoEtiquetaPrintDTOImplCopyWith<
          _$ItemConsignadoEtiquetaPrintDTOImpl>
      get copyWith => __$$ItemConsignadoEtiquetaPrintDTOImplCopyWithImpl<
          _$ItemConsignadoEtiquetaPrintDTOImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$ItemConsignadoEtiquetaPrintDTOImplToJson(
      this,
    );
  }
}

abstract class _ItemConsignadoEtiquetaPrintDTO
    implements ItemConsignadoEtiquetaPrintDTO {
  factory _ItemConsignadoEtiquetaPrintDTO({required String idEtiqueta}) =
      _$ItemConsignadoEtiquetaPrintDTOImpl;

  factory _ItemConsignadoEtiquetaPrintDTO.fromJson(Map<String, dynamic> json) =
      _$ItemConsignadoEtiquetaPrintDTOImpl.fromJson;

  @override
  String get idEtiqueta;
  set idEtiqueta(String value);
  @override
  @JsonKey(ignore: true)
  _$$ItemConsignadoEtiquetaPrintDTOImplCopyWith<
          _$ItemConsignadoEtiquetaPrintDTOImpl>
      get copyWith => throw _privateConstructorUsedError;
}
