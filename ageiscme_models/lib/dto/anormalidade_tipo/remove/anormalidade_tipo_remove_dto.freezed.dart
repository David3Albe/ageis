// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'anormalidade_tipo_remove_dto.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

AnormalidadeTipoRemoveDTO _$AnormalidadeTipoRemoveDTOFromJson(
    Map<String, dynamic> json) {
  return _AnormalidadeTipoRemoveDTO.fromJson(json);
}

/// @nodoc
mixin _$AnormalidadeTipoRemoveDTO {
  int get cod => throw _privateConstructorUsedError;
  set cod(int value) => throw _privateConstructorUsedError;
  String get tstamp => throw _privateConstructorUsedError;
  set tstamp(String value) => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $AnormalidadeTipoRemoveDTOCopyWith<AnormalidadeTipoRemoveDTO> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $AnormalidadeTipoRemoveDTOCopyWith<$Res> {
  factory $AnormalidadeTipoRemoveDTOCopyWith(AnormalidadeTipoRemoveDTO value,
          $Res Function(AnormalidadeTipoRemoveDTO) then) =
      _$AnormalidadeTipoRemoveDTOCopyWithImpl<$Res, AnormalidadeTipoRemoveDTO>;
  @useResult
  $Res call({int cod, String tstamp});
}

/// @nodoc
class _$AnormalidadeTipoRemoveDTOCopyWithImpl<$Res,
        $Val extends AnormalidadeTipoRemoveDTO>
    implements $AnormalidadeTipoRemoveDTOCopyWith<$Res> {
  _$AnormalidadeTipoRemoveDTOCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? cod = null,
    Object? tstamp = null,
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
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$AnormalidadeTipoRemoveDTOImplCopyWith<$Res>
    implements $AnormalidadeTipoRemoveDTOCopyWith<$Res> {
  factory _$$AnormalidadeTipoRemoveDTOImplCopyWith(
          _$AnormalidadeTipoRemoveDTOImpl value,
          $Res Function(_$AnormalidadeTipoRemoveDTOImpl) then) =
      __$$AnormalidadeTipoRemoveDTOImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({int cod, String tstamp});
}

/// @nodoc
class __$$AnormalidadeTipoRemoveDTOImplCopyWithImpl<$Res>
    extends _$AnormalidadeTipoRemoveDTOCopyWithImpl<$Res,
        _$AnormalidadeTipoRemoveDTOImpl>
    implements _$$AnormalidadeTipoRemoveDTOImplCopyWith<$Res> {
  __$$AnormalidadeTipoRemoveDTOImplCopyWithImpl(
      _$AnormalidadeTipoRemoveDTOImpl _value,
      $Res Function(_$AnormalidadeTipoRemoveDTOImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? cod = null,
    Object? tstamp = null,
  }) {
    return _then(_$AnormalidadeTipoRemoveDTOImpl(
      cod: null == cod
          ? _value.cod
          : cod // ignore: cast_nullable_to_non_nullable
              as int,
      tstamp: null == tstamp
          ? _value.tstamp
          : tstamp // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$AnormalidadeTipoRemoveDTOImpl implements _AnormalidadeTipoRemoveDTO {
  _$AnormalidadeTipoRemoveDTOImpl({required this.cod, required this.tstamp});

  factory _$AnormalidadeTipoRemoveDTOImpl.fromJson(Map<String, dynamic> json) =>
      _$$AnormalidadeTipoRemoveDTOImplFromJson(json);

  @override
  int cod;
  @override
  String tstamp;

  @override
  String toString() {
    return 'AnormalidadeTipoRemoveDTO(cod: $cod, tstamp: $tstamp)';
  }

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$AnormalidadeTipoRemoveDTOImplCopyWith<_$AnormalidadeTipoRemoveDTOImpl>
      get copyWith => __$$AnormalidadeTipoRemoveDTOImplCopyWithImpl<
          _$AnormalidadeTipoRemoveDTOImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$AnormalidadeTipoRemoveDTOImplToJson(
      this,
    );
  }
}

abstract class _AnormalidadeTipoRemoveDTO implements AnormalidadeTipoRemoveDTO {
  factory _AnormalidadeTipoRemoveDTO(
      {required int cod,
      required String tstamp}) = _$AnormalidadeTipoRemoveDTOImpl;

  factory _AnormalidadeTipoRemoveDTO.fromJson(Map<String, dynamic> json) =
      _$AnormalidadeTipoRemoveDTOImpl.fromJson;

  @override
  int get cod;
  set cod(int value);
  @override
  String get tstamp;
  set tstamp(String value);
  @override
  @JsonKey(ignore: true)
  _$$AnormalidadeTipoRemoveDTOImplCopyWith<_$AnormalidadeTipoRemoveDTOImpl>
      get copyWith => throw _privateConstructorUsedError;
}