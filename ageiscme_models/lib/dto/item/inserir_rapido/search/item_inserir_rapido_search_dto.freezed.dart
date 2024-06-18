// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'item_inserir_rapido_search_dto.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

ItemInserirRapidoSearchDTO _$ItemInserirRapidoSearchDTOFromJson(
    Map<String, dynamic> json) {
  return _ItemInserirRapidoSearchDTO.fromJson(json);
}

/// @nodoc
mixin _$ItemInserirRapidoSearchDTO {
  int get codItem => throw _privateConstructorUsedError;
  set codItem(int value) => throw _privateConstructorUsedError;
  String get idEtiqueta => throw _privateConstructorUsedError;
  set idEtiqueta(String value) => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $ItemInserirRapidoSearchDTOCopyWith<ItemInserirRapidoSearchDTO>
      get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $ItemInserirRapidoSearchDTOCopyWith<$Res> {
  factory $ItemInserirRapidoSearchDTOCopyWith(ItemInserirRapidoSearchDTO value,
          $Res Function(ItemInserirRapidoSearchDTO) then) =
      _$ItemInserirRapidoSearchDTOCopyWithImpl<$Res,
          ItemInserirRapidoSearchDTO>;
  @useResult
  $Res call({int codItem, String idEtiqueta});
}

/// @nodoc
class _$ItemInserirRapidoSearchDTOCopyWithImpl<$Res,
        $Val extends ItemInserirRapidoSearchDTO>
    implements $ItemInserirRapidoSearchDTOCopyWith<$Res> {
  _$ItemInserirRapidoSearchDTOCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? codItem = null,
    Object? idEtiqueta = null,
  }) {
    return _then(_value.copyWith(
      codItem: null == codItem
          ? _value.codItem
          : codItem // ignore: cast_nullable_to_non_nullable
              as int,
      idEtiqueta: null == idEtiqueta
          ? _value.idEtiqueta
          : idEtiqueta // ignore: cast_nullable_to_non_nullable
              as String,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$ItemInserirRapidoSearchDTOImplCopyWith<$Res>
    implements $ItemInserirRapidoSearchDTOCopyWith<$Res> {
  factory _$$ItemInserirRapidoSearchDTOImplCopyWith(
          _$ItemInserirRapidoSearchDTOImpl value,
          $Res Function(_$ItemInserirRapidoSearchDTOImpl) then) =
      __$$ItemInserirRapidoSearchDTOImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({int codItem, String idEtiqueta});
}

/// @nodoc
class __$$ItemInserirRapidoSearchDTOImplCopyWithImpl<$Res>
    extends _$ItemInserirRapidoSearchDTOCopyWithImpl<$Res,
        _$ItemInserirRapidoSearchDTOImpl>
    implements _$$ItemInserirRapidoSearchDTOImplCopyWith<$Res> {
  __$$ItemInserirRapidoSearchDTOImplCopyWithImpl(
      _$ItemInserirRapidoSearchDTOImpl _value,
      $Res Function(_$ItemInserirRapidoSearchDTOImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? codItem = null,
    Object? idEtiqueta = null,
  }) {
    return _then(_$ItemInserirRapidoSearchDTOImpl(
      codItem: null == codItem
          ? _value.codItem
          : codItem // ignore: cast_nullable_to_non_nullable
              as int,
      idEtiqueta: null == idEtiqueta
          ? _value.idEtiqueta
          : idEtiqueta // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$ItemInserirRapidoSearchDTOImpl implements _ItemInserirRapidoSearchDTO {
  _$ItemInserirRapidoSearchDTOImpl(
      {required this.codItem, required this.idEtiqueta});

  factory _$ItemInserirRapidoSearchDTOImpl.fromJson(
          Map<String, dynamic> json) =>
      _$$ItemInserirRapidoSearchDTOImplFromJson(json);

  @override
  int codItem;
  @override
  String idEtiqueta;

  @override
  String toString() {
    return 'ItemInserirRapidoSearchDTO(codItem: $codItem, idEtiqueta: $idEtiqueta)';
  }

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$ItemInserirRapidoSearchDTOImplCopyWith<_$ItemInserirRapidoSearchDTOImpl>
      get copyWith => __$$ItemInserirRapidoSearchDTOImplCopyWithImpl<
          _$ItemInserirRapidoSearchDTOImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$ItemInserirRapidoSearchDTOImplToJson(
      this,
    );
  }
}

abstract class _ItemInserirRapidoSearchDTO
    implements ItemInserirRapidoSearchDTO {
  factory _ItemInserirRapidoSearchDTO(
      {required int codItem,
      required String idEtiqueta}) = _$ItemInserirRapidoSearchDTOImpl;

  factory _ItemInserirRapidoSearchDTO.fromJson(Map<String, dynamic> json) =
      _$ItemInserirRapidoSearchDTOImpl.fromJson;

  @override
  int get codItem;
  set codItem(int value);
  @override
  String get idEtiqueta;
  set idEtiqueta(String value);
  @override
  @JsonKey(ignore: true)
  _$$ItemInserirRapidoSearchDTOImplCopyWith<_$ItemInserirRapidoSearchDTOImpl>
      get copyWith => throw _privateConstructorUsedError;
}
