// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'item_descritor_drop_down_search_response_dto.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

ItemDescritorDropDownSearchResponseDTO
    _$ItemDescritorDropDownSearchResponseDTOFromJson(
        Map<String, dynamic> json) {
  return _ItemDescritorDropDownSearchResponseDTO.fromJson(json);
}

/// @nodoc
mixin _$ItemDescritorDropDownSearchResponseDTO {
  int get cod => throw _privateConstructorUsedError;
  set cod(int value) => throw _privateConstructorUsedError;
  String? get nome => throw _privateConstructorUsedError;
  set nome(String? value) => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $ItemDescritorDropDownSearchResponseDTOCopyWith<
          ItemDescritorDropDownSearchResponseDTO>
      get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $ItemDescritorDropDownSearchResponseDTOCopyWith<$Res> {
  factory $ItemDescritorDropDownSearchResponseDTOCopyWith(
          ItemDescritorDropDownSearchResponseDTO value,
          $Res Function(ItemDescritorDropDownSearchResponseDTO) then) =
      _$ItemDescritorDropDownSearchResponseDTOCopyWithImpl<$Res,
          ItemDescritorDropDownSearchResponseDTO>;
  @useResult
  $Res call({int cod, String? nome});
}

/// @nodoc
class _$ItemDescritorDropDownSearchResponseDTOCopyWithImpl<$Res,
        $Val extends ItemDescritorDropDownSearchResponseDTO>
    implements $ItemDescritorDropDownSearchResponseDTOCopyWith<$Res> {
  _$ItemDescritorDropDownSearchResponseDTOCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? cod = null,
    Object? nome = freezed,
  }) {
    return _then(_value.copyWith(
      cod: null == cod
          ? _value.cod
          : cod // ignore: cast_nullable_to_non_nullable
              as int,
      nome: freezed == nome
          ? _value.nome
          : nome // ignore: cast_nullable_to_non_nullable
              as String?,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$ItemDescritorDropDownSearchResponseDTOImplCopyWith<$Res>
    implements $ItemDescritorDropDownSearchResponseDTOCopyWith<$Res> {
  factory _$$ItemDescritorDropDownSearchResponseDTOImplCopyWith(
          _$ItemDescritorDropDownSearchResponseDTOImpl value,
          $Res Function(_$ItemDescritorDropDownSearchResponseDTOImpl) then) =
      __$$ItemDescritorDropDownSearchResponseDTOImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({int cod, String? nome});
}

/// @nodoc
class __$$ItemDescritorDropDownSearchResponseDTOImplCopyWithImpl<$Res>
    extends _$ItemDescritorDropDownSearchResponseDTOCopyWithImpl<$Res,
        _$ItemDescritorDropDownSearchResponseDTOImpl>
    implements _$$ItemDescritorDropDownSearchResponseDTOImplCopyWith<$Res> {
  __$$ItemDescritorDropDownSearchResponseDTOImplCopyWithImpl(
      _$ItemDescritorDropDownSearchResponseDTOImpl _value,
      $Res Function(_$ItemDescritorDropDownSearchResponseDTOImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? cod = null,
    Object? nome = freezed,
  }) {
    return _then(_$ItemDescritorDropDownSearchResponseDTOImpl(
      cod: null == cod
          ? _value.cod
          : cod // ignore: cast_nullable_to_non_nullable
              as int,
      nome: freezed == nome
          ? _value.nome
          : nome // ignore: cast_nullable_to_non_nullable
              as String?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$ItemDescritorDropDownSearchResponseDTOImpl
    extends _ItemDescritorDropDownSearchResponseDTO
    with DiagnosticableTreeMixin {
  _$ItemDescritorDropDownSearchResponseDTOImpl({required this.cod, this.nome})
      : super._();

  factory _$ItemDescritorDropDownSearchResponseDTOImpl.fromJson(
          Map<String, dynamic> json) =>
      _$$ItemDescritorDropDownSearchResponseDTOImplFromJson(json);

  @override
  int cod;
  @override
  String? nome;

  @override
  String toString({DiagnosticLevel minLevel = DiagnosticLevel.info}) {
    return 'ItemDescritorDropDownSearchResponseDTO(cod: $cod, nome: $nome)';
  }

  @override
  void debugFillProperties(DiagnosticPropertiesBuilder properties) {
    super.debugFillProperties(properties);
    properties
      ..add(
          DiagnosticsProperty('type', 'ItemDescritorDropDownSearchResponseDTO'))
      ..add(DiagnosticsProperty('cod', cod))
      ..add(DiagnosticsProperty('nome', nome));
  }

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$ItemDescritorDropDownSearchResponseDTOImplCopyWith<
          _$ItemDescritorDropDownSearchResponseDTOImpl>
      get copyWith =>
          __$$ItemDescritorDropDownSearchResponseDTOImplCopyWithImpl<
              _$ItemDescritorDropDownSearchResponseDTOImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$ItemDescritorDropDownSearchResponseDTOImplToJson(
      this,
    );
  }
}

abstract class _ItemDescritorDropDownSearchResponseDTO
    extends ItemDescritorDropDownSearchResponseDTO {
  factory _ItemDescritorDropDownSearchResponseDTO(
      {required int cod,
      String? nome}) = _$ItemDescritorDropDownSearchResponseDTOImpl;
  _ItemDescritorDropDownSearchResponseDTO._() : super._();

  factory _ItemDescritorDropDownSearchResponseDTO.fromJson(
          Map<String, dynamic> json) =
      _$ItemDescritorDropDownSearchResponseDTOImpl.fromJson;

  @override
  int get cod;
  set cod(int value);
  @override
  String? get nome;
  set nome(String? value);
  @override
  @JsonKey(ignore: true)
  _$$ItemDescritorDropDownSearchResponseDTOImplCopyWith<
          _$ItemDescritorDropDownSearchResponseDTOImpl>
      get copyWith => throw _privateConstructorUsedError;
}
