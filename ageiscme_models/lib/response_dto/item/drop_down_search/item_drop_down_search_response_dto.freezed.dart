// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'item_drop_down_search_response_dto.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

ItemDropDownSearchResponseDTO _$ItemDropDownSearchResponseDTOFromJson(
    Map<String, dynamic> json) {
  return _ItemDropDownSearchResponseDTO.fromJson(json);
}

/// @nodoc
mixin _$ItemDropDownSearchResponseDTO {
  int get cod => throw _privateConstructorUsedError;
  set cod(int value) => throw _privateConstructorUsedError;
  String get idEtiqueta => throw _privateConstructorUsedError;
  set idEtiqueta(String value) => throw _privateConstructorUsedError;
  String? get descricao => throw _privateConstructorUsedError;
  set descricao(String? value) => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $ItemDropDownSearchResponseDTOCopyWith<ItemDropDownSearchResponseDTO>
      get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $ItemDropDownSearchResponseDTOCopyWith<$Res> {
  factory $ItemDropDownSearchResponseDTOCopyWith(
          ItemDropDownSearchResponseDTO value,
          $Res Function(ItemDropDownSearchResponseDTO) then) =
      _$ItemDropDownSearchResponseDTOCopyWithImpl<$Res,
          ItemDropDownSearchResponseDTO>;
  @useResult
  $Res call({int cod, String idEtiqueta, String? descricao});
}

/// @nodoc
class _$ItemDropDownSearchResponseDTOCopyWithImpl<$Res,
        $Val extends ItemDropDownSearchResponseDTO>
    implements $ItemDropDownSearchResponseDTOCopyWith<$Res> {
  _$ItemDropDownSearchResponseDTOCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? cod = null,
    Object? idEtiqueta = null,
    Object? descricao = freezed,
  }) {
    return _then(_value.copyWith(
      cod: null == cod
          ? _value.cod
          : cod // ignore: cast_nullable_to_non_nullable
              as int,
      idEtiqueta: null == idEtiqueta
          ? _value.idEtiqueta
          : idEtiqueta // ignore: cast_nullable_to_non_nullable
              as String,
      descricao: freezed == descricao
          ? _value.descricao
          : descricao // ignore: cast_nullable_to_non_nullable
              as String?,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$ItemDropDownSearchResponseDTOImplCopyWith<$Res>
    implements $ItemDropDownSearchResponseDTOCopyWith<$Res> {
  factory _$$ItemDropDownSearchResponseDTOImplCopyWith(
          _$ItemDropDownSearchResponseDTOImpl value,
          $Res Function(_$ItemDropDownSearchResponseDTOImpl) then) =
      __$$ItemDropDownSearchResponseDTOImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({int cod, String idEtiqueta, String? descricao});
}

/// @nodoc
class __$$ItemDropDownSearchResponseDTOImplCopyWithImpl<$Res>
    extends _$ItemDropDownSearchResponseDTOCopyWithImpl<$Res,
        _$ItemDropDownSearchResponseDTOImpl>
    implements _$$ItemDropDownSearchResponseDTOImplCopyWith<$Res> {
  __$$ItemDropDownSearchResponseDTOImplCopyWithImpl(
      _$ItemDropDownSearchResponseDTOImpl _value,
      $Res Function(_$ItemDropDownSearchResponseDTOImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? cod = null,
    Object? idEtiqueta = null,
    Object? descricao = freezed,
  }) {
    return _then(_$ItemDropDownSearchResponseDTOImpl(
      cod: null == cod
          ? _value.cod
          : cod // ignore: cast_nullable_to_non_nullable
              as int,
      idEtiqueta: null == idEtiqueta
          ? _value.idEtiqueta
          : idEtiqueta // ignore: cast_nullable_to_non_nullable
              as String,
      descricao: freezed == descricao
          ? _value.descricao
          : descricao // ignore: cast_nullable_to_non_nullable
              as String?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$ItemDropDownSearchResponseDTOImpl extends _ItemDropDownSearchResponseDTO
    with DiagnosticableTreeMixin {
  _$ItemDropDownSearchResponseDTOImpl(
      {required this.cod, required this.idEtiqueta, this.descricao})
      : super._();

  factory _$ItemDropDownSearchResponseDTOImpl.fromJson(
          Map<String, dynamic> json) =>
      _$$ItemDropDownSearchResponseDTOImplFromJson(json);

  @override
  int cod;
  @override
  String idEtiqueta;
  @override
  String? descricao;

  @override
  String toString({DiagnosticLevel minLevel = DiagnosticLevel.info}) {
    return 'ItemDropDownSearchResponseDTO(cod: $cod, idEtiqueta: $idEtiqueta, descricao: $descricao)';
  }

  @override
  void debugFillProperties(DiagnosticPropertiesBuilder properties) {
    super.debugFillProperties(properties);
    properties
      ..add(DiagnosticsProperty('type', 'ItemDropDownSearchResponseDTO'))
      ..add(DiagnosticsProperty('cod', cod))
      ..add(DiagnosticsProperty('idEtiqueta', idEtiqueta))
      ..add(DiagnosticsProperty('descricao', descricao));
  }

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$ItemDropDownSearchResponseDTOImplCopyWith<
          _$ItemDropDownSearchResponseDTOImpl>
      get copyWith => __$$ItemDropDownSearchResponseDTOImplCopyWithImpl<
          _$ItemDropDownSearchResponseDTOImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$ItemDropDownSearchResponseDTOImplToJson(
      this,
    );
  }
}

abstract class _ItemDropDownSearchResponseDTO
    extends ItemDropDownSearchResponseDTO {
  factory _ItemDropDownSearchResponseDTO(
      {required int cod,
      required String idEtiqueta,
      String? descricao}) = _$ItemDropDownSearchResponseDTOImpl;
  _ItemDropDownSearchResponseDTO._() : super._();

  factory _ItemDropDownSearchResponseDTO.fromJson(Map<String, dynamic> json) =
      _$ItemDropDownSearchResponseDTOImpl.fromJson;

  @override
  int get cod;
  set cod(int value);
  @override
  String get idEtiqueta;
  set idEtiqueta(String value);
  @override
  String? get descricao;
  set descricao(String? value);
  @override
  @JsonKey(ignore: true)
  _$$ItemDropDownSearchResponseDTOImplCopyWith<
          _$ItemDropDownSearchResponseDTOImpl>
      get copyWith => throw _privateConstructorUsedError;
}
