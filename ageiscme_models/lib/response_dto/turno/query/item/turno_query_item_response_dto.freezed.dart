// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'turno_query_item_response_dto.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

TurnoQueryItemResponseDTO _$TurnoQueryItemResponseDTOFromJson(
    Map<String, dynamic> json) {
  return _TurnoQueryItemResponseDTO.fromJson(json);
}

/// @nodoc
mixin _$TurnoQueryItemResponseDTO {
  int get cod => throw _privateConstructorUsedError;
  set cod(int value) => throw _privateConstructorUsedError;
  String get descricao => throw _privateConstructorUsedError;
  set descricao(String value) => throw _privateConstructorUsedError;
  bool get ativo => throw _privateConstructorUsedError;
  set ativo(bool value) => throw _privateConstructorUsedError;
  String get tstamp => throw _privateConstructorUsedError;
  set tstamp(String value) => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $TurnoQueryItemResponseDTOCopyWith<TurnoQueryItemResponseDTO> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $TurnoQueryItemResponseDTOCopyWith<$Res> {
  factory $TurnoQueryItemResponseDTOCopyWith(TurnoQueryItemResponseDTO value,
          $Res Function(TurnoQueryItemResponseDTO) then) =
      _$TurnoQueryItemResponseDTOCopyWithImpl<$Res, TurnoQueryItemResponseDTO>;
  @useResult
  $Res call({int cod, String descricao, bool ativo, String tstamp});
}

/// @nodoc
class _$TurnoQueryItemResponseDTOCopyWithImpl<$Res,
        $Val extends TurnoQueryItemResponseDTO>
    implements $TurnoQueryItemResponseDTOCopyWith<$Res> {
  _$TurnoQueryItemResponseDTOCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? cod = null,
    Object? descricao = null,
    Object? ativo = null,
    Object? tstamp = null,
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
      ativo: null == ativo
          ? _value.ativo
          : ativo // ignore: cast_nullable_to_non_nullable
              as bool,
      tstamp: null == tstamp
          ? _value.tstamp
          : tstamp // ignore: cast_nullable_to_non_nullable
              as String,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$TurnoQueryItemResponseDTOImplCopyWith<$Res>
    implements $TurnoQueryItemResponseDTOCopyWith<$Res> {
  factory _$$TurnoQueryItemResponseDTOImplCopyWith(
          _$TurnoQueryItemResponseDTOImpl value,
          $Res Function(_$TurnoQueryItemResponseDTOImpl) then) =
      __$$TurnoQueryItemResponseDTOImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({int cod, String descricao, bool ativo, String tstamp});
}

/// @nodoc
class __$$TurnoQueryItemResponseDTOImplCopyWithImpl<$Res>
    extends _$TurnoQueryItemResponseDTOCopyWithImpl<$Res,
        _$TurnoQueryItemResponseDTOImpl>
    implements _$$TurnoQueryItemResponseDTOImplCopyWith<$Res> {
  __$$TurnoQueryItemResponseDTOImplCopyWithImpl(
      _$TurnoQueryItemResponseDTOImpl _value,
      $Res Function(_$TurnoQueryItemResponseDTOImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? cod = null,
    Object? descricao = null,
    Object? ativo = null,
    Object? tstamp = null,
  }) {
    return _then(_$TurnoQueryItemResponseDTOImpl(
      cod: null == cod
          ? _value.cod
          : cod // ignore: cast_nullable_to_non_nullable
              as int,
      descricao: null == descricao
          ? _value.descricao
          : descricao // ignore: cast_nullable_to_non_nullable
              as String,
      ativo: null == ativo
          ? _value.ativo
          : ativo // ignore: cast_nullable_to_non_nullable
              as bool,
      tstamp: null == tstamp
          ? _value.tstamp
          : tstamp // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$TurnoQueryItemResponseDTOImpl implements _TurnoQueryItemResponseDTO {
  _$TurnoQueryItemResponseDTOImpl(
      {required this.cod,
      required this.descricao,
      required this.ativo,
      required this.tstamp});

  factory _$TurnoQueryItemResponseDTOImpl.fromJson(Map<String, dynamic> json) =>
      _$$TurnoQueryItemResponseDTOImplFromJson(json);

  @override
  int cod;
  @override
  String descricao;
  @override
  bool ativo;
  @override
  String tstamp;

  @override
  String toString() {
    return 'TurnoQueryItemResponseDTO(cod: $cod, descricao: $descricao, ativo: $ativo, tstamp: $tstamp)';
  }

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$TurnoQueryItemResponseDTOImplCopyWith<_$TurnoQueryItemResponseDTOImpl>
      get copyWith => __$$TurnoQueryItemResponseDTOImplCopyWithImpl<
          _$TurnoQueryItemResponseDTOImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$TurnoQueryItemResponseDTOImplToJson(
      this,
    );
  }
}

abstract class _TurnoQueryItemResponseDTO implements TurnoQueryItemResponseDTO {
  factory _TurnoQueryItemResponseDTO(
      {required int cod,
      required String descricao,
      required bool ativo,
      required String tstamp}) = _$TurnoQueryItemResponseDTOImpl;

  factory _TurnoQueryItemResponseDTO.fromJson(Map<String, dynamic> json) =
      _$TurnoQueryItemResponseDTOImpl.fromJson;

  @override
  int get cod;
  set cod(int value);
  @override
  String get descricao;
  set descricao(String value);
  @override
  bool get ativo;
  set ativo(bool value);
  @override
  String get tstamp;
  set tstamp(String value);
  @override
  @JsonKey(ignore: true)
  _$$TurnoQueryItemResponseDTOImplCopyWith<_$TurnoQueryItemResponseDTOImpl>
      get copyWith => throw _privateConstructorUsedError;
}
