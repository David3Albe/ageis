// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'turno_short_response_dto.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

TurnoShortResponseDTO _$TurnoShortResponseDTOFromJson(
    Map<String, dynamic> json) {
  return _TurnoShortResponseDTO.fromJson(json);
}

/// @nodoc
mixin _$TurnoShortResponseDTO {
  int get cod => throw _privateConstructorUsedError;
  set cod(int value) => throw _privateConstructorUsedError;
  String get descricao => throw _privateConstructorUsedError;
  set descricao(String value) => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $TurnoShortResponseDTOCopyWith<TurnoShortResponseDTO> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $TurnoShortResponseDTOCopyWith<$Res> {
  factory $TurnoShortResponseDTOCopyWith(TurnoShortResponseDTO value,
          $Res Function(TurnoShortResponseDTO) then) =
      _$TurnoShortResponseDTOCopyWithImpl<$Res, TurnoShortResponseDTO>;
  @useResult
  $Res call({int cod, String descricao});
}

/// @nodoc
class _$TurnoShortResponseDTOCopyWithImpl<$Res,
        $Val extends TurnoShortResponseDTO>
    implements $TurnoShortResponseDTOCopyWith<$Res> {
  _$TurnoShortResponseDTOCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? cod = null,
    Object? descricao = null,
  }) {
    return _then(_value.copyWith(
      cod: null == cod
          ? _value.cod
          : cod // ignore: cast_nullable_to_non_nullable
              as int,
      descricao: null == descricao
          ? _value.descricao
          : descricao // ignore: cast_nullable_to_non_nullable
              as String,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$TurnoShortResponseDTOImplCopyWith<$Res>
    implements $TurnoShortResponseDTOCopyWith<$Res> {
  factory _$$TurnoShortResponseDTOImplCopyWith(
          _$TurnoShortResponseDTOImpl value,
          $Res Function(_$TurnoShortResponseDTOImpl) then) =
      __$$TurnoShortResponseDTOImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({int cod, String descricao});
}

/// @nodoc
class __$$TurnoShortResponseDTOImplCopyWithImpl<$Res>
    extends _$TurnoShortResponseDTOCopyWithImpl<$Res,
        _$TurnoShortResponseDTOImpl>
    implements _$$TurnoShortResponseDTOImplCopyWith<$Res> {
  __$$TurnoShortResponseDTOImplCopyWithImpl(_$TurnoShortResponseDTOImpl _value,
      $Res Function(_$TurnoShortResponseDTOImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? cod = null,
    Object? descricao = null,
  }) {
    return _then(_$TurnoShortResponseDTOImpl(
      cod: null == cod
          ? _value.cod
          : cod // ignore: cast_nullable_to_non_nullable
              as int,
      descricao: null == descricao
          ? _value.descricao
          : descricao // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$TurnoShortResponseDTOImpl extends _TurnoShortResponseDTO {
  _$TurnoShortResponseDTOImpl({required this.cod, required this.descricao})
      : super._();

  factory _$TurnoShortResponseDTOImpl.fromJson(Map<String, dynamic> json) =>
      _$$TurnoShortResponseDTOImplFromJson(json);

  @override
  int cod;
  @override
  String descricao;

  @override
  String toString() {
    return 'TurnoShortResponseDTO(cod: $cod, descricao: $descricao)';
  }

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$TurnoShortResponseDTOImplCopyWith<_$TurnoShortResponseDTOImpl>
      get copyWith => __$$TurnoShortResponseDTOImplCopyWithImpl<
          _$TurnoShortResponseDTOImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$TurnoShortResponseDTOImplToJson(
      this,
    );
  }
}

abstract class _TurnoShortResponseDTO extends TurnoShortResponseDTO {
  factory _TurnoShortResponseDTO(
      {required int cod,
      required String descricao}) = _$TurnoShortResponseDTOImpl;
  _TurnoShortResponseDTO._() : super._();

  factory _TurnoShortResponseDTO.fromJson(Map<String, dynamic> json) =
      _$TurnoShortResponseDTOImpl.fromJson;

  @override
  int get cod;
  set cod(int value);
  @override
  String get descricao;
  set descricao(String value);
  @override
  @JsonKey(ignore: true)
  _$$TurnoShortResponseDTOImplCopyWith<_$TurnoShortResponseDTOImpl>
      get copyWith => throw _privateConstructorUsedError;
}
