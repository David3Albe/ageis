// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'item_drop_down_search_dto.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

ItemDropDownSearchDTO _$ItemDropDownSearchDTOFromJson(
    Map<String, dynamic> json) {
  return _ItemDropDownSearchDTO.fromJson(json);
}

/// @nodoc
mixin _$ItemDropDownSearchDTO {
  int get numeroRegistros => throw _privateConstructorUsedError;
  set numeroRegistros(int value) => throw _privateConstructorUsedError;
  String? get termoPesquisa => throw _privateConstructorUsedError;
  set termoPesquisa(String? value) => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $ItemDropDownSearchDTOCopyWith<ItemDropDownSearchDTO> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $ItemDropDownSearchDTOCopyWith<$Res> {
  factory $ItemDropDownSearchDTOCopyWith(ItemDropDownSearchDTO value,
          $Res Function(ItemDropDownSearchDTO) then) =
      _$ItemDropDownSearchDTOCopyWithImpl<$Res, ItemDropDownSearchDTO>;
  @useResult
  $Res call({int numeroRegistros, String? termoPesquisa});
}

/// @nodoc
class _$ItemDropDownSearchDTOCopyWithImpl<$Res,
        $Val extends ItemDropDownSearchDTO>
    implements $ItemDropDownSearchDTOCopyWith<$Res> {
  _$ItemDropDownSearchDTOCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? numeroRegistros = null,
    Object? termoPesquisa = freezed,
  }) {
    return _then(_value.copyWith(
      numeroRegistros: null == numeroRegistros
          ? _value.numeroRegistros
          : numeroRegistros // ignore: cast_nullable_to_non_nullable
              as int,
      termoPesquisa: freezed == termoPesquisa
          ? _value.termoPesquisa
          : termoPesquisa // ignore: cast_nullable_to_non_nullable
              as String?,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$ItemDropDownSearchDTOImplCopyWith<$Res>
    implements $ItemDropDownSearchDTOCopyWith<$Res> {
  factory _$$ItemDropDownSearchDTOImplCopyWith(
          _$ItemDropDownSearchDTOImpl value,
          $Res Function(_$ItemDropDownSearchDTOImpl) then) =
      __$$ItemDropDownSearchDTOImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({int numeroRegistros, String? termoPesquisa});
}

/// @nodoc
class __$$ItemDropDownSearchDTOImplCopyWithImpl<$Res>
    extends _$ItemDropDownSearchDTOCopyWithImpl<$Res,
        _$ItemDropDownSearchDTOImpl>
    implements _$$ItemDropDownSearchDTOImplCopyWith<$Res> {
  __$$ItemDropDownSearchDTOImplCopyWithImpl(_$ItemDropDownSearchDTOImpl _value,
      $Res Function(_$ItemDropDownSearchDTOImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? numeroRegistros = null,
    Object? termoPesquisa = freezed,
  }) {
    return _then(_$ItemDropDownSearchDTOImpl(
      numeroRegistros: null == numeroRegistros
          ? _value.numeroRegistros
          : numeroRegistros // ignore: cast_nullable_to_non_nullable
              as int,
      termoPesquisa: freezed == termoPesquisa
          ? _value.termoPesquisa
          : termoPesquisa // ignore: cast_nullable_to_non_nullable
              as String?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$ItemDropDownSearchDTOImpl implements _ItemDropDownSearchDTO {
  _$ItemDropDownSearchDTOImpl(
      {required this.numeroRegistros, this.termoPesquisa});

  factory _$ItemDropDownSearchDTOImpl.fromJson(Map<String, dynamic> json) =>
      _$$ItemDropDownSearchDTOImplFromJson(json);

  @override
  int numeroRegistros;
  @override
  String? termoPesquisa;

  @override
  String toString() {
    return 'ItemDropDownSearchDTO(numeroRegistros: $numeroRegistros, termoPesquisa: $termoPesquisa)';
  }

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$ItemDropDownSearchDTOImplCopyWith<_$ItemDropDownSearchDTOImpl>
      get copyWith => __$$ItemDropDownSearchDTOImplCopyWithImpl<
          _$ItemDropDownSearchDTOImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$ItemDropDownSearchDTOImplToJson(
      this,
    );
  }
}

abstract class _ItemDropDownSearchDTO implements ItemDropDownSearchDTO {
  factory _ItemDropDownSearchDTO(
      {required int numeroRegistros,
      String? termoPesquisa}) = _$ItemDropDownSearchDTOImpl;

  factory _ItemDropDownSearchDTO.fromJson(Map<String, dynamic> json) =
      _$ItemDropDownSearchDTOImpl.fromJson;

  @override
  int get numeroRegistros;
  set numeroRegistros(int value);
  @override
  String? get termoPesquisa;
  set termoPesquisa(String? value);
  @override
  @JsonKey(ignore: true)
  _$$ItemDropDownSearchDTOImplCopyWith<_$ItemDropDownSearchDTOImpl>
      get copyWith => throw _privateConstructorUsedError;
}
