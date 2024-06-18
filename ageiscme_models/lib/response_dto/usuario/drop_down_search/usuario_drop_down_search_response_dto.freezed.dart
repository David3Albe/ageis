// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'usuario_drop_down_search_response_dto.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

UsuarioDropDownSearchResponseDTO _$UsuarioDropDownSearchResponseDTOFromJson(
    Map<String, dynamic> json) {
  return _UsuarioDropDownSearchResponseDTO.fromJson(json);
}

/// @nodoc
mixin _$UsuarioDropDownSearchResponseDTO {
  int get cod => throw _privateConstructorUsedError;
  set cod(int value) => throw _privateConstructorUsedError;
  int get codBarra => throw _privateConstructorUsedError;
  set codBarra(int value) => throw _privateConstructorUsedError;
  String? get nome => throw _privateConstructorUsedError;
  set nome(String? value) => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $UsuarioDropDownSearchResponseDTOCopyWith<UsuarioDropDownSearchResponseDTO>
      get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $UsuarioDropDownSearchResponseDTOCopyWith<$Res> {
  factory $UsuarioDropDownSearchResponseDTOCopyWith(
          UsuarioDropDownSearchResponseDTO value,
          $Res Function(UsuarioDropDownSearchResponseDTO) then) =
      _$UsuarioDropDownSearchResponseDTOCopyWithImpl<$Res,
          UsuarioDropDownSearchResponseDTO>;
  @useResult
  $Res call({int cod, int codBarra, String? nome});
}

/// @nodoc
class _$UsuarioDropDownSearchResponseDTOCopyWithImpl<$Res,
        $Val extends UsuarioDropDownSearchResponseDTO>
    implements $UsuarioDropDownSearchResponseDTOCopyWith<$Res> {
  _$UsuarioDropDownSearchResponseDTOCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? cod = null,
    Object? codBarra = null,
    Object? nome = freezed,
  }) {
    return _then(_value.copyWith(
      cod: null == cod
          ? _value.cod
          : cod // ignore: cast_nullable_to_non_nullable
              as int,
      codBarra: null == codBarra
          ? _value.codBarra
          : codBarra // ignore: cast_nullable_to_non_nullable
              as int,
      nome: freezed == nome
          ? _value.nome
          : nome // ignore: cast_nullable_to_non_nullable
              as String?,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$UsuarioDropDownSearchResponseDTOImplCopyWith<$Res>
    implements $UsuarioDropDownSearchResponseDTOCopyWith<$Res> {
  factory _$$UsuarioDropDownSearchResponseDTOImplCopyWith(
          _$UsuarioDropDownSearchResponseDTOImpl value,
          $Res Function(_$UsuarioDropDownSearchResponseDTOImpl) then) =
      __$$UsuarioDropDownSearchResponseDTOImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({int cod, int codBarra, String? nome});
}

/// @nodoc
class __$$UsuarioDropDownSearchResponseDTOImplCopyWithImpl<$Res>
    extends _$UsuarioDropDownSearchResponseDTOCopyWithImpl<$Res,
        _$UsuarioDropDownSearchResponseDTOImpl>
    implements _$$UsuarioDropDownSearchResponseDTOImplCopyWith<$Res> {
  __$$UsuarioDropDownSearchResponseDTOImplCopyWithImpl(
      _$UsuarioDropDownSearchResponseDTOImpl _value,
      $Res Function(_$UsuarioDropDownSearchResponseDTOImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? cod = null,
    Object? codBarra = null,
    Object? nome = freezed,
  }) {
    return _then(_$UsuarioDropDownSearchResponseDTOImpl(
      cod: null == cod
          ? _value.cod
          : cod // ignore: cast_nullable_to_non_nullable
              as int,
      codBarra: null == codBarra
          ? _value.codBarra
          : codBarra // ignore: cast_nullable_to_non_nullable
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
class _$UsuarioDropDownSearchResponseDTOImpl
    extends _UsuarioDropDownSearchResponseDTO {
  _$UsuarioDropDownSearchResponseDTOImpl(
      {required this.cod, required this.codBarra, this.nome})
      : super._();

  factory _$UsuarioDropDownSearchResponseDTOImpl.fromJson(
          Map<String, dynamic> json) =>
      _$$UsuarioDropDownSearchResponseDTOImplFromJson(json);

  @override
  int cod;
  @override
  int codBarra;
  @override
  String? nome;

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$UsuarioDropDownSearchResponseDTOImplCopyWith<
          _$UsuarioDropDownSearchResponseDTOImpl>
      get copyWith => __$$UsuarioDropDownSearchResponseDTOImplCopyWithImpl<
          _$UsuarioDropDownSearchResponseDTOImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$UsuarioDropDownSearchResponseDTOImplToJson(
      this,
    );
  }
}

abstract class _UsuarioDropDownSearchResponseDTO
    extends UsuarioDropDownSearchResponseDTO {
  factory _UsuarioDropDownSearchResponseDTO(
      {required int cod,
      required int codBarra,
      String? nome}) = _$UsuarioDropDownSearchResponseDTOImpl;
  _UsuarioDropDownSearchResponseDTO._() : super._();

  factory _UsuarioDropDownSearchResponseDTO.fromJson(
          Map<String, dynamic> json) =
      _$UsuarioDropDownSearchResponseDTOImpl.fromJson;

  @override
  int get cod;
  set cod(int value);
  @override
  int get codBarra;
  set codBarra(int value);
  @override
  String? get nome;
  set nome(String? value);
  @override
  @JsonKey(ignore: true)
  _$$UsuarioDropDownSearchResponseDTOImplCopyWith<
          _$UsuarioDropDownSearchResponseDTOImpl>
      get copyWith => throw _privateConstructorUsedError;
}
