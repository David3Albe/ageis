// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'anormalidade_liberar_dto.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

AnormalidadeLiberarDTO _$AnormalidadeLiberarDTOFromJson(
    Map<String, dynamic> json) {
  return _AnormalidadeLiberarDTO.fromJson(json);
}

/// @nodoc
mixin _$AnormalidadeLiberarDTO {
  int get cod => throw _privateConstructorUsedError;
  set cod(int value) => throw _privateConstructorUsedError;
  String get tstamp => throw _privateConstructorUsedError;
  set tstamp(String value) => throw _privateConstructorUsedError;
  String get observacaoLiberacao => throw _privateConstructorUsedError;
  set observacaoLiberacao(String value) => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $AnormalidadeLiberarDTOCopyWith<AnormalidadeLiberarDTO> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $AnormalidadeLiberarDTOCopyWith<$Res> {
  factory $AnormalidadeLiberarDTOCopyWith(AnormalidadeLiberarDTO value,
          $Res Function(AnormalidadeLiberarDTO) then) =
      _$AnormalidadeLiberarDTOCopyWithImpl<$Res, AnormalidadeLiberarDTO>;
  @useResult
  $Res call({int cod, String tstamp, String observacaoLiberacao});
}

/// @nodoc
class _$AnormalidadeLiberarDTOCopyWithImpl<$Res,
        $Val extends AnormalidadeLiberarDTO>
    implements $AnormalidadeLiberarDTOCopyWith<$Res> {
  _$AnormalidadeLiberarDTOCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? cod = null,
    Object? tstamp = null,
    Object? observacaoLiberacao = null,
  }) {
    return _then(_value.copyWith(
      cod: null == cod
          ? _value.cod
          : cod // ignore: cast_nullable_to_non_nullable
              as int,
      tstamp: null == tstamp
          ? _value.tstamp
          : tstamp // ignore: cast_nullable_to_non_nullable
              as String,
      observacaoLiberacao: null == observacaoLiberacao
          ? _value.observacaoLiberacao
          : observacaoLiberacao // ignore: cast_nullable_to_non_nullable
              as String,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$AnormalidadeLiberarDTOImplCopyWith<$Res>
    implements $AnormalidadeLiberarDTOCopyWith<$Res> {
  factory _$$AnormalidadeLiberarDTOImplCopyWith(
          _$AnormalidadeLiberarDTOImpl value,
          $Res Function(_$AnormalidadeLiberarDTOImpl) then) =
      __$$AnormalidadeLiberarDTOImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({int cod, String tstamp, String observacaoLiberacao});
}

/// @nodoc
class __$$AnormalidadeLiberarDTOImplCopyWithImpl<$Res>
    extends _$AnormalidadeLiberarDTOCopyWithImpl<$Res,
        _$AnormalidadeLiberarDTOImpl>
    implements _$$AnormalidadeLiberarDTOImplCopyWith<$Res> {
  __$$AnormalidadeLiberarDTOImplCopyWithImpl(
      _$AnormalidadeLiberarDTOImpl _value,
      $Res Function(_$AnormalidadeLiberarDTOImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? cod = null,
    Object? tstamp = null,
    Object? observacaoLiberacao = null,
  }) {
    return _then(_$AnormalidadeLiberarDTOImpl(
      cod: null == cod
          ? _value.cod
          : cod // ignore: cast_nullable_to_non_nullable
              as int,
      tstamp: null == tstamp
          ? _value.tstamp
          : tstamp // ignore: cast_nullable_to_non_nullable
              as String,
      observacaoLiberacao: null == observacaoLiberacao
          ? _value.observacaoLiberacao
          : observacaoLiberacao // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$AnormalidadeLiberarDTOImpl implements _AnormalidadeLiberarDTO {
  _$AnormalidadeLiberarDTOImpl(
      {required this.cod,
      required this.tstamp,
      required this.observacaoLiberacao});

  factory _$AnormalidadeLiberarDTOImpl.fromJson(Map<String, dynamic> json) =>
      _$$AnormalidadeLiberarDTOImplFromJson(json);

  @override
  int cod;
  @override
  String tstamp;
  @override
  String observacaoLiberacao;

  @override
  String toString() {
    return 'AnormalidadeLiberarDTO(cod: $cod, tstamp: $tstamp, observacaoLiberacao: $observacaoLiberacao)';
  }

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$AnormalidadeLiberarDTOImplCopyWith<_$AnormalidadeLiberarDTOImpl>
      get copyWith => __$$AnormalidadeLiberarDTOImplCopyWithImpl<
          _$AnormalidadeLiberarDTOImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$AnormalidadeLiberarDTOImplToJson(
      this,
    );
  }
}

abstract class _AnormalidadeLiberarDTO implements AnormalidadeLiberarDTO {
  factory _AnormalidadeLiberarDTO(
      {required int cod,
      required String tstamp,
      required String observacaoLiberacao}) = _$AnormalidadeLiberarDTOImpl;

  factory _AnormalidadeLiberarDTO.fromJson(Map<String, dynamic> json) =
      _$AnormalidadeLiberarDTOImpl.fromJson;

  @override
  int get cod;
  set cod(int value);
  @override
  String get tstamp;
  set tstamp(String value);
  @override
  String get observacaoLiberacao;
  set observacaoLiberacao(String value);
  @override
  @JsonKey(ignore: true)
  _$$AnormalidadeLiberarDTOImplCopyWith<_$AnormalidadeLiberarDTOImpl>
      get copyWith => throw _privateConstructorUsedError;
}
